(:~
 : Dieses Modul stellt Funktionen für die Generigung des HTML Inhalts für die Ansicht der Eingabe von Anforderungen in die SOPHIST Satzschablone für eine Aktivität zur Verfügung
 : @version 1.1
 : @author Florian Eckey
:)
module namespace view="masterthesis/modules/care/view/stancil-view";

import module namespace rsugg ="masterthesis/modules/care/suggestions";
import module namespace ui = 'masterthesis/modules/ui-manager';
import module namespace util="masterthesis/modules/utilities";

declare namespace c="care";

(:~
 : Diese Funktion generiert den HTML Inhalt für den Header des Panels, in dem die Eingabefelder für den Funktions-Master-Master der SOPHSIT Schablone dargestellt sind
 : @param $current-package Das Paket, zu dem die Kontextinformationen angezeigt werden
 : @param $compare-package Das Paket, mit dem die Kontextinformationen verglichen werden
 : @param $ref-id Die ID der Aktivität, zu der die Kontextinformationen angezeigt werden
 : @param $req-id Ausgewählte ID der Anforderung, falls diese für die Bearbeitung angewählt wurde
 : @return HTML-Panel für die Eingabe in die Schablone
 :)
declare function view:stancil-panel($current-package,$compare-package, $ref-id, $req-id) {
  <div class="collapse-panel re-collapse-panel stancil-panel-header">
    <div class="header" data-toggle="collapse" aria-expanded="false" aria-controls="collapseExample">
      <dl class="palette">
        <dt>Anforderungs - Schablone{ui:info-tooltip("Hier können Anforderungen mit Hilfer der SOPHIST Satzschablone eingegeben werden. Als default wird der FunktionsMASTER angezeigt. Für den BedingungsMASTER drücken Sie 'Strg + B'. Nochmaliges drücken von 'Strg + B' wecheslt die Arten des BedingungsMASTERs. Für den detaillierten FunktionsMASTER drücken Sie 'Strg + Leer'. <br/> Die Vorschläge für die Satzbausteine leiten sich aus den Kontextinformationen ab.")}</dt>
      </dl>
    </div>
    <div class="collapse in" id="collapseStancil">
      {view:stancil-form($current-package,$compare-package, $ref-id, $req-id)}
    </div>
  </div>
};

(:~
 : Diese Funktion generiert den HTML Inhalt für das Panel, in dem die Eingabefelder für den Bedingungs-Master der SOPHSIT Schablone dargestellt sind
 : @param $current-package Das Paket, zu dem die Kontextinformationen angezeigt werden
 : @param $compare-package Das Paket, mit dem die Kontextinformationen verglichen werden
 : @param $ref-id Die ID der Aktivität, zu der die Kontextinformationen angezeigt werden
 : @param $requirement Anforderung, welche in der Schablone bearbeitet werden soll, falls gesetzt
 : @return HTML-Panel für die Eingabe in die Bedingung der Schablone
 :)
