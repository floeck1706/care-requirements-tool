(:~
 : Dieses Modul stellt alle Funktionen bereit, die für die Generierung der Vorschläge in die SOPHIST Satzschablone zuständig sind.
 : @author Florian Eckey
 : @version 1.1
:)
module namespace rsugg ="masterthesis/modules/care/suggestions";

declare namespace c ="care";

(:~
 : Diese Funktion generiert die Vorschläge für das Objekt der Schablone
 : @param $act Aktivität
 : @return Vorschläge als XML
:)
declare function rsugg:possible-objects($act) {
  let $doOutputs:= $act/c:ContextInformation/c:DataObjectOutputs/c:DataObjectOutput
  let $dsOutputs :=  $act/c:ContextInformation/c:DataStoreOutputs/c:DataStoreOutput
  let $doInputs := $act/c:ContextInformation/c:DataObjectInputs/c:DataObjectInput
  let $dsInputs := $act/c:ContextInformation/c:DataStoreInputs/c:DataStoreInput 
  let $dataObjects := $doOutputs | $doInputs
  let $dataStores := $dsOutputs | $dsInputs
  
  let $doOutputEntries := for $doOutput in distinct-values($doOutputs/@Id/string()) return 
                        <entry Id="{$doOutput}" Name="{$dataObjects[@Id=$doOutput]/string()}" Type="DataObject" Icon="glyphicon glyphicon-file"/>
  let $dsOutputEntries := for $dsOutput in distinct-values($dsOutputs/@Id/string()) return 
                        <entry Id="{$dsOutput}" Name="{$dataStores[@Id=$dsOutput]/string()}" Type="DataStore" Icon="glyphicon glyphicon-hdd"/>
  let $doInputEntries := for $doInput in distinct-values($doInputs/@Id/string()) return 
                        <entry Id="{$doInput}" Name="{$dataObjects[@Id=$doInput]/string()}" Type="DataObject" Icon="glyphicon glyphicon-file"/>
  let $dsInputEntries := for $dsInput in distinct-values($dsInputs/@Id/string()) return 
                        <entry Id="{$dsInput}" Name="{$dataStores[@Id=$dsInput]/string()}" Type="DataStore" Icon="glyphicon glyphicon-hdd"/>


  let $name-object := <entry Id="{random:uuid()}" Name="{tokenize($act/c:ContextInformation/c:Name/string()," ")[1]}" Type="Re ReObject ReFavorite" Icon="glyphicon glyphicon-star"/>
  return $doOutputEntries | $doInputEntries | $dsOutputEntries | $dsInputEntries | $name-object
};

(:~
 : Diese Funktion generiert die Vorschläge für das Ereignis der Bedingung der Schablone
 : @param $act Aktivität
 : @return Vorschläge als XML
:)
declare function rsugg:possible-events($act) {
  let $events := for $actor in distinct-values($act/c:ContextInformation/c:Predecessors/c:Predecessor[@Type=("StartEvent","EndEvent","IntermediateEvent")]/string()) return <entry Id="{random:uuid()}" Name="{$actor}" Type="Re ReActor ReFavorite" Icon="glyphicon glyphicon-star"/>
  return $events
};

(:~
 : Diese Funktion generiert die Vorschläge für den Vergleichswert der Bedingung der Schablone
 : @param $act Aktivität
 : @return Vorschläge als XML
:)
declare function rsugg:possible-transitions($act) {
  let $transitions := for $actor in distinct-values($act/c:ContextInformation/c:Predecessors/c:Predecessor[@Type="ExclusiveGateway"]/@Transition/string()) return <entry Id="{random:uuid()}" Name="{$actor}" Type="Re ReActor ReFavorite" Icon="glyphicon glyphicon-star"/>
  return $transitions
};

(:~
 : Diese Funktion generiert die Vorschläge für den Akteur der Schablone
 : @param $act Aktivität
 : @return Vorschläge als XML
:)
declare function rsugg:possible-actors($act) {
  let $laneEntry := <entry Id="{random:uuid()}" Name="{$act/c:ContextInformation/c:Performer/string()}" Type="Lane" Icon="glyphicon glyphicon-user"/>
  return $laneEntry
};

