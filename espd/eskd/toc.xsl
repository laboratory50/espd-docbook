<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСКД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Оформление содержания -->
<!-- ГОСТ 2.105-95 -->
<!--Слово "Содержание" записывают в виде заголовка (симметрично тексту) с прописной буквы. Наименования, включенные в содержание, записывают строчными буквами, начиная с прописной буквы-->

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    exclude-result-prefixes="d"
    version="1.1">

    <!-- Оформления заголовка содержания аналогично заголовку подраздела, но по центру -->
    <xsl:template name="table.of.contents.titlepage.recto">
        <fo:block xsl:use-attribute-sets="section.title.properties section.title.level1.properties"
                  space-after="3em"
                  font-size="{$body.font.master}"
                  font-weight="normal"
                  font-family="{$title.fontset}"
                  start-indent="0mm"
                  text-align="center">
            <xsl:call-template name="gentext">
            <xsl:with-param name="key" select="'TableofContents'"/>
        </xsl:call-template></fo:block>
    </xsl:template>

</xsl:stylesheet>
