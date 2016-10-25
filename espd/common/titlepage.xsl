<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2015-2016.
  Распространяется на условиях лицензии CC BY-SA 4.0.

  http://lab50.net/
-->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
    version="1.1">

<!-- Авторские права в российском стиле (значок организация, дата) -->
<xsl:template match="d:copyright" mode="book.titlepage.verso.auto.mode">
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

<!-- Дата публикации -->
<xsl:template match="d:bookinfo/d:pubdate|d:book/d:info/d:pubdate"
              mode="titlepage.mode" priority="2">
  <fo:block>
    <xsl:call-template name="gentext">
      <xsl:with-param name="key" select="'pubdate'"/>
    </xsl:call-template>
    <xsl:text>: </xsl:text>
    <xsl:apply-templates mode="titlepage.mode"/>
  </fo:block>
</xsl:template>

</xsl:stylesheet>