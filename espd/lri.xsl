<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2014.
  Распространяется на условиях лицензии CC BY-SA 4.0.

  http://lab50.net/
-->

<!-- Лист регистрации изменений. -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
    version="1.1">

  <fo:simple-page-master master-name="lripage"
                         page-width="{$page.width}"
                         page-height="{$page.height}"
                         margin-top="{$page.margin.top}"
                         margin-bottom="{$page.margin.bottom}"
                         margin-left="{$page.margin.inner}"
                         margin-right="{$page.margin.outer}">
    <fo:region-body margin-bottom="{$body.margin.bottom}"
                    margin-top="{$body.margin.top}"
                    column-count="{$column.count.titlepage}">
    </fo:region-body>
    <fo:region-before region-name="xsl-region-before-even"
                      extent="{$region.before.extent}"
                      display-align="before"/>
    <fo:region-after region-name="xsl-region-after-even"
                     extent="{$region.after.extent}"
                     display-align="after"/>
  </fo:simple-page-master>

  <xsl:template name="select.user.pagemaster">
    <xsl:param name="element"/>
    <xsl:param name="pageclass"/>
    <xsl:param name="default-pagemaster"/>

    <!-- Return my customized title page master name if for titlepage,
         otherwise return the default -->

    <xsl:choose>
      <xsl:when test="$default-pagemaster = 'back'">
        <xsl:value-of select="'my-new-titlepage'" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$default-pagemaster"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>

