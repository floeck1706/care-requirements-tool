(:~
 : Dieses Modul stellt Hilfs-Funktionen bereit, die in der Implementierung verwendet werden.
 : @author Florian Eckey
 : @version 1.0
 :)
module namespace utilities="masterthesis/modules/utilities";

(:~
 : Diese Funktion liefert das nachfolgende Element in einer XML Stuktur
 : @param $data XML Sequenz
 : @param $ts XML Element
 : @return Das darauf folgende XML Element in der Sequenz
 :)
declare function utilities:next-ts($data, $ts) as element(*)* {
          $data[utilities:index-of($data, $ts) + 1]
};

(:~
 : Diese Funktion liefert den Index eines Elements in einer XML Sturktur anhand der ID des Elements
 : @param $data XML Sequenz
 : @param $ts XML Element
 : @return Index des XML Elements in der Sequenz
 :)
declare function utilities:index-of($data as element(*)+, $ts as element(*)) as xs:integer {
          max(for $tmp at $i in $data return if($tmp/@Id=$ts/@Id) then $i else 0)
};

(:~
 : Diese Funktion liefert das vorgänger Element in einer XML Stuktur
 : @param $data XML Sequenz
 : @param $ts XML Element
 : @return Das vorherige XML Element in der Sequenz
 :)
declare function utilities:prev-ts($data, $ts) as element(*)* {
          $data[utilities:index-of($data, $ts) - 1]
};

(:~
 : Diese Funktion liefert aktuellste Element in einer XML Struktur anhand des Timestamps
 : @param $elements XML Sequenz
 : @return Das XML Element mit dem neusten Timestamp
 :)
declare function utilities:latest-element($elements) as element(*)* {
  let $max := max(for $timestamp in $elements/@Timestamp return xs:dateTime($timestamp))
  return $elements[xs:dateTime(@Timestamp)=$max]
};

(:~
 : Diese Funktion vergleicht zwei Elemente auf Identität anhand des Hashwertes der Elemente
 : @param $e1 Element 1
 : @param $e2 Element 2
 : @return true, wenn die beiden XML Elemente gleich sind, ansonsten false
 :)
declare function utilities:hash-eq($e1,$e2) {
  if(hash:md5(serialize($e1))=hash:md5(serialize($e2))) then xs:boolean("true") else xs:boolean("false")
};

(:~
 : Diese Funktion serilisiert den übergebenen HTML Inhalt (für Tooltips mit HTML Inhalt)
 : @param $content HTML-Inhalt, der serialisiert werden soll
 : @return Serialisierter HTML Inhalt
 :)
declare function utilities:serialize-html($content) {
  serialize($content,<output:serialization-parameters xmlns:output="http://www.w3.org/2010/xslt-xquery-serialization">
                              <output:omit-xml-declaration value="yes"/>
                              <output:method value="html"/>
                            </output:serialization-parameters>)
};