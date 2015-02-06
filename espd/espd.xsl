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

<xsl:include href="common/page.xsl"/>
<xsl:include href="common/params.xsl"/>
<xsl:include href="core.xsl"/>
<xsl:include href="common/text.xsl"/>
<xsl:include href="titles.xsl"/>
<xsl:include href="espd/headings.xsl"/>
<xsl:include href="list.xsl"/>
<xsl:include href="common/object.xsl"/>
<xsl:include href="common/l10n.xsl"/>
<xsl:include href="titlepage.xsl"/>
<xsl:include href="lu.xsl"/>
<xsl:include href="lri.xsl"/>
<xsl:include href="common/verbatim.xsl"/>
<xsl:include href="common/toc.xsl"/>
<xsl:include href="common/qandaset.xsl"/>

<!--
<xsl:template name="book.titlepage.recto"/>
<xsl:template name="book.titlepage.before.recto"/>
<xsl:template name="book.titlepage.before.verso"/>-->
  
<xsl:param name="generate.toc">
    book      toc,title
</xsl:param>
  
</xsl:stylesheet>
