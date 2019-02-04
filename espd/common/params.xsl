<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2014-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Дополнительные параметры. -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
    exclude-result-prefixes="d"
    version="1.1">

    <xsl:param name="espd.decimal"/>
    <!-- Абзацный отступ -->
    <xsl:param name="espd.text-indent">12.5mm</xsl:param>
    <!-- Лист регистрации изменений -->
    <xsl:param name="espd.lri">1</xsl:param>
    <!-- Шрифт колонтитулов -->
    <xsl:param name="espd.heading.font.family">
        <xsl:value-of select="$title.font.family"/>
    </xsl:param>

    <!-- Рекурсивная нумерация шагов процедуры-->
    <xsl:param name="procedure.numeration.recursive">1</xsl:param>

    <!-- Размер шрифта машинного текста-->
    <xsl:param name="espd.verbatim.font.size">11pt</xsl:param>

    <!-- Цвет фона абзацев машинного текста -->
    <xsl:param name="espd.verbatim.color.bg">#f5f5f5</xsl:param>
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

    <xsl:param name="body.font.master">12</xsl:param>
    <xsl:param name="line-height">1.4</xsl:param>

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

    <!-- Аналог разрыва страницы -->
    <xsl:template match="processing-instruction('hard-pagebreak')">
        <fo:block break-after='page'/>
    </xsl:template>

    <xsl:param name="glossentry.show.acronym">primary</xsl:param> 
    <xsl:param name="body.start.indent">0pt</xsl:param>
    <xsl:param name="xref.with.number.and.title">0</xsl:param>

    <!-- Буквизации приложений вместо нумерация-->
    <xsl:param name="appendix.autolabel">A</xsl:param>
    <!-- Нумерация приложений вместо буквизации -->
    <!-- <xsl:param name="appendix.autolabel">1</xsl:param> -->

    <!-- Отключение автоматического расположения содержания -->
    <!-- т.е. сначала аннотация, потом содержание -->
    <!-- <toc/> должен быть добавлен в документ вручную -->
    <xsl:param name="generate.toc">book title</xsl:param>
    <xsl:param name="process.empty.source.toc" select="1"/>

</xsl:stylesheet>

