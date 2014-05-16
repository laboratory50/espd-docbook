<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2014.
  Распространяется на условиях лицензии CC BY-SA 4.0.

  http://lab50.net/
-->

<!-- Основной текст. -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
    version="1.1">

<!-- Параметры абзаца: отбивка -->
<xsl:attribute-set name="normal.para.spacing">
  <xsl:attribute name="space-before.optimum">0mm</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0mm</xsl:attribute>
  <xsl:attribute name="space-before.maximum">0mm</xsl:attribute>
</xsl:attribute-set>

<!-- Параметры абзаца: абзацный отступ -->
<xsl:attribute-set name="indent.para.spacing"
                   use-attribute-sets="normal.para.spacing">
  <xsl:attribute name="text-indent">
    <xsl:value-of select="$espd.text-indent"/>
  </xsl:attribute>
</xsl:attribute-set>

<xsl:template match="d:para|d:simpara">
  <xsl:choose>
    <xsl:when test="parent::d:simplesect
                   |parent::d:section
                   |parent::d:sect1
                   |parent::d:sect2
                   |parent::d:sect3
                   |parent::d:sect4
                   |parent::d:sect5
                   |parent::d:part
                   |parent::d:preface
                   |parent::d:appendix
                   |parent::d:chapter">
      <fo:block xsl:use-attribute-sets="indent.para.spacing">
        <xsl:call-template name="anchor"/>
        <xsl:apply-templates/>
      </fo:block>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:attribute-set name="noindent.para.spacing"
    use-attribute-sets="normal.para.spacing">
  <xsl:attribute name="text-indent">0mm</xsl:attribute>
</xsl:attribute-set>

<!--
<xsl:template match="d:entry/d:para">
  <fo:block xsl:use-attribute-sets="noindent.para.spacing">
    <xsl:call-template name="anchor"/>
    <xsl:apply-templates/>
  </fo:block>
</xsl:template>
-->

<xsl:template match="d:para/*">
  <fo:wrapper xsl:use-attribute-sets="noindent.para.spacing">
    <xsl:apply-imports/>
  </fo:wrapper>
</xsl:template>

</xsl:stylesheet>
