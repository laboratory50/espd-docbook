<?xml version="1.0" encoding="UTF-8"?>
<!--
     Стиль для форматирования документов в формате DocBook 5.
     Выглядит современнее стандартов ЕСПД.

     © Лаборатория 50, 2014.

     Распространяется на условиях лицензии GPL 3.

     http://lab50.net
-->

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.1">
<xsl:import href="http://docbook.sourceforge.net/release/xsl-ns/current/fo/docbook.xsl"/>

<xsl:include href="modern/page.xsl"/>
<xsl:include href="common/params.xsl"/>
<xsl:include href="common/l10n.xsl"/>
<xsl:include href="common/object.xsl"/>
<xsl:include href="modern/list.xsl"/>
<xsl:include href="common/text.xsl"/>
<xsl:include href="modern/verbatim.xsl"/>
<xsl:include href="modern/titles.xsl"/>
<xsl:include href="modern/tables.xsl"/>
<xsl:include href="modern/headings.xsl"/>
<xsl:include href="modern/admonitions.xsl"/>
<!--<xsl:include href="titlepage.xsl"/>
<xsl:include href="lu.xsl"/>
<xsl:include href="lri.xsl"/>-->

<xsl:param name="body.font.master">12</xsl:param>
<xsl:param name="line-height">1.4</xsl:param>
<!-- Размер шрифта машинного текста-->
<xsl:param name="espd.verbatim.font.size">11pt</xsl:param>

<xsl:attribute-set name="monospace.properties">
  <xsl:attribute name="font-family">
    <xsl:value-of select="$monospace.font.family"></xsl:value-of>
  </xsl:attribute>
  <xsl:attribute name="font-size">0.9em</xsl:attribute>
</xsl:attribute-set>

<xsl:param name="espd-modern.color.bg">#0D2868</xsl:param>
<!-- Цвет фона для листингов, экранов и т.д. -->
<xsl:param name="espd-modern.color.bg2">#f5f5f5</xsl:param>
<!-- Цвет фона для примечаний, ошибок, предупреждений -->
<xsl:param name="espd-modern.color.bg3">#f5f5f5</xsl:param>
<xsl:param name="espd-modern.color.text">#FFFFFF</xsl:param>
<!-- Цвет рамок различных вставок -->
<xsl:param name="espd-modern.color.border">#92DBFF</xsl:param>

<!--
<xsl:template name="book.titlepage.recto"/>
<xsl:template name="book.titlepage.before.recto"/>
<xsl:template name="book.titlepage.before.verso"/>-->
  
<xsl:param name="generate.toc">
    book      toc,title
</xsl:param>
  
</xsl:stylesheet>
