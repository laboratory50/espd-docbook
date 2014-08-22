<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2014.
  Распространяется на условиях лицензии CC BY-SA 4.0.

  http://lab50.net/
-->

<!-- Названия разделов -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
    version="1.1">

<xsl:include href="../common/titles.xsl"/>

<!-- Главы (разделы) -->
<xsl:attribute-set name="component.title.properties">
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="color">
    <xsl:value-of select="$espd-modern.color.bg"/>
  </xsl:attribute>
  <xsl:attribute name="text-align">left</xsl:attribute>
  <xsl:attribute name="hyphenate">false</xsl:attribute>
  <xsl:attribute name="space-before.minimum">3em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">3em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">3em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">1em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">1em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">1em</xsl:attribute>
  <!--  <xsl:attribute name="space-after.precedence">2</xsl:attribute> -->
</xsl:attribute-set>

<!-- Подразделы -->
<xsl:attribute-set name="section.title.properties">
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="color">
    <xsl:value-of select="$espd-modern.color.bg"/>
  </xsl:attribute>
  <xsl:attribute name="hyphenate">false</xsl:attribute>
  <xsl:attribute name="space-before.minimum">1em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">1em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">1em</xsl:attribute>
  <!--  <xsl:attribute name="space-before.precedence">1</xsl:attribute> -->
  <xsl:attribute name="space-after.minimum">0.5em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">0.5em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">0.5em</xsl:attribute>
</xsl:attribute-set>

</xsl:stylesheet>

