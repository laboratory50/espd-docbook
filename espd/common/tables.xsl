<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСКД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Оформление таблиц -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    exclude-result-prefixes="d"
    version="1.1">

<!-- Сквозная нумерация-->
    <xsl:template match="d:table|d:figure" mode="label.markup">
        <xsl:variable name="pchap"
                        select="(ancestor::d:appendix[ancestor::d:book])[last()]"/>

        <xsl:variable name="prefix">
            <xsl:if test="count($pchap) &gt; 0">
                <xsl:apply-templates select="$pchap" mode="label.markup"/>
            </xsl:if>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="@label">
                <xsl:value-of select="@label"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="$prefix != ''">
                    <!-- Если в приложениях буквизация, то параметр не нужен <xsl:text>П</xsl:text>-->
                        <!-- <xsl:text>П</xsl:text> -->
                        <xsl:apply-templates select="$pchap" mode="label.markup"/>
                        <xsl:apply-templates select="$pchap" mode="intralabel.punctuation">
                            <xsl:with-param name="object" select="."/>
                        </xsl:apply-templates>
                        <xsl:number format="1" from="d:appendix" level="any"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:number format="1" from="d:book|d:article" level="any"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- Номер и название таблицы слева -->
    <xsl:attribute-set name="formal.title.properties" use-attribute-sets="normal.para.spacing">
        <xsl:attribute name="text-align">
            <xsl:choose>
                <xsl:when test="self::d:table">left</xsl:when>
                <xsl:otherwise>center</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <!-- Нормальнаятолщина шрифта в заголовке таблицы -->
    <xsl:template name="table.cell.block.properties">
        <xsl:if test="ancestor::thead">
            <xsl:attribute name="font-weight">normal</xsl:attribute>
        </xsl:if>
    </xsl:template>

    <!-- Высота строк таблицы -->
    <xsl:template name="espd.row.height">
        <xsl:variable name="row-height">
            <xsl:if test="processing-instruction('dbfo')">
                <xsl:call-template name="pi.dbfo_row-height"/>
            </xsl:if>
        </xsl:variable>

        <xsl:if test="$row-height != ''">
            <xsl:attribute name="block-progression-dimension">
                <xsl:value-of select="$row-height"/>
            </xsl:attribute>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
