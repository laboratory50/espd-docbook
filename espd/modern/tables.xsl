<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2014.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Таблицы -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    version="1.1">

<xsl:template name="table.row.properties">

  <xsl:variable name="row-height">
    <xsl:if test="processing-instruction('dbfo')">
      <xsl:call-template name="pi.dbfo_row-height"/>
    </xsl:if>
  </xsl:variable>

  <xsl:if test="$row-height != ''">
    <xsl:attribute name="block-progression-dimension">
      <xsl:value-of select="$row-height"/>
    </xsl:attribute>
  </xsl:if>

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

<!-- Удаление отступа в ячейке таблицы -->
<xsl:attribute-set name="table.cell.padding">
  <xsl:attribute name="padding-start">2pt</xsl:attribute>
  <xsl:attribute name="padding-end">2pt</xsl:attribute>
  <xsl:attribute name="padding-top">2pt</xsl:attribute>
  <xsl:attribute name="padding-bottom">2pt</xsl:attribute>
  <xsl:attribute name="text-indent">0mm</xsl:attribute>
</xsl:attribute-set>

</xsl:stylesheet>
