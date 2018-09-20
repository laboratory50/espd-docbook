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

<!-- высота строк таблицы -->
    <xsl:template name="normal-row">
        <xsl:param name="spans"/>
        <xsl:param name="browserows"/>

        <xsl:variable name="row-height">
            <xsl:if test="processing-instruction('dbfo')">
                <xsl:call-template name="pi.dbfo_row-height"/>
            </xsl:if>
        </xsl:variable>

        <fo:table-row>
            <xsl:if test="$row-height != ''">
                <xsl:attribute name="height">
                    <xsl:value-of select="$row-height"/>
                </xsl:attribute>
            </xsl:if>

            <xsl:call-template name="table.row.properties"/>
            <xsl:call-template name="anchor"/>

            <xsl:apply-templates select="(d:entry|d:entrytbl)[1]">
                <xsl:with-param name="spans" select="$spans"/>
            </xsl:apply-templates>
        </fo:table-row>

        <xsl:if test="$browserows = 'recurse'">
            <xsl:if test="following-sibling::d:row">
            <xsl:variable name="nextspans">
                <xsl:apply-templates select="(d:entry|d:entrytbl)[1]" mode="span">
                    <xsl:with-param name="spans" select="$spans"/>
                </xsl:apply-templates>
            </xsl:variable>

            <xsl:apply-templates select="following-sibling::d:row[1]">
                <xsl:with-param name="spans" select="$nextspans"/>
                <xsl:with-param name="browserows" select="$browserows"/>
            </xsl:apply-templates>
            </xsl:if>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
