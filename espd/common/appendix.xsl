<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСКД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Оформление приложений -->
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
                <xsl:if test="$component.label.includes.part.label != 0 and
                                ancestor::d:part">
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

<!-- subtitle как title, только слева -->
<!--    <xsl:template match="d:subtitle" mode="appendix.titlepage.recto.auto.mode">
        <xsl:variable name="content">
            <xsl:apply-templates select="." mode="appendix.titlepage.recto.mode"/>
        </xsl:variable>

        <fo:block xsl:use-attribute-sets="section.title.properties section.title.level1.properties"
                text-indent="0mm"
                text-align="center" 
                font-family="{$title.fontset}">
            <xsl:call-template name="ucase">
                <xsl:with-param name="string" select="$content"/>
            </xsl:call-template>
        </fo:block>
    </xsl:template>-->

    <!-- Приложение справа -->
    <!--<xsl:attribute-set name="component.title.properties">
        <xsl:attribute name="text-align">
            <xsl:choose>
                <xsl:when test="parent::d:appendix">right</xsl:when>
                <xsl:otherwise>center</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>-->

</xsl:stylesheet>
