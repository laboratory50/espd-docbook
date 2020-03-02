<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2015-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
    version="1.1">

<!-- Оформление титульных страниц -->
<xsl:attribute-set name="espd.titlepage.style">
  <xsl:attribute name="font-family">
    <xsl:value-of select="$body.font.family"/>
  </xsl:attribute>
  <xsl:attribute name="font-weight">normal</xsl:attribute>
  <xsl:attribute name="font-size">14pt</xsl:attribute>
  <xsl:attribute name="text-align">center</xsl:attribute>
  <xsl:attribute name="hyphenate">false</xsl:attribute>
</xsl:attribute-set>

<!-- Штамп вертикальный -->
<xsl:template name="espd.stamp">
  <fo:block-container reference-orientation="90"
                      absolute-position="fixed"
                      bottom="5mm"
                      left="8mm">
      <fo:block font-size="10pt" font-family="{$sans.font.family}">
        <fo:table table-layout="fixed" width="145mm" height="12mm" border-style="solid" border-width="0.3mm">
            <fo:table-column column-width="25mm" border-style="solid" border-width="0.3mm"/>
            <fo:table-column column-width="35mm" border-style="solid" border-width="0.3mm"/>
            <fo:table-column column-width="25mm" border-style="solid" border-width="0.3mm"/>
            <fo:table-column column-width="25mm" border-style="solid" border-width="0.3mm"/>
            <fo:table-column column-width="35mm" border-style="solid" border-width="0.3mm"/>
            <fo:table-body>
                <fo:table-row border-style="solid" border-width="0.3mm" height="5mm" text-align="center">
                    <fo:table-cell>
                        <fo:block>Инв. № подл.</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>Подпись и дата</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>Взам. инв. №</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>Инв. № дубл.</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>Подпись и дата</fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row height="6.4mm">
                    <fo:table-cell><fo:block/></fo:table-cell>
                    <fo:table-cell><fo:block/></fo:table-cell>
                    <fo:table-cell><fo:block/></fo:table-cell>
                    <fo:table-cell><fo:block/></fo:table-cell>
                    <fo:table-cell><fo:block/></fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </fo:block>
  </fo:block-container>
</xsl:template>

<!-- Инициалы в формате «И. О. Фамилия»-->
<xsl:template name="person.name" mode="initials">
  <xsl:param name="node" select="."/>

  <xsl:choose>
    <xsl:when test="$node/d:personname">
      <xsl:call-template name="person.name" mode="initials">
        <xsl:with-param name="node" select="$node/d:personname"/>
      </xsl:call-template>
    </xsl:when>

    <xsl:otherwise>
      <xsl:if test="$node//d:firstname">
        <xsl:apply-templates select="$node//d:firstname[1]" mode="initials"/>
        <xsl:text> </xsl:text>
      </xsl:if>

      <xsl:if test="$node//d:othername">
        <xsl:apply-templates select="$node//d:othername[1]" mode="initials"/>
        <xsl:text> </xsl:text>
      </xsl:if>

      <xsl:apply-templates select="$node//d:surname[1]" mode="initials"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="d:firstname|d:othername" mode="initials">
  <xsl:value-of select="substring(string(.), 1, 1)"/>
  <xsl:text>.</xsl:text>
</xsl:template>

<!-- Шаблон для титульных листов ЕСПД и ЕСКД -->
<xsl:template name="espd.title.page">
  <!-- УТВЕРЖДЕНО -->
  <fo:block-container absolute-position="fixed"
                      top="30mm"
                      left="25mm"
                      right="120mm"
                      xsl:use-attribute-sets="espd.titlepage.style"
                      text-align="center">
    <fo:block margin-bottom="8pt">УТВЕРЖДЕНО</fo:block>
    <fo:block><xsl:value-of select="$espd.decimal"/>-ЛУ</fo:block>
  </fo:block-container>

  <!-- Название документа -->
      <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:title"/>

  <!-- Тип документа -->
      <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:subtitle"/>

  <!-- Децимальный -->
  <fo:block xsl:use-attribute-sets="espd.titlepage.style"
            space-before="1cm">
    <xsl:value-of select="$espd.decimal"/>
  </fo:block>

  <!-- Количество листов -->
  <fo:block xsl:use-attribute-sets="espd.titlepage.style"
            space-before="1cm">
    Листов  <fo:page-number-citation ref-id="END-OF-DOCUMENT"/>
  </fo:block>

  <!-- Автор, версия, дата публикации -->
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:author"/>
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:date"/>
  <xsl:apply-templates mode="book.titlepage.verso.auto.mode" select="d:info/d:releaseinfo"/>
</xsl:template>

<!-- Шаблон для названия документа -->
<xsl:template match="d:title" mode="book.titlepage.verso.auto.mode">
  <fo:block xsl:use-attribute-sets="espd.titlepage.style"
            space-before="10cm">
    <xsl:call-template name="ucase">
      <xsl:with-param name="string">
        <xsl:call-template name="division.title">
          <xsl:with-param name="node" select="ancestor-or-self::d:book[1]"/>
        </xsl:call-template>
      </xsl:with-param>
    </xsl:call-template>
  </fo:block>
</xsl:template>

<!-- Шаблон для типа документа -->
<xsl:template match="d:subtitle" mode="book.titlepage.verso.auto.mode">
  <fo:block xsl:use-attribute-sets="espd.titlepage.style"
            space-before="5mm" >
     <xsl:apply-templates select="." mode="book.titlepage.verso.mode"/>
  </fo:block>
</xsl:template>

<!-- Шаблон для даты -->
<xsl:template match="d:date" mode="book.titlepage.verso.auto.mode">
  <fo:block-container absolute-position="fixed"
                      top="27cm"
                      left="2cm"
                      right="1cm">
  <fo:block xsl:use-attribute-sets="espd.titlepage.style"
            space-before="5mm" >
     <xsl:apply-templates select="." mode="book.titlepage.verso.mode"/>
  </fo:block>
  </fo:block-container>
</xsl:template>

<!-- Шаблон Литеры -->
<xsl:template match="d:releaseinfo" mode="book.titlepage.verso.auto.mode">
  <fo:block-container absolute-position="fixed"
                      top="28cm"
                      left="17cm"
                      right="2cm">
  <fo:block xsl:use-attribute-sets="espd.titlepage.style" 
            space-before="5mm" >
     <xsl:apply-templates select="." mode="book.titlepage.verso.mode"/>
  </fo:block>
  </fo:block-container>
</xsl:template>

</xsl:stylesheet>
