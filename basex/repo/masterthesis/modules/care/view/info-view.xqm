(:~
 : Dieses Modul stellt Funktionen für die Generigung des HTML Inhalts für die Ansicht der Kontextinformationene einer Aktivität zur Verfügung
 : @version 1.1
 : @author Florian Eckey
:)
module namespace reinfoview="masterthesis/modules/care/view/info-view";

import module namespace util="masterthesis/modules/utilities";
import module namespace gl ="masterthesis/modules/care/glossary";
import module namespace ui = 'masterthesis/modules/ui-manager';

declare namespace c="care";
declare namespace g="glossary";

(:~
: Diese Funktion generiert den HTML Inhalt für das Panel, in dem die Kontextinformationen dargestellt sind.
: @param $current-package Das Paket, zu dem die Kontextinformationen angezeigt werden
: @param $compare-package Das Paket, mit dem die Kontextinformationen verglichen werden
: @param $ref-id Die ID der Aktivität, zu der die Kontextinformationen angezeigt werden
: @param $req-id Ausgewählte ID der Anforderung, falls diese für die Bearbeitung angewählt wurde
: @param $changes Unterschiede Kontextinformationen der Aktivität zur Vorgänger-Version 
: @return HTML-Seite für die Ansicht der Kontextinformationen in der Assitenz-Ansicht
:)
declare function reinfoview:info-panel($current-package,$compare-package,$ref-id, $req-id, $changes) {
  <div class="collapse-panel re-collapse-panel info-panel-header">
    <div class="header" data-toggle="collapse" aria-expanded="false" aria-controls="collapseExample">
      <dl class="palette">
        <dt>Kontextinformationen der Aktivität{ui:info-tooltip("Hier befinden sich alle für die Erhebung von Anforderungen relevanten Kontextinformationen der aktuell betrachteten Aktivität. Nutzen Sie diese um Anforderungen mit Hilfe der SOPHIST Schablone abzuleiten.")}</dt>
      </dl>
    </div>
    <div class="collapse in" id="collapseInfo">
      {reinfoview:info-div($current-package,$compare-package,$ref-id, $req-id, $changes)}
    </div>
  </div>
};

(:~
: Diese Funktion generiert den HTML Inhalt für den Inhalt des Panels, in dem die Kontextinformationen dargestellt sind 
: @param $current-package Das Paket, zu dem die Kontextinformationen angezeigt werden
: @param $compare-package Das Paket, zu dem die Kontextinformationen angezeigt werden
: @param $ref-id Die ID der Aktivität, zu der die Kontextinformationen angezeigt werden
: @param $req-id Ausgewählte ID der Anforderung, falls diese für die Bearbeitung angewählt wurde
: @param $inconsistencies Inkonsistenzen für die Aktivität mit ID $ref-id
: @return HTML-Panel für die Anzeige der Inkonsistenzen
:)
declare function reinfoview:info-div($current-package,$compare-package,$ref-id, $req-id, $inconsistencies) {  
  let $act-info-before := $compare-package/c:Activity[@Id=$ref-id]/c:ContextInformation
  let $act-info-current := $current-package/c:Activity[@Id=$ref-id]/c:ContextInformation
  
  let $doInputs-before := $act-info-before/c:DataObjectInputs/c:DataObjectInput
  let $doInputs-current := $act-info-current/c:DataObjectInputs/c:DataObjectInput
  let $doInputs := $doInputs-current | $doInputs-before[not(@Id=$doInputs-current/@Id)]
  
  let $doOutputs-before := $act-info-before/c:DataObjectOutputs/c:DataObjectOutput
  let $doOutputs-current := $act-info-current/c:DataObjectOutputs/c:DataObjectOutput
  let $doOutputs := $doOutputs-current | $doOutputs-before[not(@Id=$doOutputs-current/@Id)]
  
  let $dsInputs-before := $act-info-before/c:DataStoreInputs/c:DataStoreInput
  let $dsInputs-current := $act-info-current/c:DataStoreInputs/c:DataStoreInput
  let $dsInputs := $dsInputs-current | $dsInputs-before[not(@Id=$dsInputs-current/@Id)]
  
  let $dsOutputs-before := $act-info-before/c:DataStoreOutputs/c:DataStoreOutput
  let $dsOutputs-current := $act-info-current/c:DataStoreOutputs/c:DataStoreOutput
  let $dsOutputs := $dsOutputs-current | $dsOutputs-before[not(@Id=$dsOutputs-current/@Id)]
  
  let $predecessors-before := $act-info-before/c:Predecessors/c:Predecessor
  let $predecessors-current := $act-info-current/c:Predecessors/c:Predecessor
  let $predecessors := $predecessors-current | $predecessors-before[not(@Id=$predecessors-current/@Id)]
  
  return 
      <div id="info-div" class="panel-box info-panel">
    
       {reinfoview:info-element("Name"
                          ,<span style="font-weight:bold">{reinfoview:diff-name($inconsistencies,$act-info-current/c:Name)}</span>)}
       
       {reinfoview:info-element("Aktivität-Typ"
                          ,reinfoview:diff-taskType($inconsistencies,$act-info-current/c:TaskType))}
       
       {reinfoview:info-element("Rolle"
                          ,reinfoview:diff-perf($inconsistencies,$act-info-current/c:Performer))}
       
       {reinfoview:info-element("Dokumente"
                          ,(for $doInput in $doInputs return reinfoview:diff-doInputs($inconsistencies,$doInput)
                          ,for $doOutput in $doOutputs return reinfoview:diff-doOutputs($inconsistencies,$doOutput)))}
       {reinfoview:info-element("Systeme"
                          ,(for $dsInput in $dsInputs return reinfoview:diff-dsInputs($inconsistencies,$dsInput)
                          ,for $dsOutput in $dsOutputs return reinfoview:diff-dsOutputs($inconsistencies,$dsOutput)))}
       
       {reinfoview:info-element("Vorgänger"
                          ,for $predecessor in $predecessors return reinfoview:diff-predecessors($inconsistencies,$predecessor))}
                                 
    </div> 
};

