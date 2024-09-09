<?xml version="1.0" encoding="UTF-8"?>
<!--
     Пример стилевого файла для <docbook>ЕСПД</docbook>
-->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.1">

    <!-- Оформление ЕСПД -->
    <xsl:import href="espd/espd.xsl"/>
    <!-- или -->
    <!-- <xsl:import href="http://lab50.net/xsl/espd/espd.xsl"/>  -->
    <!-- или ЕСПД с услрвными переменными-->
    <!-- <xsl:import href="espd/espd-profile.xsl"/> -->

    <!-- Современное оформление -->
    <!-- <xsl:import href="espd/modern.xsl"/> -->
    <!-- или -->
    <!-- <xsl:import href="http://lab50.net/xsl/espd/modern.xsl"/> -->

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

    <xsl:param name="fop1.extensions">1</xsl:param>

</xsl:stylesheet>
