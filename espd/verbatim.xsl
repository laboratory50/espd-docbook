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
    version="1.1">

<xsl:attribute-set name="monospace.verbatim.properties">
  <xsl:attribute name="wrap-option">no-wrap</xsl:attribute>
  <xsl:attribute name="font-size"><xsl:value-of select="$espd.verbatim.font.size"/></xsl:attribute>
</xsl:attribute-set>

<xsl:param name="shade.verbatim" select="1"/>

<xsl:attribute-set name="shade.verbatim.style">
  <xsl:attribute name="background-color">#e0e0e0</xsl:attribute>
</xsl:attribute-set>

</xsl:stylesheet>
