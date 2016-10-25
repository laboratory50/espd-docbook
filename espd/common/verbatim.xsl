<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2016.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Оформление машинного текста. -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    exclude-result-prefixes="d"
    version="1.1">

<!-- Параметры шрифта -->
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

<!-- Отступы блока машинного текста -->
<xsl:attribute-set name="verbatim.properties">
  <xsl:attribute name="text-indent">0mm</xsl:attribute>
  <xsl:attribute name="margin">0mm</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0.2em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">0.6em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0.2em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">1.6em</xsl:attribute>
  <xsl:attribute name="line-height">
    <xsl:choose>
      <xsl:when test="self::d:programlisting">1.2</xsl:when>
      <xsl:when test="self::d:screen">1.0</xsl:when>
      <xsl:otherwise>normal</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
  <xsl:attribute name="keep-together.within-column">
    <xsl:choose>
      <xsl:when test="self::d:screen">always</xsl:when>
      <xsl:otherwise>auto</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
</xsl:attribute-set>

<!-- Блок атрибутов для элемента computeroutput -->
<xsl:attribute-set name="computeroutput.properties">
  <xsl:attribute name="font-size">0.9em</xsl:attribute>
</xsl:attribute-set>

<xsl:param name="shade.verbatim" select="1"/>

<xsl:attribute-set name="shade.verbatim.style">
  <xsl:attribute name="background-color">
    <xsl:value-of select="$espd.verbatim.color.bg"/>
  </xsl:attribute>
  <xsl:attribute name="padding">2mm</xsl:attribute>
</xsl:attribute-set>

<!-- Использование блока параметров computeroutput.properties
     и инструкции обработки db-font-size. -->
<xsl:template match="d:computeroutput">

  <xsl:variable name="font-size">
    <xsl:if test="processing-instruction('db-font-size')">
      <xsl:value-of select="processing-instruction('db-font-size')"/>
    </xsl:if>
  </xsl:variable>

  <fo:inline xsl:use-attribute-sets="monospace.properties
                                     computeroutput.properties">
    <xsl:if test="$font-size != ''">
      <xsl:attribute name="font-size">
        <xsl:value-of select="$font-size"/>
      </xsl:attribute>
    </xsl:if>

    <xsl:call-template name="inline.charseq"/>
  </fo:inline>
</xsl:template>

</xsl:stylesheet>
