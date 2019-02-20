(:~
 : Dieses Modul stellt alle Funktionen bereit, die für die Generierung der Vorschläge in die SOPHIST Satzschablone zuständig sind.
 : @author Florian Eckey, Katharina Großer
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
  let $name-object := <entry Id="{random:uuid()}" Name="{tokenize($act/c:ContextInformation/c:Name/string()," ")[1]}" Type="Re ReObject ReFavorite" Icon="glyphicon glyphicon-tag"/>
  
  let $doOutputs:= $act/c:ContextInformation/c:DataObjectOutputs/c:DataObjectOutput
  let $dsOutputs :=  $act/c:ContextInformation/c:DataStoreOutputs/c:DataStoreOutput
  let $doInputs := $act/c:ContextInformation/c:DataObjectInputs/c:DataObjectInput
  let $dsInputs := $act/c:ContextInformation/c:DataStoreInputs/c:DataStoreInput 
  let $dataObjects := $doOutputs | $doInputs
  let $dataStores := $dsOutputs | $dsInputs
  
  let $doOutputEntries := for $doOutput in distinct-values($doOutputs/@Id/string()) return 
                        <entry Id="{$doOutput}" Name="{$dataObjects[@Id=$doOutput]/string()}" State="{$dataObjects[@Id=$doOutput]/@State}" Type="DataObject" Icon="glyphicon glyphicon-file"/>
  let $dsOutputEntries := for $dsOutput in distinct-values($dsOutputs/@Id/string()) return 
                        <entry Id="{$dsOutput}" Name="{$dataStores[@Id=$dsOutput]/string()}" State="{$dataStores[@Id=$dsOutput]/@State}" Type="DataStore" Icon="glyphicon glyphicon-hdd"/>
  let $doInputEntries := for $doInput in distinct-values($doInputs/@Id/string()) return 
                        <entry Id="{$doInput}" Name="{$dataObjects[@Id=$doInput]/string()}" State="{$dataObjects[@Id=$doInput]/@State}" Type="DataObject" Icon="glyphicon glyphicon-file"/>
  let $dsInputEntries := for $dsInput in distinct-values($dsInputs/@Id/string()) return 
                        <entry Id="{$dsInput}" Name="{$dataStores[@Id=$dsInput]/string()}" State="{$dataStores[@Id=$dsInput]/@State}" Type="DataStore" Icon="glyphicon glyphicon-hdd"/>
  return $name-object | $doOutputEntries | $doInputEntries | $dsOutputEntries | $dsInputEntries
};

(:~
 : Diese Funktion generiert die Vorschläge für das Ereignis der Ereignis-Bedingung der Schablone
 : @param $act Aktivität
 : @return Vorschläge als XML
:)
declare function rsugg:possible-events($act) {
  let $events := for $event in distinct-values($act/c:ContextInformation/c:Predecessors/c:Predecessor[@Type=("StartEvent"(:,"EndEvent" ... kann nie expliziter Vorgänger sein:),"IntermediateEvent")]/string()) return <entry Id="{random:uuid()}" Name="{$event}" Type="Re ReFavorite" Icon="glyphicon glyphicon-bell"/>
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
 : Diese Funktion generiert die Vorschläge für den Akteur der Bedingungs-Schablone
 : @param $care-pkg Paket
 : @param $act Aktivität
 : @return Vorschläge als XML
:)
declare function rsugg:possible-eventactors($care-pkg,$act) {
  let $pre := $care-pkg/c:Activity[@Id=$act/c:ContextInformation/c:Predecessors/c:Predecessor/@Id/string()]
  return if ($pre/c:ContextInformation/c:TaskType=("Benutzeraktivität")) then rsugg:possible-actors($pre) else
  if ($pre/c:ContextInformation/c:TaskType=("Systemaktivität")) then rsugg:possible-systems($care-pkg,$pre) else 
  <entry Id="{random:uuid()}" Name="{$pre/c:ContextInformation/c:Performer/string()}" Type="Lane" Icon="glyphicon glyphicon-user"/>
  | <entry Id="{random:uuid()}" Name="{$pre/c:ContextInformation/c:Participant/string()}" Type="Lane" Icon="glyphicon glyphicon-cog"/>
};

