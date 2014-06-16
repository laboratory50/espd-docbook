<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2014.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Основные параметры. -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.1">

    <!-- Размер бумаги и отступов -->
    <xsl:param name="paper.type">A4</xsl:param>
    <!-- <xsl:param name="fop.extensions">0</xsl:param>
    <xsl:param name="fop1.extensions">1</xsl:param>-->
    <xsl:param name="double.sided">0</xsl:param>
    <xsl:param name="glossentry.show.acronym">primary</xsl:param> 
    <xsl:param name="page.margin.inner">20mm</xsl:param>
    <xsl:param name="page.margin.outer">10mm</xsl:param>
    <xsl:param name="page.margin.top">10mm</xsl:param>
    <xsl:param name="region.before.extent">14mm</xsl:param>
    <xsl:param name="body.margin.top">20mm</xsl:param>
    <xsl:param name="region.after.extent">5mm</xsl:param>
    <xsl:param name="page.margin.bottom">5mm</xsl:param>
    <xsl:param name="body.margin.bottom">5mm</xsl:param>
    <xsl:param name="xref.with.number.and.title">0</xsl:param>

    <xsl:param name="body.start.indent">0pt</xsl:param>
    <xsl:param name="body.font.master">12</xsl:param>
</xsl:stylesheet>

