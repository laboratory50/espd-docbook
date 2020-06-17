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
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
    exclude-result-prefixes="d"
    version="1.1">

    <xsl:import href="http://docbook.sourceforge.net/release/xsl-ns/current/fo/docbook.xsl"/>

    <xsl:include href="common/common.xsl"/>
    <xsl:include href="modern/params.xsl"/>
    <xsl:include href="modern/page.xsl"/>
    <xsl:include href="modern/l10n.xsl"/>
    <xsl:include href="common/object.xsl"/>
    <xsl:include href="modern/list.xsl"/>
    <xsl:include href="common/text.xsl"/>
    <xsl:include href="modern/verbatim.xsl"/>
    <xsl:include href="modern/titles.xsl"/>
    <xsl:include href="common/tables.xsl"/>
    <xsl:include href="modern/tables.xsl"/>
    <xsl:include href="modern/headings.xsl"/>
    <xsl:include href="modern/admonitions.xsl"/>
    <xsl:include href="common/appendix.xsl"/>
    <xsl:include href="modern/toc.xsl"/>
    <xsl:include href="common/qandaset.xsl"/>
    <xsl:include href="modern/titlepage.xsl"/>

    <xsl:param name="espd-modern.color.bg">#0D2868</xsl:param>
    <!-- Цвет фона для листингов, экранов и т.д. -->
    <xsl:param name="espd-modern.color.bg2">#f5f5f5</xsl:param>
    <!-- Цвет фона для примечаний, ошибок, предупреждений -->
    <xsl:param name="espd-modern.color.bg3">#f5f5f5</xsl:param>
    <xsl:param name="espd-modern.color.text">#FFFFFF</xsl:param>
    <!-- Цвет рамок различных вставок -->
    <xsl:param name="espd-modern.color.border">#92DBFF</xsl:param>

    <!-- Без ЛРИ -->
    <xsl:param name="espd.lri">0</xsl:param>

</xsl:stylesheet>