declare function view:stancil-form-condition($current-package,$ref-id, $requirement) {
  let $care-ref := $current-package/c:Activity[@Id=$ref-id] return
  (<input type="hidden"  class="re-input" id="type" name="type" value="{$requirement/c:Condition/@Type}"/>
  ,<span id="span-condition-event" style="{if($requirement and $requirement/c:Condition/@Type='event') then '' else 'display:none'}">
    <input type="text" id="conjunction" class="re-tooltip re-input re-condition re-disabled" style="width:5%;min-width:150px" disabled="true" value="Sobald"/>
    <input type="text" id="subject-description" class="re-tooltip re-input re-condition re-disabled" style="width:7%;min-width:150px" disabled="true" value="das Ereignis"/>
    
    {ui:autocomplete-search-bar(
        rsugg:possible-events($care-ref)
        ,<input type="text" id="subject" name="subject" tabindex="1" placeholder="&#60;Ereignis&#62;" class="re-tooltip re-input re-condition" style="width:15%;min-width:150px" data-content="{view:info-tooltip('event')}" rel="tooltip" data-html="true" data-placement="top" value="{if($requirement) then $requirement/c:Condition[@Type='event']/c:Subject/string() else ()}"/>)}
    
    <input type="text" id="verb" tabindex="1" class="re-tooltip re-input re-condition re-disabled" style="width:5%;min-width:150px" disabled="true" value="eintritt"/>
    <span>,</span>
  </span>
  ,<span id="span-condition-logic" style="{if($requirement and $requirement/c:Condition/@Type='logic') then '' else 'display:none'}">
    
    <input type="text" id="conjunction" disabled="true" class="re-tooltip re-input re-condition re-disabled" style="width:5%;min-width:150px" value="Falls"/>
    
    {ui:autocomplete-search-bar(
        rsugg:possible-conditions($care-ref)
        ,<input type="text" id="comparisonItem" name="comparisonItem" tabindex="1" placeholder="&#60;Entscheidung&#62;" class="re-tooltip re-input re-condition" style="width:15%;min-width:200px" data-content="{view:info-tooltip('gateway')}" rel="tooltip" data-html="true" data-placement="top" value="{if($requirement) then $requirement/c:Condition[@Type='logic']/c:ComparisonItem/string() else ()}"/>)}
        
    <input type="text" id="comparisonOperator" class="re-tooltip re-input re-condition re-disabled" style="width:5%;min-width:150px" disabled="true" value="gleich"/>
    
    {ui:autocomplete-search-bar(
        rsugg:possible-transitions($care-ref)
        ,<input type="text" id="value" name="value" tabindex="2" placeholder="&#60;Transition&#62;" class="re-tooltip re-input re-condition" style="width:7%;min-width:150px" data-content="{view:info-tooltip('transition')}" rel="tooltip" data-html="true" data-placement="top" value="{if($requirement) then $requirement/c:Condition[@Type='logic']/c:Value/string() else ()}"/>)}
    
    <input type="text" id="verb" class="re-tooltip re-input re-condition" style="width:5%;min-width:100px" disabled="true" value="ist"/>
    <span>,</span>
  </span>)
};

(:~
 : Diese Funktion generiert den HTML Inhalt für das Panel, in dem die Eingabefelder für den Funktions-Master-Master der SOPHSIT Schablone dargestellt sind
 : @param $current-package Das Paket, zu dem die Kontextinformationen angezeigt werden
 : @param $compare-package Das Paket, mit dem die Kontextinformationen verglichen werden
 : @param $ref-id Die ID der Aktivität, zu der die Kontextinformationen angezeigt werden
 : @param $req-id Ausgewählte ID der Anforderung, falls diese für die Bearbeitung angewählt wurde
 : @return HTML-Formular für die Eingabe in die Schablone
 :)
