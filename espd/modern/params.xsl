<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСПД документов в формате DocBook 5.
  © Лаборатория 50, 2014.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Дополнительные параметры современного стиля -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.1">

    <!-- Форматирование заголовков (под)разделов с отступом. -->
    <!-- Если 0, отступ только у разделов, если 1 - у всех ступеней заголовков -->
    <xsl:param name="espd.heading.separation">1</xsl:param>

    <!-- Абзацный отступ -->
    <xsl:param name="espd.text-indent">1.85em</xsl:param>

</xsl:stylesheet>
