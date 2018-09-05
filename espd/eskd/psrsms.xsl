<?xml version="1.0" encoding="UTF-8"?>
<!--
     Стиль для форматирования документации в формате DocBook 5.
-->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
    exclude-result-prefixes="d"
    version="1.1">


<!-- Таблица дожна иметь номер -->
<!-- без номера раздела (сквозная нумерация)-->
<xsl:template match="d:table|d:figure" mode="label.markup">
  <xsl:variable name="pchap"
                select="(ancestor::d:appendix[ancestor::d:book])[last()]"/>

  <xsl:variable name="prefix">
    <xsl:if test="count($pchap) &gt; 0">
      <xsl:apply-templates select="$pchap" mode="label.markup"/>
    </xsl:if>
  </xsl:variable>
  <xsl:choose>
    <xsl:when test="@label">
      <xsl:value-of select="@label"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="$prefix != ''">
            <xsl:text>П</xsl:text>
            <xsl:apply-templates select="$pchap" mode="label.markup"/>
            <xsl:apply-templates select="$pchap" mode="intralabel.punctuation">
              <xsl:with-param name="object" select="."/>
            </xsl:apply-templates>
          <xsl:number format="1" from="d:appendix" level="any"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:number format="1" from="d:book|d:article" level="any"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:attribute-set name="formal.title.properties" use-attribute-sets="normal.para.spacing">
  <xsl:attribute name="text-align">
    <xsl:choose>
      <xsl:when test="self::d:table">left</xsl:when>
      <xsl:otherwise>center</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
</xsl:attribute-set>
 <xsl:template name="table.cell.block.properties">
  <xsl:if test="ancestor::thead">
    <xsl:attribute name="font-weight">normal</xsl:attribute>
  </xsl:if>
</xsl:template>

<!-- отступ между названием таблицы и самой таблицей -->
<xsl:attribute-set name="table.table.properties">
    <xsl:attribute name="margin-top">-6mm</xsl:attribute>
</xsl:attribute-set>

<!-- продолжение в таблице -->
<xsl:template name="table.layout">
  <xsl:param name="table.content"/>

  <xsl:choose>
    <xsl:when test="self::d:informaltable">
      <xsl:copy-of select="$table.content"/>
    </xsl:when>
    <xsl:otherwise>
      <fo:table>
        <fo:table-header>
          <fo:table-row>
            <fo:table-cell>
                    <fo:block xsl:use-attribute-sets="table.caption.properties">
                      <fo:retrieve-table-marker
                            retrieve-class-name="table-title"
                            retrieve-position-within-table="first-starting"
                            retrieve-boundary-within-table="table-fragment"/>&#x00A0;
                    </fo:block>
            </fo:table-cell>
          </fo:table-row>
        </fo:table-header>
        <fo:table-body>
            <fo:table-row>
                <fo:table-cell>
                    <fo:block xsl:use-attribute-sets="table.caption.properties">
                      <fo:marker marker-class-name="table-title"></fo:marker>
                    </fo:block>
                    <fo:block>
                      <fo:marker marker-class-name="table-title">
                        <fo:inline font-style="italic">
                          <xsl:text>П р о д о л ж е н и е&#160;&#160;&#160;т а б л и ц ы&#160;&#160;&#160;</xsl:text>
                              <xsl:call-template name="substitute-markup">
                                <xsl:with-param name="allow-anchors" select="0"/>
                                <xsl:with-param name="template" select="'%n'"/>
                              </xsl:call-template>
                        </fo:inline>
                      </fo:marker>
                      <xsl:copy-of select="$table.content"/>
                    </fo:block>
                    <fo:block keep-with-previous.within-column="always">
                        <fo:marker marker-class-name="table-title">
                            <fo:inline font-style="italic">
                                <xsl:text>О к о н ч а н и е&#160;&#160;&#160;т а б л и ц ы&#160;&#160;&#160;</xsl:text>
                              <xsl:call-template name="substitute-markup">
                                <xsl:with-param name="allow-anchors" select="0"/>
                                <xsl:with-param name="template" select="'%n'"/>
                              </xsl:call-template>
                            </fo:inline>
                        </fo:marker>
                    </fo:block>
                </fo:table-cell>
            </fo:table-row>
        </fo:table-body>
      </fo:table>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- чтобы таблицу не отрывало от заголовка -->
<xsl:attribute-set name="table.caption.properties">
  <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
</xsl:attribute-set>

