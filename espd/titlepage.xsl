<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2014.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Титульный лист. -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
    version="1.1">

<xsl:attribute-set name="book.titlepage.recto.style">
  <xsl:attribute name="font-family">
    <xsl:value-of select="$body.font.family"/>
  </xsl:attribute>
  <xsl:attribute name="font-weight">normal</xsl:attribute>
  <xsl:attribute name="font-size">14pt</xsl:attribute>
  <xsl:attribute name="text-align">center</xsl:attribute>
  <xsl:attribute name="hyphenate">false</xsl:attribute>
</xsl:attribute-set>

<xsl:template name="book.titlepage.recto">

  <!-- УТВЕРЖДЕНО -->
  <fo:block-container absolute-position="fixed"
                      top="3cm"
                      left="2cm"
                      right="2cm">

    <fo:block xsl:use-attribute-sets="book.titlepage.recto.style"
              text-align="left"
              >
      <fo:block margin-bottom="8pt">УТВЕРЖДЕНО</fo:block>
      <fo:block><xsl:value-of select="$espd.decimal"/>-ЛУ</fo:block>
    </fo:block>
  </fo:block-container>

  <!-- Печать -->
  <fo:block-container reference-orientation="90"
                      absolute-position="fixed"
                      bottom="13"
                      left="8mm">
    <fo:block font-size="11pt">
        <fo:table table-layout="fixed" width="145mm" height="12mm" border-style="solid" border-width="1mm">
            <fo:table-column column-width="25mm" border-style="solid" border-width="0.5mm"/>
            <fo:table-column column-width="35mm" border-style="solid" border-width="0.5mm"/>
            <fo:table-column column-width="25mm" border-style="solid" border-width="0.5mm"/>
            <fo:table-column column-width="25mm" border-style="solid" border-width="0.5mm"/>
            <fo:table-column column-width="35mm" border-style="solid" border-width="0.5mm"/>
            <fo:table-body>
                <fo:table-row border-style="solid" border-width="1mm">
                    <fo:table-cell>
                        <fo:block margin-left="0.6mm" margin-top="0.3mm">Инв. № подп.</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block margin-left="0.6mm" margin-top="0.3mm">Подпись и дата</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block margin-left="0.6mm" margin-top="0.3mm">Взам. инв. №</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block margin-left="0.6mm" margin-top="0.3mm">Инв. № дубл.</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block margin="0.5mm">Подпись и дата</fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell><fo:block padding="3mm"/></fo:table-cell>
                    <fo:table-cell><fo:block/></fo:table-cell>
                    <fo:table-cell><fo:block/></fo:table-cell>
                    <fo:table-cell><fo:block/></fo:table-cell>
                    <fo:table-cell><fo:block/></fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </fo:block>
  </fo:block-container>

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

  <!-- Децимальный -->
  <fo:block xsl:use-attribute-sets="book.titlepage.recto.style"
            space-before="1cm">
    <xsl:value-of select="$espd.decimal"/>
  </fo:block>

  <!-- Количество листов -->
  <fo:block xsl:use-attribute-sets="book.titlepage.recto.style"
            space-before="1cm">
    Листов <fo:page-number-citation ref-id="END-OF-DOCUMENT"/>  
  </fo:block>

  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:author"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:edition"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:pubdate"/>
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

<xsl:template match="d:bookinfo/d:pubdate|d:book/d:info/d:pubdate"
              mode="titlepage.mode" priority="2">
  <fo:block>
    <xsl:apply-templates mode="titlepage.mode"/>
  </fo:block>
</xsl:template>

</xsl:stylesheet>