(:~
 : Diese Funktion generiert die Vorschläge für das Objekt der Bedingungs-Schablone
 : @param $care-pkg Paket
 : @param $act Aktivität
 : @return Vorschläge als XML
:)
declare function rsugg:possible-eventobjects($care-pkg,$act) {
  let $cadidates := for $pre in $care-pkg/c:Activity[@Id=$act/c:ContextInformation/c:Predecessors/c:Predecessor/@Id/string()]
  return (:if event then (alles? oder erstes von Hinten?) vor letztem Leerzeichen Name="{tokenize($reference/c:ContextInformation/c:Name/string()," ")[last()]}" else:)
  if($pre/@Type=("StartEvent"(:,"EndEvent" ... kann nie expliziter Vorgänger sein:),"IntermediateEvent")) then 
  <entry Id="{random:uuid()}" Name="{tokenize($pre/c:ContextInformation/c:Name/string()," ")[last()-1]}" Type="Re ReObject ReFavorite" Icon="glyphicon glyphicon-tag"/> else rsugg:possible-objects($pre)
  return $cadidates
};

(:~
 : Diese Funktion generiert die Vorschläge für Funktionen der Bedingungs-Schablone
 : @param $care-pkg Paket
 : @param $act Aktivität
 : @return Vorschläge als XML
:)
declare function rsugg:possible-functions($care-pkg,$act) {
  let $cadidates := for $pre in $care-pkg/c:Activity[@Id=$act/c:ContextInformation/c:Predecessors/c:Predecessor/@Id/string()]
  return 
  if($pre/@Type=("ExclusiveGateway","InclusiveGateway","ParallelGateway")) then ()
  else
  <entry Id="{random:uuid()}" Name="{$pre/c:ContextInformation/c:Name/string()}" Type="Re ReObject ReFavorite" Icon="glyphicon glyphicon-tag"/>
  return $cadidates
};

(:~
 : Diese Funktion generiert die Vorschläge für das Prozesswort der Bedingungs-Schablone
 : @param $care-pkg Paket
 : @param $act Aktivität
 : @return Vorschläge als XML
:)
declare function rsugg:possible-condition-processverbs($care-pkg,$act) {
  let $cadidates := for $pre in $care-pkg/c:Activity[@Id=$act/c:ContextInformation/c:Predecessors/c:Predecessor/@Id/string()]
  return 
  if($pre/@Type=("ExclusiveGateway","InclusiveGateway","ParallelGateway")) then ()
  else
  rsugg:possible-processverbs($care-pkg,$pre)
  return $cadidates
};

(:~
 : Diese Funktion generiert die Vorschläge für den Akteur der Schablone
 : @param $act Aktivität
 : @return Vorschläge als XML
:)
declare function rsugg:possible-actors($act) {
  let $emptyEntry := <entry Id="{random:uuid()}" Name="" Type="Lane" Icon="glyphicon glyphicon-remove"/>
  let $laneEntry := <entry Id="{random:uuid()}" Name="{$act/c:ContextInformation/c:Performer/string()}" Type="Lane" Icon="glyphicon glyphicon-user"/>
  return if ($act/c:ContextInformation/c:TaskType=("Benutzeraktivität")) then $laneEntry else $emptyEntry | $laneEntry
};

