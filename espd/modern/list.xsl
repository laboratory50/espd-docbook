<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2014.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Перечисления -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
    exclude-result-prefixes="d"
    version="1.1">

<xsl:include href="../common/list.xsl"/>

<xsl:attribute-set name="list.block.properties">
  <xsl:attribute name="provisional-label-separation">2pt</xsl:attribute>
</xsl:attribute-set>

<!-- Расстояние между левой границей перечня и текстом -->
<xsl:param name="itemizedlist.label.width">
  <xsl:value-of select="$espd.text-indent"/>
</xsl:param>

<!-- Расстояние между левой границей перечня и текстом -->
<xsl:param name="orderedlist.label.width">
  <xsl:value-of select="$espd.text-indent"/>
</xsl:param>

<xsl:attribute-set name="itemizedlist.label.properties">
  <xsl:attribute name="text-indent">0.3em</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="orderedlist.label.properties">
  <xsl:attribute name="text-indent">0.35em</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="calloutlist.label.properties">
  <xsl:attribute name="text-indent">0.35em</xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="calloutlist.properties">
  <xsl:attribute name="space-before.optimum">1em</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0.8em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">1.2em</xsl:attribute>
  <xsl:attribute name="provisional-distance-between-starts">
    <xsl:value-of select="$espd.text-indent"/>
  </xsl:attribute>
  <xsl:attribute name="provisional-label-separation">0.15em</xsl:attribute>
</xsl:attribute-set>

<!-- Отбивка и отступы перечислений -->
<xsl:attribute-set name="list.block.spacing">
  <xsl:attribute name="space-before.optimum">0.1em</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0</xsl:attribute>
  <xsl:attribute name="space-before.maximum">0.2em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">0.3em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0.1em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">0.4em</xsl:attribute>
  <xsl:attribute name="text-indent">0</xsl:attribute>
  <xsl:attribute name="margin-left">0</xsl:attribute>
</xsl:attribute-set>

<xsl:template match="d:varlistentry" mode="vl.as.blocks">
  <xsl:variable name="id"><xsl:call-template name="object.id"/></xsl:variable>

  <fo:block id="{$id}" xsl:use-attribute-sets="variablelist.term.properties"
      keep-together.within-column="always" 
      keep-with-next.within-column="always">
    <xsl:apply-templates select="d:term"/>
  </fo:block>

  <fo:block>
    <xsl:attribute name="margin-{$direction.align.start}">
      <xsl:value-of select="$espd.text-indent"/>
    </xsl:attribute>
    <xsl:apply-templates select="d:listitem"/>
  </fo:block>
</xsl:template>

<xsl:attribute-set name="variablelist.term.properties">
  <xsl:attribute name="space-after.optimum">0.15em</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0.1em</xsl:attribute>
  <xsl:attribute name="space-after.maximum">0.2em</xsl:attribute>
  <xsl:attribute name="space-before.optimum">0.4em</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0.3em</xsl:attribute>
  <xsl:attribute name="space-before.maximum">0.6em</xsl:attribute>
  <xsl:attribute name="text-indent">0</xsl:attribute>
</xsl:attribute-set>

<xsl:template match="d:callout">
  <xsl:variable name="id"><xsl:call-template name="object.id"/></xsl:variable>

  <xsl:variable name="keep.together">
    <xsl:call-template name="pi.dbfo_keep-together"/>
  </xsl:variable>

  <fo:list-item id="{$id}">
    <xsl:if test="$keep.together != ''">
      <xsl:attribute name="keep-together.within-column"><xsl:value-of
                      select="$keep.together"/></xsl:attribute>
    </xsl:if>
    <fo:list-item-label end-indent="label-end()" xsl:use-attribute-sets="calloutlist.label.properties">
      <fo:block>
        <xsl:call-template name="callout.arearefs">
          <xsl:with-param name="arearefs" select="@arearefs"/>
        </xsl:call-template>
      </fo:block>
    </fo:list-item-label>
    <fo:list-item-body start-indent="body-start()" xsl:use-attribute-sets="callout.properties">
      <fo:block>
        <xsl:apply-templates/>
      </fo:block>
    </fo:list-item-body>
  </fo:list-item>
</xsl:template>

</xsl:stylesheet>


