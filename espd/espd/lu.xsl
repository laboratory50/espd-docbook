<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Лист утверждения -->
<!-- ГОСТ 19.104-78 -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:date="http://exslt.org/dates-and-times"
    xmlns:d="http://docbook.org/ns/docbook"
    version="1.1">

    <xsl:attribute-set name="lu.style"
                    use-attribute-sets="espd.titlepage.style">
        <xsl:attribute name="font-family">
            <xsl:value-of select="$body.font.family"/>
        </xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="font-size">16pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:template name="front.cover">
        <xsl:call-template name="page.sequence">
            <xsl:with-param name="master-reference">lu</xsl:with-param>
            <xsl:with-param name="content">

            <!-- Рамка -->
            <fo:block-container absolute-position="fixed"
                                top="5mm"
                                left="20mm">
                    <fo:block font-size="10pt" font-family="{$sans.font.family}">
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

            <!-- Штамп вертикальный слева -->
            <xsl:call-template name="espd.stamp"/>

            <!-- УТВЕРЖДАЮ (кто)-->
            <fo:block-container absolute-position="absolute"
                                top="20mm"
                                left="0cm"
                                font-size="14pt"
                                xsl:use-attribute-sets="lu.style">
            <fo:table table-layout="fixed" width="100%" border-style="none"  text-align="center">
                <fo:table-column column-width="33%"/>
                <fo:table-column column-width="33%"/>
                <fo:table-column column-width="33%"/>
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell padding-right="2mm">
                            <xsl:apply-templates mode="lu.approvement.label" select="d:info/d:authorgroup/d:othercredit[1]"/>
                        </fo:table-cell>
                        <fo:table-cell>
                            <xsl:apply-templates mode="lu.approvement.label" select="d:info/d:authorgroup/d:othercredit[2]"/>
                        </fo:table-cell>
                        <fo:table-cell padding-left="2mm">
                            <xsl:apply-templates mode="lu.approvement.label" select="d:info/d:authorgroup/d:editor"/>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell padding-right="1mm">
                            <fo:block><xsl:apply-templates select="d:info/d:authorgroup/d:othercredit[1]/d:affiliation/d:jobtitle"/></fo:block>
                            <fo:block><xsl:apply-templates select="d:info/d:authorgroup/d:othercredit[1]/d:affiliation/d:orgname"/></fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block><xsl:apply-templates select="d:info/d:authorgroup/d:othercredit[2]/d:affiliation/d:jobtitle"/></fo:block>
                            <fo:block><xsl:apply-templates select="d:info/d:authorgroup/d:othercredit[2]/d:affiliation/d:orgname"/></fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding-left="1mm">
                            <fo:block><xsl:apply-templates select="d:info/d:authorgroup/d:editor/d:affiliation/d:jobtitle"/></fo:block>
                            <fo:block><xsl:apply-templates select="d:info/d:authorgroup/d:editor/d:affiliation/d:orgname"/></fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell padding-right="2mm">
                            <xsl:apply-templates mode="lu.approvement.person" select="d:info/d:authorgroup/d:othercredit[1]/d:personname"/>
                        </fo:table-cell>
                        <fo:table-cell>
                            <xsl:apply-templates mode="lu.approvement.person" select="d:info/d:authorgroup/d:othercredit[2]/d:personname"/>
                        </fo:table-cell>
                        <fo:table-cell padding-left="2mm">
                            <xsl:apply-templates mode="lu.approvement.person" select="d:info/d:authorgroup/d:editor/d:personname"/>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell padding-right="2mm">
                            <xsl:apply-templates mode="lu.approvement.signdate" select="d:info/d:authorgroup/d:othercredit[1]"/>
                        </fo:table-cell>
                        <fo:table-cell>
                            <xsl:apply-templates mode="lu.approvement.signdate" select="d:info/d:authorgroup/d:othercredit[2]"/>
                        </fo:table-cell>
                        <fo:table-cell padding-left="2mm">
                            <xsl:apply-templates mode="lu.approvement.signdate" select="d:info/d:authorgroup/d:editor"/>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
            </fo:block-container>

            <!-- Название комплекса -->
            <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:title"/>

            <!-- Тип документа -->
            <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:subtitle"/>

            <!-- Лист утверждения -->
            <fo:block xsl:use-attribute-sets="lu.style"
                        space-before="10mm">
                Лист утверждения
            </fo:block>

            <!-- Децимальный -->
            <fo:block xsl:use-attribute-sets="lu.style">
                <xsl:value-of select="$espd.decimal"/><xsl:text>-ЛУ</xsl:text>
            </fo:block>

            <!-- Дата публикации (год) -->
            <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:date"/>

            <!-- Литера -->
            <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:releaseinfo"/>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="d:personname" mode="lu.approvement.person">
        <xsl:param name="initials">
            <xsl:call-template name="person.name" mode="initials"/>
        </xsl:param>

        <fo:block text-align="right" line-height="2.5">
            <fo:inline>
