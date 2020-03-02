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

    <!-- Децимальный номер -->
    <xsl:param name="espd.decimal"/>
    <!-- Лист регистрации изменений (для ЕСПД и ЕСКД по умолчанию есть) -->
    <xsl:param name="espd.lri">1</xsl:param>
    <!-- Лист утверждения (для ЕСПД и ЕСКД по умолчаниб есть) -->
    <!--<xsl:template name="front.cover"/> -->
    <!-- Титульный лист состоит из одной стоноры -->
    <xsl:template name="book.titlepage.recto"/>

    <!-- Абзацный отступ -->
    <xsl:param name="espd.text-indent">12.5mm</xsl:param>
    <!-- Шрифт колонтитулов -->
    <xsl:param name="espd.heading.font.family">
        <xsl:value-of select="$title.font.family"/>
    </xsl:param>

    <!-- Рекурсивная нумерация шагов процедуры-->
    <xsl:param name="procedure.numeration.recursive">1</xsl:param>

    <!-- Размер шрифта машинного текста-->
    <xsl:param name="espd.verbatim.font.size">10pt</xsl:param>
    <!-- Размер шрифта -->
    <xsl:param name="body.font.master">12</xsl:param>
    <!-- Высота строки -->
    <xsl:param name="line-height">1.4</xsl:param>
    <!-- Цвет фона абзацев машинного текста -->
    <xsl:param name="espd.verbatim.color.bg">#fff</xsl:param>

    <xsl:attribute-set name="monospace.properties">
        <xsl:attribute name="font-family">
            <xsl:value-of select="$monospace.font.family"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="font-size">0.9em</xsl:attribute>
    </xsl:attribute-set>

    <xsl:param name="double.sided">0</xsl:param>
    <xsl:param name="fop1.extensions">1</xsl:param>
    <xsl:param name="qanda.inherit.numeration">0</xsl:param>
    <xsl:param name="qandaset.label.length">8mm</xsl:param>
    <xsl:param name="callout.unicode">1</xsl:param>
    <xsl:param name="callout.graphics">0</xsl:param>
    <xsl:param name="highlight.source" select="1"/>
    <xsl:param name="use.extenstions" select="1"/>
    <!-- Блочное форматирование <variablelist> -->
    <xsl:param name="variablelist.as.blocks" select="1"></xsl:param>

    <!-- Аналог разрыва страницы -->
    <xsl:template match="processing-instruction('hard-pagebreak')">
        <fo:block break-after='page'/>
    </xsl:template>

    <xsl:param name="glossentry.show.acronym">primary</xsl:param> 
    <xsl:param name="body.start.indent">0pt</xsl:param>
    <xsl:param name="xref.with.number.and.title">0</xsl:param>

    <!-- Отключение автоматического расположения содержания -->
    <!-- т.е. сначала аннотация, потом содержание -->
    <!-- <toc/> должен быть добавлен в документ вручную -->
    <xsl:param name="generate.toc">book title</xsl:param>
    <xsl:param name="process.empty.source.toc" select="1"/>
    <xsl:template match="preface[@role='NotInToc']"  mode="toc"/>

</xsl:stylesheet>

