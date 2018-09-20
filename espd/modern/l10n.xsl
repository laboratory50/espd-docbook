<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Шаблоны названий разделов, ссылок, объектов и т.п. -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.1">
 
<xsl:param name="local.l10n.xml" select="document('')"/>

<l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0"> 
  <l:l10n language="ru">
    <l:gentext key="Step" text="шаг"/>
    <l:gentext key="step" text="шаг"/>
    <l:context name="xref-number">
      <l:template name="table" text="табл.&#160;%n"/>
      <l:template name="figure" text="рис.&#160;%n"/>
      <l:template name="chapter" text="разд.&#160;%n"/>
      <l:template name="section" text="&#167;&#160;%n"/>
      <l:template name="simplesect" text="&#167;&#160;%n"/>
      <l:template name="appendix" text="прил.&#160;%n"/>
    </l:context>
    <l:context name="title-numbered">
      <l:template name="chapter" text="%n %t"/>
      <l:template name="section" text="%n %t"/>
      <l:template name="simplesect" text="%t"/>
    </l:context>
    <l:context name="title">
      <l:template name="figure" text="Рисунок&#160;%n.&#160;%t"/>
      <l:template name="appendix" text="Приложение %n. %t"/>
    </l:context>
  </l:l10n>
</l:i18n>

</xsl:stylesheet>
