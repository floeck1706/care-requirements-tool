(:~
 : Dieses Modul stellt alle Funktionen zur Überprüfung der Konsistenz zwischen Anforderungen und Kontextinformationen einer Aktivität bereit.
 : @author Florian Eckey
 : @version 1.0
 :)
module namespace cm = 'masterthesis/modules/consistency-manager';

declare namespace c="care";

(:~
 : Diese Funktion führt alle Konsistenztests durch
 : @param $care-ref Aktivität
 : @param $inconsistencies Liste der bereits berechneten Änderungen in der Aktivität
 : @return Liste aller Inkonsistenzen
:)
declare function cm:check-consistency($care-ref, $inconsistencies) {
  let $result := (cm:check-rule1($care-ref)
                          ,cm:check-rule2($care-ref)
                          ,cm:check-rule4($care-ref)
                          ,cm:check-rule5($care-ref)
                          ,cm:check-rule6($care-ref)
                          ,cm:check-rule7($care-ref)
                          ,cm:check-rule8($care-ref, $inconsistencies)
                          ,cm:check-rule9($care-ref, $inconsistencies)
                          ,cm:check-rule10($care-ref, $inconsistencies)
                          ,cm:check-rule12($care-ref, $inconsistencies))
  return
  if($result) then ($inconsistencies[@Type="CHANGE:ACT_NAME"],$result) else ()
};

