<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии CC BY-SA 4.0.

  http://lab50.net/
-->

<!-- Названия разделов -->
<!-- ГОСТ 19.106-78 ЕСПД -->
<!--2.1.4. Содержание документа размещают на отдельной (пронумерованной) странице (страницах) после аннотации, снабжают заголовком "СОДЕРЖАНИЕ", не нумеруют как раздел и включают в общее количество страниц документа.-->

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
    version="1.1">

    <!-- Оформления заголовка содержания аналогично заголовку раздела -->
    <xsl:template name="table.of.contents.titlepage" priority="1">
        <fo:block xsl:use-attribute-sets="component.title.properties"
                font-family="{$title.font.family}">
            <xsl:call-template name="ucase">
                <xsl:with-param name="string">
                    <xsl:call-template name="gentext">
                        <xsl:with-param name="key" select="'TableofContents'"/>
                    </xsl:call-template>
                </xsl:with-param>
            </xsl:call-template>
        </fo:block>
    </xsl:template>

</xsl:stylesheet>