<!-- Рисунок по центру -->
<!--    есть -->
<!-- screen по центру -->
<xsl:attribute-set name="monospace.verbatim.properties">
  <xsl:attribute name="text-align">
    <xsl:choose>
      <xsl:when test="self::d:screen">center</xsl:when>
      <xsl:otherwise>left</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
</xsl:attribute-set>

<!-- сначала название рисунка, потом номер -->
<xsl:template match="d:figure" mode="object.title.markup">
  <xsl:param name="allow-anchors" select="0"/>
    <fo:block>
      <xsl:call-template name="substitute-markup">
        <xsl:with-param name="allow-anchors" select="$allow-anchors"/>
        <xsl:with-param name="template" select="'%t'"/>
      </xsl:call-template>
    </fo:block>
    <fo:block>
      <xsl:call-template name="substitute-markup">
        <xsl:with-param name="allow-anchors" select="$allow-anchors"/>
        <xsl:with-param name="template" select="'Рисунок %n'"/>
      </xsl:call-template>
    </fo:block>
</xsl:template>

<!-- Заголовок таблицы отделен двойной линией -->
<xsl:template name="table.row.properties">
  <xsl:choose>
    <xsl:when test="ancestor::d:thead and not (following-sibling::d:row) and not (ancestor::d:thead[@role='notdouble'])">
      <xsl:attribute name="border-after-style">double</xsl:attribute>
      <xsl:attribute name="border-after-width">0.5mm</xsl:attribute>
    </xsl:when>
    <xsl:when test="@role='double'">
      <xsl:attribute name="border-after-style">double</xsl:attribute>
      <xsl:attribute name="border-after-width">0.5mm</xsl:attribute>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<!-- высота строк таблицы -->
<xsl:template name="normal-row">
  <xsl:param name="spans"/>
  <xsl:param name="browserows"/>

  <xsl:variable name="row-height">
    <xsl:if test="processing-instruction('dbfo')">
      <xsl:call-template name="pi.dbfo_row-height"/>
    </xsl:if>
  </xsl:variable>  

  <fo:table-row>
      <xsl:if test="$row-height != ''">
      <xsl:attribute name="height">
        <xsl:value-of select="$row-height"/>
      </xsl:attribute>
    </xsl:if>

    <xsl:call-template name="table.row.properties"/>
    <xsl:call-template name="anchor"/>

    <xsl:apply-templates select="(d:entry|d:entrytbl)[1]">
      <xsl:with-param name="spans" select="$spans"/>
    </xsl:apply-templates>
  </fo:table-row>

  <xsl:if test="$browserows = 'recurse'">
    <xsl:if test="following-sibling::d:row">
      <xsl:variable name="nextspans">
        <xsl:apply-templates select="(d:entry|d:entrytbl)[1]" mode="span">
          <xsl:with-param name="spans" select="$spans"/>
        </xsl:apply-templates>
      </xsl:variable>
  
      <xsl:apply-templates select="following-sibling::d:row[1]">
        <xsl:with-param name="spans" select="$nextspans"/>
        <xsl:with-param name="browserows" select="$browserows"/>
      </xsl:apply-templates>
    </xsl:if>
  </xsl:if>
</xsl:template>

<!-- Нумерация приложений вместо буквизации -->
<xsl:param name="appendix.autolabel">1</xsl:param>
<xsl:param name="appendix.label.includes.component.label">1</xsl:param>

<xsl:param name="local.l10n.xml" select="document('')"/>
<l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0"> 
  <l:l10n language="ru">
    <l:context name="title-numbered">
      <l:template name="chapter" text="%n. %t"/>
      <l:template name="section" text="%n. %t"/>
<!-- цифры в нумерации приложений -->
      <l:template name="appendix" text="Приложение&#160;%n"/>
    </l:context>
    <l:context name="title">
      <l:template name="appendix" text="Приложение %n. %t"/>
<!--     не работает -->
<!--       <l:template name="appendix" text="Приложение&#160;%n"/> -->
<!-- Слово таблица - разреженное -->
      <l:template name="table" text="Т а б л и ц а&#160;&#160;%n — %t"></l:template>
      <l:template name="note" text="П р и м е ч а н и е. "></l:template>
      <l:template name="figure" text="%t&#010;&#013;Рисунок %n"/>
    </l:context>
    <l:context name="xref-number">
      <l:template name="table" text="табл.&#160;%n"/>
      <l:template name="figure" text="рис.&#160;%n"/>
      <l:template name="section" text="раздел&#160;%n"/>
      <l:template name="simplesect" text="подраздел&#160;%n"/>
      <l:template name="chapter" text="глава %n"/>
    </l:context>
  </l:l10n>