(:~
 : Diese Funktion überprüft eine Konsistenzbedingung:
 : Alle Datenobjekte müssen als Objekte in den Anforderungen auftauchen
 : @param $care-ref Aktivität
 : @return Inkonsistenzen, die duch verletzen der Konsistenzbedingung auftreten
:)
declare function cm:check-rule1($care-ref) {
  let $requirements := $care-ref/c:Requirements/c:Requirement
  let $context-information := $care-ref/c:ContextInformation
  for $info-data in $context-information/*[starts-with(name(),"DataObject")]/*
          let $info-data-name := $info-data/string() 
          return
             if(not(exists(index-of($requirements/c:Object/string(),$info-data-name)))) 
               then <Inconsistency Type="CARE:DO" ReferenceName="{$info-data-name}" ReferenceId="{$info-data/@Id}">
                      <span>Das Dokument <span class="re-less">{$info-data-name}</span> taucht nicht in den Anforderungen auf.</span>
                    </Inconsistency> else ()
};

(:~
 : Diese Funktion überprüft eine Konsistenzbedingung:
 : Alle Datenspeicher müssen als Objekte in den Anforderungen auftauchen
 : @param $care-ref Aktivität
 : @return Inkonsistenzen, die duch verletzen der Konsistenzbedingung auftreten
:)
declare function cm:check-rule2($care-ref) {
  let $requirements := $care-ref/c:Requirements/c:Requirement
  let $context-information := $care-ref/c:ContextInformation
  for $info-data in $context-information/*[starts-with(name(),"DataStore")]/*
         let $info-data-name := $info-data/string() 
         let $objects := string-join($requirements/c:Object/string())
         let $processverbdetails := string-join($requirements/c:ProcessVerbDetail/string())
          return
          if(not(contains($objects,$info-data-name)) and not(contains($processverbdetails,$info-data-name)))
            then <Inconsistency Type="CARE:DS" Artefact="{$info-data-name}" ArtifactId="{$info-data/@Id}">
                   <span>Das System <span class="re-less">{$info-data-name}</span> taucht nicht in den Anforderungen auf.</span>
                 </Inconsistency> else ()
};

(:~
 : Diese Funktion überprüft eine Konsistenzbedingung:
 : Der Typ der Aktivität muss der Art der Funktionalität der Anforderung entsprechen
 : @param $care-ref Aktivität
 : @return Inkonsistenzen, die duch verletzen der Konsistenzbedingung auftreten
:)
declare function cm:check-rule4($care-ref) {
  let $requirements := $care-ref/c:Requirements/c:Requirement
  let $context-information := $care-ref/c:ContextInformation return
  if($context-information/c:TaskType=("ServiceTask","TaskSend"))
          then for $req in $requirements
                 return if(not($req/c:Functionality/string()="fähig sein"))
                          then <Inconsistency Type="RE:FUNCT" Artefact="{$req/c:Functionality/string()}" ReqId="{$req/@Id}">
                                 <span>Der Akteur <span class="re-less">{$req/c:Functionality/string()}</span> entspricht nicht der Rolle, durch die die Aktivität ausgeführt wird. Dies sollte korrigiert werden.</span>
                               </Inconsistency> else () 
         else ()
};


(:~
 : Diese Funktion überprüft eine Konsistenzbedingung:
 : Der Akteur der Anforderungen muss der Lane der Aktivität entsprechen
 : @param $care-ref Aktivität
 : @return Inkonsistenzen, die duch verletzen der Konsistenzbedingung auftreten
:)
declare function cm:check-rule5($care-ref) {
  let $requirements := $care-ref/c:Requirements/c:Requirement
  let $context-information := $care-ref/c:ContextInformation
  let $act-performer := $context-information/c:Performer/string() return
  if($requirements) then
    for $re in $requirements
    let $re-actor := $re/c:Actor/string() return
            if($re-actor=$act-performer or $context-information/c:TaskType/string()="Systemaktivität") then ()
              else <Inconsistency Type="RE:ACTOR" Artefact="{$re-actor}" ReqId="{$re/@Id}">
                      <span>Der Akteur der Anforderung {$re/@Prefix/string()} stimmt nicht mit der Rolle der Aktivität überein.</span>
                   </Inconsistency>
  else ()
};

(:~
 : Diese Funktion überprüft eine Konsistenzbedingung:
 : Wenn der Vorgänger einer Aktivität ein Bedingung ist, muss es mindestens eine Anforderung mit einer Bedingung geben
 : @param $care-ref Aktivität
 : @return Inkonsistenzen, die duch verletzen der Konsistenzbedingung auftreten
:)
declare function cm:check-rule6($care-ref) {
  let $requirements := $care-ref/c:Requirements/c:Requirement
  let $context-information := $care-ref/c:ContextInformation
  let $act-predecessors := $context-information/c:Predecessors/c:Predecessor
  let $re-conditions := $requirements/c:Condition
  for $predecessor in $act-predecessors 
  return
  (if(contains(lower-case($predecessor/@Type/string()),"event")) then
    if($re-conditions[c:Subject/string()=$predecessor/string()]) then ()
    else <Inconsistency Type="RE:CONDITION_EVENT" Artifact="{$predecessor/string()}"><span>Das Ereignis <span class="re-less">{$predecessor/string()}</span> ist nicht als Bedingung formuliert.</span></Inconsistency> 
  else if(contains(lower-case($predecessor/@Type/string()),"exclusive")) then
    if($re-conditions[c:ComparisonItem/string()=$predecessor/string() and c:Value/string()=$predecessor/@Transition/string()]) then ()
    else <Inconsistency Type="RE:CONDITION_GATEWAY" Artifact="{$predecessor/string()}"><span>Die Entscheidung <span class="re-less">{$predecessor/string()}</span> mit Transition <span class="re-less">{$predecessor/@Transition/string()}</span> ist nicht als Bedingung formuliert.</span></Inconsistency>
  else ())
};

(:~
 : Diese Funktion überprüft eine Konsistenzbedingung:
 : Wenn der Vorgänger einer Aktivität ein Ereignis ist, muss es mindestens eine Anforderung mit einer Bedingung geben
 : @param $care-ref Aktivität
 : @return Inkonsistenzen, die duch verletzen der Konsistenzbedingung auftreten
:)
declare function cm:check-rule7($care-ref) {
  let $requirements := $care-ref/c:Requirements/c:Requirement
  let $context-information := $care-ref/c:ContextInformation
  let $act-task-type := $context-information/c:TaskType/string() return 
  if($requirements) then
    for $requirement in $requirements 
      let $re-functionality := $requirement/c:Functionality/string() return
      (if($act-task-type="Systemaktivität") then 
         if($re-functionality="") then ()
         else <Inconsistency Type="RE:CONDITION_EVENT" RedId="{$requirement/@Id}"><span>Die Anforderung {$requirement/@Prefix/string()} ist keine Systemfunktionalität.</span></Inconsistency>
       else ()
      ,if($act-task-type="Benutzeraktivität") then
         if($re-functionality="die Möglichkeit bieten") then ()
         else <Inconsistency Type="RE:CONDITION_EVENT" RedId="{$requirement/@Id}"><span>Die Anforderung {$requirement/@Prefix/string()} ist keine Benutzerfunktionalität.</span></Inconsistency>
       else ())
  else ()
};

(:~
 : Diese Funktion überprüft eine Konsistenzbedingung:
 : Wenn der Vorgänger einer Aktivität ein Ereignis ist, muss es mindestens eine Anforderung mit einer Bedingung geben
 : @param $care-ref Aktivität
 : @param $inconsistencies Liste der bereits berechneten Änderungen in der Aktivität
 : @return Inkonsistenzen, die duch verletzen der Konsistenzbedingung auftreten
:)
declare function cm:check-rule8($care-ref, $inconsistencies) {
  let $requirements := $care-ref/c:Requirements/c:Requirement
  for $inconsistency in $inconsistencies[@Type=("CHANGE:DO_INPUT_NAME","CHANGE:DS_INPUT_NAME","CHANGE:DO_OUTPUT_NAME","CHANGE:DS_OUTPUT_NAME","CHANGE:DO_INPUT","CHANGE:DS_INPUT","CHANGE:DO_OUTPUT","CHANGE:DS_OUTPUT")]
    return if(($inconsistency/@From/string()=$requirements/c:Object/string() and $inconsistency/@Operation=('update','delete')) or
              not($inconsistencies/@To/string()=$requirements/c:Object/string() and $inconsistency/@Operation=('update','insert'))) then $inconsistency else ()
};

(:~
 : Diese Funktion prüft, ob eine Änderung des Akteurs notwendig ist
 : @param $care-ref Aktivität
 : @param $inconsistencies Liste der bereits berechneten Änderungen in der Aktivität
 : @return Inkonsistenzen, die duch verletzen der Konsistenzbedingung auftreten
:)
declare function cm:check-rule9($care-ref, $inconsistencies) {
  let $requirements := $care-ref/c:Requirements/c:Requirement
  for $inconsistency in $inconsistencies[@Type=("CHANGE:ACT_PERF")]
    return if($inconsistency/@From/string()=$requirements/c:Actor/string()) then $inconsistency else ()
};

(:~
 : Diese Funktion prüft, ob eine Änderung einer Bedingung notwendig ist
 : @param $care-ref Aktivität
 : @param $inconsistencies Liste der bereits berechneten Änderungen in der Aktivität
 : @return Inkonsistenzen, die duch verletzen der Konsistenzbedingung auftreten
:)
declare function cm:check-rule10($care-ref, $inconsistencies) {
  let $requirements := $care-ref/c:Requirements/c:Requirement
  let $context-information := $care-ref/c:ContextInformation
  return 
  (for $inconsistency in $inconsistencies[@Type=("CHANGE:ACT_PRED","CHANGE:ACT_PRED_NAME","CHANGE:ACT_PRED_TRANSITION")]
    return if( ($requirements/c:Condition[@Type="event"]/c:Subject/string()=$inconsistency/@From/string() and $inconsistency/@Operation=('update','delete') or
                ($requirements/c:Condition[@Type="event"] and not($requirements/c:Condition[@Type="event"]/c:Subject/string()=$inconsistencies/@To/string() and $inconsistency/@Operation=('update','insert'))))
                
                or
                
                ($requirements/c:Condition[@Type="logic"]/c:ComparisonItem/string()=$inconsistency/@From/string() and $inconsistency/@Operation=('update','delete') or
                ($requirements/c:Condition[@Type="logic"] and not($requirements/c:Condition[@Type="logic"]/c:ComparisonItem/string()=$inconsistencies/@To/string() and $inconsistency/@Operation=('update','insert'))))
                
                or
                
                ($requirements/c:Condition[@Type="logic"]/c:Value/string()=$inconsistency/@From/string() and $inconsistency/@Operation=('update','delete') or
                ($requirements/c:Condition[@Type="logic"] and not($requirements/c:Condition[@Type="logic"]/c:Value/string()=$inconsistencies/@To/string() and $inconsistency/@Operation=('update','insert')))))
                
           then $inconsistency 
           else ())
};

(:~
 : Diese Funktion prüft, ob eine Änderung der Art der Funktionalität notwendig ist
 : @param $care-ref Aktivität
 : @param $inconsistencies Liste der bereits berechneten Änderungen in der Aktivität
 : @return Inkonsistenzen, die duch verletzen der Konsistenzbedingung auftreten
:)
declare function cm:check-rule12($care-ref, $inconsistencies) {
  let $requirements := $care-ref/c:Requirements/c:Requirement
  let $context-information := $care-ref/c:ContextInformation
  let $requirement-type := $context-information/c:TaskType/string() 
  return
  for $inconsistency in $inconsistencies[@Type=("CHANGE:ACT_TASKTYPE")]
    return if(($requirements/c:Functionality/string() = ""  and $inconsistency/@From/string()="Systemfunktionalität") or ($requirements/c:Functionality/string() = "die Möglichkeit bieten"  and $inconsistency/@From/string()="Benutzeraktivität")) then $inconsistency else ()
};