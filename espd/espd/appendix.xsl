<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСКД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Оформление приложений -->
<!-- ГОСТ 19.106-78 ЕСПД -->
<!--2.9.2. Каждое приложение должно начинаться с новой страницы с указанием в правом верхнем углу слова "ПРИЛОЖЕНИЕ" прописными буквами и иметь тематический заголовок, который записывают симметрично тексту прописными буквами.
При наличии в документе более одного приложения все приложения нумеруют арабскими цифрами (без знака N), например ПРИЛОЖЕНИЕ 1, ПРИЛОЖЕНИЕ 2 и т.д.-->
<!-- !!! Для корректного отображения у приложения должны быть <title> и <subtitle> !!! -->

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    exclude-result-prefixes="d"
    version="1.1">

    <!-- subtitle как title, большими буквами -->
    <xsl:template match="d:subtitle" mode="appendix.titlepage.recto.auto.mode">
        <xsl:variable name="content">
            <xsl:apply-templates select="." mode="appendix.titlepage.recto.mode"/>
        </xsl:variable>

        <fo:block xsl:use-attribute-sets="section.title.properties section.title.level1.properties"
                text-indent="0mm"
                text-align="center"
                start-indent="0mm"
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
