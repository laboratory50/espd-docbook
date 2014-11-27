<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2014.
  Распространяется на условиях лицензии CC BY-SA 4.0.

  http://lab50.net/
-->

<!-- Названия разделов -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
    exclude-result-prefixes="d"
    version="1.1">

<xsl:include href="../common/titles.xsl"/>

<!-- Главы (разделы) -->
<xsl:attribute-set name="component.title.properties">
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="color">
    <xsl:value-of select="$espd-modern.color.bg"/>
  </xsl:attribute>
  <xsl:attribute name="start-indent">
    <xsl:value-of select="$espd.text-indent"/>
  </xsl:attribute>
  <xsl:attribute name="text-align">left</xsl:attribute>
  <xsl:attribute name="hyphenate">false</xsl:attribute>
  <xsl:attribute name="space-before.minimum">3em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">3em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">3em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">1em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">1em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">1em</xsl:attribute>
  <!--  <xsl:attribute name="space-after.precedence">2</xsl:attribute> -->
</xsl:attribute-set>

<!-- Подразделы -->
<xsl:attribute-set name="section.title.properties">
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="color">
    <xsl:value-of select="$espd-modern.color.bg"/>
  </xsl:attribute>
  <xsl:attribute name="hyphenate">false</xsl:attribute>
  <xsl:attribute name="space-before.minimum">1em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">1em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">1em</xsl:attribute>
  <!--  <xsl:attribute name="space-before.precedence">1</xsl:attribute> -->
  <xsl:attribute name="space-after.minimum">0.5em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">0.5em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">0.5em</xsl:attribute>
</xsl:attribute-set>

<!-- Размеры отступов при форматировании (под)разделов.
     Используется только при установленном параметре
     espd.heading.separation. -->
<xsl:attribute-set name="heading.properties">
  <xsl:attribute name="start-indent">
    <xsl:value-of select="$espd.text-indent"/>
  </xsl:attribute>
  <xsl:attribute name="provisional-distance-between-starts">22mm</xsl:attribute>
  <xsl:attribute name="provisional-label-separation">5mm</xsl:attribute>
</xsl:attribute-set>

<!-- Оформление заголовка в соответствии с параметром espd.heading.separation -->
<xsl:template name="espd.heading">
  <xsl:param name="title"/>

  <xsl:choose>
      <xsl:when test="$espd.heading.separation = 0">
        <xsl:value-of select="$title"/>
      </xsl:when>
      <xsl:when test="parent::d:book|parent::d:preface|parent::d:appendix">
        <xsl:value-of select="$title"/>
      </xsl:when>
      <xsl:when test="parent::d:simplesect">
        <fo:block xsl:use-attribute-sets="heading.properties">
           <xsl:apply-templates/>
        </fo:block>
      </xsl:when>
      <xsl:when test="$espd.heading.separation != 0">
        <fo:list-block xsl:use-attribute-sets="heading.properties">
          <fo:list-item>
            <fo:list-item-label end-indent="label-end()" text-align="start">
              <fo:block>
                <xsl:apply-templates select="parent::*" mode="label.markup"/>
              </fo:block>
            </fo:list-item-label>
            <fo:list-item-body start-indent="body-start()" text-align="start">
              <fo:block>
                <xsl:apply-templates select="parent::*" mode="title.markup"/>
              </fo:block>
            </fo:list-item-body>
          </fo:list-item>
        </fo:list-block>
      </xsl:when>
      <xsl:otherwise><xsl:value-of select="$title"/></xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="section.heading">
  <xsl:param name="level" select="1"/>
  <xsl:param name="marker" select="1"/>
  <xsl:param name="title"/>
  <xsl:param name="marker.title"/>

  <xsl:variable name="title.block">
    <xsl:call-template name="espd.heading">
       <xsl:with-param name="title" select="$title"/>
    </xsl:call-template>
  </xsl:variable>

  <fo:block xsl:use-attribute-sets="section.title.properties">
    <xsl:if test="$marker != 0">
      <fo:marker marker-class-name="section.head.marker">
        <xsl:copy-of select="$marker.title"/>
      </fo:marker>
    </xsl:if>

    <xsl:choose>
      <xsl:when test="$level=1">
        <fo:block xsl:use-attribute-sets="section.title.level1.properties">
          <xsl:copy-of select="$title.block"/>
        </fo:block>
      </xsl:when>
      <xsl:when test="$level=2">
        <fo:block xsl:use-attribute-sets="section.title.level2.properties">
          <xsl:copy-of select="$title.block"/>
        </fo:block>
      </xsl:when>
      <xsl:when test="$level=3">
        <fo:block xsl:use-attribute-sets="section.title.level3.properties">
          <xsl:copy-of select="$title.block"/>
        </fo:block>
      </xsl:when>
      <xsl:when test="$level=4">
        <fo:block xsl:use-attribute-sets="section.title.level4.properties">
          <xsl:copy-of select="$title.block"/>
        </fo:block>
      </xsl:when>
      <xsl:when test="$level=5">
        <fo:block xsl:use-attribute-sets="section.title.level5.properties">
          <xsl:copy-of select="$title.block"/>
        </fo:block>
      </xsl:when>
      <xsl:otherwise>
        <fo:block xsl:use-attribute-sets="section.title.level6.properties">
          <xsl:copy-of select="$title.block"/>
        </fo:block>
      </xsl:otherwise>
    </xsl:choose>
  </fo:block>
