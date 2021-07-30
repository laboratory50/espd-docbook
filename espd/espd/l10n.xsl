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
      <l:template name="section" text="подразд.&#160;%n"/>
      <l:template name="simplesect" text="&#167;&#160;%n"/>
      <l:template name="appendix" text="прил.&#160;%n"/>
    </l:context>
    <!-- Нумерованные заголовки в теле документа -->
    <l:context name="title-numbered">
      <l:template name="chapter" text="%n. %t"/>
      <l:template name="section" text="%n. %t"/>
      <l:template name="simplesect" text="%t"/>
      <l:template name="appendix" text="Приложение %n"/>
    </l:context>
    <l:context name="title">
      <l:template name="figure" text="Рисунок %n.&#160;%t"/>
      <l:template name="appendix" text="Приложение %n.&#13;%t"/>
      <l:template name="note" text="Примечание. "/>
      <l:template name="important" text="Важно. "/>
      <l:template name="warning" text="Предупреждение. "/>
    <!-- Слово таблица - разреженное ГОСТ 19.106-78 -> ГОСТ 1.5-2001 -->
      <l:template name="table" text="Т а б л и ц а&#160;&#160;%n — %t"/>
    </l:context>
  </l:l10n>
</l:i18n>

</xsl:stylesheet>
