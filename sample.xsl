<?xml version="1.0" encoding="UTF-8"?>
<!--
     Пример стилевого файла для <docbook>ЕСПД</docbook>
-->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.1">
    <xsl:import href="espd/espd.xsl"/>
    <!-- <xsl:import href="http://lab50.net/xsl/espd/espd.xsl"/>  -->
    <!-- <xsl:import href="http://lab50.net/xsl/espd/modern.xsl"/> -->

<xsl:param name="body.font.family">Liberation Sans</xsl:param>
<xsl:param name="sans.font.family">Liberation Sans</xsl:param>
<xsl:param name="title.font.family">Liberation Sans</xsl:param>
<xsl:param name="symbol.font.family">OpenSymbol,Symbol</xsl:param>
<xsl:param name="monospace.font.family">Liberation Mono</xsl:param>
<xsl:param name="body.font.master">10</xsl:param>
<xsl:param name="espd.text-indent">8mm</xsl:param>
<xsl:param name="double.sided">0</xsl:param>
<xsl:param name="fop1.extensions">1</xsl:param>

<xsl:template name="book.titlepage.recto"/>
<xsl:template name="book.titlepage.before.recto"/>
<xsl:template name="book.titlepage.before.verso"/>

</xsl:stylesheet>
