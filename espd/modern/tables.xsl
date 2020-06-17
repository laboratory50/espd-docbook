<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Таблицы -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    version="1.1">

<xsl:template name="table.row.properties">

  <xsl:call-template name="espd.row.height"/>

  <xsl:variable name="bgcolor">
    <xsl:call-template name="pi.dbfo_bgcolor"/>
  </xsl:variable>

  <!-- Цвет заголовка таблицы -->
  <xsl:choose>
    <xsl:when test="ancestor::d:thead">
      <xsl:attribute name="background-color">
        <xsl:value-of select="$espd-modern.color.bg"/>
      </xsl:attribute>
      <xsl:attribute name="color">
        <xsl:value-of select="$espd-modern.color.text"/>
      </xsl:attribute>
      <xsl:attribute name="text-align">center</xsl:attribute>
      <xsl:attribute name="display-align">center</xsl:attribute>
    </xsl:when>
    <xsl:when test="$bgcolor != ''">
      <xsl:attribute name="background-color">
        <xsl:value-of select="$bgcolor"/>
      </xsl:attribute>
    </xsl:when>
  </xsl:choose>

  <!-- Keep header row with next row -->
  <xsl:if test="ancestor::d:thead">
    <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
  </xsl:if>

</xsl:template>

</xsl:stylesheet>
