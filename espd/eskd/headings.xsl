<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Колонтитулы -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
    version="1.1">

<!-- Удаление разделительных полос. -->
<xsl:param name="footer.rule" select="0"/>
<xsl:param name="header.rule" select="0"/>

<!-- Содержимое колонтитулов -->
<!-- Верхний — нет -->
<xsl:template name="header.content">
  <xsl:param name="pageclass" select="''"/>
  <xsl:param name="sequence" select="''"/>
  <xsl:param name="position" select="''"/>
  <xsl:param name="gentext-key" select="''"/>
</xsl:template>

<!-- Нижний колонтитул -->
<xsl:template name="footer.content">
  <xsl:param name="pageclass" select="''"/>
  <xsl:param name="sequence" select="''"/>
  <xsl:param name="position" select="''"/>
  <xsl:param name="gentext-key" select="''"/>
  <fo:block>
    <xsl:choose>
      <xsl:when test="$pageclass = 'titlepage' or $pageclass = 'lripage'">
      </xsl:when>
      <xsl:when test="$pageclass = 'front' and $position = 'center'">
      <fo:block-container absolute-position="fixed"
                            bottom="5mm"
                            left="20mm">
            <fo:block font-size="10pt" font-family="{$sans.font.family}">
                <fo:table table-layout="fixed" width="185mm" height="287mm" border-style="solid" border-width="0.3mm">
                    <fo:table-column column-width="185mm" border-style="solid" border-width="0.3mm"/>
                    <fo:table-body>
                        <fo:table-row border-style="solid" border-width="0.3mm" text-align="center" height="287mm">
                            <fo:table-cell><fo:block/></fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>
            </fo:block>
        </fo:block-container>
      <fo:block-container absolute-position="fixed"
                            bottom="47.7mm"
                            left="85mm">
            <fo:block font-size="10pt" font-family="{$sans.font.family}">
                <fo:table table-layout="fixed" width="120mm" height="22mm" border-style="solid" border-width="0.3mm">
                    <fo:table-column column-width="14mm" border-style="solid" border-width="0.3mm"/>
                    <fo:table-column column-width="53mm" border-style="solid" border-width="0.3mm"/>
                    <fo:table-column column-width="53mm" border-style="solid" border-width="0.3mm"/>
                    <fo:table-body>
                        <fo:table-row border-style="solid" border-width="0.3mm" text-align="center" height="14mm">
                            <fo:table-cell><fo:block/></fo:table-cell>
                            <fo:table-cell><fo:block/></fo:table-cell>
                        </fo:table-row>
                        <fo:table-row border-style="solid" border-width="0.3mm" text-align="center" height="8mm">
                            <fo:table-cell><fo:block/></fo:table-cell>
                            <fo:table-cell><fo:block/></fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>
            </fo:block>
        </fo:block-container>
        <fo:block-container absolute-position="fixed"
                                bottom="5mm"
                                left="20mm">
                <fo:block font-size="10pt" font-family="{$sans.font.family}">
                    <fo:table table-layout="fixed" width="185mm" height="15mm" border-style="solid" border-width="0.3mm">
                        <fo:table-column column-width="7mm" border-style="solid" border-width="0.3mm"/>
                        <fo:table-column column-width="10mm" border-style="solid" border-width="0.3mm"/>
                        <fo:table-column column-width="23mm" border-style="solid" border-width="0.3mm"/>
                        <fo:table-column column-width="15mm" border-style="solid" border-width="0.3mm"/>
                        <fo:table-column column-width="10mm" border-style="solid" border-width="0.3mm"/>
                        <fo:table-column column-width="70mm" border-style="solid" border-width="0.3mm"/>
                        <fo:table-column column-width="5mm" border-style="solid" border-width="0.3mm"/>
                        <fo:table-column column-width="5mm" border-style="solid" border-width="0.3mm"/>
                        <fo:table-column column-width="5mm" border-style="solid" border-width="0.3mm"/>
                        <fo:table-column column-width="15mm" border-style="solid" border-width="0.3mm"/>
                        <fo:table-column column-width="20mm" border-style="solid" border-width="0.3mm"/>
                        <fo:table-body>
                            <fo:table-row border-style="solid" border-width="0.3mm" text-align="center" height="5mm">
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell margin-left="0.6mm"
                                               margin-top="0.3mm" 
                                               number-rows-spanned="3"
                                               number-columns-spanned="6"
                                               display-align="center">
                                    <fo:block><xsl:value-of select="$espd.decimal"/></fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row border-style="solid" border-width="0.3mm" text-align="center" height="5mm">
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                            </fo:table-row>
                            <fo:table-row border-style="solid" border-width="0.3mm" text-align="center" height="5mm">
                                <fo:table-cell>
                                    <fo:block margin-top="0.3mm">Изм</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block margin-top="0.3mm">Лист</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block margin-top="0.3mm">№ докум.</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block margin-top="0.3mm">Подпись</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block margin-top="0.3mm">Дата</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row border-style="solid" border-width="0.3mm" text-align="center" height="5mm">
                                <fo:table-cell number-columns-spanned="2"><fo:block>Разраб.</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell number-rows-spanned="5" display-align="center">
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
                            <fo:table-row border-style="solid" border-width="0.3mm" text-align="center" height="5mm">
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
                            <fo:table-row border-style="solid" border-width="0.3mm" text-align="center" height="5mm">
                                <fo:table-cell number-columns-spanned="2"><fo:block/></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell number-columns-spanned="5" number-rows-spanned="3" display-align="center">
                                    <fo:block><xsl:value-of select="/d:book/d:info/d:author/d:orgname"/></fo:block></fo:table-cell>
                            </fo:table-row>
                            <fo:table-row border-style="solid" border-width="0.3mm" text-align="center" height="5mm">
                                <fo:table-cell number-columns-spanned="2"><fo:block>Н. контр.</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                            </fo:table-row>
                            <fo:table-row border-style="solid" border-width="0.3mm" text-align="center" height="5mm">
                                <fo:table-cell number-columns-spanned="2"><fo:block>Утв.</fo:block></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                </fo:block>
        </fo:block-container>
        <xsl:call-template name="espd-stamp"/>
      </xsl:when>

      <xsl:when test="$position = 'center'">
        <fo:block-container absolute-position="fixed"
                            bottom="5mm"
                            left="20mm">
            <fo:block font-size="10pt" font-family="{$sans.font.family}">
                <fo:table table-layout="fixed" width="185mm" height="287mm" border-style="solid" border-width="0.3mm">
                    <fo:table-column column-width="185mm" border-style="solid" border-width="0.3mm"/>
                    <fo:table-body>
                        <fo:table-row border-style="solid" border-width="0.3mm" text-align="center" height="287mm">
                            <fo:table-cell><fo:block/></fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>
            </fo:block>
        </fo:block-container>
        <xsl:call-template name="espd-stamp"/>
        <fo:block-container absolute-position="fixed"
                                bottom="5mm"
                                left="20mm">
                <fo:block font-size="10pt" font-family="{$sans.font.family}">
                    <fo:table table-layout="fixed" width="185mm" height="15mm" border-style="solid" border-width="0.3mm">
                        <fo:table-column column-width="7mm" border-style="solid" border-width="0.3mm"/>
                        <fo:table-column column-width="10mm" border-style="solid" border-width="0.3mm"/>
                        <fo:table-column column-width="23mm" border-style="solid" border-width="0.3mm"/>
                        <fo:table-column column-width="15mm" border-style="solid" border-width="0.3mm"/>
                        <fo:table-column column-width="10mm" border-style="solid" border-width="0.3mm"/>
                        <fo:table-column column-width="110mm" border-style="solid" border-width="0.3mm"/>
                        <fo:table-column column-width="10mm" border-style="solid" border-width="0.3mm"/>
                        <fo:table-body>
                            <fo:table-row border-style="solid" border-width="0.3mm" text-align="center" height="5mm">
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell margin-left="0.6mm" margin-top="0.3mm" number-rows-spanned="3" display-align="center">
                                    <fo:block><xsl:value-of select="$espd.decimal"/></fo:block>
                                </fo:table-cell>
                                <fo:table-cell number-rows-spanned="2" display-align="center">
                                    <fo:block><fo:page-number/></fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row border-style="solid" border-width="0.3mm" text-align="center" height="5mm">
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                                <fo:table-cell><fo:block/></fo:table-cell>
                            </fo:table-row>
                            <fo:table-row border-style="solid" border-width="0.3mm" text-align="center" height="5mm">
                                <fo:table-cell>
                                    <fo:block margin-top="0.3mm">Изм</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block margin-top="0.3mm">Лист</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block margin-top="0.3mm">№ докум.</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block margin-top="0.3mm">Подпись</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block margin-top="0.3mm">Дата</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block margin-top="0.3mm">Лист</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                </fo:block>
        </fo:block-container>
      </xsl:when>
      <xsl:otherwise/>
    </xsl:choose>
  </fo:block>
</xsl:template>

<!-- Шрифт: основной, размер 100% основного. -->
<xsl:attribute-set name="footer.content.properties">
  <xsl:attribute name="font-family">
    <xsl:value-of select="$espd.heading.font.family"/>
  </xsl:attribute>
  <xsl:attribute name="font-size">
    <xsl:value-of select="$body.font.master"/>
    <xsl:text>pt</xsl:text>
  </xsl:attribute>
</xsl:attribute-set>

<xsl:attribute-set name="footer.content.properties"
                   use-attribute-sets="header.content.properties">
</xsl:attribute-set>

</xsl:stylesheet>
