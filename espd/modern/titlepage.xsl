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
    <xsl:value-of select="$title.font.family"/>
  </xsl:attribute>
  <xsl:attribute name="font-weight">normal</xsl:attribute>
  <xsl:attribute name="font-size">14pt</xsl:attribute>
  <xsl:attribute name="text-align">right</xsl:attribute>
  <xsl:attribute name="space-before">2mm</xsl:attribute>
  <xsl:attribute name="space-after">2mm</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="book.titlepage.verso.style">
  <xsl:attribute name="font-family">
    <xsl:value-of select="$title.font.family"/>
  </xsl:attribute>
  <xsl:attribute name="font-weight">normal</xsl:attribute>
  <xsl:attribute name="font-size">12pt</xsl:attribute>
</xsl:attribute-set>

<!-- Оформление титульных страниц -->
<xsl:attribute-set name="espd.titlepage.style">
  <xsl:attribute name="font-family">
    <xsl:value-of select="$title.font.family"/>
  </xsl:attribute>
  <xsl:attribute name="font-weight">normal</xsl:attribute>
  <xsl:attribute name="font-size">14pt</xsl:attribute>
  <xsl:attribute name="text-align">center</xsl:attribute>
</xsl:attribute-set>


<!-- Лицевая сторона -->
<xsl:template name="book.titlepage.recto">
    <fo:block-container absolute-position="absolute" top="55mm">
        <!-- Название документа -->
        <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:title"/>

        <!-- Тип документа -->
        <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:subtitle"/>

        <!-- Линия -->
        <fo:block xsl:use-attribute-sets="book.titlepage.recto.style"
                font-size="16pt" border-bottom-style="solid" border-bottom-color="gray">
        </fo:block>

        <!-- Версия -->
        <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:productnumber"/>

        <!-- Для какой ОС -->
        <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:productname"/>

    </fo:block-container>

    <fo:block-container absolute-position="absolute" top="180mm">
        <!-- Название организации -->
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

        <!-- Почтовый адрес -->
        <xsl:choose>
            <xsl:when test="d:info/d:author/d:email">
                <xsl:apply-templates mode="book.titlepage.recto.auto.mode"
                                     select="d:info/d:author/d:email"/>
            </xsl:when>
            <xsl:when test="d:info/d:org/d:email">
                <xsl:apply-templates mode="book.titlepage.recto.auto.mode"
                                     select="d:info/d:org/d:email"/>
            </xsl:when>
        </xsl:choose>

        <!-- Версия -->
        <xsl:if test="$draft.mode = 'yes'">
            <fo:block xsl:use-attribute-sets="book.titlepage.recto.style" font-style="italic">
                <xsl:text>Предварительная версия</xsl:text>
            </fo:block>
        </xsl:if>
    </fo:block-container>

     <fo:block-container absolute-position="absolute" top="230mm">
        <!-- Год -->
        <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:date"/>

        <!-- Лого -->
        <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:mediaobject"/>
    </fo:block-container>

</xsl:template>

<!-- Шаблоны для названия документа -->
<xsl:template match="d:title" mode="book.titlepage.recto.auto.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.recto.style"
            font-size="22pt">
     <xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
  </fo:block>
</xsl:template>

<!-- Шаблон для типа документа -->
<xsl:template match="d:subtitle" mode="book.titlepage.recto.auto.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.recto.style" 
            font-size="18pt">
     <xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
  </fo:block>
</xsl:template>

<!-- Шаблон для версии документа -->
<xsl:template match="d:productnumber" mode="book.titlepage.recto.auto.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.recto.style">
     <xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
  </fo:block>
</xsl:template>

<!-- Шаблон для типа ОС -->
<xsl:template match="d:productname" mode="book.titlepage.recto.auto.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.recto.style">
     <xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
  </fo:block>
</xsl:template>

<!-- Шаблон для названия организации -->
<xsl:template match="d:orgname" mode="book.titlepage.recto.auto.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.recto.style">
     <xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
  </fo:block>
</xsl:template>

<!-- Шаблон для электронного адреса -->
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

<!-- Шаблон для даты -->
<xsl:template match="d:date" mode="book.titlepage.recto.auto.mode">
  <fo:block xsl:use-attribute-sets="espd.titlepage.style">
     <xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
  </fo:block>
</xsl:template>

<!-- Шаблон для логотипа -->
<xsl:template match="d:mediaobject" mode="book.titlepage.recto.auto.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.recto.style">
     <xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
  </fo:block>
</xsl:template>

<!-- __________________________ -->
<!-- Оборотная сторона -->
<xsl:template name="book.titlepage.verso">
  <!-- Название документа -->
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:title"/>

  <!-- Описание -->
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:abstract"/>

  <!-- Авторские права -->
  <fo:block absolute-position="absolute"  space-before="1em">
    <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:copyright"/>
  </fo:block>
<!--  -->
<!--   <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:legalnotice"/> -->

  <!-- Дата публикации -->
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:pubdate"/>

  <!-- Название организации и адрес -->
  <fo:block-container absolute-position="absolute" top="23cm">
    <fo:block xsl:use-attribute-sets="book.titlepage.verso.style" 
              font-size="10pt" text-align="center">
      <!-- Название -->
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

<!-- Шаблон для названия документа -->
<xsl:template match="d:title" mode="book.titlepage.verso.auto.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.verso.style" 
            font-size="14.4pt">
     <xsl:call-template name="book.verso.title"/>
  </fo:block>
</xsl:template>

<!-- Шаблон для авторских прав -->
<!--Со словами «Авторские права»-->
<xsl:template match="d:copyright" mode="book.titlepage.verso.auto.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.verso.style" space-before="1em">
     <xsl:apply-templates select="." mode="book.titlepage.verso.mode"/>
  </fo:block>
</xsl:template>

<!---->
<xsl:template match="d:legalnotice" mode="book.titlepage.verso.auto.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.verso.style" space-before="1em">
    <xsl:apply-templates select="." mode="book.titlepage.verso.mode"/>
  </fo:block>
</xsl:template>

<!-- Шаблон для даты публикации -->
<xsl:template match="d:bookinfo/d:pubdate|d:book/d:info/d:pubdate"
              mode="book.titlepage.verso.auto.mode" priority="2">
  <fo:block xsl:use-attribute-sets="book.titlepage.verso.style" >
    <xsl:call-template name="gentext">
      <xsl:with-param name="key" select="'pubdate'"/>
    </xsl:call-template>
    <xsl:text>: </xsl:text>
    <xsl:apply-templates mode="titlepage.mode"/>
  </fo:block>
</xsl:template>

<!-- Шаблон для почтового адреса -->
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

<!-- Авторские права в российском стиле (значок организация, дата) -->
<xsl:template match="d:copyright" mode="book.titlepage.verso.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.verso.style">
  <xsl:call-template name="dingbat">
    <xsl:with-param name="dingbat">copyright</xsl:with-param>
  </xsl:call-template>
  <xsl:call-template name="gentext.space"/>
  <xsl:apply-templates select="d:holder" mode="titlepage.mode"/>
  <xsl:text>,</xsl:text>
  <xsl:call-template name="gentext.space"/>
  <xsl:call-template name="copyright.years">
    <xsl:with-param name="years" select="d:year"/>
    <xsl:with-param name="print.ranges" select="$make.year.ranges"/>
    <xsl:with-param name="single.year.ranges"
                    select="$make.single.year.ranges"/>
  </xsl:call-template>
  </fo:block>
</xsl:template>

</xsl:stylesheet>
