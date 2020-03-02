<?xml version="1.0" encoding="UTF-8"?>
<!--
     Стиль для форматирования документации Глобулы в формате DocBook 5.
-->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.1">

    <!-- Размер бумаги и отступов ГОСТ 19.106-78 -->
    <xsl:param name="paper.type">A4</xsl:param>
    <!-- Отступ слева -->
    <xsl:param name="page.margin.inner">20mm</xsl:param>
    <!-- Отступ справва -->
    <xsl:param name="page.margin.outer">10mm</xsl:param>
    <!-- Отступ сверху -->
    <xsl:param name="page.margin.top">10mm</xsl:param>
    <xsl:param name="region.before.extent">10mm</xsl:param>
    <xsl:param name="body.margin.top">15mm</xsl:param>
    <!-- Отступ снизу -->
    <xsl:param name="page.margin.bottom">10mm</xsl:param>
    <xsl:param name="region.after.extent">0mm</xsl:param>
    <xsl:param name="body.margin.bottom">0mm</xsl:param>

    <!-- Отступы для ЛРИ по ГОСТ 19.604-78 -->
    <xsl:param name="lri.margin.top">25mm</xsl:param>
    <xsl:param name="lri.margin.bottom">25mm</xsl:param>
    <xsl:param name="lri.margin.left">20mm</xsl:param>
    <xsl:param name="lri.margin.right">5mm</xsl:param>
    <!-- Отступы для ЛУ -->
    <xsl:param name="lu.margin.top"><xsl:value-of select="$page.margin.top"/></xsl:param>
    <xsl:param name="lu.margin.bottom"><xsl:value-of select="$page.margin.bottom"/></xsl:param>
    <xsl:param name="lu.margin.left"><xsl:value-of select="$page.margin.inner"/></xsl:param>
    <xsl:param name="lu.margin.right"><xsl:value-of select="$page.margin.outer"/></xsl:param>

    <!-- Нумерация приложений вместо буквизации -->
     <xsl:param name="appendix.autolabel">1</xsl:param>

</xsl:stylesheet>
