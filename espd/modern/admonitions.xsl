<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Примечания, важно, предупреждения -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
    version="1.1">

    <xsl:param name="admon.graphics.extension">.svg</xsl:param>
    <xsl:param name="admon.graphics.path">../common/figures/</xsl:param>
    <xsl:param name="admon.graphics">0</xsl:param>

<!-- Параметры текста -->
    <xsl:attribute-set name="nongraphical.admonition.properties">
        <xsl:attribute name="keep-together.within-column">always</xsl:attribute>
        <xsl:attribute name="color">black</xsl:attribute>
        <xsl:attribute name="background-color">white</xsl:attribute>
        <xsl:attribute name="text-indent">
            <xsl:value-of select="$espd.text-indent"/>
        </xsl:attribute>
        <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
        <xsl:attribute name="padding-top">0pt</xsl:attribute>
        <xsl:attribute name="padding-left">-15pt</xsl:attribute>
        <xsl:attribute name="padding-right">0pt</xsl:attribute>
        <xsl:attribute name="margin-bottom">1em</xsl:attribute>
        <xsl:attribute name="margin-top">0pt</xsl:attribute>
        <xsl:attribute name="margin-left">0pt</xsl:attribute>
        <xsl:attribute name="margin-right">-1pt</xsl:attribute>
        <xsl:attribute name="space-after.minimum">0.6em</xsl:attribute>
        <xsl:attribute name="space-after.optimum">0.8em</xsl:attribute>
        <xsl:attribute name="space-after.maximum">1em</xsl:attribute>
        <xsl:attribute name="space-before.minimum">0.6em</xsl:attribute>
        <xsl:attribute name="space-before.optimum">0.8em</xsl:attribute>
        <xsl:attribute name="space-before.maximum">1.0em</xsl:attribute>
    </xsl:attribute-set>
<!-- Параметры заголовка -->
    <xsl:attribute-set name="admonition.title.properties">
        <xsl:attribute name="padding-left">0em</xsl:attribute>
        <xsl:attribute name="padding-bottom">0em</xsl:attribute>
        <xsl:attribute name="margin-left">0em</xsl:attribute>
        <xsl:attribute name="margin-bottom">0em</xsl:attribute>
        <xsl:attribute name="text-indent">0mm</xsl:attribute>
        <xsl:attribute name="font-size">13pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="hyphenate">true</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="color">
            <xsl:choose>
                <xsl:when test="self::d:note">#8e9f00</xsl:when>
                <xsl:when test="self::d:important">#d08e13</xsl:when>
                <xsl:when test="self::d:warning">#9e0000</xsl:when>
                <xsl:otherwise>#dddddd</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="admonition.properties">
        <xsl:attribute name="margin-right">0em</xsl:attribute>
        <xsl:attribute name="margin-left">0em</xsl:attribute>
        <xsl:attribute name="margin-top">0em</xsl:attribute>
        <xsl:attribute name="margin-bottom">0em</xsl:attribute>
        <xsl:attribute name="border-width">1pt</xsl:attribute>
        <xsl:attribute name="border-start-width">5pt</xsl:attribute>
        <xsl:attribute name="border-style">solid</xsl:attribute>
        <xsl:attribute name="border-color">
            <xsl:choose>
                <xsl:when test="self::d:note">#8e9f00</xsl:when>
                <xsl:when test="self::d:important">#d08e13</xsl:when>
                <xsl:when test="self::d:warning">#9e0000</xsl:when>
            <xsl:otherwise>#dddddd</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="padding-top">1.1em</xsl:attribute>
        <xsl:attribute name="padding-bottom">0.8em</xsl:attribute>
        <xsl:attribute name="padding-left">1em</xsl:attribute>
        <xsl:attribute name="padding-right">1em</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="graphical.admonition.properties">
        <xsl:attribute name="keep-together.within-column">always</xsl:attribute>
        <xsl:attribute name="color">black</xsl:attribute>
        <xsl:attribute name="background-color">white</xsl:attribute>
        <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
        <xsl:attribute name="padding-top">0pt</xsl:attribute>
        <xsl:attribute name="padding-right">12pt</xsl:attribute>
        <xsl:attribute name="padding-left">0em</xsl:attribute>
        <xsl:attribute name="margin-left">0pc</xsl:attribute>
    </xsl:attribute-set>

    <xsl:template name="graphical.admonition">
        <xsl:variable name="id">
            <xsl:call-template name="object.id"/>
        </xsl:variable>
        <xsl:variable name="graphic.width">
            <xsl:apply-templates select="." mode="admon.graphic.width"/>
        </xsl:variable>
        <xsl:variable name="src">
            <xsl:call-template name="admon.graphic"/>
        </xsl:variable>

        <fo:block id="{$id}"
                    xsl:use-attribute-sets="graphical.admonition.properties">
            <xsl:attribute name="margin-top">1em</xsl:attribute>
            <xsl:attribute name="padding-bottom">-3em</xsl:attribute>
            <xsl:attribute name="margin-bottom">4em</xsl:attribute>
            <fo:block-container>
                <fo:block-container>
                    <xsl:attribute name="margin-left">0em</xsl:attribute>
                    <fo:block xsl:use-attribute-sets="admonition.title.properties">
                        <xsl:apply-templates select="." mode="object.title.markup">
                            <xsl:with-param name="allow-anchors" select="1"/>
                        </xsl:apply-templates>
                    </fo:block>
                </fo:block-container>
                <fo:block-container>
                    <xsl:attribute name="margin-left">0em</xsl:attribute>
                    <fo:block xsl:use-attribute-sets="admonition.properties">
                        <xsl:apply-templates/>
                    </fo:block>
                </fo:block-container>
                <fo:block-container position="absolute" top="-12px" left="1px">
                <xsl:attribute name="margin-left">0em</xsl:attribute>
                    <fo:block>
                        <fo:external-graphic width="auto" height="auto"
                                            content-width="{$graphic.width}" >
                            <xsl:attribute name="src">
                            <xsl:call-template name="admon.graphic"/>
                            </xsl:attribute>
                        </fo:external-graphic>
                    </fo:block>
                </fo:block-container>
            </fo:block-container>
        </fo:block>
    </xsl:template>

</xsl:stylesheet>

