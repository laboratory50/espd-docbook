<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Лист регистрации изменений. -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
    version="1.1">

<xsl:template match="processing-instruction()[local-name()='lastpage']">
    <fo:block id="END-OF-DOCUMENT"/>
</xsl:template>

<xsl:template match="d:book">
    <xsl:apply-imports/>
    <xsl:if test="$espd.lri = 1">
      <xsl:call-template name="lripage"/>
    </xsl:if>
</xsl:template>

<xsl:attribute-set name="espd.lri.style">
  <xsl:attribute name="font-family">
    <xsl:value-of select="$body.font.family"/>
  </xsl:attribute>
  <xsl:attribute name="font-weight">normal</xsl:attribute>
  <xsl:attribute name="font-size">10.5pt</xsl:attribute>
  <xsl:attribute name="text-align">center</xsl:attribute>
  <xsl:attribute name="hyphenate">true</xsl:attribute>
</xsl:attribute-set>

</xsl:stylesheet>
