(:~
 : Dieses Modul stellt Informationen zur Verarbeitung von XPDL Dokumenten bereit. Diese werden für die Generierung des CARE-Formats benötigt.
 : @author Florian Eckey, Katharina Großer
 : @version 1.0
 :)
module namespace xm = 'masterthesis/modules/xpdl-manager';

declare namespace xpdl="http://www.wfmc.org/2009/XPDL2.2";

declare variable $xm:db-name := "xpdl-packages";

(:~
 : Diese Funktion berechnet die Lane einer Aktivität anhand der Koordinaten im BPMN Modell
 : @param $package XPDL
 : @param $activity Aktivität
 : @return <Lane>, in der die Aktivität liegt
:)
declare function xm:getLaneForActivity($package, $activity as element(xpdl:Activity)) as element(xpdl:Lane)*{
let $lanes:=$package/xpdl:Pools/xpdl:Pool/xpdl:Lanes/xpdl:Lane
let $x:=xs:decimal($activity/xpdl:NodeGraphicsInfos/xpdl:NodeGraphicsInfo/xpdl:Coordinates/@XCoordinate)
let $y:=xs:decimal($activity/xpdl:NodeGraphicsInfos/xpdl:NodeGraphicsInfo/xpdl:Coordinates/@YCoordinate)
return
  for $lane in $lanes
  let $px:=xs:decimal($lane/ancestor::xpdl:Pool/xpdl:NodeGraphicsInfos/xpdl:NodeGraphicsInfo/xpdl:Coordinates/@XCoordinate)
  let $py:=xs:decimal($lane/ancestor::xpdl:Pool/xpdl:NodeGraphicsInfos/xpdl:NodeGraphicsInfo/xpdl:Coordinates/@YCoordinate)
  let $lx1:=xs:decimal($lane/xpdl:NodeGraphicsInfos/xpdl:NodeGraphicsInfo/xpdl:Coordinates/@XCoordinate)+$px
  let $lx2:=xs:decimal($lane/xpdl:NodeGraphicsInfos/xpdl:NodeGraphicsInfo/xpdl:Coordinates/@XCoordinate)+xs:decimal($lane//@Width)+$px
  let $ly1:=xs:decimal($lane/xpdl:NodeGraphicsInfos/xpdl:NodeGraphicsInfo/xpdl:Coordinates/@YCoordinate)+$py
  let $ly2:=xs:decimal($lane/xpdl:NodeGraphicsInfos/xpdl:NodeGraphicsInfo/xpdl:Coordinates/@YCoordinate)+xs:decimal($lane//@Height)+$py
  where ($x>$lx1 and $x<$lx2 and $y>$ly1 and $y<$ly2)
  return $lane
};

(:~
 : Diese Funktion berechnet den Pool einer Aktivität anhand der Koordinaten im BPMN Modell
 : @param $package XPDL
 : @param $activity Aktivität
 : @return <Pool>, in der die Aktivität liegt
:)
declare function xm:getPoolForActivity($package, $activity as element(xpdl:Activity)) as element(xpdl:Pool)*{
let $lanes:=$package/xpdl:Pools/xpdl:Pool/xpdl:Lanes/xpdl:Lane
let $x:=xs:decimal($activity/xpdl:NodeGraphicsInfos/xpdl:NodeGraphicsInfo/xpdl:Coordinates/@XCoordinate)
let $y:=xs:decimal($activity/xpdl:NodeGraphicsInfos/xpdl:NodeGraphicsInfo/xpdl:Coordinates/@YCoordinate)
return
  for $lane in $lanes
  let $px:=xs:decimal($lane/ancestor::xpdl:Pool/xpdl:NodeGraphicsInfos/xpdl:NodeGraphicsInfo/xpdl:Coordinates/@XCoordinate)
  let $py:=xs:decimal($lane/ancestor::xpdl:Pool/xpdl:NodeGraphicsInfos/xpdl:NodeGraphicsInfo/xpdl:Coordinates/@YCoordinate)
  let $lx1:=xs:decimal($lane/xpdl:NodeGraphicsInfos/xpdl:NodeGraphicsInfo/xpdl:Coordinates/@XCoordinate)+$px
  let $lx2:=xs:decimal($lane/xpdl:NodeGraphicsInfos/xpdl:NodeGraphicsInfo/xpdl:Coordinates/@XCoordinate)+xs:decimal($lane//@Width)+$px
  let $ly1:=xs:decimal($lane/xpdl:NodeGraphicsInfos/xpdl:NodeGraphicsInfo/xpdl:Coordinates/@YCoordinate)+$py
  let $ly2:=xs:decimal($lane/xpdl:NodeGraphicsInfos/xpdl:NodeGraphicsInfo/xpdl:Coordinates/@YCoordinate)+xs:decimal($lane//@Height)+$py
  where ($x>$lx1 and $x<$lx2 and $y>$ly1 and $y<$ly2)
  return $lane/ancestor::xpdl:Pool
};

(:~
 : Diese Funktion liefert das Label eines eingehenden Sequenzflusses in einem XPDL
 : @param $package XPDL
 : @param $predecessor-id ID des Vorgängers
 : @param $activity-id ID der Aktivität
 : @return das Label des Sequenzflusses zwischen dem Vorgänger und der Aktivität
:)
declare function xm:get-transition-label-from-predecessor($package,$predecessor-id, $activity-id) {
  $package/xpdl:WorkflowProcesses/xpdl:WorkflowProcess/xpdl:Transitions/xpdl:Transition[@To=$activity-id and @From=$predecessor-id]/@Name/string()
};

(:~
 : Diese Funktion berechnet alle unmittelbaren Vorgänger einer Aktivität in einem XPDL
 : @param $package XPDL
 : @param $activity-id ID der Aktivität
 : @return Vorgänger der Aktivität
:)
declare function xm:getPredecessorActivities($package,$activity-id) {
  let $ingoing-transisitons := $package/xpdl:WorkflowProcesses/xpdl:WorkflowProcess/xpdl:Transitions/xpdl:Transition[@To=$activity-id]
  return $package/xpdl:WorkflowProcesses/xpdl:WorkflowProcess/xpdl:Activities/xpdl:Activity[@Id=$ingoing-transisitons/@From] 
};

(:~
 : Diese Funktion berechnet alle unmittelbaren Nachfolger einer Aktivität in einem XPDL
 : @param $package XPDL
 : @param $activity-id ID der Aktivität
 : @return Nachfolger der Aktivität
:)
declare function xm:getSuccessorActivities($package,$activity-id) {
  let $ingoing-transisitons := $package/xpdl:WorkflowProcesses/xpdl:WorkflowProcess/xpdl:Transitions/xpdl:Transition[@From=$activity-id]
  return $package/xpdl:WorkflowProcesses/xpdl:WorkflowProcess/xpdl:Activities/xpdl:Activity[@Id=$ingoing-transisitons/@To] 
};

(:~
 : Diese Funktion liefert den Typ eines BPMN Elements in einem XPDL
 : @param $package XPDL
 : @param $activity-id ID der Aktivität
 : @return Typ der Aktivität
:)
declare function xm:getActivityType($package, $activity-id) {
   let $activity := $package/xpdl:WorkflowProcesses/xpdl:WorkflowProcess/xpdl:Activities/xpdl:Activity[@Id=$activity-id]
   return
   if ($activity/xpdl:Event/xpdl:StartEvent) then 'StartEvent'
   else if ($activity/xpdl:Event/xpdl:EndEvent) then 'EndEvent' 
   else if ($activity/xpdl:Event/xpdl:IntermediateEvent) then 'IntermediateEvent' 
   else if ($activity/xpdl:Route/@GatewayType='Parallel') then 'ParallelGateway'
   else if ($activity/xpdl:Route/@GatewayType='Inclusive') then 'InclusiveGateway'
   else if ($activity/xpdl:Route/@ExclusiveType='Event') then 'ExclusiveGateway'
   else if ($activity/xpdl:Route) then 'ExclusiveGateway'
   else if ($activity/xpdl:Implementation/xpdl:Task) then 'Task'
   else 'not defined' 
};