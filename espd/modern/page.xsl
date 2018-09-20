<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль для форматирования документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net
-->

<!-- Настройки разметки страницы -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.1">

    <xsl:include href="../common/page.xsl"/>

    <!-- Размер бумаги и отступов -->
    <xsl:param name="page.margin.inner">30mm</xsl:param>
    <xsl:param name="page.margin.outer">20mm</xsl:param>
    <xsl:param name="page.margin.top">15mm</xsl:param>
    <xsl:param name="region.before.extent">10mm</xsl:param>
    <xsl:param name="body.margin.top">15mm</xsl:param>
    <xsl:param name="region.after.extent">5mm</xsl:param>
    <xsl:param name="page.margin.bottom">10mm</xsl:param>
    <xsl:param name="body.margin.bottom">10mm</xsl:param>
</xsl:stylesheet>

