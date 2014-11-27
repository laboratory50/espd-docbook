<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2014.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Колонтитулы -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
    exclude-result-prefixes="d"
    version="1.1">

<!-- Нумерация страниц -->
<xsl:template name="initial.page.number">
  <xsl:param name="element" select="local-name(.)"/>
  <xsl:param name="master-reference" select="''"/>

  <xsl:choose>
    <xsl:when test="$element = 'toc'">2</xsl:when> <!-- Когда у нас есть ЛУ, выкидываем его из нумерации. -->
    <xsl:when test="$element = 'book'">1</xsl:when>
    <xsl:otherwise>auto</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="page.number.format">1</xsl:template>

<!-- Удаление разделительных полос. -->
<xsl:param name="footer.rule" select="0"/>
<!-- <xsl:param name="header.rule" select="0"/> -->

<!-- Содержимое колонтитулов -->
<!-- Верхний — номер страницы и децимальный номер по центру. -->
<xsl:template name="header.content">
  <xsl:param name="pageclass" select="''"/>
  <xsl:param name="sequence" select="''"/>
  <xsl:param name="position" select="''"/>
  <xsl:param name="gentext-key" select="''"/>
  <fo:block>
    <xsl:choose>
     <xsl:when test="$pageclass = 'titlepage'"/>

      <xsl:when test="$sequence = 'odd' and $position = 'left'">
        <xsl:apply-templates select="." mode="titleabbrev.markup"/>
      </xsl:when>

      <!--      <xsl:when test="($sequence = 'odd' or $sequence = 'first') and $position = 'left'">
        <xsl:apply-templates select="." mode="titleabbrev.markup"/>
      </xsl:when>-->

      <xsl:when test="$sequence = 'even' and $position = 'right'">
        <xsl:apply-templates select="." mode="titleabbrev.markup"/>
      </xsl:when>

      <xsl:when test="$position = 'center'">
        <xsl:value-of select="$espd.decimal"/>
      </xsl:when>
    
      <xsl:when test="($sequence = 'odd' or $sequence = 'first') and $position = 'right'">
        <fo:page-number/>
      </xsl:when>

      <xsl:when test="$sequence = 'even' and $position = 'left'">
        <fo:page-number/>
      </xsl:when>

      <xsl:when test="$sequence = 'blank' and $position = 'left'">
        <fo:page-number/>
      </xsl:when>

      <xsl:otherwise/>
    
    </xsl:choose>
  </fo:block>
</xsl:template>

<!-- Нижний колонтитул: отсутствует. -->
<xsl:template name="footer.content">
  <xsl:param name="pageclass" select="''"/>
  <xsl:param name="sequence" select="''"/>
  <xsl:param name="position" select="''"/>
  <xsl:param name="gentext-key" select="''"/>
</xsl:template>

<!--
  Шрифт: основной, размер 90% основного.
-->
<xsl:attribute-set name="header.content.properties">
  <xsl:attribute name="font-family">
    <xsl:value-of select="$espd.heading.font.family"/>
  </xsl:attribute>
  <xsl:attribute name="font-size">0.9em</xsl:attribute>
  <!--  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master"/>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>-->
</xsl:attribute-set>

<!-- Относительная ширина колонок в верхнем колонтитуле. -->
<!-- <xsl:param name="header.column.widths">2 2 1</xsl:param> -->

<xsl:attribute-set name="footer.content.properties"
                   use-attribute-sets="header.content.properties">
</xsl:attribute-set>

</xsl:stylesheet>

