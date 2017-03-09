(:~
 : Dieses Modul enthält alle Funktionen, welche es ermöglichen mit einer bizAgi bpm Datei umzugehen.
 : @author Florian Eckey
 : @version 1.1
 :)
module namespace bizagi = 'masterthesis/modules/bizagi-manager';

import module namespace xm = 'masterthesis/modules/xpdl-manager';

declare namespace xpdl="http://www.wfmc.org/2009/XPDL2.2";

(:~
 : Diese Funktion liest eine bpm-Datei im Binär-Format und parst das enthaltene XPDL. Dabei werden Modifikationen am XPDL vorgenommen.
 : @param $file bpm-Binäerdatei
 : @return XDPL (modifiziert)
 :)
declare function bizagi:read($file as xs:base64Binary) as element(xpdl:Package)+{
  let $opts:=<archive:options><archive:format value="zip"/><archive:algorithm value="deflate"/></archive:options>
  for $archive in $file
    let $extended-info := for $entry in archive:entries($archive) where starts-with($entry,"Documentation") and ends-with($entry,".xml")
                 let $result:=(parse-xml(archive:extract-text($archive,$entry)))
                 return $result
    for $entry in archive:entries($archive)
    where ends-with($entry,'.diag') (: the zip compressed diagram files :)
    return
       let $subarchives := archive:extract-binary($archive, $entry) 
       for $subarchive in $subarchives
          let $extended-values := for $subentries in archive:entries($subarchive)
             for $subentry in $subentries
                                  where $subentry/text()="ExtendedAttributeValues.xml" 
                                   return
                                     let $result:=(parse-xml(archive:extract-text($subarchive,$subentry))/DiagramAttributeValues)
                                     return $result
            for $subentries in archive:entries($subarchive)
            for $subentry in $subentries
             where $subentry/text()="Diagram.xml" (: extract XPDL Diagram, it's the xpdl:Packages, really... :)
               return
                 let $result:=parse-xml(archive:extract-text($subarchive,$subentry))/xpdl:Package
                 let $modified-package := bizagi:modify-xpdl($result)
                 let $modified-package := bizagi:addExtendedValues($modified-package,$extended-info,$extended-values)
                 return $modified-package
};

(:~
 : Diese Funktion fügt dem XPDL die Lanes der Aktivitäten als Performer ein. Dies ist nötig, da die Lanes dem XPDL nicht direkt entnommen werden können.
 : @param $package XPDL
 : @return XDPL (modifiziert)
 :)
declare function bizagi:addLanesAsPerformers($package as element(xpdl:Package)) as element(xpdl:Package){
      copy $newPackage:=$package
      modify 
        for $activity in $newPackage//xpdl:Activity
          let $lane :=xm:getLaneForActivity($newPackage,$activity) return
          if($activity/xpdl:Performers) then insert node <Performer xmlns="http://www.wfmc.org/2009/XPDL2.2">{ $lane/@Id/string() }</Performer> into $activity/xpdl:Performers
          else insert node <Performers xmlns="http://www.wfmc.org/2009/XPDL2.2"><Performer>{ $lane/@Id/string() }</Performer></Performers> into $activity
      return $newPackage
};

(:~
 : Diese Funktion fügt dem XPDL die ExtendedAttributes aus BizAgi hinzu. Dies ist nötig, da die Lanes dem XPDL nicht direkt entnommen werden können.
 : @param $package XPDL
 : @param $extended-info XML der externen Attribut-Deklaration (von BizAgi)
 : @param $extended-values XML der externen Attribut-Werte (von BizAgi)
 : @return XDPL (modifiziert)
 :)
declare function bizagi:addExtendedValues($package as element(xpdl:Package),$extended-info,$extended-values) as element(xpdl:Package) {
  copy $package:=$package modify (
    for $act in $package//xpdl:Activity
     let $ext-node := <ExtendedValues>
                        {for $info in $extended-info/ExtendedAttribute return 
                            <ExtendedValue Name="{$info/Name/string()}" Type="{$info/@Type}">
                              {$extended-values/ElementAttributeValues[@ElementId=$act/@Id]/Values/ExtendedAttributeValue[@Id=$info/@Id]/Content/string()}
                            </ExtendedValue>}
                      </ExtendedValues>
     return insert node $ext-node into $act
  ) return $package
};

(:~
 : Diese Funktion führt alle Modifikationen am XPDL aus
 : @param $package XPDL
 : @return XDPL (modifiziert)
 :)
declare function bizagi:modify-xpdl($package as element(xpdl:Package)) as element(xpdl:Package) {
  let $modified := bizagi:deleteDuplicates($package)
  let $modified := bizagi:addInOuts($modified)
  let $modified := bizagi:addLanesAsPerformers($modified)
  return $modified
};

(:~
 : Diese Funktion entfernt doppelte DataStores aus dem XPDL und fixt damit einen Bug von BizAgi.
 : @param $pack XPDL
 : @return XDPL (modifiziert)
 :)
declare function bizagi:deleteDuplicates($pack as element(xpdl:Package)) {
  copy $pack:=$pack modify delete node $pack//xpdl:DataStore[@Id=following-sibling::xpdl:DataStore/@Id]
  return $pack
};

(:~
 : Diese Funktion fügt die Daten Inputs und Outputs direkt den Aktivitäten hinzu. Dies erleichtert die Generierung des CARE-Formats.
 : @param $pack XPDL
 : @return XDPL (modifiziert)
 :)
declare function bizagi:addInOuts($pack as element(xpdl:Package)) {
  let $wfp := $pack/xpdl:WorkflowProcesses/xpdl:WorkflowProcess
  let $DataStoreReferences := $wfp/xpdl:DataStoreReferences/xpdl:DataStoreReference
  let $storeIds := distinct-values($DataStoreReferences/@Id)
  let $dataObjIds := $wfp/xpdl:DataObjects/xpdl:DataObject/@Id
  let $acts := $wfp/xpdl:Activities/xpdl:Activity
  let $assocs:= $pack/xpdl:Associations/xpdl:Association
  let $lanes:=$pack/xpdl:Pools/xpdl:Pool/xpdl:Lanes/xpdl:Lane
  let $pack:=copy $pack:=$pack 
    modify 
      (
       for $dataInput in $assocs[@Target=$acts/@Id][@Source=$storeIds]
         return insert node <DataStoreInput Id="{$DataStoreReferences[@Id=$dataInput/@Source]/@DataStoreRef}"/> as last into $pack/xpdl:WorkflowProcesses/xpdl:WorkflowProcess/xpdl:Activities/xpdl:Activity[@Id=$dataInput/@Target]
       ,for $dataOutput in $assocs[@Source=$acts/@Id][@Target=$storeIds]
         return insert node <DataStoreOutput Id="{$DataStoreReferences[@Id=$dataOutput/@Target]/@DataStoreRef}"/> as last into $pack/xpdl:WorkflowProcesses/xpdl:WorkflowProcess/xpdl:Activities/xpdl:Activity[@Id=$dataOutput/@Source]
       ,for $dataInput in $assocs[@Target=$acts/@Id][@Source=$dataObjIds]
         return insert node <DataObjectInput Id="{$dataInput/@Source}"/> as last into $pack/xpdl:WorkflowProcesses/xpdl:WorkflowProcess/xpdl:Activities/xpdl:Activity[@Id=$dataInput/@Target]
       ,for $dataOutput in $assocs[@Source=$acts/@Id][@Target=$dataObjIds]
         return insert node <DataObjectOutput Id="{$dataOutput/@Target}"/> as last into $pack/xpdl:WorkflowProcesses/xpdl:WorkflowProcess/xpdl:Activities/xpdl:Activity[@Id=$dataOutput/@Source]     
      ) 
    return $pack
 return $pack
};