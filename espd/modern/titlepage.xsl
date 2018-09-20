<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Титульный лист. -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
    exclude-result-prefixes="d"
    version="1.1">

<xsl:attribute-set name="book.titlepage.recto.style">
  <xsl:attribute name="font-family">
    <xsl:value-of select="$title.fontset"/>
  </xsl:attribute>
  <xsl:attribute name="font-weight">normal</xsl:attribute>
  <xsl:attribute name="font-size">13pt</xsl:attribute>
  <xsl:attribute name="text-align">left</xsl:attribute>
  <xsl:attribute name="space-before">2mm</xsl:attribute>
  <xsl:attribute name="space-after">2mm</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="book.titlepage.verso.style">
  <xsl:attribute name="font-weight">normal</xsl:attribute>
  <xsl:attribute name="font-size">11pt</xsl:attribute>
</xsl:attribute-set>
<!-- Лицевая сторона -->
<xsl:template name="book.titlepage.recto">
<!-- Название -->
  <fo:block-container absolute-position="absolute" top="35mm">
    <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:title"/>
<!-- Тип докумена -->
    <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:subtitle"/>
<!-- Линия -->
    <!--<fo:block xsl:use-attribute-sets="book.titlepage.recto.style"
              font-size="16pt" border-bottom-style="solid" border-bottom-color="gray">
    </fo:block>-->
<!-- Версия -->
    <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:productnumber"/>
<!-- Для какой ОС -->
    <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:productname"/>
  </fo:block-container>
<!-- Название организации -->
  <!--<fo:block-container absolute-position="absolute" top="18cm">
    <xsl:choose>
      <xsl:when test="d:info/d:author/d:orgname">
        <xsl:apply-templates mode="book.titlepage.recto.auto.mode"
                             select="d:info/d:author/d:orgname"/>
      </xsl:when>
      <xsl:when test="d:info/d:org/d:orgname">
        <xsl:apply-templates mode="book.titlepage.recto.auto.mode"
                             select="d:info/d:org/d:orgname"/>
      </xsl:when>
    </xsl:choose>
  </fo:block-container>-->
<!-- Почтовый адрес -->
 <!-- <fo:block-container absolute-position="absolute" top="19cm">
    <xsl:choose>
      <xsl:when test="d:info/d:author/d:email">
        <xsl:apply-templates mode="book.titlepage.recto.auto.mode"
                             select="d:info/d:author/d:email"/>
      </xsl:when>
      <xsl:when test="d:info/d:org/d:email">
        <xsl:apply-templates mode="book.titlepage.recto.auto.mode"
                             select="d:info/d:org/d:email"/>
      </xsl:when>
    </xsl:choose>-->
<!-- версия -->
<!--    <xsl:if test="$draft.mode = 'no'">
    <fo:block xsl:use-attribute-sets="book.titlepage.recto.style" font-style="italic">
      <xsl:text>Предварительная версия</xsl:text>
    </fo:block>
    </xsl:if>
  </fo:block-container>-->
<!-- Год -->
  <!--<fo:block-container absolute-position="absolute" top="23cm">
    <fo:block xsl:use-attribute-sets="book.titlepage.verso.style" 
              font-size="10pt" text-align="center">
        <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:date"/>
    </fo:block>
  </fo:block-container>-->
<!-- Лого -->
  <fo:block-container absolute-position="absolute" top="23cm">
    <fo:block xsl:use-attribute-sets="book.titlepage.recto.style" 
              font-size="10pt" text-align="right">
        <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:legalnotice"/>
    </fo:block>
  </fo:block-container>
</xsl:template>

<!-- Размер шрифта и расположение -->
<xsl:template match="d:title" mode="book.titlepage.recto.auto.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.recto.style"
            space-before="2mm" font-size="22pt" font-family="Lato Medium"  text-align="right">
     <xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
  </fo:block>
</xsl:template>

<xsl:template match="d:subtitle" mode="book.titlepage.recto.auto.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.recto.style" 
            space-before="4mm" font-size="18pt" font-family="Lato Medium"  text-align="right">
     <xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
  </fo:block>
</xsl:template>

<xsl:template match="d:productnumber" mode="book.titlepage.recto.auto.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.recto.style" 
            space-before="24mm" font-size="12pt" font-family="Lato Medium" text-align="right">
     <xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
  </fo:block>
</xsl:template>

<xsl:template match="d:productname" mode="book.titlepage.recto.auto.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.recto.style"
            space-before="2mm" font-size="12pt" font-family="Lato Medium" text-align="right">
     <xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
  </fo:block>
</xsl:template>

<xsl:template match="d:orgname" mode="book.titlepage.recto.auto.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.recto.style">
     <xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
  </fo:block>
</xsl:template>

<xsl:template match="d:email" mode="book.titlepage.recto.auto.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.recto.style">
     e-mail: <xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
  </fo:block>
