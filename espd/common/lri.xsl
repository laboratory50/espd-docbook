<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Лист регистрации изменений. -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
    version="1.1">

<xsl:template name="user.pagemasters">
  <fo:simple-page-master master-name="lrip"
                         page-width="{$page.width}"
                         page-height="{$page.height}"
                         margin-top="{$page.margin.top}"
                         margin-bottom="25mm"
                         margin-left="{$page.margin.inner}"
                         margin-right="5mm">
    <fo:region-body margin-bottom="{$body.margin.bottom}"
                    margin-top="{$body.margin.top}"/>
    <fo:region-before region-name="xsl-region-before-even"
                      extent="{$region.before.extent}"
                      display-align="before"/>
    <fo:region-after region-name="xsl-region-after-even"
                      extent="{$region.after.extent}"
                      display-align="after"/>
  </fo:simple-page-master>

  <fo:page-sequence-master master-name="lripage">
      <fo:repeatable-page-master-alternatives>
        <fo:conditional-page-master-reference blank-or-not-blank="blank" master-reference="lrip"/>
        <fo:conditional-page-master-reference page-position="first" master-reference="lrip"/>
        <fo:conditional-page-master-reference odd-or-even="odd" master-reference="lrip"/>
        <fo:conditional-page-master-reference odd-or-even="even" master-reference="lrip"/>
      </fo:repeatable-page-master-alternatives>
    </fo:page-sequence-master>
</xsl:template>

<xsl:template match="processing-instruction()[local-name()='lastpage']">
    <xsl:if test="$espd.lri = 0">
        <fo:block id="END-OF-DOCUMENT"/>
    </xsl:if>
</xsl:template>

<xsl:template match="d:book">
    <xsl:apply-imports/>
    <xsl:if test="$espd.lri = 1">
      <xsl:call-template name="lripage"/>
    </xsl:if>
</xsl:template>

<xsl:attribute-set name="espd.lri.style">
  <xsl:attribute name="font-family">
    <xsl:value-of select="$body.font.family"/>
  </xsl:attribute>
  <xsl:attribute name="font-weight">normal</xsl:attribute>
  <xsl:attribute name="font-size">10.5pt</xsl:attribute>
  <xsl:attribute name="text-align">center</xsl:attribute>
  <xsl:attribute name="hyphenate">true</xsl:attribute>
</xsl:attribute-set>

</xsl:stylesheet>
