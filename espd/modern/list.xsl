<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2014.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Перечисления -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    version="1.1">

<xsl:include href="../common/list.xsl"/>

<xsl:attribute-set name="list.block.properties">
  <xsl:attribute name="provisional-label-separation">2pt</xsl:attribute>
  <!--  <xsl:attribute name="provisional-distance-between-starts">15mm</xsl:attribute> -->
</xsl:attribute-set>

<xsl:param name="itemizedlist.label.width">
    <xsl:value-of select="$espd.text-indent"/>
</xsl:param>

<xsl:param name="orderedlist.label.width">
    <xsl:value-of select="$espd.text-indent"/>
</xsl:param>

<xsl:attribute-set name="itemizedlist.label.properties">
  <xsl:attribute name="start-indent">1pt</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="orderedlist.label.properties">
  <xsl:attribute name="start-indent">2pt</xsl:attribute>
</xsl:attribute-set>

<!-- Отбивка и отступы перечислений -->
<xsl:attribute-set name="list.block.spacing">
  <xsl:attribute name="space-before.optimum">0.1em</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">0.2em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">0.1em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">0.2em</xsl:attribute>
  <xsl:attribute name="text-indent">0mm</xsl:attribute>
  <xsl:attribute name="margin-left">0mm</xsl:attribute>
</xsl:attribute-set>
  
</xsl:stylesheet>


