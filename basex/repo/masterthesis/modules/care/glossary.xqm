(:~
 : Dieses Modul stellt alle Funktionen für das Glossar zur Verfügung.
 : @version 1.1
 : @author Florian Eckey
:)
module namespace gl ="masterthesis/modules/care/glossary";

declare namespace g ="glossary";

declare variable $gl:db := doc("glossary")/g:Glossary;

(:~
 : Diese Funktion erzeugt das XML für einen neuen Glossar-Eintrag
 : @param $key Der Fachbegriff, unter dem der Glossareintrag erfasst wird
 : @param $value Die Beschreibung zu dem Fachbegriff
 : @param $category Die Kategorie, in die der Fachbegriff eingeordnet wird
 : @return Glossar-Eintrag (XML)
:)
declare function gl:new-entry($key,$value,$category) {
  <Entry Id="{random:uuid()}" Category="{$category}">
    <Key>{$key}</Key>
    <Value>{$value}</Value>
  </Entry>
};

(:~
 : Diese Funktion speichert den übergebenen Glossar-Eintrag in der Datenbank
 : @param $entry Glossar-Eintrag, der in der Datenbank gespeichert werden soll (XML)
:)
declare updating function gl:save($entry) {
  let $existing-entry := $gl:db/g:Entry[@Id=$entry/@Id] return 
  if($existing-entry) 
    then replace node $existing-entry with $entry
    else insert node $entry into $gl:db
};

(:~
 : Diese Funktion löscht den Glossar-Eintrag mit der übergebenen ID in der Datenbank
 : @param $entry-id ID des Glossareintrags, der gelöscht werden soll
:)
declare updating function gl:delete($entry-id) {
  delete node $gl:db/g:Entry[@Id=$entry-id]
};

(:~
 : Diese Funktion löscht das gesamte Glossar
:)
declare updating function gl:delete() {
  for $node in $gl:db/g:Entry return delete node $node
};

(:~
 : Diese Funktion liefert den Glossar-Eintrag mit der übergebenen ID
 : @param $entry-id ID des Glossareintrags, der zurückgegeben werden soll
 : @return Glossareintrag mit der übergebenen ID
:)
declare function gl:get($entry-id) {
  $gl:db/g:Entry[@Id=$entry-id]
};