(:~
: Diese Funktion generiert den HTML Code für die Differenzansicht der Werte der Kontextinformationen
: @param $changes Unterschiede Kontextinformationen der Aktivität zur Vorgänger-Version 
: @param $name Name der Aktivität
: @return HTML der Differenzansicht
:)
declare function reinfoview:diff-name($changes,$name) {
  let $relevant-changes := $changes[@Type=("CHANGE:ACT_NAME") and @ReferenceId=$name/@Id] return
  switch($relevant-changes/@Operation)
    case "update" return (<span style="text-decoration: line-through;color:red">{$relevant-changes/@From/string()}</span>
                           ,<span style="color:green">{reinfoview:link-html-glossary($relevant-changes/@To/string())}</span>)
    case "delete" return <span style="color:red;text-decoration: line-through">{$relevant-changes/@From/string()}</span>
    case "insert" return <span style="color:green">{reinfoview:link-html-glossary($relevant-changes/@To/string())}</span>
    default return <span>{reinfoview:link-html-glossary($name/string())}</span>
};

(:~
: Diese Funktion generiert den HTML Code für die Differenzansicht der Lane der Aktivität
: Diese Funktion generiert den HTML Code für die Differenzansicht der Werte der Kontextinformationen
: @param $changes Unterschiede der Aktivität zur Vorgänger-Version 
: @param $performer Name der Lane
: @return HTML der Differenzansicht
:)
declare function reinfoview:diff-perf($changes,$performer) {
  let $relevant-changes := $changes[@Type=("CHANGE:ACT_PERF") and @ReferenceId=$performer/@Id] return
  switch($relevant-changes/@Operation)
    case "update" return (<span style="text-decoration: line-through;color:red">{$relevant-changes/@From/string()}</span>
                           ,<span style="color:green">{reinfoview:link-html-glossary($relevant-changes/@To/string())}</span>)
    case "delete" return <span style="color:red;text-decoration: line-through">{$changes/@From/string()}</span>
    case "insert" return <span style="color:green">{reinfoview:link-html-glossary($relevant-changes/@To/string())}</span>
    default return <span>{reinfoview:link-html-glossary($performer/string())}</span>
};

(:~
: Diese Funktion generiert den HTML Code für die Differenzansicht des Typs der Aktivität
: @param $changes Unterschiede der Aktivität zur Vorgänger-Version 
: @param $tasktype Typ der Aktivität
: @return HTML der Differenzansicht
:)
declare function reinfoview:diff-taskType($changes,$tasktype) {
  let $relevant-changes := $changes[@Type=("CHANGE:ACT_TASKTYPE") and @ReferenceId=$tasktype/@Id] return
  switch($relevant-changes/@Operation)
    case "update" return (<span style="text-decoration: line-through;color:red">{$relevant-changes/@From/string()}</span>
                           ,<span style="color:green">{reinfoview:link-html-glossary($relevant-changes/@To/string())}</span>)
    case "delete" return <span style="color:red;text-decoration: line-through">{$relevant-changes/@From/string()}</span>
    case "insert" return <span style="color:green">{reinfoview:link-html-glossary($relevant-changes/@To/string())}</span>
    default return <span>{reinfoview:link-html-glossary($tasktype/string())}</span>
};

