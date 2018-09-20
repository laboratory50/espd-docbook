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
    version="1.1">

<xsl:include href="../common/list.xsl"/>

<!-- Ширина символов перечислений. -->
<xsl:param name="orderedlist.label.width">1.6em</xsl:param>
<xsl:param name="itemizedlist.label.width">1.6em</xsl:param>

<!-- Отбивка и отступы перечислений -->
<xsl:attribute-set name="list.block.spacing">
  <xsl:attribute name="space-before.optimum">0mm</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0mm</xsl:attribute>
  <xsl:attribute name="space-before.maximum">0mm</xsl:attribute>
  <xsl:attribute name="space-after.optimum">0mm</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0mm</xsl:attribute>
  <xsl:attribute name="space-after.maximum">0mm</xsl:attribute>
<!-- Положение знаков перечислений относительно отступа -->
  <xsl:attribute name="text-indent">0cm</xsl:attribute>
  <xsl:attribute name="start-indent">0cm</xsl:attribute>
  <xsl:attribute name="margin-left">
    <xsl:value-of select="$espd.text-indent"/>
  </xsl:attribute>
</xsl:attribute-set>
  
</xsl:stylesheet>

