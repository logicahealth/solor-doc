<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:exsl="http://exslt.org/common"
  xmlns:d="http://docbook.org/ns/docbook"
  exclude-result-prefixes="exsl d"
  version="1.0">

<!-- $Id: docbook-common.xsl,v 1.1 2016/02/05 19:01:22 bobs Exp $ -->

<!-- Common properties for both PDF and HTML outputs -->

<!--==============================================================-->
<!--  Parameter settings                                          -->
<!--==============================================================-->
<xsl:param name="section.autolabel" select="1"/>
<xsl:param name="section.label.includes.component.label" select="1"/>

<!-- This parameter places the element's title either before
(above) or after (below) the content -->
<!-- Add new elements requirement and editorial-rule -->
<xsl:param name="formal.title.placement">
requirement before
editorial-rule before
figure before
example before
equation before
table before
procedure before
task before
</xsl:param>
  
<xsl:param name="bibliography.collection" select="concat('file:///', system-property('user.dir'),'/bibliography-db/src/docbkx/bibliography.xml')"/>


  <!-- Add new lists to book TOC -->
<xsl:param name="generate.toc">
/appendix toc,title
article/appendix  nop
/article  toc,title
book      toc,title,figure,table,example,requirement,editorial-rule,equation
/chapter  toc,title
part      toc,title
/preface  toc,title
reference toc,title
/sect1    toc
/sect2    toc
/sect3    toc
/sect4    toc
/sect5    toc
/section  toc
set       toc,title
</xsl:param>
<!--==============================================================-->
<!--  Generated text settings                                     -->
<!--==============================================================-->
<xsl:param name="local.l10n.xml" select="document('')"/> 
<l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0"> 
  <l:l10n language="en"> 
    <l:gentext key="requirement" text="Requirement"/>
    <l:gentext key="editorial-rule" text="Editorial Rule"/>
    <l:gentext key="ListofRequirements" text="List of Requirements"/>
    <l:gentext key="ListofEditorialRules" text="List of Editorial Rules"/>

    <l:context name="title"> 
      <l:template name="requirement" text="Requirement %n. %t"/>
      <l:template name="editorial-rule" text="Editorial Rule %n. %t"/>
    </l:context>    
    <l:context name="title-numbered"> 
      <l:template name="chapter" text="%n. %t"/>
      <l:template name="appendix" text="%n. %t"/>
    </l:context>    
    <l:context name="xref"> 
      <l:template name="requirement" text="%t"/>
      <l:template name="editorial-rule" text="%t"/>
    </l:context>    
    <l:context name="xref-number"> 
      <l:template name="requirement" text="Requirement %n"/>
      <l:template name="editorial-rule" text="Editorial Rule %n"/>
    </l:context>    
    <l:context name="xref-number-and-title"> 
    <!-- use these instead if want long version for xrefs 
      <l:template name="requirement" text="Requirement %n, “%t”"/>
      <l:template name="editorial-rule" text="Editorial Rule %n, “%t”"/>
    -->
      <l:template name="requirement" text="Requirement %n"/>
      <l:template name="editorial-rule" text="Editorial Rule %n"/>
    </l:context>    
  </l:l10n>
</l:i18n>

<!--==============================================================-->
<!--  Template customizations                                     -->
<!--==============================================================-->
<!-- label.markup mode is used to number elements -->
<xsl:template match="d:requirement | d:editorial-rule" mode="label.markup">
  <xsl:variable name="pchap"
                select="(ancestor::d:chapter
                        |ancestor::d:appendix
                        |ancestor::d:article[ancestor::d:book])[last()]"/>

  <xsl:variable name="prefix">
    <xsl:if test="count($pchap) &gt; 0">
      <xsl:apply-templates select="$pchap" mode="label.markup"/>
    </xsl:if>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="@label">
      <xsl:value-of select="@label"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:choose>
        <xsl:when test="$prefix != ''">
            <xsl:apply-templates select="$pchap" mode="label.markup"/>
            <xsl:apply-templates select="$pchap" mode="intralabel.punctuation">
              <xsl:with-param name="object" select="."/>
            </xsl:apply-templates>
          <xsl:number format="1" from="d:chapter|d:appendix" level="any"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:number format="1" from="d:book|d:article" level="any"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- This template adds support for xrefs to the new elements -->
<xsl:template match="d:requirement|d:editorial-rule" mode="xref-to">
  <xsl:param name="referrer"/>
  <xsl:param name="xrefstyle"/>
  <xsl:param name="verbose" select="1"/>

  <xsl:apply-templates select="." mode="object.xref.markup">
    <xsl:with-param name="purpose" select="'xref'"/>
    <xsl:with-param name="xrefstyle" select="$xrefstyle"/>
    <xsl:with-param name="referrer" select="$referrer"/>
    <xsl:with-param name="verbose" select="$verbose"/>
  </xsl:apply-templates>
</xsl:template>

<!-- This is used in xref formatting -->
<xsl:template match="d:requirement|d:editorial-rule" mode="is.autonumber">
  <xsl:value-of select="'1'"/>
</xsl:template>

</xsl:stylesheet>
