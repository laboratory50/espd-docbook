<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Титульный лист -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
    version="1.1">

<xsl:template name="book.titlepage.verso">

    <!-- Рамка -->
    <xsl:call-template name="eskd.frame"/>

    <!-- Штамп вертикальный слева -->
    <xsl:call-template name="espd.stamp"/>

    <!-- Наполнение -->
    <xsl:call-template name="espd.title.page"/>

</xsl:template>

</xsl:stylesheet>


