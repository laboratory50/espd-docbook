<?xml version="1.0" encoding="UTF-8"?>
<!--
  Стиль оформления ЕСКД документов в формате DocBook 5.
  © Лаборатория 50, 2013-2018.
  Распространяется на условиях лицензии GPL 3.

  http://lab50.net/
-->
<!-- Перечисления -->
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:d="http://docbook.org/ns/docbook"
    exclude-result-prefixes="d"
    version="1.1">

    <!-- отступы dedication (в спецификации) -->
    <xsl:attribute-set name="component.title.properties">
        <xsl:attribute name="space-after.minimum">
            <xsl:choose>
                <xsl:when test="ancestor-or-self::d:dedication">0.1em</xsl:when>
                <xsl:otherwise>2.8em</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="space-after.optimum">
            <xsl:choose>
                <xsl:when test="ancestor-or-self::d:dedication">0.1em</xsl:when>
                <xsl:otherwise>3em</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="space-after.maximum">
            <xsl:choose>
                <xsl:when test="ancestor-or-self::d:dedication">0.1em</xsl:when>
                <xsl:otherwise>3.2em</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <!-- Выравнивание отступов -->
    <!--<xsl:template name="nongraphical.admonition">
        <xsl:param name="content">
            <xsl:apply-templates/>
        </xsl:param>
        <xsl:variable name="id">
            <xsl:call-template name="object.id"/>
        </xsl:variable>

        <fo:block id="{$id}"
                  xsl:use-attribute-sets="nongraphical.admonition.properties">
            <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
            <xsl:attribute name="padding-top">0pt</xsl:attribute>
            <xsl:attribute name="padding-right">0pt</xsl:attribute>
            <xsl:attribute name="padding-left">0em</xsl:attribute>
            <xsl:attribute name="margin-left">0pt</xsl:attribute>
            <xsl:attribute name="margin-bottom">0em</xsl:attribute>
            <xsl:attribute name="margin-right">0pt</xsl:attribute>
            <xsl:attribute name="margin-top">0em</xsl:attribute>
            <xsl:attribute name="text-indent">
                <xsl:value-of select="$espd.text-indent"/>
            </xsl:attribute>
            <fo:block xsl:use-attribute-sets="admonition.properties">
            <xsl:apply-templates select="." mode="object.title.markup"/>
            <xsl:value-of select="$content"/>
            </fo:block>
        </fo:block>
    </xsl:template>-->


<!--     !!!Переписать!!! -->
<!--     !!Избавиться от констант!! -->
<!--     !mm заменить на em! -->
<!--     espd.text-indent в common.params -->
<!--     orderedlist.label.width itemizedlist.label.width в common.list -->


    <!-- Отбивка и отступы перечислений -->
    <xsl:attribute-set name="list.block.spacing">
        <xsl:attribute name="space-before.optimum">0mm</xsl:attribute>
        <xsl:attribute name="space-before.minimum">0mm</xsl:attribute>
        <xsl:attribute name="space-before.maximum">0.2mm</xsl:attribute>
        <xsl:attribute name="space-after.optimum">0mm</xsl:attribute>
        <xsl:attribute name="space-after.minimum">0mm</xsl:attribute>
        <xsl:attribute name="space-after.maximum">0.2mm</xsl:attribute>
        <!--   Абзацный отступ перечислений -->
        <xsl:attribute name="margin-left">-7mm</xsl:attribute>
    </xsl:attribute-set>

    <!-- Отбивка пунктов перечислений. -->
    <xsl:attribute-set name="list.item.spacing">
        <xsl:attribute name="space-before.optimum">0</xsl:attribute>
        <xsl:attribute name="space-before.minimum">0</xsl:attribute>
        <xsl:attribute name="space-before.maximum">0.2em</xsl:attribute>
        <xsl:attribute name="space-after.optimum">0mm</xsl:attribute>
        <xsl:attribute name="space-after.minimum">0mm</xsl:attribute>
        <xsl:attribute name="space-after.maximum">0.2mm</xsl:attribute>
        <!-- положение знака перечислений -->
<!--         <xsl:attribute name="text-indent">19.5mm</xsl:attribute> -->
    </xsl:attribute-set>

    <!-- Положение знаков перечислений относительно отступа -->
    <!-- !!! Это так же есть в common.text !!! -->
    <!-- Абзацный отступ -->
    <xsl:attribute-set name="para.properties"
        xsl:use-attribute-sets="normal.para.spacing">
        <xsl:attribute name="text-indent">
            <xsl:choose>
                <xsl:when test="parent::d:simplesect
                            |parent::d:section
                            |parent::d:sect1
                            |parent::d:sect2
                            |parent::d:sect3
                            |parent::d:sect4
                            |parent::d:sect5
                            |parent::d:part
                            |parent::d:preface
                            |parent::d:appendix
                            |parent::d:tip
                            |parent::d:note
                            |parent::d:caution
                            |parent::d:important
                            |parent::d:warning
                            |parent::d:chapter
                            |parent::d:abstract
                            |parent::d:acknowledgements">
                    <xsl:value-of select="$espd.text-indent"/>
                </xsl:when>
                <xsl:when test="parent::d:listitem">19.5mm</xsl:when>
                <xsl:otherwise>0mm</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>