declare function view:stancil-form($current-package,$compare-package, $ref-id, $req-id) {
    let $care-ref := $current-package/c:Activity[@Id=$ref-id]
    let $requirement := $care-ref/c:Requirements/c:Requirement[@Id=$req-id]
    return
    <div id="stancil" class="panel-box stancil-panel">
      <form id="stancil-form" class="form" action="{$ui:prefix}/restancil/save/{$current-package/@Id}/{$current-package/@VersionId}/{$ref-id}?{if($req-id) then 'req-id='|| $requirement/@Id else ()}" method="post" autocomplete="off">
      
          {view:stancil-form-condition($current-package,$ref-id,$requirement)}
          
          {ui:autocomplete-search-bar(
                  rsugg:possible-systems($current-package,$care-ref)
                  ,<input type="text" id="system" name="system" placeholder="&#60;System&#62;" class="re-tooltip re-input re-main" style="width:6%;min-width:150px" data-content="{view:info-tooltip('system')}" rel="tooltip" data-html="true" data-placement="top" value="{if($requirement) then $requirement/c:System/string() else 'System'}"/>)}
          
          {ui:autocomplete-search-bar(
              rsugg:possible-liabilities()
              ,<input type="text" id="liability" name="liability" placeholder="&#60;Verbindlichkeit&#62;" class="re-tooltip re-input re-main" style="width:6%;min-width:100px" data-content="{view:info-tooltip('liability')}" rel="tooltip" data-html="true" data-placement="top" value="{if($requirement) then $requirement/c:Liability/string() else 'muss'}"/>)}
              
          {ui:autocomplete-search-bar(
                  rsugg:possible-actors($care-ref)
                  ,<input type="text" id="actor" name="actor" tabindex="4" placeholder="&#60;Akteur&#62;" class="re-tooltip re-input re-main" style="width:15%;min-width:200px" data-content="{view:info-tooltip('actor')}" rel="tooltip" data-html="true" data-placement="top" value="{if($requirement) then $requirement/c:Actor/string() else ()}"/>)}
          
          {ui:autocomplete-search-bar(
                  rsugg:possible-functionalities()
                  ,<input type="text" id="functionality" name="functionality" tabindex="5" placeholder="&#60;Art der Funktionalität&#62;" class="re-tooltip re-input re-main" style="width:15%;min-width:250px" data-content="{view:info-tooltip('functionality')}" rel="tooltip" data-html="true" data-placement="top" value="{if($requirement) then $requirement/c:Functionality/string() else ()}"/>)}
          
          {ui:autocomplete-search-bar(
                  rsugg:possible-objectdetails1($current-package,$care-ref)
                  ,<input type="text" id="object-detail1" name="object-detail1" tabindex="5" placeholder="&#60;Welches? Welche? Welcher?&#62;" class="re-tooltip re-input re-object-detail" style="width:25%; {if($requirement and $requirement/c:ObjectDetail1/string()) then '' else 'display:none'}" data-content="{view:info-tooltip('object-detail1')}" rel="tooltip" data-html="true" data-placement="top" value="{if($requirement) then $requirement/c:ObjectDetail1/string() else ()}" autocomplete="off"/>)}
                  
          {ui:autocomplete-search-bar(
                  rsugg:possible-objects($care-ref)
                  ,<input type="text" id="object" name="object" tabindex="6" placeholder="&#60;Objekt&#62;" class="re-tooltip re-input re-main" style="width:28%;min-width:200px" data-content="{view:info-tooltip('object')}" rel="tooltip" data-html="true" data-placement="top" value="{if($requirement) then $requirement/c:Object/string() else ()}"/>)}
                  

          
          {ui:autocomplete-search-bar(
                  rsugg:possible-objectdetails2($current-package,$care-ref)
                  ,<input type="text" id="object-detail2" name="object-detail2" tabindex="7" placeholder="&#60;Wessen?&#62;" class="re-tooltip re-input re-object-detail" style="width:18%; {if($requirement and $requirement/c:ObjectDetail2/string()) then '' else 'display:none'}" data-content="{view:info-tooltip('object-detail2')}" rel="tooltip" data-html="true" data-placement="top" value="{if($requirement) then $requirement/c:ObjectDetail2/string() else ()}"/>)}
                  
          {ui:autocomplete-search-bar(
                  rsugg:possible-processverbdetails($current-package,$care-ref)
                  ,<input type="text" id="processverb-detail" name="processverb-detail" tabindex="8" placeholder="&#60;Wann? Wo? Woher? Wohin?&#62;" class="re-tooltip re-input re-processverb-detail" style="width:20%; {if($requirement and $requirement/c:ProcessVerbDetail/string()) then '' else 'display:none'}" data-content="{view:info-tooltip('processverb-detail')}" rel="tooltip" data-html="true" data-placement="top" value="{if($requirement) then $requirement/c:ProcessVerbDetail/string() else()}"/>)}
           
           
                  
          {ui:autocomplete-search-bar(
                  rsugg:possible-processverbs($current-package,$care-ref)
                  ,<input type="text" id="processverb" name="processverb" tabindex="9" placeholder="&#60;Prozesswort&#62;" class="re-tooltip re-input re-main" style="width:20%" data-content="{view:info-tooltip('processverb')}" rel="tooltip" data-html="true" data-placement="top" value="{if($requirement) then $requirement/c:ProcessVerb/string() else ()}"/>)}
          
        {view:validation-div("Bitte füllen Sie die Schablone vollständig und korrekt aus.", "error")}  
        
        <p>
            {if($requirement) then (<a class="btn btn-sm btn-stancil" tabindex="11" onclick="submitRequirement()"><span class="fui-check"/> Anforderung bearbeiten</a>
            ,<a class="btn btn-sm btn-stancil" tabindex="11" href="{$ui:prefix}/requirements-manager/assist/{$current-package/@Id}/{$current-package/@VersionId}/{$ref-id}">Abbrechen</a>) else <a class="btn btn-stancil btn-sm" tabindex="11" onclick="submitRequirement()"><span class="fui-check"/> Anforderung eintragen</a>}
            
        </p>
      </form>
    </div>
    ,<script type="text/javascript" src="{$ui:prefix}/static/care/js/requirements_bindings.js"/>
};