</xsl:template>

<xsl:template match="d:email" mode="book.titlepage.recto.mode">
  <fo:inline keep-together.within-line="always" hyphenate="false">
    <xsl:choose>
      <xsl:when test="not($email.mailto.enabled = 0)">
        <fo:basic-link xsl:use-attribute-sets="xref.properties"
                       keep-together.within-line="always" hyphenate="false">
          <xsl:attribute name="external-destination">
            mailto:<xsl:value-of select="string(.)" />
          </xsl:attribute>
          <xsl:apply-templates/>
        </fo:basic-link>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </fo:inline>
</xsl:template>

<!--<xsl:template match="d:date" mode="book.titlepage.recto.auto.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.recto.style" text-align="center">
     <xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
  </fo:block>
</xsl:template>

<xsl:template match="d:bookinfo/d:date|d:book/d:info/d:date"
              mode="titlepage.mode" priority="2">
  <fo:block>
    <xsl:apply-templates mode="titlepage.mode"/>
  </fo:block>
</xsl:template>-->
<xsl:template match="d:legalnotice" mode="book.titlepage.recto.auto.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.recto.style" text-align="right">
     <xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
  </fo:block>
</xsl:template>

<!-- Оборотная сторона -->
<xsl:template name="book.titlepage.verso">
<!-- Заголовок -->
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:title"/>
<!-- Описание -->
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:abstract"/>
<!-- Авторские права -->
  <fo:block absolute-position="absolute"  space-before="1em">
    <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:copyright"/>
  </fo:block>
<!--  -->
<!--   <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:legalnotice"/> -->
<!-- Информация о версии -->
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:releaseinfo"/>
<!-- Дата публикации -->
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:pubdate"/>
<!-- Название организации -->
  <fo:block-container absolute-position="absolute" top="23cm">
    <fo:block xsl:use-attribute-sets="book.titlepage.verso.style" 
              font-size="10pt" text-align="center">

      <xsl:choose>
        <xsl:when test="d:info/d:author/d:orgname">
          <xsl:apply-templates mode="book.titlepage.verso.auto.mode"
                               select="d:info/d:author/d:orgname"/>
        </xsl:when>
        <xsl:when test="d:info/d:org/d:orgname">
          <xsl:apply-templates mode="book.titlepage.verso.auto.mode"
                               select="d:info/d:org/d:orgname"/>
        </xsl:when>
      </xsl:choose>

<!-- Адрес -->
      <xsl:choose>
        <xsl:when test="d:info/d:org/d:address">
          <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:org/d:address"/>
        </xsl:when>
        <xsl:when test="d:info/d:author/d:address">
          <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:author/d:address"/>
        </xsl:when>
      </xsl:choose>
    </fo:block>
  </fo:block-container>
</xsl:template>

<xsl:template match="d:title" mode="book.titlepage.verso.auto.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.verso.style" 
            font-family="{$title.fontset}" font-size="14.4pt">
     <xsl:call-template name="book.verso.title"/>
  </fo:block>
</xsl:template>

<xsl:template match="d:releaseinfo" mode="book.titlepage.verso.auto.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.verso.style" space-before="1em">
    <xsl:apply-templates select="." mode="book.titlepage.verso.mode"/>
  </fo:block>
</xsl:template>
<!--Со словами "Авторские права"
<xsl:template match="d:copyright" mode="book.titlepage.verso.auto.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.verso.style" space-before="1em">
     <xsl:apply-templates select="." mode="book.titlepage.verso.mode"/>
  </fo:block>
</xsl:template>-->
<!--
<xsl:template match="d:legalnotice" mode="book.titlepage.verso.auto.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.verso.style" space-before="1em">
    <xsl:apply-templates select="." mode="book.titlepage.verso.mode"/>
  </fo:block>
</xsl:template>-->

<xsl:template match="d:address" mode="book.titlepage.verso.auto.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.verso.style" 
            font-size="10pt">
     <xsl:call-template name="book.verso.address"/>
  </fo:block>
</xsl:template>

<xsl:template name="book.verso.address" mode="titlepage.mode">
  <xsl:if test="child::d:postcode">
    <xsl:apply-templates select="child::d:postcode[1]"
                         mode="titlepage.mode"/>
    <xsl:text>, </xsl:text>
  </xsl:if>

  <xsl:if test="child::d:city">
    <xsl:apply-templates select="child::d:city[1]"
                         mode="titlepage.mode"/>
<!--     <xsl:text>, </xsl:text>  -->
  </xsl:if>

  <xsl:if test="child::d:street">
    <xsl:apply-templates select="child::d:street[1]"
                         mode="titlepage.mode"/>
    <!-- <xsl:text>.</xsl:text> -->
  </xsl:if>
</xsl:template>

</xsl:stylesheet>
