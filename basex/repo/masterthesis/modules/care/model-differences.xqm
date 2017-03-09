(:~
 : Dieses Modul stellt alle Funktionen bereit, welche sich um die Differenzberechnung auf den Kontextinformationen einer Aktivität kümmern.
 : @version 1.1
 : @author Florian Eckey
:)
module namespace diff="masterthesis/modules/care/model-differences";

declare namespace c ="care";

(:~
 : Diese Funktion stößt die Differenzberechnung der übergebenen Pakete an
 : @param $pkg1 Paket 1
 : @param $pkg2 Paket, mit dem Paket 1 verglichen wird
 : @return Differenzen zwischen den Paketen
:)
declare function diff:Activities($pkg1,$pkg2) {
  let $acts1 := $pkg1/c:Activity/c:ContextInformation
  let $acts2 := $pkg2/c:Activity/c:ContextInformation
  return (
    for $act1 in $acts1 where not($act1/@Id/string()=($acts2/@Id/string())) return <Inconsistency Operation="delete" Type="CHANGE:ACT" ReferenceId="{$act1/@ActivityId}" PackageId="{$pkg1/@Id}"><span>Die Aktivität <span class="change-from">{$act1/c:Name/string()}</span> wurde entfernt.</span></Inconsistency> 
    ,for $act2 in $acts2 where not($act2/@Id/string()=($acts1/@Id/string())) return <Inconsistency Operation="insert" Type="CHANGE:ACT"  ReferenceId="{$act2/@ActivityId}" PackageId="{$pkg1/@Id}"><span>Die Aktivität <span class="change-to">{$act2/c:Name/string()}</span> wurde hinzugefügt. Erheben Sie neue Anforderungen.</span></Inconsistency>
    ,for $act1 in $acts1,$act2 in $acts2 where $act1/@Id=$act2/@Id 
     return diff:Activity($act1,$act2))
};

(:~
 : Diese Funktion stößt die Differenzberechnung der übergebenen Kontextinformationen an
 : @param $act1 Aktivität 1
 : @param $act2 Aktivität, mit der Aktivität 1 verglichen wird
 : @return Differenzen zwischen den Aktivitäten
:)
declare function diff:Activity($act1,$act2) {
  if($act1/c:Name/string()=$act2/c:Name/string()) then () else <Inconsistency Operation="update" From="{$act1/c:Name/string()}" To="{$act2/c:Name/string()}" Type="CHANGE:ACT_NAME" ReferenceId="{$act1/c:Name/@Id}"><span>Der Name der Aktivität hat sich von <span class="change-from">{$act1/c:Name/string()}</span> nach <span class="change-to">{$act2/c:Name/string()}</span> geändert.</span></Inconsistency>
  ,if($act1/c:Performer/string()=$act2/c:Performer/string()) then () else <Inconsistency Operation="update" From="{$act1/c:Performer/string()}" To="{$act2/c:Performer/string()}" Type="CHANGE:ACT_PERF" ReferenceId="{$act1/c:Performer/@Id}"><span>Die Zuständigkeit der Aktivität hat sich von <span class="change-from">{$act1/c:Performer/string()}</span> nach <span class="change-to">{$act2/c:Performer/string()}</span> geändert.</span></Inconsistency>
  ,if($act1/c:TaskType/string()=$act2/c:TaskType/string()) then () else <Inconsistency Operation="update" From="{$act1/c:TaskType/string()}" To="{$act2/c:TaskType/string()}" Type="CHANGE:ACT_TASKTYPE" ReferenceId="{$act1/c:TaskType/@Id}"><span>Der Typ der Aktivität hat sich von <span class="change-from">{$act1/c:TaskType/string()}</span> nach <span class="change-to">{$act2/c:TaskType/string()}</span> geändert.</span></Inconsistency>
  ,diff:DataObjectInputs($act1,$act2)
  ,diff:DataObjectOutputs($act1,$act2)
  ,diff:DataStoreInputs($act1,$act2)
  ,diff:DataStoreOutputs($act1,$act2)
  ,diff:Predecessors($act1,$act2)
};

