<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСКД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->

<!-- Оформление рисунков (ГОСТ 19.106-78)-->
<!-- Тематический заголовок (наименование) помещают над иллюстрацией, подрисуночный текст - под ней. Номер иллюстрации помещают под поясняющими данными. -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    exclude-result-prefixes="d"
    version="1.1">

    <!-- сначала название рисунка, потом номер -->
    <xsl:template match="d:figure" mode="object.title.markup">
        <xsl:param name="allow-anchors" select="0"/>
            <fo:block>
                <xsl:call-template name="substitute-markup">
                    <xsl:with-param name="allow-anchors" select="$allow-anchors"/>
                    <xsl:with-param name="template" select="'%t'"/>
                </xsl:call-template>
            </fo:block>
            <fo:block>
                <xsl:call-template name="substitute-markup">
                    <xsl:with-param name="allow-anchors" select="$allow-anchors"/>
                    <xsl:with-param name="template" select="'Рисунок %n'"/>
                </xsl:call-template>
            </fo:block>
    </xsl:template>

</xsl:stylesheet>
