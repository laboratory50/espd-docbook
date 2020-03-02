<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Примечания, важно, предупреждения -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
    version="1.1">

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
            <xsl:attribute name="padding-left">0pt</xsl:attribute>
            <xsl:attribute name="margin-left">0pt</xsl:attribute>
            <xsl:attribute name="margin-bottom">0pt</xsl:attribute>
            <xsl:attribute name="margin-right">0pt</xsl:attribute>
            <xsl:attribute name="margin-top">0pt</xsl:attribute>
            <xsl:attribute name="text-indent">
                <xsl:value-of select="$espd.text-indent"/>
            </xsl:attribute>
            <fo:block xsl:use-attribute-sets="admonition.properties">
                <xsl:apply-templates select="." mode="object.title.markup"/>
                <xsl:value-of select="$content"/>
            </fo:block>
        </fo:block>
    </xsl:template>

</xsl:stylesheet>

