<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Лист регистрации изменений. -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
    version="1.1">

    <xsl:template match="processing-instruction()[local-name()='lastpage']">
        <fo:block id="END-OF-DOCUMENT"/>
    </xsl:template>

    <xsl:template match="d:book">
        <xsl:apply-imports/>
        <xsl:if test="$espd.lri = 1">
            <xsl:call-template name="lripage"/>
        </xsl:if>
    </xsl:template>

    <xsl:attribute-set name="espd.lri.style">
        <xsl:attribute name="font-family">
            <xsl:value-of select="$sans.font.family"/>
        </xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
        <xsl:attribute name="hyphenate">true</xsl:attribute>
    </xsl:attribute-set>

    <xsl:template name="user.pagemasters">
        <fo:simple-page-master master-name="lrip"
                                page-width="{$page.width}"
                                page-height="{$page.height}"
                                margin-top="{$lri.margin.top}"
                                margin-bottom="{$lri.margin.bottom}"
                                margin-left="{$lri.margin.left}"
                                margin-right="{$lri.margin.right}">
            <fo:region-body margin-bottom="0mm"
                            margin-top="0mm"/>
            <fo:region-before region-name="xsl-region-before-even"
                            extent="0mm"
                            display-align="before"/>
            <fo:region-after region-name="xsl-region-after-even"
                            extent="0mm"
                            display-align="after"/>
        </fo:simple-page-master>

        <fo:simple-page-master master-name="lu-any"
                            page-width="{$page.width}"
                            page-height="{$page.height}"
                            margin-top="{$lu.margin.top}"
                            margin-bottom="{$lu.margin.bottom}"
                            margin-left="{$lu.margin.left}"
                            margin-right="{$lu.margin.right}">
        <fo:region-body margin-bottom="0mm"
                        margin-top="0mm"/>
        <fo:region-before region-name="xsl-region-before"
                        extent="0mm"
                        display-align="before"/>
        <fo:region-after region-name="xsl-region-after"
                        extent="0mm"
                        display-align="after"/>
    </fo:simple-page-master>

    <fo:page-sequence-master master-name="lripage">
        <fo:repeatable-page-master-alternatives>
            <fo:conditional-page-master-reference blank-or-not-blank="blank" master-reference="lrip"/>
            <fo:conditional-page-master-reference page-position="first" master-reference="lrip"/>
            <fo:conditional-page-master-reference odd-or-even="odd" master-reference="lrip"/>
            <fo:conditional-page-master-reference odd-or-even="even" master-reference="lrip"/>
        </fo:repeatable-page-master-alternatives>
    </fo:page-sequence-master>

    <fo:page-sequence-master master-name="lu">
        <fo:repeatable-page-master-alternatives>
            <fo:conditional-page-master-reference blank-or-not-blank="blank" master-reference="lu-any"/>
            <fo:conditional-page-master-reference page-position="first" master-reference="lu-any"/>
            <fo:conditional-page-master-reference odd-or-even="odd" master-reference="lu-any"/>
            <fo:conditional-page-master-reference odd-or-even="even" master-reference="lu-any"/>
        </fo:repeatable-page-master-alternatives>
    </fo:page-sequence-master>
    </xsl:template>

    <xsl:template name="lripage">
        <xsl:variable name="master-reference">lripage</xsl:variable>
        <fo:page-sequence master-reference="{$master-reference}">
            <xsl:attribute name="language">
                <xsl:call-template name="l10n.language"/>
            </xsl:attribute>
            <xsl:attribute name="format">
                <xsl:call-template name="page.number.format">
                    <xsl:with-param name="master-reference" select="$master-reference"/>
                </xsl:call-template>
            </xsl:attribute>

            <xsl:attribute name="force-page-count">
                <xsl:call-template name="force.page.count">
                    <xsl:with-param name="master-reference" select="$master-reference"/>
                </xsl:call-template>
            </xsl:attribute>

            <xsl:attribute name="hyphenation-character">
                <xsl:call-template name="gentext">
                    <xsl:with-param name="key" select="'hyphenation-character'"/>
                </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="hyphenation-push-character-count">
                <xsl:call-template name="gentext">
                    <xsl:with-param name="key" select="'hyphenation-push-character-count'"/>
                </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="hyphenation-remain-character-count">
                <xsl:call-template name="gentext">
                    <xsl:with-param name="key" select="'hyphenation-remain-character-count'"/>
                </xsl:call-template>
            </xsl:attribute>

            <fo:flow flow-name="xsl-region-body">
                <fo:block xsl:use-attribute-sets="espd.lri.style" break-before="page">
                    <xsl:call-template name="lri.table"/>
                </fo:block>
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>

</xsl:stylesheet>
