(:~
 : Diese Modul generiert die Start-Seite der Webanwendung.
 : @version 1.0
 : @author Florian Eckey
 :)
module namespace page = 'masterthesis/modules/web-page';

import module namespace ui = 'masterthesis/modules/ui-manager';

(:~
 : Diese Funktion erzeugt den HTML-Inhalt der Startseite. Der Inhalt wird in das UI-Template eingebunden.
 : @return Startseite (XHTML)
 :)
declare
  %rest:path("care-webapp")
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function page:care()
  as element(Q{http://www.w3.org/1999/xhtml}html) {
    page:start()
};

(:~
 : Diese Funktion erzeugt den HTML-Inhalt der Startseite. Der Inhalt wird in das UI-Template eingebunden.
 : @return Startseite (XHTML)
 :)
declare
  %rest:path("care")
  %output:method("xhtml")
  %output:omit-xml-declaration("no")
  %output:doctype-public("-//W3C//DTD XHTML 1.0 Transitional//EN")
  %output:doctype-system("http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
  function page:start()
  as element(Q{http://www.w3.org/1999/xhtml}html) {
    ui:page(
      <div class="container">
          <div class="login">
            <div class="login-screen" style="width:81.3%;font-size:1.5em">
              Welcome to CARE ...
               <div style="font-size:13pt">
                Masterarbeit von <a style="color:green" href="https://www.xing.com/profile/Florian_Eckey" target="_blank">Florian Eckey</a><br/>
                Entwicklung und Konzeption einer Software zur Konsistenzhaltung von Prozessmodellierung und textueller Anforderungsdokumentation<br/>
                <a href="{$ui:prefix}/setup" style="color:green">>> Datenbank neu laden</a><br/>
                <a href="{$ui:prefix}/inspection" style="color:green">>> Code Dokumentation</a>
                </div>
            </div>
          </div>
      </div>)
};

(:~
 : Diese Funktion stellt den REST-Aufrufe für die initiale Erstellung der Datenbanken dar
 : @return Redirekt auf die Startseite
 :)
declare
  %rest:path("setup")
  updating function page:setup() {
    db:create("care-packages")
    ,db:create("inspection",<Inspections xmlns="inspections"/>,"inspections.xml")
    ,db:create("glossary",<Glossary xmlns="glossary"/>,"glossary.xml")
    ,db:output(<restxq:redirect>/care</restxq:redirect>)
  };

(:~
 : Diese Funktione stellt den REST-Aufrufe für das Löschen der Datenbanken dar
 : @return Redirekt auf die Startseite
 :)
declare
  %rest:path("setup/drop")
  updating function page:setup-drop() {
    db:drop("care-packages")
    ,db:drop("inspectiosn")
    ,db:drop("glossary")
    ,db:output(<restxq:redirect>/care</restxq:redirect>)
  };