(:~
 : Diese Funktion generiert den HTML Inhalt für das Panel, in dem die Eingabefelder für den Funktions-Master-Master der SOPHSIT Schablone dargestellt sind
 : @param $message Die Validierungs-Nachricht, die angezeigt werden soll
 : @param $type Der Typ der Fehlermeldung (wird nicht verwendet)
 : @return HTML-Panel für die Validierung der Eingabe in die Schablone
 :)
declare function view:validation-div($message, $type) {
  <div class="validation">
      {$message}<a id="validation-close" class="glyphicon glyphicon-remove validation-close pull-right"/>
  </div>
};

(:~
 : Diese Funktion generiert den HTML Inhalt ein Tooltip, welches über jedem Baustein der Schablone angezeigt wird, in dem sich zusätzliche Informationen zu dem Baustein befinden
 : @param $element Art des Schablonen-Bausteins, zui dem die Informationen angezeigt werden sollen
 : @return HTML-Tooltip
 :)
declare function view:info-tooltip($element as xs:string) {
  let $content :=
    switch($element)
      case "system" return 
        <div>Tragen Sie das System ein, für das die Anforderung erhoben wird. Ist ggf. ein <a id="condition-link" style="cursor:pointer" onclick="$('#span-condition-event').toggle();switchSystemAndObject();$('.re-input#condition').focus().val('')">Bedingungssatz</a> (Strg + b) erforderlich?</div>
        
      case "liability" return <div>Tragen Sie eine Verbindlichkeit der Anforderung ein. Wie wichtig ist diese für das Zielsystem?</div>   
      
      case "actor" return <div>Tragen Sie eine Zuständigkeit der Anforderung ein. Diese lässt sich aus der Rolle der Aktivität herleiten.</div>  
      
      case "functionality" return <div>Tragen Sie eine Funktionalität. Wird vom System eine Aktion automatisch ausgeführt (leer lassen) oder agiert ein Akteur ('die Möglichkeit bieten')? Dies lässt sich aus dem Typ der Aktivität herleiten.</div> 
      
      case "object" return <div>Tragen Sie das Objekt ein, um das es in der Anforderung geht. Dies lässt sich aus den Dokumenten oder Systemen der Aktivität herleiten. Können Sie das Objekt <span id="object-in-tooltip" style="color:green"></span> präzisieren? Fragen Sie nach <a id="object-detail1-link" onclick="$('#object-detail1').toggle().focus().val('');$('#object-detail1-in-tooltip').html($('#object').val())">Welches? Welche? Welcher?</a> oder <a id="object-detail2-link" onclick="$('#object-detail2').toggle().focus().val('');$('#objcet-detail2-in-tooltip').html($('#object').val())">Wessen?</a> (Strg + Leer)</div> 
      
      case "object-detail1" return <div>Präzisieren Sie das Objekt <span id="object-detail1-in-tooltip" style="color:green"></span>. <a onclick="$('#object-detail1').toggle().val('')"><i class="glyphicon glyphicon-remove pull-right"/></a></div>   
      
      case "object-detail2" return <div>Präzisieren Sie das Objekt <span id="object-detail2-in-tooltip" style="color:green"></span>. <a onclick="$('#object-detail2').toggle().val('')"><i class="glyphicon glyphicon-remove pull-right"/></a></div>
      
      case "processverb" return <div>Was wird in Anforderung von dem System verlangt? <span id="processverb-in-tooltip" style="color:green"></span>. Fragen Sie nach <a id="processverb-detail-link" onclick="$('#processverb-detail').toggle().focus().val('');$('#processverb-detail-in-tooltip').html($('#processverb').val())">Wann? Wo? Woher? Wohin?</a> (Strg + Leer)</div> 
      
      case "processverb-detail" return <div>Konkretisieren Sie das Prozesswort <span id="processverb-detail-in-tooltip" style="color:green"></span>. <a onclick="$('#process-detail').toggle().val('')"><i class="glyphicon glyphicon-remove pull-right"/></a></div>
      
      case "event" return <div>Welches Ereignis muss eintreten, damit die Anforderung, welche im Hauptsatz formuliert ist, greift?</div>
      
      case "gateway" return <div>Welche Entscheidungsparameter oder welche Frage ist Basis der Entscheidung?</div>
      
      case "transition" return <div>Welche Entscheidung muss getroffen werden, damit die Anforderung greift? Dies Lässt sich aus dem Label der Transistion von dem vorherigen Gateway herleiten</div>
      
      default return "Kein Tooltip"
      
  return util:serialize-html($content)
};