(:~
: Diese Funktion generiert den HTML Code für die Differenzansicht der Datenobjekte, welche von der Aktivität gelesen werden
: @param $changes Unterschiede der Aktivität zur Vorgänger-Version 
: @param $doInput Name des Datenobjekts
: @return HTML der Differenzansicht
:)
declare function reinfoview:diff-doInputs($changes,$doInput) {
  let $relevant-changes := $changes[@Type=("CHANGE:DO_INPUT_NAME","CHANGE:DO_INPUT") and @ReferenceId=$doInput/@Id] return
  switch($relevant-changes/@Operation)
    case "update" return <li>
                            <span style="text-decoration: line-through;color:red">{$relevant-changes/@From/string()}</span>
                            <span style="color:green">{reinfoview:link-html-glossary($relevant-changes/@To/string())}</span>
                          </li>
    case "delete" return <li style="color:red;text-decoration: line-through">{$relevant-changes/@From/string()}</li>
    case "insert" return <li style="color:green">{reinfoview:link-html-glossary($relevant-changes/@To/string())}</li>
    default return <li>{reinfoview:link-html-glossary($doInput/string())}</li>
};

(:~
: Diese Funktion generiert den HTML Code für die Differenzansicht der Datenobjekte, welche von der Aktivität geschrieben werden
: @param $changes Unterschiede der Aktivität zur Vorgänger-Version 
: @param $doOutput Name des Datenobjekts
: @return HTML der Differenzansicht
:)
declare function reinfoview:diff-doOutputs($changes,$doOutput) {
  let $relevant-changes := $changes[@Type=("CHANGE:DO_OUTPUT_NAME","CHANGE:DO_OUTPUT") and @ReferenceId=$doOutput/@Id] return
  switch($relevant-changes/@Operation)
    case "update" return <li>
                            <span style="text-decoration: line-through;color:red">{$relevant-changes/@From/string()}</span>
                            <span style="color:green">{reinfoview:link-html-glossary($relevant-changes/@To/string())}</span>
                          </li>
    case "delete" return <li style="color:red;text-decoration: line-through">{$relevant-changes/@From/string()}</li>
    case "insert" return <li style="color:green">{reinfoview:link-html-glossary($relevant-changes/@To/string())}</li>
    default return <li>{reinfoview:link-html-glossary($doOutput/string())}</li>
};

(:~
: Diese Funktion generiert den HTML Code für die Differenzansicht der Datenspeicher, welche von der Aktivität gelesen werden
: @param $changes Unterschiede der Aktivität zur Vorgänger-Version 
: @param $dsInput Name des Datenspeichers
: @return HTML der Differenzansicht
:)
declare function reinfoview:diff-dsInputs($changes,$dsInput) {
  let $relevant-changes := $changes[@Type=("CHANGE:DS_INPUT_NAME","CHANGE:DS_INPUT") and @ReferenceId=$dsInput/@Id] return
  switch($relevant-changes/@Operation)
    case "update" return <li>
                            <span style="text-decoration: line-through;color:red">{$relevant-changes/@From/string()}</span>
                            <span style="color:green">{reinfoview:link-html-glossary($relevant-changes/@To/string())}</span>
                          </li>
    case "delete" return <li style="color:red;text-decoration: line-through">{$relevant-changes/@From/string()}</li>
    case "insert" return <li style="color:green">{reinfoview:link-html-glossary($relevant-changes/@To/string())}</li>
    default return <li>{reinfoview:link-html-glossary($dsInput/string())}</li>
};

