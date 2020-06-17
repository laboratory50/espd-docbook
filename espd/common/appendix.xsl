<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСКД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Оформление приложений -->
<!-- ГОСТ 2.105-95 ЕСКД -->
<!--4.3.7 Каждое приложение следует начинать с новой страницы с указанием наверху посередине страницы слова "Приложение" и его обозначения, а под ним в скобках для обязательного приложения пишут слово "обязательное", а для информационного - "рекомендуемое" или "справочное".
Приложение должно иметь заголовок, который записывают симметрично относительно текста с прописной буквы отдельной строкой.-->
<!-- !!! Для корректного отображения у приложения должн быть <subtitle>(Обязательное)</subtitle>, <subtitle>(Рекомендуемое)</subtitle> или <subtitle>(Справочное)</subtitle> !!! -->

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    exclude-result-prefixes="d"
    version="1.1">

<xsl:variable name="english-alphabet" select="'ABCDEFGHIJKLMNOPQRSTUVWXY'"/>
<xsl:variable name="russian-alphabet" select="'АБВГДЕЖИКЛМНПРСТУФХЦШЩЭЮЯ'"/>

<xsl:template name="espd.appendix.label">
    <xsl:param name="number"/>
    <xsl:param name="format"/>

    <xsl:choose>
        <xsl:when test="$format='upperalpha' or $format='A'">
           <xsl:value-of select="translate($number, $english-alphabet, $russian-alphabet)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$number"/>
          </xsl:otherwise>
          </xsl:choose>
</xsl:template>

<!-- Буквизация -->
    <xsl:template match="d:appendix" mode="label.markup">
        <xsl:choose>
            <xsl:when test="@label">
                <xsl:value-of select="@label"/>
            </xsl:when>
            <xsl:when test="string($appendix.autolabel) != 0">
                <xsl:if test="$component.label.includes.part.label != 0 and ancestor::d:part">
                    <xsl:variable name="part.label">
                    <xsl:apply-templates select="ancestor::d:part" 
                                        mode="label.markup"/>
                    </xsl:variable>
                    <xsl:if test="$part.label != ''">
                    <xsl:value-of select="$part.label"/>
                    <xsl:apply-templates select="ancestor::d:part" 
                                        mode="intralabel.punctuation">
                        <xsl:with-param name="object" select="."/>
                    </xsl:apply-templates>
                    </xsl:if>
                </xsl:if>
                <xsl:variable name="format">
                    <xsl:call-template name="autolabel.format">
                        <xsl:with-param name="format" select="$appendix.autolabel"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="$label.from.part != 0 and ancestor::d:part">
                        <xsl:number from="d:part" count="d:appendix" format="{$format}" level="any"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="espd.appendix.label">
                            <xsl:with-param name="number">
                                <xsl:number from="d:book|d:article"
                                            count="d:appendix" format="{$format}" level="any"/>
                            </xsl:with-param>
                            <xsl:with-param name="format" select="$format"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
        </xsl:choose>
</xsl:template>

<xsl:template match="d:title" mode="appendix.titlepage.recto.auto.mode"/>
<xsl:template match="d:subtitle" mode="appendix.titlepage.recto.auto.mode"/>

<!-- Превращение <subtitle> в "рекомендуемое" или "справочное" -->
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
            <xsl:if test="following::d:subtitle">
                <fo:block>
                    <xsl:value-of select="following::d:subtitle"/>
                </fo:block>
            </xsl:if>
            <fo:block>
                <xsl:call-template name="ucase">
                    <xsl:with-param name="string" select="."/>
                </xsl:call-template>
            </fo:block>
        </fo:block>
    </fo:block>
</xsl:template>

</xsl:stylesheet>