(:~
 : Diese Funktion berechnet die Differenzen von Datenobjekten, welche von der Aktivität gelesen werden
 : @param $act1 Aktivität 1
 : @param $act2 Aktivität, mit der Aktivität 1 verglichen wird
 : @return Differenzen der gelesenen Datenobjekte
:)
declare function diff:DataObjectInputs($act1,$act2) {
  let $doInputs1 := $act1/c:DataObjectInputs/c:DataObjectInput
  let $doInputs2 := $act2/c:DataObjectInputs/c:DataObjectInput
  return (
    for $doInput1 in $doInputs1 where not($doInput1/@Id/string()=($doInputs2/@Id/string())) return <Inconsistency Operation="delete" Type="CHANGE:DO_INPUT" From="{$doInput1/string()}" ReferenceId="{$doInput1/@Id}"><span>Das Dokument <span class="change-from">{$doInput1/string()}</span> wurde entfernt.</span></Inconsistency>  
    ,for $doInput2 in $doInputs2 where not($doInput2/@Id/string()=($doInputs1/@Id/string())) return <Inconsistency Operation="insert" Type="CHANGE:DO_INPUT" To="{$doInput2/string()}" ReferenceId="{$doInput2/@Id}"><span>Das Dokument <span class="change-to">{$doInput2/string()}</span> wurde hinzugefügt.</span></Inconsistency> 
    ,for $doInput1 in $doInputs1,$doInput2 in $doInputs2 where $doInput1/@Id=$doInput2/@Id and not(diff:hash-eq($doInput1,$doInput2)) return diff:DataObjectInput($doInput1,$doInput2)
  )
};

(:~
 : Diese Funktion berechnet die Differenzen von Datenobjekten, welche von der Aktivität geschrieben werden
 : @param $act1 Aktivität 1
 : @param $act2 Aktivität, mit der Aktivität 1 verglichen wird
 : @return Differenzen der geschriebenen Datenobjekte
:)
declare function diff:DataObjectOutputs($act1,$act2) {
  let $doOutputs1 := $act1/c:DataObjectOutputs/c:DataObjectOutput
  let $doOutputs2 := $act2/c:DataObjectOutputs/c:DataObjectOutput
  return (
    for $doOutput1 in $doOutputs1 where not($doOutput1/@Id/string()=($doOutputs2/@Id/string())) return <Inconsistency Operation="delete" Type="CHANGE:DO_OUTPUT" From="{$doOutput1/string()}" ReferenceId="{$doOutput1/@Id}"><span>Das Dokument <span class="change-from">{$doOutput1/string()}</span> wurde entfernt.</span></Inconsistency> 
    ,for $doOutput2 in $doOutputs2 where not($doOutput2/@Id/string()=($doOutputs1/@Id/string())) return <Inconsistency Operation="insert" Type="CHANGE:DO_OUTPUT" To="{$doOutput2/string()}" ReferenceId="{$doOutput2/@Id}"><span>Das Dokument <span class="change-to">{$doOutput2/string()}</span> wurde hinzugefügt.</span></Inconsistency> 
    ,for $doOutput1 in $doOutputs1,$doOutput2 in $doOutputs2 where $doOutput1/@Id=$doOutput2/@Id and not(diff:hash-eq($doOutput1,$doOutput2)) return diff:DataObjectOutput($doOutput1,$doOutput2)
  )
};

(:~
 : Diese Funktion berechnet die Differenzen von Datenspeichern, welche von der Aktivität gelesen werden
 : @param $act1 Aktivität 1
 : @param $act2 Aktivität, mit der Aktivität 1 verglichen wird
 : @return Differenzen der gelesenen Datenspeicher
:)
declare function diff:DataStoreInputs($act1,$act2) {
  let $dsInputs1 := $act1/c:DataStoreInputs/c:DataStoreInput
  let $dsInputs2 := $act2/c:DataStoreInputs/c:DataStoreInput
  return (
    for $dsInput1 in $dsInputs1 where not($dsInput1/@Id/string()=($dsInputs2/@Id/string())) return <Inconsistency Operation="delete" Type="CHANGE:DS_INPUT" From="{$dsInput1/string()}" ReferenceId="{$dsInput1/@Id}"><span>Das System <span class="change-from">{$dsInput1/string()}</span> wurde entfernt.</span></Inconsistency>  
    ,for $dsInput2 in $dsInputs2 where not($dsInput2/@Id/string()=($dsInputs1/@Id/string())) return <Inconsistency Operation="insert" Type="CHANGE:DS_INPUT" To="{$dsInput2/string()}" ReferenceId="{$dsInput2/@Id}"><span>Das System <span class="change-to">{$dsInput2/string()}</span> wurde hinzugefügt.</span></Inconsistency> 
    ,for $dsInput1 in $dsInputs1,$dsInput2 in $dsInputs2 where $dsInput1/@Id=$dsInput2/@Id and not(diff:hash-eq($dsInput1,$dsInput2)) return diff:DataStoreInput($dsInput1,$dsInput2)
  )
};

