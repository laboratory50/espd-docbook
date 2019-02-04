<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСКД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Оформление таблиц (ГОСТ 2.105-95)-->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    exclude-result-prefixes="d"
    version="1.1">

    <!-- отступ между названием таблицы и самой таблицей -->
    <xsl:attribute-set name="table.table.properties">
        <xsl:attribute name="margin-top">-6mm</xsl:attribute>
    </xsl:attribute-set>

    <!-- продолжение в таблице -->
    <xsl:template name="table.layout">
    <xsl:param name="table.content"/>

    <xsl:choose>
        <xsl:when test="self::d:informaltable">
            <xsl:copy-of select="$table.content"/>
        </xsl:when>
        <xsl:otherwise>
            <fo:table>
                <fo:table-header>
                  <fo:table-row>
                    <fo:table-cell>
                        <fo:block xsl:use-attribute-sets="table.caption.properties">
                            <fo:retrieve-table-marker
                                    retrieve-class-name="table-title"
                                    retrieve-position-within-table="first-starting"
                                    retrieve-boundary-within-table="table-fragment"/>&#x00A0;
                        </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </fo:table-header>
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block xsl:use-attribute-sets="table.caption.properties">
                                <fo:marker marker-class-name="table-title"></fo:marker>
                            </fo:block>
                            <fo:block>
                                <fo:marker marker-class-name="table-title">
                                    <fo:inline font-style="italic">
                                    <xsl:text>П р о д о л ж е н и е&#160;&#160;&#160;т а б л и ц ы&#160;&#160;&#160;</xsl:text>
                                        <xsl:call-template name="substitute-markup">
                                            <xsl:with-param name="allow-anchors" select="0"/>
                                            <xsl:with-param name="template" select="'%n'"/>
                                        </xsl:call-template>
                                    </fo:inline>
                                </fo:marker>
                                <xsl:copy-of select="$table.content"/>
                            </fo:block>
                            <fo:block keep-with-previous.within-column="always">
                                <fo:marker marker-class-name="table-title">
                                    <fo:inline font-style="italic">
                                        <xsl:text>О к о н ч а н и е&#160;&#160;&#160;т а б л и ц ы&#160;&#160;&#160;</xsl:text>
                                    <xsl:call-template name="substitute-markup">
                                        <xsl:with-param name="allow-anchors" select="0"/>
                                        <xsl:with-param name="template" select="'%n'"/>
                                    </xsl:call-template>
                                    </fo:inline>
                                </fo:marker>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- чтобы таблицу не отрывало от заголовка -->
    <xsl:attribute-set name="table.caption.properties">
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
    </xsl:attribute-set>

    <!-- Заголовок таблицы отделен двойной линией -->
    <xsl:template name="table.row.properties">
        <xsl:choose>
            <xsl:when test="@role='double' or (ancestor::d:thead and not (following-sibling::d:row) and not (ancestor::d:thead[@role='notdouble']))">
                <xsl:attribute name="border-after-style">double</xsl:attribute>
                <xsl:attribute name="border-after-width">0.5mm</xsl:attribute>
            <xsl:attribute name="text-align">center</xsl:attribute>
            <xsl:attribute name="display-align">center</xsl:attribute>
            </xsl:when>
        </xsl:choose>
        <xsl:call-template name="espd.row.height"/>
    </xsl:template>

</xsl:stylesheet>
