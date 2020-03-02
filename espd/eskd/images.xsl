<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСКД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    exclude-result-prefixes="d"
    version="1.1">

    <!-- screen по центру -->
    <xsl:attribute-set name="monospace.verbatim.properties">
        <xsl:attribute name="text-align">
            <xsl:choose>
                <xsl:when test="self::d:screen">center</xsl:when>
                <xsl:otherwise>left</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>