(:~
 : Diese Funktion generiert die Vorschläge für das System der Schablone
 : @param $care-pkg Paket
 : @param $reference Aktivität
 : @return Vorschläge als XML
:)
declare function rsugg:possible-systems($care-pkg,$reference) {
   if ($reference/c:ContextInformation/c:TaskType=("Systemaktivität")) then
   let $laneEntry := <entry Id="{random:uuid()}" Name="{$reference/c:ContextInformation/c:Performer/string()}" Type="Lane" Icon="glyphicon glyphicon-user"/>
  let $pool-system := <entry Id="{random:uuid()}" Name="{$reference/c:ContextInformation/c:Participant/string()}" Type="Pool" Icon="glyphicon glyphicon-cog"/>
  let $other-systems := for $system in distinct-values($care-pkg//c:System) return <entry Id="{random:uuid()}" Name="{$system}" Type="Re ReSystem ReFavorite" Icon="glyphicon glyphicon-star"/>
  return  $laneEntry | $pool-system | $other-systems
  else
  let $pool-system := <entry Id="{random:uuid()}" Name="{$reference/c:ContextInformation/c:Participant/string()}" Type="Lane" Icon="glyphicon glyphicon-cog"/>
  let $other-systems := for $system in distinct-values($care-pkg//c:System) return <entry Id="{random:uuid()}" Name="{$system}" Type="Re ReSystem ReFavorite" Icon="glyphicon glyphicon-star"/>
  return $pool-system | $other-systems
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
 : Diese Funktion generiert die Vorschläge für die Verbindlichkeit der Schablone
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
 : @param $act Aktivität
 : @return Vorschläge als XML
:)
declare function rsugg:possible-functionalities($act) {
  
  let $other-functionalities := 
  
  if ($act/c:ContextInformation/c:TaskType=("Systemaktivität") or $act/c:ContextInformation/c:TaskType=("Sendende Aktivität")) then
  
  (<entry Id="{random:uuid()}" Name="" Type="Re ReFunctionality" Icon="glyphicon glyphicon-cog"/>,
 <entry Id="{random:uuid()}" Name="die Möglichkeit bieten" Type="Re ReFunctionality" Icon="glyphicon glyphicon-user"/>
                            ,<entry Id="{random:uuid()}" Name="fähig sein" Type="Re ReFunctionality" Icon="glyphicon glyphicon-link"/>)
                            
  else if ($act/c:ContextInformation/c:TaskType=("Benutzeraktivität")) then
  
   (<entry Id="{random:uuid()}" Name="die Möglichkeit bieten" Type="Re ReFunctionality" Icon="glyphicon glyphicon-user"/>
                            ,<entry Id="{random:uuid()}" Name="fähig sein" Type="Re ReFunctionality" Icon="glyphicon glyphicon-link"/>
                            ,<entry Id="{random:uuid()}" Name="" Type="Re ReFunctionality" Icon="glyphicon glyphicon-cog"/>)
                            
  else if ($act/c:ContextInformation/c:TaskType=("Skript Aktivität") or $act/c:ContextInformation/c:TaskType=("Aktivität mit Geschäftsentscheidung") or $act/c:ContextInformation/c:TaskType=("Empfangende Aktivität")) then
  
   (<entry Id="{random:uuid()}" Name="fähig sein" Type="Re ReFunctionality" Icon="glyphicon glyphicon-link"/>
                            ,<entry Id="{random:uuid()}" Name="die Möglichkeit bieten" Type="Re ReFunctionality" Icon="glyphicon glyphicon-user"/>
                            ,<entry Id="{random:uuid()}" Name="" Type="Re ReFunctionality" Icon="glyphicon glyphicon-cog"/>)
                            
  else if ($act/c:ContextInformation/c:TaskType=("Manuelle Aktivität")) then
  
   (<entry Id="{random:uuid()}" Name="" Type="Re ReFunctionality" Icon="glyphicon glyphicon-user"/>,
   <entry Id="{random:uuid()}" Name="fähig sein" Type="Re ReFunctionality" Icon="glyphicon glyphicon-link"/>
                            ,<entry Id="{random:uuid()}" Name="die Möglichkeit bieten" Type="Re ReFunctionality" Icon="glyphicon glyphicon-user"/>
                            ,<entry Id="{random:uuid()}" Name="" Type="Re ReFunctionality" Icon="glyphicon glyphicon-cog"/>)
                            
  else
  
  (<entry Id="{random:uuid()}" Name="" Type="Re ReFunctionality" Icon="glyphicon glyphicon-cog"/>,
  <entry Id="{random:uuid()}" Name="die Möglichkeit bieten" Type="Re ReFunctionality" Icon="glyphicon glyphicon-user"/>
                            ,<entry Id="{random:uuid()}" Name="fähig sein" Type="Re ReFunctionality" Icon="glyphicon glyphicon-link"/>,
                          <entry Id="{random:uuid()}" Name="" Type="Re ReFunctionality" Icon="glyphicon glyphicon-user"/>)
                            
  return $other-functionalities
};

(:~
 : Diese Funktion generiert die Vorschläge für das Prozesswort der Schablone
 : @param $care-pkg Paket
 : @param $reference Aktivität
 : @return Vorschläge als XML
:)
declare function rsugg:possible-processverbs($care-pkg,$reference) {
   let $name-object := <entry Id="{random:uuid()}" Name="{tokenize($reference/c:ContextInformation/c:Name/string()," ")[last()]}" Type="Re ReObject ReFavorite" Icon="glyphicon glyphicon-tag"/>
  
  let $other-processverbs := for $processverbs in distinct-values($care-pkg//c:ProcessVerb/string()) return <entry Id="{random:uuid()}" Name="{$processverbs}" Type="Re ReProcessVerb ReFavorite" Icon="glyphicon glyphicon-star"/>
  return $name-object | $other-processverbs
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
  let $state-objectdetails1 := for $object in rsugg:possible-objects($reference)[@State!=""] return <entry Id="{random:uuid()}" Name="{$object/@State}" Type="Re ReObjectDetail1 ReFavorite" Icon="glyphicon glyphicon-file"/>
  let $other-objectdetails1 := for $objectdetail1 in distinct-values($care-pkg//c:ObjectDetail1/string()) return <entry Id="{random:uuid()}" Name="{$objectdetail1}" Type="Re ReObjectDetail1 ReFavorite" Icon="glyphicon glyphicon-star"/>
  
  return $state-objectdetails1 | $other-objectdetails1
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