(:~
 : Diese Funktion berechnet die Differenzen von Datenspeichern, welche von der Aktivität geschrieben werden
 : @param $act1 Aktivität 1
 : @param $act2 Aktivität, mit der Aktivität 1 verglichen wird
 : @return Differenzen der geschriebenen Datenspeicher
:)
declare function diff:DataStoreOutputs($act1,$act2) {
  let $dsOutputs1 := $act1/c:DataStoreOutputs/c:DataStoreOutput
  let $dsOutputs2 := $act2/c:DataStoreOutputs/c:DataStoreOutput
  return (
    for $dsOutput1 in $dsOutputs1 where not($dsOutput1/@Id/string()=($dsOutputs2/@Id/string())) return <Inconsistency Operation="delete" Type="CHANGE:DS_OUTPUT" From="{$dsOutput1/string()}" ReferenceId="{$dsOutput1/@Id}"><span>Das System <span class="change-from">{$dsOutput1/string()}</span> wurde entfernt.</span></Inconsistency> 
    ,for $dsOutput2 in $dsOutputs2 where not($dsOutput2/@Id/string()=($dsOutputs1/@Id/string())) return <Inconsistency Operation="insert" Type="CHANGE:DS_OUTPUT" To="{$dsOutput2/string()}" ReferenceId="{$dsOutput2/@Id}"><span>Das System <span class="change-to">{$dsOutput2/string()}</span> wurde hinzugefügt.</span></Inconsistency> 
    ,for $dsOutput1 in $dsOutputs1,$dsOutput2 in $dsOutputs2 where $dsOutput1/@Id=$dsOutput2/@Id and not(diff:hash-eq($dsOutput1,$dsOutput2)) return diff:DataStoreOutput($dsOutput1,$dsOutput2)
  )
};

(:~
 : Diese Funktion berechnet die Differenzen der Vorgänger der Aktivität
 : @param $act1 Aktivität 1
 : @param $act2 Aktivität, mit der Aktivität 1 verglichen wird
 : @return Differenzen der Vorgänger
:)
declare function diff:Predecessors($act1,$act2) {
  let $predecessors1 := $act1/c:Predecessors/c:Predecessor
  let $predecessors2 := $act2/c:Predecessors/c:Predecessor
  return (
    for $predecessor1 in $predecessors1 where not($predecessor1/@Id/string()=($predecessors2/@Id/string())) return <Inconsistency Operation="delete" Type="CHANGE:ACT_PRED" From="{$predecessor1/string()}" ReferenceId="{$predecessor1/@Id}"><span>Der Vorgänger <span class="change-from">{$predecessor1/string()}</span> wurde entfernt.</span></Inconsistency>  
    ,for $predecessor2 in $predecessors2 where not($predecessor2/@Id/string()=($predecessors1/@Id/string())) return <Inconsistency Operation="insert" Type="CHANGE:ACT_PRED" To="{$predecessor2/string()}" ReferenceId="{$predecessor2/@Id}"><span>Der Vorgänger <span class="change-to">{$predecessor2/string()}</span> wurde hinzugefügt.</span></Inconsistency>  
    ,for $predecessor1 in $predecessors1,$predecessor2 in $predecessors2 where $predecessor1/@Id=$predecessor2/@Id and not(diff:hash-eq($predecessor1,$predecessor2)) return diff:Predecessor($predecessor1,$predecessor2)
  )
};

(:~
 : Diese Funktion berechnet die Differenzen der Datenspeicher einer Aktivität
 : @param $do1 Datenobjekt 1
 : @param $do2 Datenobjekt, mit der Datenobjekt 1 verglichen wird
 : @return Differenzen der Datenobjekte
:)
declare function diff:DataObjectInput($do1,$do2) {
  if($do1/string()=$do2/string()) then () else <Inconsistency Operation="update" From="{$do1/string()}" To="{$do2/string()}" Type="CHANGE:DO_INPUT_NAME" ReferenceId="{$do1/@Id}"><span>Das Dokument <span class="change-from">{$do1/string()}</span> hat sich in <span class="change-to">{$do2/string()}</span> geändert.</span></Inconsistency>
};

(:~
 : Diese Funktion berechnet die Differenzen der Datenspeicher einer Aktivität
 : @param $do1 Datenobjekt 1
 : @param $do2 Datenobjekt, mit der Datenobjekt 1 verglichen wird
 : @return Differenzen der Datenobjekte
:)
declare function diff:DataObjectOutput($do1,$do2) {
  if($do1/string()=$do2/string()) then () else <Inconsistency Operation="update" From="{$do1/string()}" To="{$do2/string()}" Type="CHANGE:DO_OUTPUT_NAME" ReferenceId="{$do1/@Id}"><span>Das Dokument <span class="change-from">{$do1/string()}</span> hat sich in <span class="change-to">{$do2/string()}</span> geändert.</span></Inconsistency>
};

