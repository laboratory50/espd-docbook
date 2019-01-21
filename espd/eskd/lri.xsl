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
                         margin-top="5mm"
                         margin-bottom="5mm"
                         margin-left="20mm"
                         margin-right="5mm">
    <fo:region-body margin-bottom="0mm"
                    margin-top="0mm"/>
    <fo:region-before region-name="xsl-region-before-even"
                      extent="0mm"
                      display-align="before"/>
    <fo:region-after region-name="xsl-region-after-even"
                      extent="0mm"
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

    <xsl:template name="lripage">
        <xsl:variable name="master-reference">lripage</xsl:variable>
        <fo:page-sequence master-reference="{$master-reference}">
            <xsl:attribute name="language">
                <xsl:call-template name="l10n.language"/>
            </xsl:attribute>
            <xsl:attribute name="format">
                <xsl:call-template name="page.number.format">
                    <xsl:with-param name="master-reference" select="$master-reference"/>
                </xsl:call-template>
            </xsl:attribute>

            <xsl:attribute name="force-page-count">
                <xsl:call-template name="force.page.count">
                    <xsl:with-param name="master-reference" select="$master-reference"/>
                </xsl:call-template>
            </xsl:attribute>

            <xsl:attribute name="hyphenation-character">
                <xsl:call-template name="gentext">
                    <xsl:with-param name="key" select="'hyphenation-character'"/>
                </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="hyphenation-push-character-count">
                <xsl:call-template name="gentext">
                    <xsl:with-param name="key" select="'hyphenation-push-character-count'"/>
                </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="hyphenation-remain-character-count">
                <xsl:call-template name="gentext">
                    <xsl:with-param name="key" select="'hyphenation-remain-character-count'"/>
                </xsl:call-template>
            </xsl:attribute>

            <fo:flow flow-name="xsl-region-body">
                <fo:block xsl:use-attribute-sets="espd.lri.style" break-before="page" font-size="10pt" font-family="{$sans.font.family}">
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
                            <fo:table-row height="10mm" border-style="solid" border-width="0.4mm" text-align="center">
                                <fo:table-cell number-columns-spanned="10" display-align="center">
                                    <fo:block>Лист регистрации изменений</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row height="6mm" border-style="solid" border-width="0.4mm" text-align="center">
                                <fo:table-cell number-rows-spanned="2" display-align="center">
                                    <fo:block>Изм.</fo:block>
                                </fo:table-cell>
                                <fo:table-cell number-columns-spanned="4" display-align="center">
                                    <fo:block>Номера листов (страниц)</fo:block>
                                </fo:table-cell>
                                <fo:table-cell number-rows-spanned="2" display-align="center">
                                    <fo:block>Всего листов (страниц) в документе</fo:block>
                                </fo:table-cell>
                                <fo:table-cell number-rows-spanned="2" display-align="center">
                                    <fo:block>Номер документа</fo:block>
                                </fo:table-cell>
                                <fo:table-cell number-rows-spanned="2" display-align="center">
                                    <fo:block>Входящий номер сопроводительного документа и дата</fo:block>
                                </fo:table-cell>
                                <fo:table-cell number-rows-spanned="2" display-align="center">
                                    <fo:block>Подпись (фамилия)</fo:block>
                                </fo:table-cell>
                                <fo:table-cell number-rows-spanned="2" display-align="center">
                                    <fo:block>Дата</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row height="19mm" border-style="solid" border-width="0.4mm" text-align="center">
                                <fo:table-cell display-align="center">
                                    <fo:block>изменённых</fo:block>
                                </fo:table-cell>
                                <fo:table-cell display-align="center">
                                    <fo:block>заменённых</fo:block>
                                </fo:table-cell>
                                <fo:table-cell display-align="center">
                                    <fo:block>новых</fo:block>
                                </fo:table-cell>
                                <fo:table-cell display-align="center">
                                    <fo:block>аннулированных</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <xsl:call-template name="lri-empty-row"/>
                        </fo:table-body>
                    </fo:table>
                </fo:block>
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>

    <xsl:template name="lri-empty-row">
        <fo:table-row border-style="solid" height="250mm">
            <fo:table-cell><fo:block>&#x00A0;</fo:block></fo:table-cell>
        </fo:table-row>
    </xsl:template>

</xsl:stylesheet>
