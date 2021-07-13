<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Перечисления -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.1">

<!-- Тире для ненумерованных списков. -->
<xsl:template name="itemizedlist.label.markup">
    <xsl:param name="itemsymbol" select="'disc'"/>
—
</xsl:template>

<!-- Ширина символов перечислений (отступ слева). -->
<xsl:param name="orderedlist.label.width">1.6em</xsl:param>
<xsl:param name="itemizedlist.label.width">1.6em</xsl:param>

<!-- Отбивка пунктов перечислений. -->
<xsl:attribute-set name="list.item.spacing">
  <xsl:attribute name="space-before.optimum">0em</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">0.4em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">0em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">0.4em</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="orderedlist.properties">
  <xsl:attribute name="margin-left">
    <xsl:choose>
      <xsl:when test="ancestor::d:listitem">0.6em</xsl:when>
      <xsl:otherwise><xsl:value-of select="$espd.text-indent"/></xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="itemizedlist.properties">
  <xsl:attribute name="margin-left">
    <xsl:choose>
      <xsl:when test="ancestor::d:listitem">0.6em</xsl:when>
      <xsl:otherwise><xsl:value-of select="$espd.text-indent"/></xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
</xsl:attribute-set>

<!--
<xsl:attribute-set name="list.block.properties">
  <xsl:attribute name="provisional-label-separation">0cm</xsl:attribute>
  <xsl:attribute name="provisional-distance-between-starts">0mm</xsl:attribute>
</xsl:attribute-set>
-->
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
  <xsl:variable name="base">
    <xsl:choose>
      <xsl:when test="$numeration='arabic'">1</xsl:when>
      <xsl:when test="$numeration='loweralpha'">а</xsl:when>
      <xsl:when test="$numeration='lowerroman'">i</xsl:when>
      <xsl:when test="$numeration='upperalpha'">А</xsl:when>
      <xsl:when test="$numeration='upperroman'">I</xsl:when>
      <xsl:otherwise>
        <xsl:message>
          <xsl:text>Unexpected numeration: </xsl:text>
          <xsl:value-of select="$numeration"/>
        </xsl:message>
        <xsl:value-of select="1"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="type">
    <xsl:choose>
      <xsl:when test="parent::d:orderedlist[@role='dot']">
        <xsl:value-of select="concat($base, '.')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="concat($base, ')')"/>
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

<!-- Нумерация шагов в процедуре -->
<xsl:param name="procedure.step.numeration.formats" select="'11111'"/>

<xsl:template match="d:step" mode="number">
  <xsl:param name="rest" select="''"/>
  <xsl:param name="recursive" select="1"/>
  <xsl:variable name="format">
    <xsl:call-template name="procedure.step.numeration"/>
  </xsl:variable>
  <xsl:variable name="num">
    <xsl:number count="d:step" format="{$format}"/>
  </xsl:variable>
  <xsl:choose>
    <xsl:when test="$procedure.numeration.recursive != 0 and ancestor::d:step">
      <xsl:apply-templates select="ancestor::d:step[1]" mode="number">
        <xsl:with-param name="rest" select="concat('.', $num, $rest)"/>
      </xsl:apply-templates>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="concat($num, $rest)"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- Отбивка для variablelist -->
<xsl:attribute-set name="variablelist.term.properties">
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="text-indent"><xsl:value-of select="$espd.text-indent"/></xsl:attribute>
</xsl:attribute-set>

</xsl:stylesheet>