(:~
 : Diese Funktion berechnet die Differenzen der Datenspeicher einer Aktivität
 : @param $ds1 Datenspeicher 1
 : @param $ds2 Datenspeicher, mit der Datenspeicher 1 verglichen wird
 : @return Differenzen der Datenspeicher
:)
declare function diff:DataStoreInput($ds1,$ds2) {
  if($ds1/string()=$ds2/string()) then () else <Inconsistency Operation="update" From="{$ds1/string()}" To="{$ds2/string()}" Type="CHANGE:DS_INPUT_NAME" ReferenceId="{$ds1/@Id}"><span>Das System <span class="change-from">{$ds1/string()}</span> hat sich in <span class="change-to">{$ds2/string()}</span> geändert.</span></Inconsistency>
};

(:~
 : Diese Funktion berechnet die Differenzen der Datenspeicher einer Aktivität
 : @param $ds1 Datenspeicher 1
 : @param $ds2 Datenspeicher, mit der Datenspeicher 1 verglichen wird
 : @return Differenzen der Datenspeicher
:)
declare function diff:DataStoreOutput($ds1,$ds2) {
  if($ds1/string()=$ds2/string()) then () else <Inconsistency Operation="update" From="{$ds1/string()}" To="{$ds2/string()}" Type="CHANGE:DS_OUTPUT_NAME" ReferenceId="{$ds1/@Id}"><span>Das System <span class="change-from">{$ds1/string()}</span> hat sich in <span class="change-to">{$ds2/string()}</span> geändert.</span></Inconsistency>
};

(:~
 : Diese Funktion berechnet die Differenzen der Vorgänger einer Aktivität
 : @param $pre1 Vorgänger 1
 : @param $pre2 Vorgänger, mit der Vorgänger 1 verglichen wird
 : @return Differenzen der Vorgänger
:)
declare function diff:Predecessor($pre1,$pre2) {
  if($pre1/string()=$pre2/string()) then () else <Inconsistency Operation="update" From="{$pre1/string()}" To="{$pre2/string()}" Type="CHANGE:ACT_PRED_NAME" ReferenceId="{$pre1/@Id}"><span>Der Name des Vorgängers <span class="change-from">{$pre1/string()}</span> hat sich in <span class="change-to">{$pre2/string()}</span> geändert.</span></Inconsistency>
  ,if($pre1/@Type/string()=$pre2/@Type/string()) then () else <Inconsistency Operation="update" Type="CHANGE:ACT_PRED_TYPE" From="{$pre1/@Type/string()}" To="{$pre2/@Type/string()}" ReferenceId="{$pre1/@Id}"><span>Der Typ des Vorgängers <span class="change-from">{$pre1/string()}</span> hat sich von {$pre1/@Type/string()} in <span class="change-to">{$pre2/@Type/string()}</span> geändert.</span></Inconsistency>
  ,if($pre1/@Transition/string()=$pre2/@Transition/string()) then () else <Inconsistency Operation="update" Type="CHANGE:ACT_PRED_TRANSITION" From="{$pre1/@Transition/string()}" To="{$pre2/@Transition/string()}" ReferenceId="{$pre1/@Id}"><span>Die Entscheidung des Vorgängers {$pre1/string()} hat sich von <span class="change-from">{$pre1/@Transition/string()}</span> in <span class="change-to">{$pre2/@Transition/string()}</span> geändert.</span></Inconsistency>
  ,(:if($pre1/@Performer/string()=$pre2/@Performer/string()) then () else <Inconsistency Operation="update" Type="CHANGE:ACT_PRED_PERFORMER" From="{$pre1/@Performer/string()}" To="{$pre2/@Performer/string()}" ReferenceId="{$pre1/@Id}"><span>Die Zuständigkeit des Vorgängers <span class="change-from">{$pre1/string()}</span> hat sich von {$pre1/@Performer/string()} in <span class="change-to">{$pre2/@Performer/string()}</span> geändert.</span></Inconsistency>:)()
};

(:~
 : Diese Funktion berechnet, ob zwei XML Elemente gleich sind
 : @param $e1 Element 1
 : @param $e2 Element, mit der Element 1 verglichen wird
 : @return true, falls die Elemente gleich sind, anderenfalls false
:)
declare function diff:hash-eq($e1,$e2) {
  if(hash:md5(serialize($e1))=hash:md5(serialize($e2))) then xs:boolean("true") else xs:boolean("false")
};