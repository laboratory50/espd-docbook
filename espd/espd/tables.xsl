<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСКД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Оформление таблиц ГОСТ 19.106-78 -> ГОСТ 1.5-2001-->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    exclude-result-prefixes="d"
    version="1.1">

<!-- Заголовок таблицы отделен двойной линией -->
    <xsl:template name="table.row.properties">
        <xsl:choose>
            <xsl:when test="@role='double' or (ancestor::d:thead and not (following-sibling::d:row) and not (ancestor::d:thead[@role='notdouble']))">
                <xsl:attribute name="border-after-style">double</xsl:attribute>
                <xsl:attribute name="border-after-width">0.5mm</xsl:attribute>
            <!-- Центрирование в заголовке таблицы -->
            <xsl:attribute name="text-align">center</xsl:attribute>
            <xsl:attribute name="display-align">center</xsl:attribute>
            </xsl:when>
        </xsl:choose>
        <xsl:call-template name="espd.row.height"/>
    </xsl:template>

</xsl:stylesheet>
