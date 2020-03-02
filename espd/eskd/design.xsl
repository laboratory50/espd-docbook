<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
    version="1.1">

<xsl:attribute-set name="espd.stamp.style">
    <xsl:attribute name="font-family">
        <xsl:value-of select="$sans.font.family"/>
    </xsl:attribute>
    <xsl:attribute name="font-weight">normal</xsl:attribute>
    <xsl:attribute name="font-size">10pt</xsl:attribute>
    <xsl:attribute name="text-align">center</xsl:attribute>
    <xsl:attribute name="border">0.3mm solid black</xsl:attribute>
    <xsl:attribute name="hyphenate">false</xsl:attribute>
</xsl:attribute-set>

<!-- !!! Для расчётов размеров: при условии, что все размеры считаются от середины бордера -->
<!--     для ширины ячейки указываются настоящие размеры -->
<!--     для высоты ячейки необходимо из рамера вычесть толщину бордера -->
<!-- !!! -->

<xsl:template name="eskd.frame">
    <fo:block-container absolute-position="fixed"
                        top="5mm"
                        left="20mm">
        <fo:block>
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
</xsl:template>

<!-- Рамка и основная надпись (первый лист)-->
<xsl:template name="eskd.main.stamp">
    <fo:block-container absolute-position="fixed"
              bottom="5mm"
              left="20mm">
        <fo:block>
            <fo:table table-layout="fixed" xsl:use-attribute-sets="espd.stamp.style">
                <fo:table-column column-width="7mm" border-style="solid"/>
                <fo:table-column column-width="10mm" border-style="solid"/>
                <fo:table-column column-width="23mm" border-style="solid"/>
                <fo:table-column column-width="15mm" border-style="solid"/>
                <fo:table-column column-width="10mm" border-style="solid"/>
                <fo:table-column column-width="70mm" border-style="solid"/>
<!--                 <fo:table-column column-width="14mm" border-style="dashed" /> -->
<!--                 <fo:table-column column-width="53mm" border-style="dashed" /> -->
<!--                 <fo:table-column column-width="3mm" border-style="dashed" /> -->
                <fo:table-column column-width="5mm" border-style="solid"/>
                <fo:table-column column-width="5mm" border-style="solid"/>
                <fo:table-column column-width="5mm" border-style="solid"/>
                <fo:table-column column-width="15mm" border-style="solid"/>
                <fo:table-column column-width="20mm" border-style="solid"/>
                <fo:table-body>
                    <!-- Верх рамки -->
                    <fo:table-row border-style="none" text-align="center" height="245mm">
                        <fo:table-cell border-top-style="solid" number-columns-spanned="11"><fo:block/></fo:table-cell>
                    </fo:table-row>
                    <!-- Надстройка над осовной надписью -->
                    <!--<fo:table-row border-style="none" text-align="center" height="13.7mm">
                        <fo:table-cell border-style="none" number-columns-spanned="5"><fo:block/></fo:table-cell>
                        <fo:table-cell border-style="dashed"><fo:block/></fo:table-cell>
                        <fo:table-cell border-style="dashed"><fo:block/></fo:table-cell>
                        <fo:table-cell border-style="dashed" number-columns-spanned="6"><fo:block/></fo:table-cell>
                    </fo:table-row>
                    <fo:table-row border-style="none" text-align="center" height="7.7mm">
                        <fo:table-cell border-style="none" number-columns-spanned="5"><fo:block/></fo:table-cell>
                        <fo:table-cell border-style="none" number-columns-spanned="8"><fo:block/></fo:table-cell>
                    </fo:table-row>-->
                    <!-- Основная надпись -->
                    <fo:table-row border-style="solid" text-align="center" height="4.7mm">
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell number-rows-spanned="3"
                                       number-columns-spanned="6"
                                       font-size="16pt"
                                       display-align="center"
                                       border-style="solid">
                            <fo:block><xsl:value-of select="$espd.decimal"/></fo:block>
                        </fo:table-cell>
                    </fo:table-row>

                    <fo:table-row border-style="solid" text-align="center" height="4.7mm">
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                    </fo:table-row>

                    <fo:table-row border-style="solid" text-align="center" height="4.7mm">
                        <fo:table-cell><fo:block>Изм</fo:block></fo:table-cell>
                        <fo:table-cell><fo:block>Лист</fo:block></fo:table-cell>
                        <fo:table-cell><fo:block>№ докум.</fo:block></fo:table-cell>
                        <fo:table-cell><fo:block>Подпись</fo:block></fo:table-cell>
                        <fo:table-cell><fo:block>Дата</fo:block></fo:table-cell>
                    </fo:table-row>

                    <fo:table-row border-style="solid" text-align="center" height="4.7mm">
                        <fo:table-cell number-columns-spanned="2"><fo:block>Разраб.</fo:block></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell number-rows-spanned="5"
                                       font-size="12pt"
                                       display-align="center">
                            <fo:block>
                                <xsl:value-of select="/d:book/d:info/d:title"/>
                            </fo:block>
                            <fo:block>
                                <xsl:value-of select="/d:book/d:info/d:subtitle"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell number-columns-spanned="3"><fo:block>Лит.</fo:block></fo:table-cell>
                        <fo:table-cell><fo:block>Лист</fo:block></fo:table-cell>
                        <fo:table-cell><fo:block>Листов</fo:block></fo:table-cell>
                    </fo:table-row>

                    <fo:table-row border-style="solid" text-align="center" height="4.7mm">
                        <fo:table-cell number-columns-spanned="2"><fo:block>Пров.</fo:block></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block><fo:page-number/></fo:block></fo:table-cell>
                        <fo:table-cell><fo:block><fo:page-number-citation ref-id="END-OF-DOCUMENT"/></fo:block></fo:table-cell>
                    </fo:table-row>

                    <fo:table-row border-style="solid" text-align="center" height="4.7mm">
                        <fo:table-cell number-columns-spanned="2"><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell number-columns-spanned="5"
                                       number-rows-spanned="3"
                                       font-size="12pt"
                                       display-align="center">
                            <fo:block><xsl:value-of select="/d:book/d:info/d:author/d:orgname"/></fo:block></fo:table-cell>
                    </fo:table-row>

                    <fo:table-row border-style="solid" text-align="center" height="4.7mm">
                        <fo:table-cell number-columns-spanned="2"><fo:block>Н. контр.</fo:block></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                    </fo:table-row>

                    <fo:table-row border-style="solid" text-align="center" height="4.7mm">
                        <fo:table-cell number-columns-spanned="2"><fo:block>Утв.</fo:block></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:block>
    </fo:block-container>