</xsl:template>

<xsl:template name="component.title">
  <xsl:param name="node" select="."/>
  <xsl:param name="pagewide" select="0"/>

  <xsl:variable name="id">
    <xsl:call-template name="object.id">
      <xsl:with-param name="object" select="$node"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="title">
    <xsl:apply-templates select="$node" mode="object.title.markup">
      <xsl:with-param name="allow-anchors" select="1"/>
    </xsl:apply-templates>
  </xsl:variable>

  <xsl:variable name="titleabbrev">
    <xsl:apply-templates select="$node" mode="titleabbrev.markup"/>
  </xsl:variable>

  <xsl:variable name="title.block">
    <xsl:call-template name="espd.heading">
       <xsl:with-param name="title" select="$title"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="level">
    <xsl:choose>
      <xsl:when test="ancestor::d:section">
        <xsl:value-of select="count(ancestor::d:section)+1"/>
      </xsl:when>
      <xsl:when test="ancestor::d:sect5">6</xsl:when>
      <xsl:when test="ancestor::d:sect4">5</xsl:when>
      <xsl:when test="ancestor::d:sect3">4</xsl:when>
      <xsl:when test="ancestor::d:sect2">3</xsl:when>
      <xsl:when test="ancestor::d:sect1">2</xsl:when>
      <xsl:otherwise>1</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <fo:block xsl:use-attribute-sets="component.title.properties">
    <xsl:if test="$pagewide != 0">
      <xsl:attribute name="span">inherit</xsl:attribute>
    </xsl:if>
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
    <xsl:if test="$axf.extensions != 0">
      <xsl:attribute name="axf:outline-level">
        <xsl:value-of select="count($node/ancestor::*)"/>
      </xsl:attribute>
      <xsl:attribute name="axf:outline-expand">false</xsl:attribute>
      <xsl:attribute name="axf:outline-title">
        <xsl:value-of select="normalize-space($title)"/>
      </xsl:attribute>
    </xsl:if>

    <xsl:choose>
      <xsl:when test="$level=2">
        <fo:block xsl:use-attribute-sets="section.title.level2.properties">
          <xsl:copy-of select="$title.block"/>
        </fo:block>
      </xsl:when>
      <xsl:when test="$level=3">
        <fo:block xsl:use-attribute-sets="section.title.level3.properties">
          <xsl:copy-of select="$title.block"/>
        </fo:block>
      </xsl:when>
      <xsl:when test="$level=4">
        <fo:block xsl:use-attribute-sets="section.title.level4.properties">
          <xsl:copy-of select="$title.block"/>
        </fo:block>
      </xsl:when>
      <xsl:when test="$level=5">
        <fo:block xsl:use-attribute-sets="section.title.level5.properties">
          <xsl:copy-of select="$title.block"/>
        </fo:block>
      </xsl:when>
      <xsl:when test="$level=6">
        <fo:block xsl:use-attribute-sets="section.title.level6.properties">
          <xsl:copy-of select="$title.block"/>
        </fo:block>
      </xsl:when>
      <xsl:otherwise>
        <xsl:copy-of select="$title.block"/>
      </xsl:otherwise>
    </xsl:choose>
  </fo:block>
</xsl:template>

</xsl:stylesheet>

