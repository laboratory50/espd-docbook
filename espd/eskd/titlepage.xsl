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
    version="1.1">

<xsl:import href="../espd/design.xsl"/>

<xsl:attribute-set name="book.titlepage.verso.style"
                   use-attribute-sets="espd.titlepage.style"/>

<xsl:template name="book.titlepage.verso">
    <!-- Рамка -->
    <fo:block-container absolute-position="fixed"
                        top="5mm"
                        left="20mm">
            <fo:block font-size="10pt" font-family="{$sans.font.family}">
                <fo:table width="185mm" height="286.6mm" border-style="solid" border-width="0.3mm">
                    <fo:table-column column-width="185mm" border-style="solid" border-width="0.3mm"/>
                    <fo:table-body>
                        <fo:table-row border-style="solid" text-align="center" height="286.6mm">
                            <fo:table-cell><fo:block/></fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>
            </fo:block>
        </fo:block-container>

    <!-- УТВЕРЖДЕНО -->
    <fo:block-container absolute-position="fixed"
                        top="30mm"
                        left="25mm"
                        right="20mm">

        <fo:block xsl:use-attribute-sets="book.titlepage.verso.style"
                text-align="left"
                >
        <fo:block margin-bottom="8pt">УТВЕРЖДЕНО</fo:block>
        <fo:block><xsl:value-of select="$espd.decimal"/>-ЛУ</fo:block>
        </fo:block>
    </fo:block-container>

    <xsl:call-template name="espd-stamp"/>

  <xsl:choose>
    <xsl:when test="d:bookinfo/d:title">
      <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:bookinfo/d:title"/>
    </xsl:when>
    <xsl:when test="d:info/d:title">
      <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:title"/>
    </xsl:when>
    <xsl:when test="d:title">
      <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:title"/>
    </xsl:when>
  </xsl:choose>

  <xsl:choose>
    <xsl:when test="d:bookinfo/d:subtitle">
      <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:bookinfo/d:subtitle"/>
    </xsl:when>
    <xsl:when test="d:info/d:subtitle">
      <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:subtitle"/>
    </xsl:when>
    <xsl:when test="d:subtitle">
      <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:subtitle"/>
    </xsl:when>
  </xsl:choose>

  <!-- Децимальный -->
  <fo:block xsl:use-attribute-sets="book.titlepage.verso.style"
            space-before="1cm">
    <xsl:value-of select="$espd.decimal"/>
  </fo:block>

  <!-- Количество листов -->
  <fo:block xsl:use-attribute-sets="book.titlepage.verso.style"
            space-before="1cm">
    Листов  <fo:page-number-citation ref-id="END-OF-DOCUMENT"/>
  </fo:block>

  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:author"/>
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:edition"/>
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:pubdate"/>
</xsl:template>

<xsl:template match="d:title" mode="book.titlepage.verso.auto.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.verso.style" 
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

<xsl:template match="d:subtitle" mode="book.titlepage.verso.auto.mode">
  <fo:block xsl:use-attribute-sets="book.titlepage.verso.style" 
            space-before="5mm" >
     <xsl:apply-templates select="." mode="book.titlepage.verso.mode"/>
  </fo:block>
</xsl:template>

<xsl:template match="d:pubdate" mode="book.titlepage.verso.auto.mode">
  <fo:block-container absolute-position="fixed"
                      top="27cm"
                      left="2cm"
                      right="2cm">
  <fo:block xsl:use-attribute-sets="book.titlepage.verso.style" 
            space-before="5mm" >
     <xsl:apply-templates select="." mode="book.titlepage.verso.mode"/>
  </fo:block>
  </fo:block-container>
</xsl:template>

<xsl:template match="d:bookinfo/d:pubdate|d:book/d:info/d:pubdate"
              mode="titlepage.mode" priority="2">
  <fo:block>
    <xsl:apply-templates mode="titlepage.mode"/>
  </fo:block>
</xsl:template>

</xsl:stylesheet>


