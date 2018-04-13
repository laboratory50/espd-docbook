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
    version="1.1">

<xsl:include href="common/titles.xsl"/>

<!-- Главы (разделы) -->
<xsl:attribute-set name="component.title.properties">
  <xsl:attribute name="font-weight">normal</xsl:attribute>
  <xsl:attribute name="text-align">center</xsl:attribute>
  <xsl:attribute name="hyphenate">false</xsl:attribute>
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master"/>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
  <xsl:attribute name="space-before.minimum">4em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">4em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">4em</xsl:attribute>
<!--  <xsl:attribute name="space-after.minimum">3em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">3em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">3em</xsl:attribute>-->
  <xsl:attribute name="space-after.precedence">2</xsl:attribute>
  <xsl:attribute name="space-after.minimum">
    <xsl:choose>
      <xsl:when test="parent::d:appendix">1em</xsl:when>
      <xsl:otherwise>2.8em</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
  <xsl:attribute name="space-after.optimum">
    <xsl:choose>
      <xsl:when test="parent::d:appendix">1em</xsl:when>
      <xsl:otherwise>3em</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
  <xsl:attribute name="space-after.maximum">
    <xsl:choose>
      <xsl:when test="parent::d:appendix">1em</xsl:when>
      <xsl:otherwise>3.2em</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
</xsl:attribute-set>

<!--
  Оформления заголовка содержания аналогично заголовку раздела.
-->
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

<!--
  2.1.7. Заголовки разделов пишут прописными буквами и размещают
  симметрично относительно правой и левой границ текста.
  Заголовки подразделов записывают с абзаца строчными буквами (кроме первой прописной).
  -->
<xsl:variable name="uppercase-alphabet" select="'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
<xsl:variable name="lowercase-alphabet" select="'абвгдеёжзийклмнопрстуфхцчшщъыьэюяabcdefghijklmnopqrstuvwxyz'"/>

<xsl:template name="ucase">
  <xsl:param name="string" />
  <xsl:value-of select="translate($string,
                                  $lowercase-alphabet,
                                  $uppercase-alphabet)" />
</xsl:template>

<xsl:template match="d:preface|d:chapter|d:appendix|d:glossary|d:acknowledgements" mode="object.title.markup">
  <xsl:variable name="content">
    <xsl:apply-imports/>
  </xsl:variable>
  
  <xsl:call-template name="ucase">
    <xsl:with-param name="string" select="$content"/>
  </xsl:call-template>
</xsl:template>

<!-- Подразделы -->
<xsl:attribute-set name="section.title.properties">
  <xsl:attribute name="font-weight">normal</xsl:attribute>
  <xsl:attribute name="hyphenate">false</xsl:attribute>
  <xsl:attribute name="start-indent">
    <xsl:value-of select="$espd.text-indent"/>
  </xsl:attribute>
  <xsl:attribute name="space-before.minimum">3.8em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">4em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">4.2em</xsl:attribute>
  <xsl:attribute name="space-before.precedence">1</xsl:attribute>
  <xsl:attribute name="space-after.minimum">2.8em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">3em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">3.2em</xsl:attribute>
</xsl:attribute-set>
  
<xsl:attribute-set name="section.title.level1.properties">
  <xsl:attribute name="font-size">
      <xsl:value-of select="$body.font.master"/>
      <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>
  
<xsl:attribute-set name="section.title.level2.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master"/>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="section.title.level3.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master"/>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="section.title.level4.properties">
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master"/>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>
  
</xsl:stylesheet>

