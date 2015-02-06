<?xml version="1.0" encoding="UTF-8"?>
<!--
     Стиль для форматирования документов в формате DocBook 5.

     © Лаборатория 50, 2013-2015.

     Распространяется на условиях лицензии GPL 3.

     http://lab50.net
-->

<!-- Секции вопрос-ответ -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.1">
    
<xsl:template name="qandaset.label.length">
  <xsl:param name="deflabel">
    <xsl:apply-templates select="." mode="qanda.defaultlabel"/>
  </xsl:param>

  <xsl:variable name="label-width">
    <xsl:call-template name="pi.dbfo_label-width"/>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="$label-width != ''">
      <xsl:value-of select="$label-width"/>
    </xsl:when>
    <xsl:when test="$deflabel = 'number'">
      <xsl:value-of select="$espd.text-indent"/>
    </xsl:when>
    <xsl:otherwise>
        <xsl:apply-imports/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>

