(:~
 : Dieses Modul dient zur Generierung von Graphen als Graph-ML.
 : @author Florian Eckey
 : @version 1.1
:)
module namespace graphml ="masterthesis/modules/inspection/graphml";

declare default element namespace "http://graphml.graphdrawing.org/xmlns";
declare namespace y="http://www.yworks.com/xml/graphml";

(:~
 : Diese Funktion generiert den Rumpf des Graph-ML Dokuments
 : @param $graph Graphen, welche im Graph-ML angezeigt werden
 : @return Komplettes Graph-ML Dokument
:)
declare function graphml:xml($graph) {
  <graphml xmlns="http://graphml.graphdrawing.org/xmlns" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:y="http://www.yworks.com/xml/graphml" xmlns:yed="http://www.yworks.com/xml/yed/3" xsi:schemaLocation="http://graphml.graphdrawing.org/xmlns http://www.yworks.com/xml/schema/graphml/1.1/ygraphml.xsd">
    {graphml:keys()/*} 
    {$graph}
    <data key="d0">
      <y:Resources/>
    </data>
  </graphml>
};

(:~
 : Diese Funktion generiert den Inhalt des Elements <keys> im Graph-ML Dokument
 : @return <keys> Element
:)
declare function graphml:keys() {
  <keys>
    <key for="graphml" id="d0" yfiles.type="resources"/>
    <key for="port" id="d1" yfiles.type="portgraphics"/>
    <key for="port" id="d2" yfiles.type="portgeometry"/>
    <key for="port" id="d3" yfiles.type="portuserdata"/>
    <key attr.name="url" attr.type="string" for="node" id="d4"/>
    <key attr.name="description" attr.type="string" for="node" id="d5"/>
    <key for="node" id="d6" yfiles.type="nodegraphics"/>
    <key attr.name="Beschreibung" attr.type="string" for="graph" id="d7"/>
    <key attr.name="url" attr.type="string" for="edge" id="d8"/>
    <key attr.name="description" attr.type="string" for="edge" id="d9"/>
    <key for="edge" id="d10" yfiles.type="edgegraphics"/>
  </keys>
};

(:~
 : Diese Funktion generiert den Graphen für ein Graph-ML Dokument
 : @param $nodes Liste der Knoten des Graphen
 : @param $edges Liste der Kanten des Graphen
 : @return <graph> Element
:)
declare function graphml:graph($nodes, $edges) {
  <graph edgedefault="directed" id="G">  
    <data key="d7"/> 
    {$nodes}
    {$edges}
  </graph>
};

(:~
 : Diese Funktion generiert einen Knoten für ein Graph-ML Dokument
 : @param $id ID des Knoten
 : @param $label Label des Knoten
 : @param $color Farbe des Knoten
 : @param $dummy (nicht verwendet)
 : @param $shapetype Art der Umrandung des Knoten
 : @return <node> Element
:)
declare function graphml:node($id,$label, $color,$dummy, $shapetype) {
  let $shapetype:="rectangle" return
  <node id="{$id}">
      <data key="d5"/>
      <data key="d6">
        <y:ShapeNode>
          <y:Geometry height="10.0" width="40.0" x="15.0" y="60.0"/>
          <y:Fill color="{$color}" color2="{$color}" transparent="false"/>
          <y:BorderStyle color="#000000" type="line" width="1.0"/>
          <y:NodeLabel alignment="center" autoSizePolicy="content" fontFamily="Dialog" fontSize="26" fontStyle="plain" hasBackgroundColor="false" hasLineColor="false" height="4.0" modelName="custom" textColor="#000000" visible="true" width="4.0" x="13.0" y="13.0">{$label}<y:LabelModel>
              <y:SmartNodeLabelModel distance="4.0"/>
            </y:LabelModel>
            <y:ModelParameter>
              <y:SmartNodeLabelModelParameter labelRatioX="0.0" labelRatioY="0.0" nodeRatioX="0.0" nodeRatioY="0.0" offsetX="0.0" offsetY="0.0" upX="0.0" upY="-1.0"/>
            </y:ModelParameter>
          </y:NodeLabel>
          <y:Shape type="{$shapetype}"/>
        </y:ShapeNode>
      </data>
    </node>
};

(:~
 : Diese Funktion generiert einen Knoten für ein Graph-ML Dokument
 : @param $id ID des Knoten
 : @param $label Label des Knoten
 : @param $color Farbe des Knoten
 : @param $title-color Farbe des Knoten-Titels
 : @param $content Inhalt des Knotens
 : @param $type Typ des Knotens
 : @return <node> Element
:)
declare function graphml:generic-node($id,$label,$color,$title-color,$content,$type) {
   <node id="{$id}">
      <data key="d5"/>
      <data key="d6">
        <y:GenericNode configuration="{$type}">
          <y:Geometry height="45.0" width="350.0" x="527.5" y="13.5"/>
          <y:Fill color="{$color}" color2="{$color}" transparent="false"/>
          <y:BorderStyle color="#000000" type="line" width="1.0"/>
          <y:NodeLabel alignment="center" autoSizePolicy="content" backgroundColor="{$title-color}" configuration="com.yworks.entityRelationship.label.name" fontFamily="Dialog" fontSize="26" fontStyle="plain" hasLineColor="false" height="18.701171875" modelName="internal" modelPosition="t" textColor="#000000" visible="true" width="181.43359375" x="74.783203125" y="4.0">{$label}</y:NodeLabel>
          <y:NodeLabel alignment="left" autoSizePolicy="content" configuration="com.yworks.entityRelationship.label.attributes" fontFamily="Dialog" fontSize="26" fontStyle="plain" hasBackgroundColor="false" hasLineColor="false" height="48.103515625" modelName="custom" textColor="#000000" visible="true" width="57.3671875" x="2.0" y="30.701171875">{$content}<y:LabelModel>
              <y:ErdAttributesNodeLabelModel/>
            </y:LabelModel>
            <y:ModelParameter>
              <y:ErdAttributesNodeLabelModelParameter/>
            </y:ModelParameter>
          </y:NodeLabel>
          <y:StyleProperties>
            <y:Property class="java.lang.Boolean" name="y.view.ShadowNodePainter.SHADOW_PAINTING" value="true"/>
          </y:StyleProperties>
        </y:GenericNode>
      </data>
    </node>
};

(:~
 : Diese Funktion generiert eine Kante für ein Graph-ML Dokument
 : @param $id ID der Kante
 : @param $source ID des Source-Knoten
 : @param $target ID des Target-Knoten
 : @param $color Farbe des Knoten
 : @return <edge> Element
:)
declare function graphml:edge($id,$source,$target,$color) {
  <edge id="{$id}" source="{$source}" target="{$target}">
      <data key="d9"/>
      <data key="d10">
        <y:PolyLineEdge>
          <y:Path sx="-44.66666666666667" sy="33.0" tx="0.0" ty="-33.0">
            <y:Point x="201.33333333333331" y="81.0"/>
            <y:Point x="82.0" y="81.0"/>
          </y:Path>
          <y:LineStyle color="{$color}" type="line" width="2.0"/>
          <y:Arrows source="none" target="standard"/>
          <y:BendStyle smoothed="true"/>
        </y:PolyLineEdge>
      </data>
    </edge>
};