(:~
: Diese Funktion generiert den HTML Code für die Differenzansicht der Datenspeicher, welche von der Aktivität geschrieben werden
: @param $changes Unterschiede der Aktivität zur Vorgänger-Version 
: @param $dsOutput Name des Datenspeichers
: @return HTML der Differenzansicht
:)
declare function reinfoview:diff-dsOutputs($changes,$dsOutput) {
  let $relevant-changes := $changes[@Type=("CHANGE:DS_OUTPUT_NAME","CHANGE:DS_OUTPUT") and @ReferenceId=$dsOutput/@Id] return
  switch($relevant-changes/@Operation)
    case "update" return <li>
                            <span style="text-decoration: line-through;color:red">{$relevant-changes/@From/string()}</span>
                            <span style="color:green">{reinfoview:link-html-glossary($relevant-changes/@To/string())}</span>
                          </li>
    case "delete" return <li style="color:red;text-decoration: line-through">{$relevant-changes/@From/string()}</li>
    case "insert" return <li style="color:green">{reinfoview:link-html-glossary($relevant-changes/@To/string())}</li>
    default return <li>{reinfoview:link-html-glossary($dsOutput/string())}</li>
};

(:~
: Diese Funktion generiert den HTML Code für die Differenzansicht der Vorgänger einer Aktivität
: @param $changes Unterschiede der Aktivität zur Vorgänger-Version 
: @param $predecessor Name des Vorgängers
: @return HTML der Differenzansicht
:)
declare function reinfoview:diff-predecessors($changes,$predecessor) {
  let $relevant-changes := $changes[@Type=("CHANGE:ACT_PRED","CHANGE:ACT_PRED_NAME","CHANGE:ACT_PRED_TRANSITION") and @ReferenceId=$predecessor/@Id][1] return
  switch($relevant-changes/@Operation)
    case "update" return <li>
                            <span style="color:red;text-decoration: line-through;">{$relevant-changes/@From/string()}</span>
                            <span style="color:green">{reinfoview:link-html-glossary($relevant-changes/@To/string())}</span>
                          </li>
    case "delete" return <li style="color:red;text-decoration: line-through">{$relevant-changes/@From/string()}</li>
    case "insert" return <li style="color:green">{reinfoview:link-html-glossary($relevant-changes/@To/string())}</li>
    default return <li>{reinfoview:link-html-glossary($predecessor/string())}</li>
};

(:~
: Diese Funktion generiert den HTML Code die Anzeige eines Kontextinformations-Elements
: @param $key Name des Kontextinformations-Elements
: @param $value Wert des Kontextinformations-Elements
: @return HTML eines Elementes in den Kontextinformationen
:)
declare function reinfoview:info-element($key, $value) {
  let $random-id := random:uuid() return
  if($value and $value!="") then
    <dl class="dl-horizontal">
      <dt>{$key}</dt>
      <dd >{$value}</dd>
    </dl>
  else ()
};

(:~
: Diese Funktion generiert den HTML Code für die Einbettung des Tooltips in einen Text
: @param $text Text, welcher auf vorhandene Glossareinträge überprüft werden soll
: @return HTML, in dem die gefundenen Glossareinträge als Popover angezeigt werden
:)
declare function reinfoview:link-html-glossary($text) {
  for $word in tokenize($text," ") return <span>{reinfoview:link-glossary($word)}</span>
};

(:~
: Diese Funktion generiert den HTML Code für die Anzeige eines Tooltips, in dem die Erklärung eines Fachbegriffs erklärt wird
: @param $word Wort, welches auf vorhandene Glossareinträge überprüft werden soll
: @return HTML Popover, in dem die gefundenen Glossareinträge angezeigt werden
:)
declare function reinfoview:link-glossary($word) {
  let $entries := $gl:db/g:Entry[g:Key contains text {$word} using fuzzy using stemming] return
  if($entries)
    then <a title="{reinfoview:glossary2html($entries)}" data-template="{util:serialize-html(<div class='tooltip' role='tooltip'><div class='tooltip-arrow'/><div class='glossary-tooltip tooltip-inner'/></div>)}" data-toggle="tooltip" data-placement="right" data-content="{reinfoview:glossary2html($entries)}" style="cursor:help;">{$word}</a>
    else $word
};

(:~
: Diese Funktion generiert den HTML Code für den Inhalt eines Glossar-Tooltips
: @param $entries Glossareinträge
: @return serialisiertes HTML, welches den Inhalt des Glossar-Popovers zeigt
:)
declare function reinfoview:glossary2html($entries) {
  util:serialize-html(
    for $entry in $entries return
    <div>
      <span style="font-weight:bold"><i>{$entry/g:Key/string()}</i> bedeutet:</span>
      <br/>
      <div>{$entry/g:Value/string()}</div>
    </div>)
};