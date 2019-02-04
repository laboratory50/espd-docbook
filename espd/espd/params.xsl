<?xml version="1.0" encoding="UTF-8"?>
<!--
     Стиль для форматирования документации Глобулы в формате DocBook 5.
-->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.1">
    <!-- Шрифт основного текста -->
    <xsl:param name="body.font.family">Liberation Serif</xsl:param>
    <!-- Шрифт без засечек, где-то используется... -->
    <xsl:param name="sans.font.family">Liberation Sans</xsl:param>
    <!-- Шрифт заголовков -->
    <xsl:param name="title.font.family">Liberation Serif</xsl:param>
    <!-- Шрифт символов (псевдографики) -->
    <xsl:param name="symbol.font.family">OpenSymbol</xsl:param>
    <!-- Шрифт моноширинный (computeroutput, programlisting) -->
    <xsl:param name="monospace.font.family">Liberation Mono</xsl:param>

    <xsl:param name="body.font.master">12</xsl:param>
    <xsl:param name="espd.text-indent">8mm</xsl:param>
    <xsl:param name="double.sided">0</xsl:param>
    <xsl:param name="fop1.extensions">1</xsl:param>
    <xsl:param name="espd.verbatim.font.size">10pt</xsl:param>
    <xsl:param name="qanda.inherit.numeration">0</xsl:param>
    <xsl:param name="qandaset.label.length">8mm</xsl:param>
    <xsl:param name="callout.unicode">1</xsl:param>
    <xsl:param name="callout.graphics">0</xsl:param>
    <xsl:param name="highlight.source" select="1"/>
    <xsl:param name="use.extenstions" select="1"/>
    <!-- Блочное форматирование <variablelist> -->
    <xsl:param name="variablelist.as.blocks" select="1"></xsl:param>

</xsl:stylesheet>
