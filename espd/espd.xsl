<?xml version="1.0" encoding="UTF-8"?>
<!--
     Стиль для форматирования документов в формате DocBook 5.

     © Лаборатория 50, 2013-2014.

     Распространяется на условиях лицензии GPL 3.

     http://lab50.net
-->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.1">
<xsl:import href="http://docbook.sourceforge.net/release/xsl-ns/current/fo/docbook.xsl"/>

<xsl:include href="page.xsl"/>
<xsl:include href="common/params.xsl"/>
<xsl:include href="core.xsl"/>
<xsl:include href="common/text.xsl"/>
<xsl:include href="titles.xsl"/>
<xsl:include href="headings.xsl"/>
<xsl:include href="list.xsl"/>
<xsl:include href="common/object.xsl"/>
<xsl:include href="common/l10n.xsl"/>
<xsl:include href="titlepage.xsl"/>
<xsl:include href="lu.xsl"/>
<xsl:include href="lri.xsl"/>
<xsl:include href="verbatim.xsl"/>

<xsl:param name="body.font.family">GentiumAlt</xsl:param>
<xsl:param name="sans.font.family">FreeSans</xsl:param>
<xsl:param name="title.font.family">URW Gothic L</xsl:param>
<xsl:param name="symbol.font.family">OpenSymbol,Symbol</xsl:param>

<!--
<xsl:template name="book.titlepage.recto"/>
<xsl:template name="book.titlepage.before.recto"/>
<xsl:template name="book.titlepage.before.verso"/>-->
  
<xsl:param name="generate.toc">
    book      toc,title
</xsl:param>
  
</xsl:stylesheet>
