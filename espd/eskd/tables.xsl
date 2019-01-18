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

    <xsl:include href="../common/tables.xsl"/>

<!-- Таблица дожна иметь номер -->
<!-- без номера раздела (сквозная нумерация)-->
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

    <xsl:attribute-set name="formal.title.properties" use-attribute-sets="normal.para.spacing">
        <xsl:attribute name="text-align">
            <xsl:choose>
                <xsl:when test="self::d:table">left</xsl:when>
                <xsl:otherwise>center</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>
    <xsl:template name="table.cell.block.properties">
        <xsl:if test="ancestor::thead">
            <xsl:attribute name="font-weight">normal</xsl:attribute>
        </xsl:if>
    </xsl:template>

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
            <xsl:when test="ancestor::d:thead and not (following-sibling::d:row) and not (ancestor::d:thead[@role='notdouble'])">
                <xsl:attribute name="border-after-style">double</xsl:attribute>
                <xsl:attribute name="border-after-width">0.5mm</xsl:attribute>
                <xsl:attribute name="text-align">center</xsl:attribute>
                <xsl:attribute name="display-align">center</xsl:attribute>
            </xsl:when>
            <xsl:when test="@role='double'">
                <xsl:attribute name="border-after-style">double</xsl:attribute>
                <xsl:attribute name="border-after-width">0.5mm</xsl:attribute>
                <xsl:attribute name="text-align">center</xsl:attribute>
                <xsl:attribute name="display-align">center</xsl:attribute>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