</xsl:template>

<!-- Рамка и основная надпись (последующие листы) -->
<xsl:template name="eskd.other.stamp">
    <fo:block-container absolute-position="fixed"
              bottom="5mm"
              left="20mm">
        <fo:block>
            <fo:table table-layout="fixed" width="185mm" xsl:use-attribute-sets="espd.stamp.style">
                <fo:table-column column-width="7mm" border-style="solid" />
                <fo:table-column column-width="10mm" border-style="solid" />
                <fo:table-column column-width="23mm" border-style="solid" />
                <fo:table-column column-width="15mm" border-style="solid" />
                <fo:table-column column-width="10mm" border-style="solid" />
                <fo:table-column column-width="110mm" border-style="solid" />
                <fo:table-column column-width="10mm" border-style="solid" />
                <fo:table-body>
                    <fo:table-row border-style="solid" text-align="center" height="271.3mm">
                        <fo:table-cell number-columns-spanned="7"><fo:block/></fo:table-cell>
                    </fo:table-row>
                    <fo:table-row border-style="solid" text-align="center" height="4.7mm">
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell number-rows-spanned="3" display-align="center" font-size="16pt">
                            <fo:block><xsl:value-of select="$espd.decimal"/></fo:block>
                        </fo:table-cell>
                        <fo:table-cell number-rows-spanned="2" display-align="center" font-size="16pt">
                            <fo:block><fo:page-number/></fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row border-style="solid" text-align="center" height="4.7mm">
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                        <fo:table-cell><fo:block/></fo:table-cell>
                    </fo:table-row>
                    <fo:table-row border-style="solid" text-align="center" height="4.7mm">
                        <fo:table-cell><fo:block>Изм</fo:block></fo:table-cell>
                        <fo:table-cell><fo:block>Лист</fo:block></fo:table-cell>
                        <fo:table-cell><fo:block>№ докум.</fo:block></fo:table-cell>
                        <fo:table-cell><fo:block>Подпись</fo:block></fo:table-cell>
                        <fo:table-cell><fo:block>Дата</fo:block></fo:table-cell>
                        <fo:table-cell><fo:block>Лист</fo:block></fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:block>
    </fo:block-container>
</xsl:template>

        <!-- Надстройка над осовной надписью -->
        <!--<fo:block-container absolute-position="fixed"
                            bottom="47.7mm"
                            left="85mm">
            <fo:block font-size="10pt" font-family="{$sans.font.family}">
                <fo:table table-layout="fixed" width="120mm" height="22mm" border-style="dashed" >
                    <fo:table-column column-width="14mm" border-style="dashed" />
                    <fo:table-column column-width="53mm" border-style="dashed" />
                    <fo:table-column column-width="53mm" border-style="dashed" />
                    <fo:table-body>
                        <fo:table-row border-style="dashed" text-align="center" height="14mm">
                            <fo:table-cell><fo:block/></fo:table-cell>
                            <fo:table-cell><fo:block/></fo:table-cell>
                            <fo:table-cell><fo:block/></fo:table-cell>
                        </fo:table-row>
                        <fo:table-row border-style="dashed" text-align="center" height="8mm">
                            <fo:table-cell number-columns-spanned="3"><fo:block/></fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>
            </fo:block>
        </fo:block-container>-->

</xsl:stylesheet>
