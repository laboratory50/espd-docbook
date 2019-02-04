<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Лист утверждения -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:date="http://exslt.org/dates-and-times"
    xmlns:d="http://docbook.org/ns/docbook"
    version="1.1">

    <xsl:import href="design.xsl"/>

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
                <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:authorgroup/d:editor"/>
                <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:authorgroup/d:othercredit"/>

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

            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="lu.approvement">
        <xsl:param name="caption"/>
        <xsl:param name="appointment">
            <xsl:apply-templates select="d:affiliation/d:jobtitle"/>
        </xsl:param>
        <xsl:param name="organization">
            <xsl:apply-templates select="d:affiliation/d:orgname"/>
        </xsl:param>
        <xsl:param name="initials">
            <xsl:call-template name="person.name" mode="initials"/>
        </xsl:param>

        <fo:block>
            <xsl:if test="$caption != ''">
                <fo:block text-align="center" line-height="2.5"><xsl:value-of select="$caption"/></fo:block>
            </xsl:if>
            <fo:block text-align="center"><xsl:value-of select="$appointment"/></fo:block>
            <fo:block text-align="center"><xsl:value-of select="$organization"/></fo:block>
            <fo:block text-align="right" line-height="2.5">
                <fo:inline>
                    <xsl:text>___________ </xsl:text>
                    <xsl:value-of select="$initials"/>
                </fo:inline></fo:block>
            <fo:block text-align="center">
                <fo:inline>
                    <xsl:text>«__»___________</xsl:text>
                    <xsl:call-template name="datetime.format">
                        <xsl:with-param name="date" select="date:date-time()"/>
                        <xsl:with-param name="format" select="'Y'"/>
                    </xsl:call-template>
                    <xsl:text> г.</xsl:text>
                </fo:inline>
            </fo:block>
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

    <!-- утверждаю -->
    <xsl:template name="lu.approvement.approve">
        <fo:block-container absolute-position="absolute"
                            top="20mm"
                            right="0cm"
                            width="40%"
                            xsl:use-attribute-sets="lu.style">
            <xsl:call-template name="lu.approvement">
                <xsl:with-param name="caption" select="'УТВЕРЖДАЮ'"/>
            </xsl:call-template>
        </fo:block-container>
    </xsl:template>

    <xsl:template name="lu.approvement.custom">
        <fo:block-container absolute-position="absolute"
                            top="20mm"
                            left="0cm"
                            width="40%"
                            xsl:use-attribute-sets="lu.style">
            <xsl:call-template name="lu.approvement">
                <xsl:with-param name="caption" select="'УТВЕРЖДАЮ'"/>
            </xsl:call-template>
        </fo:block-container>
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

    <xsl:template match="d:editor" mode="book.titlepage.recto.auto.mode">
        <xsl:call-template name="lu.approvement.approve"/>
    </xsl:template>

    <xsl:template match="d:othercredit" mode="book.titlepage.recto.auto.mode">
        <xsl:call-template name="lu.approvement.custom"/>
    </xsl:template>

</xsl:stylesheet>

