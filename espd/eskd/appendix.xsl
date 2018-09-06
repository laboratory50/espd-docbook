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

<!-- Нумерация приложений вместо буквизации -->
    <xsl:param name="appendix.autolabel">1</xsl:param>
    <xsl:param name="appendix.label.includes.component.label">1</xsl:param>

    <xsl:param name="local.l10n.xml" select="document('')"/>
        <l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0"> 
            <l:l10n language="ru">
                <l:context name="title-numbered">
                    <l:template name="chapter" text="%n. %t"/>
                    <l:template name="section" text="%n. %t"/>
                <!-- цифры в нумерации приложений -->
                    <l:template name="appendix" text="Приложение&#160;%n"/>
                </l:context>
                <l:context name="title">
                    <l:template name="appendix" text="Приложение %n. %t"/>
                <!-- Слово таблица - разреженное -->
                    <l:template name="table" text="Т а б л и ц а&#160;&#160;%n — %t"></l:template>
                    <l:template name="note" text="П р и м е ч а н и е. "></l:template>
                    <l:template name="important" text="В А Ж Н О. "></l:template>
                    <l:template name="warning" text="Предупреждение! "></l:template>
                    <l:template name="figure" text="%t&#010;&#013;Рисунок %n"/>
                </l:context>
                <l:context name="xref-number">
                    <l:template name="table" text="табл.&#160;%n"/>
                    <l:template name="figure" text="рис.&#160;%n"/>
                    <l:template name="section" text="раздел&#160;%n"/>
                    <l:template name="simplesect" text="подраздел&#160;%n"/>
                    <l:template name="chapter" text="глава %n"/>
                </l:context>
            </l:l10n>
        </l:i18n>

    <!-- subtitle как title, только слева -->
    <xsl:template match="d:subtitle" mode="appendix.titlepage.recto.auto.mode">
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
    </xsl:template>

    <!-- Приложение справа -->
    <xsl:attribute-set name="component.title.properties">
    <xsl:attribute name="text-align">
        <xsl:choose>
        <xsl:when test="parent::d:appendix">right</xsl:when>
        <xsl:otherwise>center</xsl:otherwise>
        </xsl:choose>
    </xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>
