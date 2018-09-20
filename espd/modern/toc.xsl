<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Оформление содержания. -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    exclude-result-prefixes="d"
    version="1.1">

    <xsl:include href="../common/toc.xsl"/>

    <xsl:template name="table.of.contents.titlepage" priority="1">
    <fo:block xsl:use-attribute-sets="section.title.properties section.title.level1.properties"
                space-before.conditionality="retain">
        <xsl:call-template name="gentext">
        <xsl:with-param name="key" select="'TableofContents'"/>
        </xsl:call-template>
    </fo:block>
    </xsl:template>

    <!-- Убираем точку после номера в оглавлении (стандартное значение «. »). -->
    <xsl:param name="autotoc.label.separator"><xsl:text>  </xsl:text></xsl:param>

</xsl:stylesheet>

