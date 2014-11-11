<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2014.
  Распространяется на условиях лицензии CC BY-SA 4.0.

  http://lab50.net/
-->

<!-- Оформление машинного текста. -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.1">

<xsl:attribute-set name="monospace.verbatim.properties">
  <xsl:attribute name="wrap-option">no-wrap</xsl:attribute>
  <xsl:attribute name="font-size">
    <xsl:choose>
      <xsl:when test="processing-instruction('db-font-size')">
        <xsl:value-of select="processing-instruction('db-font-size')"/>
      </xsl:when>
      <xsl:otherwise><xsl:value-of select="$espd.verbatim.font.size"/></xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
</xsl:attribute-set>

<xsl:param name="shade.verbatim" select="1"/>

<xsl:attribute-set name="shade.verbatim.style">
  <xsl:attribute name="background-color">#f5f5f5</xsl:attribute>
  <xsl:attribute name="border-width">0.5pt</xsl:attribute>
  <xsl:attribute name="border-style">dashed</xsl:attribute>
  <xsl:attribute name="border-color">#aaaaaa</xsl:attribute>
  <xsl:attribute name="padding">2mm</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="verbatim.properties">
  <xsl:attribute name="line-height">1.2</xsl:attribute>
    <!--  <xsl:attribute name="line-height">
    <xsl:choose>
      <xsl:when test="self::d:programlisting">1.1</xsl:when>
      <xsl:when test="self::d:screen">1</xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$line-height"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>-->
  <xsl:attribute name="text-indent">0mm</xsl:attribute>
  <xsl:attribute name="margin">0mm</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0.1em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">0.2em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">0.3em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0.1em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">0.2em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">1.3em</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="computeroutput.properties">
  <xsl:attribute name="line-height">1</xsl:attribute>
  <xsl:attribute name="font-size">
    <xsl:choose>
      <xsl:when test="processing-instruction('db-font-size')">
        <xsl:value-of select="processing-instruction('db-font-size')"/>
      </xsl:when>
      <xsl:otherwise>0.9em</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
</xsl:attribute-set>

<xsl:template match="d:computeroutput">
  <fo:block xsl:use-attribute-sets="computeroutput.properties">
    <xsl:apply-templates/>
  </fo:block>
</xsl:template>

</xsl:stylesheet>
