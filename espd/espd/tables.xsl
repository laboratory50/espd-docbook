<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСКД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Оформление таблиц -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    exclude-result-prefixes="d"
    version="1.1">

    <!-- Центрирование в заголовке таблицы -->
    <xsl:template name="table.row.properties">
            <xsl:if test="ancestor::d:thead">
                <xsl:attribute name="text-align">center</xsl:attribute>
                <xsl:attribute name="display-align">center</xsl:attribute>
            </xsl:if>

        <xsl:call-template name="espd.row.height"/>
    </xsl:template>

</xsl:stylesheet>