<!--             <xsl:text>___________ </xsl:text> -->
                    <xsl:value-of select="$initials"/>
            </fo:inline>
        </fo:block>
    </xsl:template>

    <xsl:template match="d:othercredit" mode="lu.approvement.label">
        <fo:block line-height="2.5">СОГЛАСОВАНО</fo:block>
    </xsl:template>

    <xsl:template match="d:editor" mode="lu.approvement.label">
        <fo:block line-height="2.5">УТВЕРЖДАЮ</fo:block>
    </xsl:template>

    <xsl:template match="d:othercredit|d:editor" mode="lu.approvement.signdate">
        <xsl:param name="year">
            <xsl:call-template name="datetime.format">
                <xsl:with-param name="date" select="date:date-time()"/>
                <xsl:with-param name="format" select="'Y'"/>
            </xsl:call-template>
        </xsl:param>

        <fo:block>
            <fo:inline>
                <xsl:text>«__»_________</xsl:text>
                <xsl:value-of select="$year"/>
                <xsl:text> г.</xsl:text>
            </fo:inline>
        </fo:block>
    </xsl:template>

    <xsl:template name="lu.approvement.entity">
        <xsl:param name="caption"/>

        <fo:block space-before="10mm" space-after="5mm">
            <xsl:call-template name="lu.approvement">
                <xsl:with-param name="caption" select="$caption"/>
                <xsl:with-param name="appointment" select="d:personblurb[1]"/>
                <xsl:with-param name="initials">
                    <xsl:call-template name="person.name" mode="initials"/>
                </xsl:with-param>
            </xsl:call-template>
        </fo:block>
    </xsl:template>

    <!-- название комплекса -->
    <xsl:template match="d:title" mode="book.titlepage.recto.auto.mode">
        <fo:block xsl:use-attribute-sets="lu.style" 
                    space-before="11cm" font-size="18pt">
                <xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
        </fo:block>
    </xsl:template>

    <!-- название документа -->
    <xsl:template match="d:subtitle" mode="book.titlepage.recto.auto.mode">
        <fo:block xsl:use-attribute-sets="lu.style"
                    space-before="10mm">
            <xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
        </fo:block>
    </xsl:template>

    <xsl:template match="d:author|d:othercredit" mode="book.titlepage.recto.auto.mode">
        <xsl:call-template name="lu.approvement.entity"/>
    </xsl:template>

    <!-- дата публикации -->
    <xsl:template match="d:date" mode="book.titlepage.recto.auto.mode">
        <fo:block-container absolute-position="fixed"
                            top="260mm"
                            left="25mm"
                            right="10mm">
            <fo:block xsl:use-attribute-sets="lu.style" space-before="5mm">
                <xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
            </fo:block>
        </fo:block-container>
    </xsl:template>

    <xsl:template match="d:releaseinfo" mode="book.titlepage.recto.auto.mode">
        <fo:block-container absolute-position="fixed"
                        top="265mm"
                        left="165mm"
                        right="10mm">
            <fo:block xsl:use-attribute-sets="lu.style" space-before="5mm" >
                <xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
            </fo:block>
        </fo:block-container>
    </xsl:template>

</xsl:stylesheet>

