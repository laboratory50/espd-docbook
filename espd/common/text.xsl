<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

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
  <xsl:attribute name="space-before.maximum">0em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">0mm</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0mm</xsl:attribute>
  <xsl:attribute name="space-after.maximum">0.4em</xsl:attribute>
  <xsl:attribute name="text-indent">0mm</xsl:attribute>
</xsl:attribute-set>

<!-- Параметры абзаца: абзацный отступ -->
<xsl:attribute-set name="indent.para.spacing"
                   use-attribute-sets="normal.para.spacing">
  <xsl:attribute name="text-indent">
    <xsl:value-of select="$espd.text-indent"/>
  </xsl:attribute>
  <xsl:attribute name="space-before.optimum">0mm</xsl:attribute>
  <xsl:attribute name="space-before.minimum">0mm</xsl:attribute>
  <xsl:attribute name="space-before.maximum">0.4em</xsl:attribute>
  <xsl:attribute name="space-after.optimum">0mm</xsl:attribute>
  <xsl:attribute name="space-after.minimum">0mm</xsl:attribute>
  <xsl:attribute name="space-after.maximum">0.4em</xsl:attribute>
</xsl:attribute-set>

<!-- Абзацный отступ -->
<!-- !!! Конфликтует с espd/list!!! -->
<xsl:attribute-set name="para.properties"
     xsl:use-attribute-sets="normal.para.spacing">
  <xsl:attribute name="text-indent">
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
                   |parent::d:tip
                   |parent::d:chapter
                   |parent::d:abstract
                   |parent::d:acknowledgements">
        <xsl:value-of select="$espd.text-indent"/>
      </xsl:when>
      <xsl:otherwise>0mm</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
</xsl:attribute-set>

</xsl:stylesheet>