(:~
 : Diese Funktion generiert die Vorschläge für das System der Schablone
 : @param $care-pkg Paket
 : @param $reference Aktivität
 : @return Vorschläge als XML
:)
declare function rsugg:possible-systems($care-pkg,$reference) {
  let $other-systems := for $system in distinct-values($care-pkg//c:System) return <entry Id="{random:uuid()}" Name="{$system}" Type="Re ReSystem ReFavorite" Icon="glyphicon glyphicon-star"/>
  return $other-systems
};

(:~
 : Diese Funktion generiert die Vorschläge für die Bedingung der Schablone (depricated)
 : @param $act Aktivität
 : @return Vorschläge als XML
:)
declare function rsugg:possible-conditions($act) {
  let $conditions := for $actor in distinct-values($act/c:ContextInformation/c:Predecessors/c:Predecessor[@Type="ExclusiveGateway"]/string()) return <entry Id="{random:uuid()}" Name="{$actor}" Type="Re ReActor ReFavorite" Icon="glyphicon glyphicon-star"/>
  return $conditions
};

(:~
 : Diese Funktion generiert die Vorschläge für das Objekt der Schablone
 : @return Vorschläge als XML
:)
declare function rsugg:possible-liabilities() {
  let $other-liabilities := (<entry Id="{random:uuid()}" Name="muss" Type="Re ReLiability"/>
                            ,<entry Id="{random:uuid()}" Name="kann" Type="Re ReLiability"/>
                            ,<entry Id="{random:uuid()}" Name="soll" Type="Re ReLiability"/>)
  return $other-liabilities
};

(:~
 : Diese Funktion generiert die Vorschläge für die Art der Funktionalität der Schablone
 : @return Vorschläge als XML
:)
declare function rsugg:possible-functionalities() {
  let $other-functionalities := (<entry Id="{random:uuid()}" Name="die Möglichkeit bieten" Type="Re ReFunctionality" />
                            ,<entry Id="{random:uuid()}" Name="fähig sein" Type="Re ReFunctionality"/>
                            ,<entry Id="{random:uuid()}" Name="" Type="Re ReFunctionality"/>)
  return $other-functionalities
};

(:~
 : Diese Funktion generiert die Vorschläge für das Prozesswort der Schablone
 : @param $care-pkg Paket
 : @param $reference Aktivität
 : @return Vorschläge als XML
:)
declare function rsugg:possible-processverbs($care-pkg,$reference) {
  let $other-processverbs := for $processverbs in distinct-values($care-pkg//c:ProcessVerb/string()) return <entry Id="{random:uuid()}" Name="{$processverbs}" Type="Re ReProcessVerb ReFavorite" Icon="glyphicon glyphicon-star"/>
  return $other-processverbs
};

(:~
 : Diese Funktion generiert die Vorschläge für das die Konkretisierung des Prozesswortes der Schablone
 : @param $care-pkg Paket
 : @param $reference Aktivität
 : @return Vorschläge als XML
:)
declare function rsugg:possible-processverbdetails($care-pkg,$reference) {
  let $other-processverbdetails := for $processverbdetail in distinct-values($care-pkg//c:ProcessVerbDetail/string()) return <entry Id="{random:uuid()}" Name="{$processverbdetail}" Type="Re ReProcessVerbDetail ReFavorite" Icon="glyphicon glyphicon-star"/>
  return $other-processverbdetails
};

(:~
 : Diese Funktion generiert die Vorschläge für die Präzisierung 1 des Objekts der Schablone
 : @param $care-pkg Paket
 : @param $reference Aktivität
 : @return Vorschläge als XML
:)
declare function rsugg:possible-objectdetails1($care-pkg,$reference) {
  let $other-objectdetails1 := for $objectdetail1 in distinct-values($care-pkg//c:ObjectDetail1/string()) return <entry Id="{random:uuid()}" Name="{$objectdetail1}" Type="Re ReObjectDetail1 ReFavorite" Icon="glyphicon glyphicon-star"/>
  return $other-objectdetails1
};

(:~
 : Diese Funktion generiert die Vorschläge für die Präzisierung 2 des Objekts der Schablone
 : @param $care-pkg Paket
 : @param $reference Aktivität
 : @return Vorschläge als XML
:)
declare function rsugg:possible-objectdetails2($care-pkg,$reference) {
  let $other-objectdetails2 := for $objectdetail2 in distinct-values($care-pkg//c:ObjectDetail2/string()) return <entry Id="{random:uuid()}" Name="{$objectdetail2}" Type="Re ReObjectDetail2 ReFavorite" Icon="glyphicon glyphicon-star"/>
  return $other-objectdetails2
};