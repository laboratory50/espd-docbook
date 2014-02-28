<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2014.
  Распространяется на условиях лицензии CC BY-SA 4.0.

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
                         margin-top="25mm"
                         margin-bottom="25mm"
                         margin-left="20mm"
                         margin-right="5mm">
    <fo:region-body margin="0mm"/>
    <fo:region-before region-name="xsl-region-before-even" extent="0mm"/>
    <fo:region-after region-name="xsl-region-after-even" extent="0mm"/>
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

<xsl:template match="d:book">
    <xsl:apply-imports/>
    <xsl:call-template name="lripage"/>
</xsl:template>

<xsl:attribute-set name="espd.lri.style">
  <xsl:attribute name="font-family">
    <xsl:value-of select="$sans.font.family"/>
  </xsl:attribute>
  <xsl:attribute name="font-weight">normal</xsl:attribute>
  <xsl:attribute name="font-size">11pt</xsl:attribute>
  <xsl:attribute name="text-align">center</xsl:attribute>
  <xsl:attribute name="hyphenate">true</xsl:attribute>
</xsl:attribute-set>

<xsl:template name="lripage">
  <fo:page-sequence master-reference="lripage">
      <fo:flow flow-name="xsl-region-body">
        <fo:block id="END-OF-DOCUMENT" break-before="page"/>
          <fo:block xsl:use-attribute-sets="espd.lri.style">
            <fo:table table-layout="fixed" width="100%" height="100%" border-style="solid" border-width="0.4mm">
              <fo:table-column column-width="8mm" border-style="solid"/>
              <fo:table-column column-width="20mm" border-style="solid"/>
              <fo:table-column column-width="20mm" border-style="solid"/>
              <fo:table-column column-width="20mm" border-style="solid"/>
              <fo:table-column column-width="20mm" border-style="solid"/>
              <fo:table-column column-width="20mm" border-style="solid"/>
              <fo:table-column column-width="25mm" border-style="solid"/>
              <fo:table-column column-width="25mm" border-style="solid"/>
              <fo:table-column column-width="15mm" border-style="solid"/>
              <fo:table-column column-width="12mm" border-style="solid"/>
              <fo:table-body>
                <fo:table-row height="9mm" border-style="solid" border-width="0.4mm" text-align="center">
                    <fo:table-cell number-columns-spanned="10" display-align="center">
                        <fo:block>Лист регистрации изменений</fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row height="6mm" border-style="solid" border-width="0.4mm" text-align="center">
                    <fo:table-cell number-columns-spanned="5" display-align="center">
                        <fo:block>Номера листов (страниц)</fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-rows-spanned="2" display-align="center">
                        <fo:block>Всего листов (страниц) в докум.</fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-rows-spanned="2" display-align="center">
                        <fo:block>№ документа</fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-rows-spanned="2" display-align="center">
                        <fo:block>Входящий № сопроводительного докум. и дата</fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-rows-spanned="2" display-align="center">
                        <fo:block>Подп.</fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-rows-spanned="2" display-align="center">
                        <fo:block>Дата</fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row border-style="solid" border-width="0.4mm" text-align="center">
                    <fo:table-cell>
                        <fo:block>Изм.</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>измененных</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>замененных</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>новых</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>аннулированных</fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <xsl:call-template name="lri-empty-row"/>
                <xsl:call-template name="lri-empty-row"/>
                <xsl:call-template name="lri-empty-row"/>
                <xsl:call-template name="lri-empty-row"/>
                <xsl:call-template name="lri-empty-row"/>
                <xsl:call-template name="lri-empty-row"/>
                <xsl:call-template name="lri-empty-row"/>
                <xsl:call-template name="lri-empty-row"/>
                <xsl:call-template name="lri-empty-row"/>
                <xsl:call-template name="lri-empty-row"/>
                <xsl:call-template name="lri-empty-row"/>
                <xsl:call-template name="lri-empty-row"/>
                <xsl:call-template name="lri-empty-row"/>
                <xsl:call-template name="lri-empty-row"/>
                <xsl:call-template name="lri-empty-row"/>
                <xsl:call-template name="lri-empty-row"/>
                <xsl:call-template name="lri-empty-row"/>
                <xsl:call-template name="lri-empty-row"/>
                <xsl:call-template name="lri-empty-row"/>
                <xsl:call-template name="lri-empty-row"/>
                <xsl:call-template name="lri-empty-row"/>
                <xsl:call-template name="lri-empty-row"/>
                <xsl:call-template name="lri-empty-row"/>
                <xsl:call-template name="lri-empty-row"/>
                <xsl:call-template name="lri-empty-row"/>
                <xsl:call-template name="lri-empty-row"/>
                <xsl:call-template name="lri-empty-row"/>
            </fo:table-body>
          </fo:table>
       </fo:block>
     </fo:flow>
  </fo:page-sequence>
</xsl:template>

<xsl:template name="lri-empty-row">
    <fo:table-row border-style="solid" height="7.6mm">
        <fo:table-cell><fo:block>&#x00A0;</fo:block></fo:table-cell>
        <fo:table-cell><fo:block>&#x00A0;</fo:block></fo:table-cell>
        <fo:table-cell><fo:block>&#x00A0;</fo:block></fo:table-cell>
        <fo:table-cell><fo:block>&#x00A0;</fo:block></fo:table-cell>
        <fo:table-cell><fo:block>&#x00A0;</fo:block></fo:table-cell>
        <fo:table-cell><fo:block>&#x00A0;</fo:block></fo:table-cell>
        <fo:table-cell><fo:block>&#x00A0;</fo:block></fo:table-cell>
        <fo:table-cell><fo:block>&#x00A0;</fo:block></fo:table-cell>
        <fo:table-cell><fo:block>&#x00A0;</fo:block></fo:table-cell>
        <fo:table-cell><fo:block>&#x00A0;</fo:block></fo:table-cell>
    </fo:table-row>
</xsl:template>

</xsl:stylesheet>

