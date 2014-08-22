<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2014.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Рисунки, таблицы и т.п. -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    version="1.1">

<!-- Положения названий. -->
<xsl:param name="formal.title.placement">
        figure after
        example before
        equation after
        table before
        procedure before
</xsl:param>

<xsl:attribute-set name="formal.title.properties" use-attribute-sets="normal.para.spacing">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master"/>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
  <xsl:attribute name="hyphenate">false</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0.3em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">0.6em</xsl:attribute>
</xsl:attribute-set>

<!-- Рисунки -->

<!-- Центрирование названия -->
<xsl:attribute-set name="figure.properties"
                   use-attribute-sets="formal.object.properties">
  <xsl:attribute name="text-align">center</xsl:attribute>
</xsl:attribute-set>

<!-- Таблицы -->

<!-- Центрирование названия -->
<xsl:attribute-set name="table.properties"
                   use-attribute-sets="formal.object.properties">
  <xsl:attribute name="text-align">center</xsl:attribute>
</xsl:attribute-set>

</xsl:stylesheet>
