<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Оформление машинного текста. -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.1">

<xsl:include href="../common/verbatim.xsl"/>

<xsl:attribute-set name="shade.verbatim.style">
  <xsl:attribute name="border-width">0.5pt</xsl:attribute>
  <xsl:attribute name="border-style">dashed</xsl:attribute>
  <xsl:attribute name="border-color">#aaaaaa</xsl:attribute>
  <xsl:attribute name="padding-top">2mm</xsl:attribute>
  <xsl:attribute name="padding-bottom">1.5mm</xsl:attribute>
  <xsl:attribute name="padding-left">2mm</xsl:attribute>
  <xsl:attribute name="padding-right">2mm</xsl:attribute>
</xsl:attribute-set>

</xsl:stylesheet>
