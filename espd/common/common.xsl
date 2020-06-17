<?xml version="1.0" encoding="UTF-8"?>
<!--
  Общие параметры для всех стилей в оформлении документов в формате DocBook 5.
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

    <xsl:variable name="uppercase-alphabet" select="'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
    <xsl:variable name="lowercase-alphabet" select="'абвгдеёжзийклмнопрстуфхцчшщъыьэюяabcdefghijklmnopqrstuvwxyz'"/>

    <xsl:template name="ucase">
        <xsl:param name="string" />
        <xsl:value-of select="translate($string,
                                        $lowercase-alphabet,
                                        $uppercase-alphabet)" />
    </xsl:template>

</xsl:stylesheet>
