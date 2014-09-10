<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2014.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Вставки -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    version="1.1">

<xsl:attribute-set name="nongraphical.admonition.properties">
  <xsl:attribute name="space-after.minimum">0.6em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">0.8em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">1em</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0.6em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">0.8em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">1.0em</xsl:attribute>
  <xsl:attribute name="margin-{$direction.align.start}">2mm</xsl:attribute>
  <xsl:attribute name="margin-{$direction.align.end}">2mm</xsl:attribute>
</xsl:attribute-set>
<!--
<xsl:attribute-set name="admonition.properties">
  <xsl:attribute name="background-color">
    <xsl:value-of select="$espd-modern.color.bg3"/>
  </xsl:attribute>
  <xsl:attribute name="border-width">1pt</xsl:attribute>
  <xsl:attribute name="border-before-width">0pt</xsl:attribute>
  <xsl:attribute name="border-style">solid</xsl:attribute>

  <xsl:attribute name="border-color">
    <xsl:choose>
      <xsl:when test="ancestor-or-self::d:tip"      >#FFFFFF</xsl:when>
      <xsl:when test="ancestor-or-self::d:note"     >#6BA100</xsl:when>
      <xsl:when test="ancestor-or-self::d:important">#B5FFB5</xsl:when>
      <xsl:when test="ancestor-or-self::d:caution"  >#FAFA8C</xsl:when>
      <xsl:when test="ancestor-or-self::d:warning"  >#FFADAD</xsl:when>
      <xsl:otherwise>#000000</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
  <xsl:attribute name="border-color">
    <xsl:value-of select="$espd-modern.color.border"/>
  </xsl:attribute>
  <xsl:attribute name="padding">2mm</xsl:attribute>
</xsl:attribute-set>-->
<!--
<xsl:attribute-set name="admonition.title.properties">
  <xsl:attribute name="font-size">1.1em</xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="hyphenate">false</xsl:attribute>
  <xsl:attribute name="border-width">1pt</xsl:attribute>
  <xsl:attribute name="border-style">solid</xsl:attribute>
  <xsl:attribute name="padding">2mm</xsl:attribute>
  <xsl:attribute name="padding-top">1mm</xsl:attribute>
  <xsl:attribute name="padding-bottom">1mm</xsl:attribute>
  <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
  <xsl:attribute name="color">
    <xsl:choose>
      <xsl:when test="ancestor-or-self::d:tip"      >#FFFFFF</xsl:when>
      <xsl:when test="ancestor-or-self::d:note"     >#6BA100</xsl:when>
      <xsl:when test="ancestor-or-self::d:important">#B5FFB5</xsl:when>
      <xsl:when test="ancestor-or-self::d:caution"  >#FAFA8C</xsl:when>
      <xsl:when test="ancestor-or-self::d:warning"  >#FFADAD</xsl:when>
      <xsl:otherwise>#000000</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
  <xsl:attribute name="border-color">
    <xsl:choose>
      <xsl:when test="ancestor-or-self::d:tip"      >#FFFFFF</xsl:when>
      <xsl:when test="ancestor-or-self::d:note"     >#6BA100</xsl:when>
      <xsl:when test="ancestor-or-self::d:important">#B5FFB5</xsl:when>
      <xsl:when test="ancestor-or-self::d:caution"  >#FAFA8C</xsl:when>
      <xsl:when test="ancestor-or-self::d:warning"  >#FFADAD</xsl:when>
      <xsl:otherwise>#000000</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
        <xsl:attribute name="color">
        <xsl:value-of select="$espd-modern.color.text"/>
      </xsl:attribute>
  </xsl:attribute-set> -->

</xsl:stylesheet>

