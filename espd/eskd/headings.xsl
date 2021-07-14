<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Колонтитулы -->
<!-- ГОСТ 2.104-2006 -->
<!-- Вариант для односторонней печати -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
    version="1.1">

<!-- Удаление разделительных полос колонтитулов -->
<xsl:param name="footer.rule" select="0"/>
<xsl:param name="header.rule" select="0"/>

<!-- Содержимое колонтитулов -->
<!-- Верхний — нет -->
<xsl:template name="header.content">
    <xsl:param name="pageclass" select="''"/>
    <xsl:param name="sequence" select="''"/>
    <xsl:param name="position" select="''"/>
    <xsl:param name="gentext-key" select="''"/>
</xsl:template>

<!-- Нижний колонтитул -->
<xsl:template name="footer.content">
    <xsl:param name="pageclass" select="''"/>
    <xsl:param name="sequence" select="''"/>
    <xsl:param name="position" select="''"/>
    <xsl:param name="gentext-key" select="''"/>
    <fo:block>
        <xsl:choose>
            <xsl:when test="$pageclass = 'titlepage' or $pageclass = 'lripage'">
            </xsl:when>

            <xsl:when test="$pageclass = 'lot' and $position = 'center'">
                <!-- Рамка и основная надпись -->
                <xsl:call-template name="eskd.main.stamp"/>
                <!-- Штамп вертикальный слева -->
                <xsl:call-template name="espd.stamp"/>
            </xsl:when>

            <xsl:when test="$position = 'center'">
                <!-- Рамка и основная надпись -->
                <xsl:call-template name="eskd.other.stamp"/>
                <!-- Штамп вертикальный слева -->
                <xsl:call-template name="espd.stamp"/>
            </xsl:when>

            <xsl:otherwise/>
        </xsl:choose>
    </fo:block>
</xsl:template>

<!-- Шрифт: основной, размер 100% основного -->
<xsl:attribute-set name="footer.content.properties">
    <xsl:attribute name="font-family">
        <xsl:value-of select="$espd.heading.font.family"/>
    </xsl:attribute>
    <xsl:attribute name="font-size">
        <xsl:value-of select="$body.font.master"/>
        <xsl:text>pt</xsl:text>
    </xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="footer.content.properties"
                   use-attribute-sets="header.content.properties">
</xsl:attribute-set>

</xsl:stylesheet>
