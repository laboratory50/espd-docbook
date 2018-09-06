<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСКД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Оформление содержания -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    exclude-result-prefixes="d"
    version="1.1">

<!-- По левому краю все уровни -->
    <xsl:param name="toc.indent.width">0</xsl:param>

<!-- Точка после номера в оглавлении (стандартное значение «. »). -->
    <xsl:param name="autotoc.label.separator"><xsl:text>. </xsl:text></xsl:param>

<!-- Добавляется слово «Приложение» для номера приложений
    и для Apache FOP ровное выравнивание номеров страниц. --> 
    <xsl:template name="toc.line">
    <xsl:param name="toc-context" select="NOTANODE"/>

    <xsl:variable name="id">
        <xsl:call-template name="object.id"/>
    </xsl:variable>

    <xsl:variable name="label">
        <xsl:choose>
        <xsl:when test="self::d:appendix">
            <xsl:call-template name="gentext">
            <xsl:with-param name="key">appendix</xsl:with-param>
            </xsl:call-template>

            <xsl:text> </xsl:text>
            <xsl:apply-templates select="." mode="label.markup"/>
            <xsl:text></xsl:text>
        </xsl:when>
        <xsl:otherwise>
            <xsl:apply-templates select="." mode="label.markup"/>
        </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <fo:block xsl:use-attribute-sets="toc.line.properties"
                text-align-last="justify"
                white-space-collapse="false">

        <fo:basic-link internal-destination="{$id}">
        <xsl:if test="$label != ''">
            <xsl:copy-of select="$label"/>
            <xsl:value-of select="$autotoc.label.separator"/>
        </xsl:if>
        <xsl:apply-templates select="." mode="title.markup"/>
        </fo:basic-link>
        <xsl:text> </xsl:text>
        <fo:leader leader-pattern="dots"
                leader-pattern-width="0"
                leader-alignment="reference-area"
                keep-with-next.within-line="always"/>
        <xsl:text> </xsl:text>
        <fo:basic-link internal-destination="{$id}">
        <fo:page-number-citation ref-id="{$id}"/>
        </fo:basic-link>
    </fo:block>
    </xsl:template>

</xsl:stylesheet>
