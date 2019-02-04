<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСКД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Оформление приложений -->
<!-- ГОСТ 2.105-95 ЕСКД -->
<!--4.3.7 Каждое приложение следует начинать с новой страницы с указанием наверху посередине страницы слова "Приложение" и его обозначения, а под ним в скобках для обязательного приложения пишут слово "обязательное", а для информационного - "рекомендуемое" или "справочное".-->

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    exclude-result-prefixes="d"
    version="1.1">

    <xsl:template match="d:title" mode="appendix.titlepage.recto.auto.mode">
        <fo:block xsl:use-attribute-sets="appendix.titlepage.recto.style">
            <xsl:variable name="id">
                <xsl:call-template name="object.id">
                <xsl:with-param name="object" select="ancestor-or-self::d:appendix[1]"/>
                </xsl:call-template>
            </xsl:variable>

            <xsl:variable name="title">
                <xsl:apply-templates select="ancestor-or-self::d:appendix[1]" mode="object.title.markup">
                <xsl:with-param name="allow-anchors" select="1"/>
                </xsl:apply-templates>
            </xsl:variable>

            <fo:block xsl:use-attribute-sets="component.title.properties">
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

                <xsl:copy-of select="$title"/>
                <fo:block>
                    <xsl:value-of select="."/>
                </fo:block>
                <xsl:if test="ancestor::d:subtitle">
                    <fo:block>
                        <xsl:value-of select="."/>
                    </fo:block>
                </xsl:if>
            </fo:block>

        </fo:block>

    </xsl:template>

</xsl:stylesheet>
