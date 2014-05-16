<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2014.
  Распространяется на условиях лицензии CC BY-SA 4.0.

  http://lab50.net/
-->

<!-- Перечисления -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    version="1.1">

<!-- Тире для ненумерованных списков. -->
<xsl:template name="itemizedlist.label.markup">
    <xsl:param name="itemsymbol" select="'disc'"/>
—
</xsl:template>

<!-- Ширина символов перечислений. -->
<xsl:param name="orderedlist.label.width">6mm</xsl:param>
<xsl:param name="itemizedlist.label.width">6mm</xsl:param>

<!-- Отбивка пунктов перечислений. -->
<xsl:attribute-set name="list.item.spacing">
  <xsl:attribute name="space-before.optimum">0mm</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0mm</xsl:attribute>
  <xsl:attribute name="space-before.maximum">0mm</xsl:attribute>
</xsl:attribute-set>

<!-- Отбивка и отступы перечислений -->
<xsl:attribute-set name="list.block.spacing">
  <xsl:attribute name="space-before.optimum">0mm</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0mm</xsl:attribute>
  <xsl:attribute name="space-before.maximum">0mm</xsl:attribute>
  <xsl:attribute name="space-after.optimum">0mm</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0mm</xsl:attribute>
  <xsl:attribute name="space-after.maximum">0mm</xsl:attribute>
  <!--  <xsl:attribute name="text-indent">0cm</xsl:attribute> -->
  <xsl:attribute name="margin-left">
    <xsl:value-of select="$espd.text-indent"/>
  </xsl:attribute>
</xsl:attribute-set>
  
<xsl:attribute-set name="list.block.properties">
  <xsl:attribute name="provisional-label-separation">0cm</xsl:attribute>
  <xsl:attribute name="provisional-distance-between-starts">0mm</xsl:attribute>
</xsl:attribute-set>

<!--
  ГОСТ 2.105-95 (ЕСКД)
  4.1.7 Внутри пунктов или подпунктов могут быть перечисления.
  Перед каждой позицией перечисления следует ставить дефис или при необходимости ссылки
  в тексте документа на одно из перечислений, строчную букву, после которой ставится скобка.
-->
<xsl:template match="d:orderedlist/d:listitem" mode="item-number">
  <xsl:variable name="numeration">
    <xsl:call-template name="list.numeration">
      <xsl:with-param name="node" select="parent::d:orderedlist"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="type">
    <xsl:choose>
      <xsl:when test="$numeration='arabic'">1)</xsl:when>
      <xsl:when test="$numeration='loweralpha'">a)</xsl:when>
      <xsl:when test="$numeration='lowerroman'">i)</xsl:when>
      <xsl:when test="$numeration='upperalpha'">A)</xsl:when>
      <xsl:when test="$numeration='upperroman'">I)</xsl:when>
      <xsl:otherwise>
        <xsl:message>
          <xsl:text>Unexpected numeration: </xsl:text>
          <xsl:value-of select="$numeration"/>
        </xsl:message>
        <xsl:value-of select="1."/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="item-number">
    <xsl:call-template name="orderedlist-item-number"/>
  </xsl:variable>

  <xsl:if test="parent::d:orderedlist/@inheritnum='inherit'
                and ancestor::d:listitem[parent::d:orderedlist]">
    <xsl:apply-templates select="ancestor::d:listitem[parent::d:orderedlist][1]"
                         mode="item-number"/>
  </xsl:if>

  <xsl:number value="$item-number" format="{$type}"/>
</xsl:template>
  
</xsl:stylesheet>
