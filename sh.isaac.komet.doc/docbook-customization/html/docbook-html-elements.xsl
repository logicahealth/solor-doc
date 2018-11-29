<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:d="http://docbook.org/ns/docbook"
  xmlns:exsl="http://exslt.org/common"
  exclude-result-prefixes="exsl d"
  version="1.0">

<!-- $Id: docbook-html-elements.xsl,v 1.2 2016/02/05 19:01:23 bobs Exp $ -->

<xsl:import href="../../docbook-xsl-ns-1.79.1/html/docbook.xsl"/>
<xsl:import href="docbook-common.xsl"/>

<!-- Add here any customizations of element formats -->

<!--==============================================================-->
<!--  Parameter settings                                          -->
<!--==============================================================-->
<!-- Some parameter settings can be found in docbook-common.xsl -->

<!--==============================================================-->
<!--  Template customizations                                     -->
<!--==============================================================-->
<!-- Add support for the new elements, based on the template for example -->
<xsl:template match="d:requirement | d:editorial-rule">
  <xsl:variable name="param.placement"
             select="substring-after(normalize-space($formal.title.placement),
                     concat(local-name(.), ' '))"/>

  <xsl:variable name="placement">
    <xsl:choose>
      <xsl:when test="contains($param.placement, ' ')">
        <xsl:value-of select="substring-before($param.placement, ' ')"/>
      </xsl:when>
      <xsl:when test="$param.placement = ''">before</xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$param.placement"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:call-template name="formal.object">
    <xsl:with-param name="placement" select="$placement"/>
  </xsl:call-template>

</xsl:template>

<!-- Add new Lists of for new elements. This version is used
for single-page HTML output -->
<xsl:template name="make.lots">
  <xsl:param name="toc.params" select="''"/>
  <xsl:param name="toc"/>

  <xsl:if test="contains($toc.params, 'toc')">
    <xsl:copy-of select="$toc"/>
  </xsl:if>

  <xsl:if test="contains($toc.params, 'figure')">
    <xsl:call-template name="list.of.titles">
      <xsl:with-param name="titles" select="'figure'"/>
      <xsl:with-param name="nodes" select=".//d:figure"/>
    </xsl:call-template>
  </xsl:if>

  <xsl:if test="contains($toc.params, 'table')">
    <xsl:call-template name="list.of.titles">
      <xsl:with-param name="titles" select="'table'"/>
      <xsl:with-param name="nodes" select=".//d:table[not(@tocentry = 0)]"/>
    </xsl:call-template>
  </xsl:if>

  <xsl:if test="contains($toc.params, 'example')">
    <xsl:call-template name="list.of.titles">
      <xsl:with-param name="titles" select="'example'"/>
      <xsl:with-param name="nodes" select=".//d:example"/>
    </xsl:call-template>
  </xsl:if>

  <xsl:if test="contains($toc.params, 'requirement')">
    <xsl:call-template name="list.of.titles">
      <xsl:with-param name="titles" select="'requirement'"/>
      <xsl:with-param name="nodes" select=".//d:requirement"/>
    </xsl:call-template>
  </xsl:if>

  <xsl:if test="contains($toc.params, 'editorial-rule')">
    <xsl:call-template name="list.of.titles">
      <xsl:with-param name="titles" select="'editorial-rule'"/>
      <xsl:with-param name="nodes" select=".//d:editorial-rule"/>
    </xsl:call-template>
  </xsl:if>

  <xsl:if test="contains($toc.params, 'equation')">
    <xsl:call-template name="list.of.titles">
      <xsl:with-param name="titles" select="'equation'"/>
      <xsl:with-param name="nodes" select=".//d:equation[d:title or d:info/d:title]"/>
    </xsl:call-template>
  </xsl:if>

  <xsl:if test="contains($toc.params, 'procedure')">
    <xsl:call-template name="list.of.titles">
      <xsl:with-param name="titles" select="'procedure'"/>
      <xsl:with-param name="nodes" select=".//d:procedure[d:title]"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<!-- add support for new elements -->
<xsl:template name="list.of.titles">
  <xsl:param name="toc-context" select="."/>
  <xsl:param name="titles" select="'table'"/>
  <xsl:param name="nodes" select=".//d:table"/>

  <xsl:if test="$nodes">
    <div class="list-of-{$titles}s">
      <xsl:choose>
        <xsl:when test="$make.clean.html != 0">
          <div class="toc-title">
            <xsl:call-template name="gentext">
              <xsl:with-param name="key">
                <xsl:choose>
                  <xsl:when test="$titles='table'">ListofTables</xsl:when>
                  <xsl:when test="$titles='figure'">ListofFigures</xsl:when>
                  <xsl:when test="$titles='equation'">ListofEquations</xsl:when>
                  <xsl:when test="$titles='example'">ListofExamples</xsl:when>
                  <xsl:when test="$titles='procedure'">ListofProcedures</xsl:when>
                  <xsl:when test="$titles='requirement'">ListofRequirements</xsl:when>
                  <xsl:when test="$titles='editorial-rule'">ListofEditorialRules</xsl:when>
                  <xsl:otherwise>ListofUnknown</xsl:otherwise>
                </xsl:choose>
              </xsl:with-param>
            </xsl:call-template>
          </div>
        </xsl:when>
        <xsl:otherwise>
          <p>
            <b>
              <xsl:call-template name="gentext">
                <xsl:with-param name="key">
                  <xsl:choose>
                    <xsl:when test="$titles='table'">ListofTables</xsl:when>
                    <xsl:when test="$titles='figure'">ListofFigures</xsl:when>
                    <xsl:when test="$titles='equation'">ListofEquations</xsl:when>
                    <xsl:when test="$titles='example'">ListofExamples</xsl:when>
                    <xsl:when test="$titles='procedure'">ListofProcedures</xsl:when>
                    <xsl:when test="$titles='requirement'">ListofRequirements</xsl:when>
                    <xsl:when test="$titles='editorial-rule'">ListofEditorialRules</xsl:when>
                    <xsl:otherwise>ListofUnknown</xsl:otherwise>
                  </xsl:choose>
                </xsl:with-param>
              </xsl:call-template>
            </b>
          </p>
        </xsl:otherwise>
      </xsl:choose>

      <xsl:element name="{$toc.list.type}">
        <xsl:apply-templates select="$nodes" mode="toc">
          <xsl:with-param name="toc-context" select="$toc-context"/>
        </xsl:apply-templates>
      </xsl:element>
    </div>
  </xsl:if>
</xsl:template>

<xsl:template match="d:figure|d:table|d:example|d:equation|d:procedure|
                     d:requirement|d:editorial-rule" mode="toc">
  <xsl:param name="toc-context" select="."/>

  <xsl:element name="{$toc.listitem.type}">
    <xsl:variable name="label">
      <xsl:apply-templates select="." mode="label.markup"/>
    </xsl:variable>
    <xsl:copy-of select="$label"/>
    <xsl:if test="$label != ''">
      <xsl:value-of select="$autotoc.label.separator"/>
    </xsl:if>
    <a>
      <xsl:attribute name="href">
        <xsl:call-template name="href.target">
          <xsl:with-param name="toc-context" select="$toc-context"/>
        </xsl:call-template>
      </xsl:attribute>
      <xsl:apply-templates select="." mode="titleabbrev.markup"/>
    </a>
  </xsl:element>
</xsl:template>

<!-- These titles are handled by formal.object.heading -->
<xsl:template match="d:requirement/d:title"/>
<xsl:template match="d:editorial-rule/d:title"/>

</xsl:stylesheet>
