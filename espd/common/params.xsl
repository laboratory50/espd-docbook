<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2014.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Дополнительные параметры. -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.1">

<xsl:param name="espd.decimal"/>
<!-- <xsl:param name="espd.decimal">АБВГ.50.0001-01</xsl:param> -->
<!-- Абзацный отступ -->
<xsl:param name="espd.text-indent">1.27cm</xsl:param>
<!-- Лист регистрации изменений -->
<xsl:param name="espd.lri">1</xsl:param>
<!-- Шрифт колонтитулов -->
<xsl:param name="espd.heading.font.family">
    <xsl:value-of select="$title.font.family"/>
</xsl:param>

<!-- Рекурсивная нумерация шагов процедуры-->
<xsl:param name="procedure.numeration.recursive">1</xsl:param>

<!-- Размер шрифта машинного текста-->
<xsl:param name="espd.verbatim.font.size">0.9em</xsl:param>

</xsl:stylesheet>

