<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСКД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Шаблоны названий разделов, ссылок, объектов и т.п. -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    exclude-result-prefixes="d"
    version="1.1">

    <xsl:param name="appendix.autolabel">1</xsl:param>
    <xsl:param name="appendix.label.includes.component.label">1</xsl:param>

    <xsl:param name="local.l10n.xml" select="document('')"/>
        <l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0"> 
            <l:l10n language="ru">
                <l:context name="xref-number">
                    <l:template name="table" text="табл.&#160;%n"/>
                    <l:template name="figure" text="рис.&#160;%n"/>
                    <l:template name="section" text="раздел&#160;%n"/>
                    <l:template name="simplesect" text="подраздел&#160;%n"/>
                    <l:template name="chapter" text="глава %n"/>
                </l:context>
                <!-- Нумерованные заголовки в теле документа -->
                <l:context name="title-numbered">
                    <l:template name="chapter" text="%n. %t"/>
                    <l:template name="section" text="%n. %t"/>
                    <!-- цифры в нумерации приложений -->
                    <l:template name="appendix" text="Приложение&#160;%n" lang="ru"/>
                </l:context>
                <l:context name="title">
                    <l:template name="appendix" text="Приложение %n. %t" lang="ru"/>
                    <!-- Слово таблица - разреженное -->
                    <l:template name="table" text="Т а б л и ц а&#160;&#160;%n — %t"/>
                    <l:template name="note" text="П р и м е ч а н и е — "/>
                    <!-- Оформление рисунков (ГОСТ 2.105-95)-->
                    <!-- Слово "Рисунок" и наименование помещают после пояснительных данных и 
                    располагают следующим образом: Рисунок 1 - Детали прибора.-->
                    <l:template name="figure" text="Рисунок %n — %t"/>
                </l:context>
            </l:l10n>
        </l:i18n>

</xsl:stylesheet>
