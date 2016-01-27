<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2016.
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

<!-- Двое уменьшенный отступ относительно стандартного. -->
<xsl:param name="toc.indent.width">12</xsl:param>

<!-- Убираем точку после номера в оглавлении (стандартное значение «. »). -->
<xsl:param name="autotoc.label.separator"><xsl:text>  </xsl:text></xsl:param>

<!-- Добавляется слово «Приложение» для номера приложений
     и для Apache FOP ровное выравнивание номеров страниц. -->
<xsl:template name="toc.line">
  <xsl:param name="toc-context" select="NOTANODE"/>

  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>

  <xsl:variable name="label">
    <xsl:choose>
      <xsl:when test="self::d:appendix">
        <xsl:call-template name="gentext">
          <xsl:with-param name="key">appendix</xsl:with-param>
        </xsl:call-template>
        <xsl:text> </xsl:text>
        <xsl:apply-templates select="." mode="label.markup"/>
        <xsl:text>.</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="." mode="label.markup"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <fo:block xsl:use-attribute-sets="toc.line.properties"
            text-align-last="justify"
            white-space-collapse="false">

    <fo:basic-link internal-destination="{$id}">
      <xsl:if test="$label != ''">
        <xsl:copy-of select="$label"/>
        <xsl:value-of select="$autotoc.label.separator"/>
      </xsl:if>
      <xsl:apply-templates select="." mode="title.markup"/>
    </fo:basic-link>
    <xsl:text> </xsl:text>
    <fo:leader leader-pattern="dots"
               leader-pattern-width="0"
               leader-alignment="reference-area"
               keep-with-next.within-line="always"/>
    <xsl:text> </xsl:text>
    <fo:basic-link internal-destination="{$id}">
      <fo:page-number-citation ref-id="{$id}"/>
    </fo:basic-link>
  </fo:block>
</xsl:template>

<!-- Чистые листы после оглавления в случае двусторонней печати:
     https://lists.oasis-open.org/archives/docbook-apps/201202/msg00117.html -->
<xsl:template name="force.page.count">
  <xsl:param name="element" select="local-name(.)"/>
  <xsl:param name="master-reference" select="''"/>

  <xsl:choose>
    <!-- no automatic even blank pages at end of chapters -->
    <xsl:when test="$force.blank.pages = 0">no-force</xsl:when>

    <xsl:when test="$double.sided != 0 and $master-reference = 'lot'">no-force</xsl:when>
    <!-- double-sided output -->
    <xsl:when test="$double.sided != 0">end-on-even</xsl:when>
    <!-- single-sided output -->
    <xsl:otherwise>no-force</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="page.number.format">1</xsl:template>

<xsl:template name="initial.page.number">
  <xsl:choose>
    <!-- double-sided output -->
    <xsl:when test="$double.sided != 0">auto-odd</xsl:when>
    <!-- single-sided output -->
    <xsl:otherwise>auto</xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>

