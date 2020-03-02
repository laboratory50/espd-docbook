<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2014-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Дополнительные параметры -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
    exclude-result-prefixes="d"
    version="1.1">

    <!-- Размер бумаги и отступов ГОСТ 2.104-2006 -->
    <xsl:param name="paper.type">A4</xsl:param>
    <!-- Отступ слева -->
    <xsl:param name="page.margin.inner">25mm</xsl:param>
    <!-- Отступ справва -->
    <xsl:param name="page.margin.outer">10mm</xsl:param>
    <!-- Отступ сверху -->
    <xsl:param name="page.margin.top">5mm</xsl:param>
    <xsl:param name="region.before.extent">0mm</xsl:param>
    <xsl:param name="body.margin.top">5mm</xsl:param>
    <!-- Отступ снизу (!!уточнить! т.к. разные основные надписи)-->
    <xsl:param name="page.margin.bottom">5mm</xsl:param>
    <xsl:param name="region.after.extent">15mm</xsl:param>
    <xsl:param name="body.margin.bottom">20mm</xsl:param>

    <!-- Отступы для ЛРИ -->
    <xsl:param name="lri.margin.top">5mm</xsl:param>
    <xsl:param name="lri.margin.bottom">5mm</xsl:param>
    <xsl:param name="lri.margin.left">20mm</xsl:param>
    <xsl:param name="lri.margin.right">5mm</xsl:param>

    <!-- Отступы для ЛУ -->
    <xsl:param name="lu.margin.top">10mm</xsl:param>
    <xsl:param name="lu.margin.bottom">10mm</xsl:param>
    <xsl:param name="lu.margin.left"><xsl:value-of select="$page.margin.inner"/></xsl:param>
    <xsl:param name="lu.margin.right"><xsl:value-of select="$page.margin.outer"/></xsl:param>

    <!-- Буквизации приложений вместо нумерация-->
    <xsl:param name="appendix.autolabel">A</xsl:param>

</xsl:stylesheet>

