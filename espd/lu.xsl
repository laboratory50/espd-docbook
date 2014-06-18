<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2014.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Лист утверждения. -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:date="http://exslt.org/dates-and-times"
    xmlns:d="http://docbook.org/ns/docbook"
    version="1.1">

<xsl:import href="design.xsl"/>

<xsl:attribute-set name="book.titlepage.recto.style"
                   use-attribute-sets="espd.titlepage.style"/>

<xsl:template name="book.titlepage.recto">

  <!-- УТВЕРЖДАЮ -->
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:authorgroup/d:editor"/>

  <xsl:call-template name="espd-stamp"/>

  <xsl:choose>
    <xsl:when test="d:bookinfo/d:title">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:title"/>
    </xsl:when>
    <xsl:when test="d:info/d:title">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:title"/>
    </xsl:when>
    <xsl:when test="d:title">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:title"/>
    </xsl:when>
  </xsl:choose>
              
  <xsl:choose>
    <xsl:when test="d:bookinfo/d:subtitle">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:subtitle"/>
    </xsl:when>
    <xsl:when test="d:info/d:subtitle">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:subtitle"/>
    </xsl:when>
    <xsl:when test="d:subtitle">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:subtitle"/>
    </xsl:when>
  </xsl:choose>

  <fo:block xsl:use-attribute-sets="book.titlepage.recto.style"
            space-before="1cm">
    ЛИСТ УТВЕРЖДЕНИЯ
  </fo:block>

  <!-- Децимальный -->
  <fo:block xsl:use-attribute-sets="book.titlepage.recto.style"
            space-before="1cm">
    <xsl:value-of select="$espd.decimal"/><xsl:text>-ЛУ</xsl:text>
  </fo:block>

  <fo:block-container keep-together="always" space-before="1cm">
    <fo:block-container absolute-position="absolute"
                      keep-together="always"
                      right="0cm"
                      width="30%"
                      xsl:use-attribute-sets="book.titlepage.recto.style">

      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:authorgroup/d:othercredit"/>
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:authorgroup/d:author"/>
    </fo:block-container>
  </fo:block-container>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:edition"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:pubdate"/>
</xsl:template>

<xsl:template name="espd.title.approvement">
  <xsl:param name="caption"/>
  <xsl:param name="appointment"/>
  <xsl:param name="initials"/>

  <fo:block>
    <xsl:if test="$caption != ''">
      <fo:block text-align="center"><xsl:value-of select="$caption"/></fo:block>
    </xsl:if>
    <fo:block text-align="center"><xsl:value-of select="$appointment"/></fo:block>
    <fo:block text-align="right"><xsl:value-of select="$initials"/></fo:block>
    <fo:block text-align="center">
      <fo:inline>
        <xsl:text>«__»___________</xsl:text>
          <xsl:call-template name="datetime.format">
            <xsl:with-param name="date" select="date:date-time()"/>
            <xsl:with-param name="format" select="'Y'"/>
          </xsl:call-template>
      </fo:inline>
    </fo:block>
  </fo:block>
</xsl:template>

<xsl:template name="espd.title.approvement.entity">
  <xsl:param name="caption"/>

  <fo:block space-before="10mm" space-after="5mm">
    <xsl:call-template name="espd.title.approvement">
      <xsl:with-param name="caption" select="$caption"/>      
      <xsl:with-param name="appointment" select="d:personblurb[1]"/>
      <xsl:with-param name="initials">
        <xsl:call-template name="person.name" mode="initials"/>
      </xsl:with-param>
    </xsl:call-template>
  </fo:block>
</xsl:template>

<xsl:template name="espd.title.approvement.approve">
  <fo:block-container absolute-position="absolute"
                      top="0cm"
                      right="0cm"
                      width="30%"
                      xsl:use-attribute-sets="book.titlepage.recto.style">

    <xsl:call-template name="espd.title.approvement">
      <xsl:with-param name="caption" select="'УТВЕРЖДАЮ'"/>
      <xsl:with-param name="appointment" select="d:personblurb[1]"/>
      <xsl:with-param name="initials">
        <xsl:call-template name="person.name" mode="initials"/>
      </xsl:with-param>
    </xsl:call-template>
  </fo:block-container>
</xsl:template>

<xsl:template match="d:title" mode="book.titlepage.recto.auto.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.recto.style" 
            space-before="8cm">
    <xsl:call-template name="ucase">
      <xsl:with-param name="string">
        <xsl:call-template name="division.title">
          <xsl:with-param name="node" select="ancestor-or-self::d:book[1]"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
  </fo:block>
</xsl:template>

<xsl:template match="d:subtitle" mode="book.titlepage.recto.auto.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.recto.style" 
            space-before="5mm" >
     <xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
  </fo:block>
</xsl:template>

<xsl:template match="d:author|d:othercredit" mode="book.titlepage.recto.auto.mode">
  <xsl:call-template name="espd.title.approvement.entity"/>
</xsl:template>

<xsl:template match="d:editor" mode="book.titlepage.recto.auto.mode">
  <xsl:call-template name="espd.title.approvement.approve"/>
</xsl:template>

<xsl:template match="d:pubdate" mode="book.titlepage.recto.auto.mode">
  <fo:block-container absolute-position="fixed"
                      top="27cm"
                      left="2cm"
                      right="2cm">
  <fo:block xsl:use-attribute-sets="book.titlepage.recto.style" 
            space-before="5mm" >
     <xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
  </fo:block>
  </fo:block-container>
</xsl:template>

</xsl:stylesheet>

