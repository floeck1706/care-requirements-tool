(:~
 : Diese Modul dient stellt alle nötigen Funktionen zur Verarbeitung von XQDOC zur Verfügung.
 : @author Florian Eckey
 : @version 1.1
:)
module namespace inspection ="masterthesis/modules/inspection/inspection";

import module namespace graphml ="masterthesis/modules/inspection/graphml";
import module namespace functx="http://www.functx.com";

declare namespace i="inspections";
declare namespace xd="http://www.xqdoc.org/1.0";

(:~
 : Diese Funktion liefert die Pfad-Information zu allen XQuery-Modulen in dem übergeben Verzeichnis
 : @param $dir Verzeichnis der XQuery-Module
 : @param $recursive true, falls die Verzeichnisse rekursiv durchgegangen werden sollen
 : @return Sequenz von <module> Elementen
:)
declare function inspection:module-paths($dir,$recursive) {
  for $path in file:list($dir,$recursive,"*.xqm")
  let $path := $dir || file:dir-separator() || $path
  return <module dir="{inspection:relative-path($path)}" file="{file:name($path)}" fullpath="{$path}"/>
};

(:~
 : Diese Funktion liefert den relativen Pfad zu dem übergebenen Modul-Pfad
 : @param $path Pfad zu einem XQuery Modul
 : @return relativer Pfad
:)
declare function inspection:relative-path($path) {
  if(file:is-file($path)) then functx:substring-before-last($path,file:dir-separator()) else ()
};

(:~
 : Diese Funktion validiert ein XQuery-Modul auf vollständigkeit in der Dokumentation
 : @param $module Xquery-Modul, welches validiert werden soll
 : @return Validierungsfehler (falls keine vorhanden -> keine Fehler)
:)
declare function inspection:validate-module($module) {
  if($module/xd:module/xd:comment/xd:author/string()) then () else <validationFailed message="Kein Autor dokumentiert"/>
  ,if($module/xd:module/xd:comment/xd:version/string()) then () else <validationFailed message="Keine Version dokumentiert"/>
  ,if($module/xd:module/xd:comment/xd:description/string()) then () else <validationFailed message="Keine Beschreibung dokumentiert"/>
  ,for $function in $module/xd:functions/xd:function return inspection:validate-function($function)
};

(:~
 : Diese Funktion validiert eine XQuery-Funktion auf vollständigkeit in der Dokumentation
 : @param $function Xquery-Funktion, welche validiert werden soll
 : @return Validierungsfehler (falls keine vorhanden -> keine Fehler)
:)
declare function inspection:validate-function($function) {
  if($function/xd:comment/xd:description/string()) then () else <validationFailed message="Keine Beschreibung dokumentiert"/>
  ,if($function/xd:comment/xd:return/string() or $function/xd:annotations/xd:annotation[@name="updating"]) then () else <validationFailed message="Keine Rückgabewert dokumentiert"/>
  ,for $parameter in $function/xd:parameters/xd:parameter return inspection:validate-parameter($function,$parameter)
};

(:~
 : Diese Funktion validiert einen XQuery-Parameter auf vollständigkeit in der Dokumentation
 : @param $parameter Xquery-Parameter, welches validiert werden soll
 : @param $function Xquery-Funktion, in der sich der Prarameter befindet
 : @return Validierungsfehler (falls keine vorhanden -> keine Fehler)
:)
declare function inspection:validate-parameter($function, $parameter) {
  if(substring-after($function/xd:comment/xd:param[starts-with(string(),"$"||$parameter/xd:name/string()||" ")],"$"||$parameter/xd:name/string()||" ")="") then <validationFailed message="Keine Beschreibung dokumentiert"/> else ()
};

(:~
 : Diese Funktion liefert die das XQDOC aller XQuery-Module in dem übergebenen Verzeichnis
 : @param $dir Verzeichnis
 : @return XQDOC der Module
:)
declare function inspection:modules($dir) {
  let $modules := inspection:module-paths($dir, false()) return 
  <modules path="{$dir}">
    {for $module in $modules return copy $tmp:=inspect:xqdoc($module/@fullpath/string()) modify (
                                                insert node attribute id {random:uuid()} into $tmp
                                                ,insert node attribute path {$dir} into $tmp
                                              ) return $tmp}
  </modules>
};

(:~
 : Diese Funktion liefert die ID eines Moduls anhand des URIs
 : @param $modules XQDOC aller XQuery-Module
 : @param $uri URI des Moduls
 : @return ID des Moduls
:)
declare function inspection:get-id-by-uri($modules,$uri) {
  $modules[xd:module/xd:uri/string()=$uri]/@id
};

(:~
 : Diese Funktion liefert die das XQDOC aller XQuery-Module in den Verzeichnissen repo und webapp\restxq
 : @return XQDOC gruppiert nach Pfad
:)
declare function inspection:get-modules() {
  let $module-paths := (distinct-values(inspection:module-paths("repo",true())/@dir/string()),distinct-values(inspection:module-paths("webapp\restxq",true())/@dir/string()))
  let $modules := for $module-path in $module-paths return inspection:modules($module-path)
  return $modules
};

(:~
 : Diese Funktion liefert die Module, in denen das übergebene Modul importiert bzw. verwendet wird.
 : @param $modules XQDOC aller XQuery-Module
 : @param $module XQuery-Modul
 : @return XQDOC der Module
:)
declare function inspection:get-uses($modules,$module) {
  for $m in $modules/xd:xqdoc
    let $import-names := distinct-values($m/xd:imports/xd:import/xd:uri/string())
    for $import-name in $import-names return 
    if($import-name=$module/xd:module/xd:uri/string()) then $m else () 
};

(:~
 : Diese Funktion berechnet einen Graphen aus den Abhängigkeiten unter den Modulen als Graph-ML
 : @param $modules1 XQDOC aller XQuery-Module
 : @return Graph-ML der Abhängigkeiten aller Module
:)
declare function inspection:generate-graphml($modules1) {
      let $modules := for $module in $modules1/xd:xqdoc return $module
      let $nodes-repo := for $module in $modules where contains($module/@path,"repo") return graphml:generic-node($module/@id,$module/xd:module/xd:name/string(),"#ccffcc","#aedbae", "",())
      let $nodes-webapp := for $module in $modules where contains($module/@path,"webapp") return graphml:generic-node($module/@id,$module/xd:module/xd:name/string(),"#99ccff","#7faede", "",())
      let $nodes := $nodes-repo | $nodes-webapp
      let $edges := for $module in $modules 
                    for $import in $module/xd:imports/xd:import/xd:uri/string()
                    let $source := inspection:get-id-by-uri($modules,$import)
                    let $target := $module/@id/string()
                    return if($source and $target) then graphml:edge(random:uuid(),$source,$target,"#000000") else ()
      
      let $graph := graphml:graph($nodes,$edges)
      let $graphml := graphml:xml($graph)
      return $graphml
};

(:~
 : Diese Funktion extrahiert den Code einer Funktion als Text
 : @param $module-xqdoc XQDOC (muss @path enthalten)
 : @param $function-name Name der Funktion
 : @return Code der Funktion als Text
:)
declare function inspection:function-code($module-xqdoc,$function-name) {
  let $path := $module-xqdoc/@path || "\" || $module-xqdoc/xd:module/xd:name
  let $module-code := file:read-text($path)
  let $function := $module-xqdoc//*:function[*:name=$function-name]
  let $function-code := substring-after($module-code,$function-name)
  let $function-code := substring-after($function-code,"{")
  let $function-code := substring-before($function-code,"};")
  return replace($function-code,file:line-separator(),"<br/>")
};