</l:i18n>

<!-- subtitle как title, только слева -->
<xsl:template match="d:subtitle" mode="appendix.titlepage.recto.auto.mode">
  <xsl:variable name="content">
    <xsl:apply-templates select="." mode="appendix.titlepage.recto.mode"/>
  </xsl:variable>

  <fo:block xsl:use-attribute-sets="section.title.properties section.title.level1.properties"
          text-indent="0mm"
          text-align="center" 
          font-family="{$title.fontset}">
    <xsl:call-template name="ucase">
      <xsl:with-param name="string" select="$content"/>
    </xsl:call-template>
  </fo:block>
</xsl:template>

<!-- Приложение справа -->
<xsl:attribute-set name="component.title.properties">
  <xsl:attribute name="text-align">
    <xsl:choose>
      <xsl:when test="parent::d:appendix">right</xsl:when>
      <xsl:otherwise>center</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
</xsl:attribute-set>

<!-- Выравнивание отступов -->
<xsl:template name="nongraphical.admonition">
  <xsl:param name="content">
    <xsl:apply-templates/>
  </xsl:param>
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>

  <fo:block id="{$id}"
            xsl:use-attribute-sets="nongraphical.admonition.properties">
    <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
    <xsl:attribute name="padding-top">0pt</xsl:attribute>
    <xsl:attribute name="padding-right">0pt</xsl:attribute>
    <xsl:attribute name="padding-left">0em</xsl:attribute>
    <xsl:attribute name="margin-left">0pt</xsl:attribute>
    <xsl:attribute name="margin-bottom">0em</xsl:attribute>
    <xsl:attribute name="margin-right">0pt</xsl:attribute>
    <xsl:attribute name="margin-top">0em</xsl:attribute>
    <xsl:attribute name="text-indent"><xsl:value-of select="$espd.text-indent"/></xsl:attribute>
    <fo:block xsl:use-attribute-sets="admonition.properties">
      <xsl:apply-templates select="." mode="object.title.markup"/>
      <xsl:value-of select="$content"/>
    </fo:block>
  </fo:block>
</xsl:template>

<!-- Отбивка и отступы перечислений -->
<xsl:attribute-set name="list.block.spacing">
  <xsl:attribute name="space-before.optimum">0mm</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0mm</xsl:attribute>
  <xsl:attribute name="space-before.maximum">0.2mm</xsl:attribute>
  <xsl:attribute name="space-after.optimum">0mm</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0mm</xsl:attribute>
  <xsl:attribute name="space-after.maximum">0.2mm</xsl:attribute>
<!--   Абзацный отступ перечислений -->
  <xsl:attribute name="margin-left">-7mm</xsl:attribute>
</xsl:attribute-set>

<!-- Отбивка пунктов перечислений. -->
<xsl:attribute-set name="list.item.spacing">
  <xsl:attribute name="space-before.optimum">0</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0</xsl:attribute>
  <xsl:attribute name="space-before.maximum">0.2em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">0mm</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0mm</xsl:attribute>
  <xsl:attribute name="space-after.maximum">0.2mm</xsl:attribute>
<!--   положение знака перечислений -->
  <xsl:attribute name="text-indent">19.5mm</xsl:attribute>
</xsl:attribute-set>

<!-- Положение знаков перечислений относительно отступа -->
<!-- Абзацный отступ -->
<xsl:attribute-set name="para.properties"
     xsl:use-attribute-sets="normal.para.spacing">
  <xsl:attribute name="text-indent">
    <xsl:choose>
      <xsl:when test="parent::d:simplesect
                   |parent::d:section
                   |parent::d:sect1
                   |parent::d:sect2
                   |parent::d:sect3
                   |parent::d:sect4
                   |parent::d:sect5
                   |parent::d:part
                   |parent::d:preface
                   |parent::d:appendix
                   |parent::d:tip
                   |parent::d:note
                   |parent::d:caution
                   |parent::d:important
                   |parent::d:warning
                   |parent::d:chapter
                   |parent::d:abstract
                   |parent::d:acknowledgements">
        <xsl:value-of select="$espd.text-indent"/>
      </xsl:when>
      <xsl:when test="ancestor::d:varlistentry and not (ancestor::d:itemizedlist) and not (ancestor::d:orderedlist)">13mm</xsl:when>
      <xsl:when test="parent::d:listitem">19mm</xsl:when>
      <xsl:otherwise>0mm</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
</xsl:attribute-set>


</xsl:stylesheet>
