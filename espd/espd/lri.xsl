<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Лист регистрации изменений по ГОСТ 19.604-78 -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
    version="1.1">

<xsl:template name="lri.table">
    <fo:table table-layout="fixed" height="100%" border-style="solid" border-width="0.4mm">
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
            <fo:table-row height="9.6mm" border-style="solid" border-width="0.4mm" text-align="center" font-size="{$body.font.master}pt">
                <fo:table-cell number-columns-spanned="10" display-align="center">
                    <fo:block>Лист регистрации изменений</fo:block>
                </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="5.6mm" border-style="solid" border-width="0.4mm" text-align="center">
                <fo:table-cell number-columns-spanned="5" display-align="center">
                    <fo:block>Номера листов (страниц)</fo:block>
                </fo:table-cell>
                <fo:table-cell number-rows-spanned="2" display-align="center">
                    <fo:block>Всего</fo:block>
                    <fo:block>листов</fo:block>
                    <fo:block>(страниц)</fo:block>
                    <fo:block>в докум.</fo:block>
                </fo:table-cell>
                <fo:table-cell number-rows-spanned="2" display-align="center">
                    <fo:block>№</fo:block>
                    <fo:block>документа</fo:block>
                </fo:table-cell>
                <fo:table-cell number-rows-spanned="2" display-align="center">
                    <fo:block>Входящий</fo:block>
                    <fo:block>№ сопро-</fo:block>
                    <fo:block>водительно-</fo:block>
                    <fo:block>го докум.</fo:block>
                    <fo:block>и дата</fo:block>
                </fo:table-cell>
                <fo:table-cell number-rows-spanned="2" display-align="center">
                    <fo:block>Подп.</fo:block>
                </fo:table-cell>
                <fo:table-cell number-rows-spanned="2" display-align="center">
                    <fo:block>Дата</fo:block>
                </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="24.6mm" border-style="solid" border-width="0.4mm" text-align="center">
                <fo:table-cell display-align="center">
                    <fo:block>Изм.</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center">
                    <fo:block>измененных</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center">
                    <fo:block>замененных</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center">
                    <fo:block>новых</fo:block>
                </fo:table-cell>
                <fo:table-cell display-align="center">
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
        </fo:table-body>
    </fo:table>
</xsl:template>

<xsl:template name="lri-empty-row">
    <fo:table-row border-style="solid" height="7.6mm" border-width="0.4mm">
        <fo:table-cell><fo:block></fo:block></fo:table-cell>
        <fo:table-cell><fo:block></fo:block></fo:table-cell>
        <fo:table-cell><fo:block></fo:block></fo:table-cell>
        <fo:table-cell><fo:block></fo:block></fo:table-cell>
        <fo:table-cell><fo:block></fo:block></fo:table-cell>
        <fo:table-cell><fo:block></fo:block></fo:table-cell>
        <fo:table-cell><fo:block></fo:block></fo:table-cell>
        <fo:table-cell><fo:block></fo:block></fo:table-cell>
        <fo:table-cell><fo:block></fo:block></fo:table-cell>
        <fo:table-cell><fo:block></fo:block></fo:table-cell>
    </fo:table-row>
</xsl:template>

</xsl:stylesheet>

