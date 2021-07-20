<?xml version="1.0" encoding="UTF-8"?>
<!--
     Пример стилевого файла для <docbook>ЕСПД</docbook>
-->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    version="1.1">

    <xsl:import href="espd/eskd.xsl"/>

    <!-- Без ЛУ -->
    <!-- <xsl:template name="front.cover"/> -->

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


</xsl:stylesheet>
