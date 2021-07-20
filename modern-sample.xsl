<?xml version="1.0" encoding="UTF-8"?>
<!--
     Пример стилевого файла для <docbook>ЕСПД</docbook>
-->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:d="http://docbook.org/ns/docbook"
    exclude-result-prefixes="d"
    version="1.1">

    <xsl:import href="espd/modern.xsl"/>

    <!-- Без ЛУ -->
     <xsl:template name="front.cover"/> 

    <!-- Титульный лист состоит из одной стоноры -->
    <!--<xsl:template name="book.titlepage.recto"/>-->

</xsl:stylesheet>
