<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:exsl="http://exslt.org/common"
  xmlns:d="http://docbook.org/ns/docbook"
  exclude-result-prefixes="exsl d"
  version="1.0">

<!-- $Id: docbook-html-chunk.xsl,v 1.2 2016/02/05 19:01:23 bobs Exp $ -->

<xsl:import href="docbook-html-elements.xsl"/>

<xsl:import href="../../docbook-xsl-ns-1.79.1/html/chunk-common.xsl"/>

<xsl:include href="../../docbook-xsl-ns-1.79.1/html/chunk-code.xsl"/>

<!-- add any parameter or customizations that affect chunking behavior here -->
<!-- If you customize a template with a "match" attribute, then add
a priority="1" attribute to that xsl:template -->

<!--==============================================================-->
<!--  Parameter settings                                          -->
<!--==============================================================-->
<!-- Change this to change depth of chunking -->
<xsl:param name="chunk.section.depth" select="2"/>

<!--==============================================================-->
<!--  Template customizations                                     -->
<!--==============================================================-->
<!-- This adds List of for the new elements. 
This version is used for chunked output. -->
<xsl:template name="make.lots">
  <xsl:param name="toc.params" select="''"/>
  <xsl:param name="toc"/>

  <xsl:variable name="lots">
    <xsl:if test="contains($toc.params, 'toc')">
      <xsl:copy-of select="$toc"/>
    </xsl:if>

    <xsl:if test="contains($toc.params, 'figure')">
      <xsl:choose>
        <xsl:when test="$chunk.separate.lots != '0'">
          <xsl:call-template name="make.lot.chunk">
            <xsl:with-param name="type" select="'figure'"/>
            <xsl:with-param name="lot">
              <xsl:call-template name="list.of.titles">
                <xsl:with-param name="titles" select="'figure'"/>
                <xsl:with-param name="nodes" select=".//d:figure"/>
              </xsl:call-template>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="list.of.titles">
            <xsl:with-param name="titles" select="'figure'"/>
            <xsl:with-param name="nodes" select=".//d:figure"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>

    <xsl:if test="contains($toc.params, 'table')">
      <xsl:choose>
        <xsl:when test="$chunk.separate.lots != '0'">
          <xsl:call-template name="make.lot.chunk">
            <xsl:with-param name="type" select="'table'"/>
            <xsl:with-param name="lot">
              <xsl:call-template name="list.of.titles">
                <xsl:with-param name="titles" select="'table'"/>
                <xsl:with-param name="nodes" select=".//d:table[not(@tocentry = 0)]"/>
              </xsl:call-template>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="list.of.titles">
            <xsl:with-param name="titles" select="'table'"/>
            <xsl:with-param name="nodes" select=".//d:table[not(@tocentry = 0)]"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>

    <xsl:if test="contains($toc.params, 'example')">
      <xsl:choose>
        <xsl:when test="$chunk.separate.lots != '0'">
          <xsl:call-template name="make.lot.chunk">
            <xsl:with-param name="type" select="'example'"/>
            <xsl:with-param name="lot">
              <xsl:call-template name="list.of.titles">
                <xsl:with-param name="titles" select="'example'"/>
                <xsl:with-param name="nodes" select=".//d:example"/>
              </xsl:call-template>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="list.of.titles">
            <xsl:with-param name="titles" select="'example'"/>
            <xsl:with-param name="nodes" select=".//d:example"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>

    <xsl:if test="contains($toc.params, 'requirement')">
      <xsl:choose>
        <xsl:when test="$chunk.separate.lots != '0'">
          <xsl:call-template name="make.lot.chunk">
            <xsl:with-param name="type" select="'requirement'"/>
            <xsl:with-param name="lot">
              <xsl:call-template name="list.of.titles">
                <xsl:with-param name="titles" select="'requirement'"/>
                <xsl:with-param name="nodes" select=".//d:requirement"/>
              </xsl:call-template>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="list.of.titles">
            <xsl:with-param name="titles" select="'requirement'"/>
            <xsl:with-param name="nodes" select=".//d:requirement"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>

    <xsl:if test="contains($toc.params, 'editorial-rule')">
      <xsl:choose>
        <xsl:when test="$chunk.separate.lots != '0'">
          <xsl:call-template name="make.lot.chunk">
            <xsl:with-param name="type" select="'editorial-rule'"/>
            <xsl:with-param name="lot">
              <xsl:call-template name="list.of.titles">
                <xsl:with-param name="titles" select="'editorial-rule'"/>
                <xsl:with-param name="nodes" select=".//d:editorial-rule"/>
              </xsl:call-template>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="list.of.titles">
            <xsl:with-param name="titles" select="'editorial-rule'"/>
            <xsl:with-param name="nodes" select=".//d:editorial-rule"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>

    <xsl:if test="contains($toc.params, 'equation')">
      <xsl:choose>
        <xsl:when test="$chunk.separate.lots != '0'">
          <xsl:call-template name="make.lot.chunk">
            <xsl:with-param name="type" select="'equation'"/>
            <xsl:with-param name="lot">
              <xsl:call-template name="list.of.titles">
                <xsl:with-param name="titles" select="'equation'"/>
                <xsl:with-param name="nodes" select=".//d:equation[d:title or d:info/d:title]"/>
              </xsl:call-template>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="list.of.titles">
            <xsl:with-param name="titles" select="'equation'"/>
            <xsl:with-param name="nodes" select=".//d:equation[d:title or d:info/d:title]"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>

    <xsl:if test="contains($toc.params, 'procedure')">
      <xsl:choose>
        <xsl:when test="$chunk.separate.lots != '0'">
          <xsl:call-template name="make.lot.chunk">
            <xsl:with-param name="type" select="'procedure'"/>
            <xsl:with-param name="lot">
              <xsl:call-template name="list.of.titles">
                <xsl:with-param name="titles" select="'procedure'"/>
                <xsl:with-param name="nodes" select=".//d:procedure[d:title]"/>
              </xsl:call-template>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="list.of.titles">
            <xsl:with-param name="titles" select="'procedure'"/>
            <xsl:with-param name="nodes" select=".//d:procedure[d:title]"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:variable>

  <xsl:if test="string($lots) != ''">
    <xsl:choose>
      <xsl:when test="$chunk.tocs.and.lots != 0 and not(parent::*)">
        <xsl:call-template name="write.chunk">
          <xsl:with-param name="filename">
            <xsl:call-template name="make-relative-filename">
              <xsl:with-param name="base.dir" select="$chunk.base.dir"/>
              <xsl:with-param name="base.name">
                <xsl:call-template name="dbhtml-dir"/>
                <xsl:value-of select="$chunked.filename.prefix"/>
                <xsl:apply-templates select="." mode="recursive-chunk-filename">
                  <xsl:with-param name="recursive" select="true()"/>
                </xsl:apply-templates>
                <xsl:text>-toc</xsl:text>
                <xsl:value-of select="$html.ext"/>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:with-param>
          <xsl:with-param name="content">
            <xsl:call-template name="chunk-element-content">
              <xsl:with-param name="prev" select="/d:foo"/>
              <xsl:with-param name="next" select="/d:foo"/>
              <xsl:with-param name="nav.context" select="'toc'"/>
              <xsl:with-param name="content">
                <xsl:if test="$chunk.tocs.and.lots.has.title != 0">
                  <h1>
                    <xsl:apply-templates select="." mode="object.title.markup"/>
                  </h1>
                </xsl:if>
                <xsl:copy-of select="$lots"/>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:with-param>
          <xsl:with-param name="quiet" select="$chunk.quietly"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:copy-of select="$lots"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:if>
</xsl:template>


</xsl:stylesheet>
