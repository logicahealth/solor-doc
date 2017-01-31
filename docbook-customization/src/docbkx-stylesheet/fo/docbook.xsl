<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
     xmlns:fo="http://www.w3.org/1999/XSL/Format"
     xmlns:d="http://docbook.org/ns/docbook">
  <!-- imports the original docbook stylesheet -->
  <xsl:import href="../docbook-xsl-ns-1.79.1/fo/docbook.xsl"/>
  
  <!-- Import the settings common to both PDF and HTML -->
  <xsl:import href="../common/docbook-common.xsl"/>
  
  <!-- set below all your custom PDF changes -->

  <!--
    Important links:
    - http://www.sagehill.net/docbookxsl/
    - http://docbkx-tools.sourceforge.net/
  -->
  
  <xsl:output indent="no"/>

<!--==============================================================-->
<!--  Parameter settings                                          -->
<!--==============================================================-->
<!-- start chapters on odd page -->
<xsl:param name="double.sided" select="1"/>
<xsl:param name="force.blank.pages" select="1"/>
<xsl:param name="page.margin.inner">1in</xsl:param>
<xsl:param name="page.margin.outer">1in</xsl:param>


<!--==============================================================-->
<!--  Attribute sets                                              -->
<!--==============================================================-->
  <xsl:attribute-set name="xref.properties">
      <xsl:attribute name="text-decoration">underline</xsl:attribute>
  </xsl:attribute-set>
  
  <!-- Turn off table hyphenation -->
  <xsl:attribute-set name="table.table.properties">
    <xsl:attribute name="hyphenate">false</xsl:attribute>
  </xsl:attribute-set>

<!--==============================================================-->
<!--  Template customizations                                     -->
<!--==============================================================-->
  <xsl:template match="d:guibutton">
    <fo:inline border="1px outset #dddddd" background-color="#dddddd">
      <xsl:call-template name="inline.charseq"/>
    </fo:inline>
  </xsl:template>
  
  <xsl:template match="d:guilabel">
    <fo:inline font-style="italic" font-weight="bold">
      <xsl:call-template name="inline.charseq"/>
    </fo:inline>
  </xsl:template>
  
  <!-- PI to cause a line break
  usage: <?hard-linebreak?>, <?line-break?> or <?lb?>  -->
  <xsl:template match="processing-instruction('lb')">
    <fo:block />
  </xsl:template>

  <xsl:template match="processing-instruction('line-break')">
    <fo:block />
  </xsl:template>

  <xsl:template match="processing-instruction('hard-linebreak')">
    <fo:block break-before='page' />
  </xsl:template>
  
  <!-- Add support for new elements, based on "example" template -->
<xsl:template match="d:requirement | d:editorial-rule" >
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

  <!-- Example doesn't have a pgwide attribute, so may use a PI -->
  <xsl:variable name="pgwide.pi">
    <xsl:call-template name="pi.dbfo_pgwide"/>
  </xsl:variable>

  <xsl:variable name="pgwide">
    <xsl:choose>
      <xsl:when test="$pgwide.pi">
        <xsl:value-of select="$pgwide.pi"/>
      </xsl:when>
      <!-- child element may set pgwide -->
      <xsl:when test="*[@pgwide]">
        <xsl:value-of select="*[@pgwide][1]/@pgwide"/>
      </xsl:when>
    </xsl:choose>
  </xsl:variable>

  <!-- Get align value from internal mediaobject -->
  <xsl:variable name="align">
    <xsl:if test="d:mediaobject|d:mediaobjectco">
      <xsl:variable name="olist" select="d:mediaobject/d:imageobject
                     |d:mediaobjectco/d:imageobjectco
                     |d:mediaobject/d:videoobject
                     |d:mediaobject/d:audioobject
                     |d:mediaobject/d:textobject"/>

      <xsl:variable name="object.index">
        <xsl:call-template name="select.mediaobject.index">
          <xsl:with-param name="olist" select="$olist"/>
          <xsl:with-param name="count" select="1"/>
        </xsl:call-template>
      </xsl:variable>

      <xsl:variable name="object" select="$olist[position() = $object.index]"/>

      <xsl:value-of select="$object/descendant::d:imagedata[@align][1]/@align"/>
    </xsl:if>
  </xsl:variable>

  <xsl:variable name="example">
    <xsl:choose>
      <xsl:when test="$pgwide = '1'">
        <fo:block xsl:use-attribute-sets="pgwide.properties">
          <xsl:if test="$align != ''">
            <xsl:attribute name="text-align">
              <xsl:value-of select="$align"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:call-template name="formal.object">
            <xsl:with-param name="placement" select="$placement"/>
          </xsl:call-template>
        </fo:block>
      </xsl:when>
      <xsl:otherwise>
        <fo:block>
          <xsl:if test="$align != ''">
            <xsl:attribute name="text-align">
              <xsl:value-of select="$align"/>
            </xsl:attribute>
          </xsl:if>
          <xsl:call-template name="formal.object">
            <xsl:with-param name="placement" select="$placement"/>
          </xsl:call-template>
        </fo:block>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="floatstyle">
    <xsl:call-template name="floatstyle"/>
  </xsl:variable>

  <xsl:choose>
    <xsl:when test="$floatstyle != ''">
      <xsl:call-template name="floater">
        <xsl:with-param name="position" select="$floatstyle"/>
        <xsl:with-param name="content" select="$example"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:copy-of select="$example"/>
    </xsl:otherwise>
  </xsl:choose>

</xsl:template>

<!-- add new elements to front Lists of -->
<!-- You can rearrange the order of the lists here -->
<xsl:template name="make.book.tocs">

  <xsl:variable name="lot-master-reference">
    <xsl:call-template name="select.pagemaster">
      <xsl:with-param name="pageclass" select="'lot'"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:variable name="toc.params">
    <xsl:call-template name="find.path.params">
      <xsl:with-param name="table" select="normalize-space($generate.toc)"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:if test="contains($toc.params, 'toc')">
    <xsl:call-template name="page.sequence">
      <xsl:with-param name="master-reference"
                      select="$lot-master-reference"/>
      <xsl:with-param name="element" select="'toc'"/>
      <xsl:with-param name="gentext-key" select="'TableofContents'"/>
      <xsl:with-param name="content">
        <xsl:call-template name="division.toc">
          <xsl:with-param name="toc.title.p" 
                          select="contains($toc.params, 'title')"/>
        </xsl:call-template>

        <xsl:if test="contains($toc.params,'figure') and .//d:figure">
          <fo:block break-before="page"/>
          <xsl:call-template name="list.of.titles">
            <xsl:with-param name="titles" select="'figure'"/>
            <xsl:with-param name="nodes" select=".//d:figure"/>
          </xsl:call-template>
        </xsl:if>

        <xsl:if test="contains($toc.params,'table') and .//d:table">
          <fo:block break-before="page"/>
          <xsl:call-template name="list.of.titles">
            <xsl:with-param name="titles" select="'table'"/>
            <xsl:with-param name="nodes" select=".//d:table[not(@tocentry = 0)]"/>
          </xsl:call-template>
        </xsl:if>

        <xsl:if test="contains($toc.params,'example') and .//d:example">
          <fo:block break-before="page"/>
          <xsl:call-template name="list.of.titles">
            <xsl:with-param name="titles" select="'example'"/>
            <xsl:with-param name="nodes" select=".//d:example"/>
          </xsl:call-template>
        </xsl:if>

        <xsl:if test="contains($toc.params,'requirement') and .//d:requirement">
          <fo:block break-before="page"/>
          <xsl:call-template name="list.of.titles">
            <xsl:with-param name="titles" select="'requirement'"/>
            <xsl:with-param name="nodes" select=".//d:requirement"/>
          </xsl:call-template>
        </xsl:if>

        <xsl:if test="contains($toc.params,'editorial-rule') and .//d:editorial-rule">
          <fo:block break-before="page"/>
          <xsl:call-template name="list.of.titles">
            <xsl:with-param name="titles" select="'editorial-rule'"/>
            <xsl:with-param name="nodes" select=".//d:editorial-rule"/>
          </xsl:call-template>
        </xsl:if>

        <xsl:if test="contains($toc.params,'equation') and 
                 .//d:equation[d:title or d:info/d:title]">
          <fo:block break-before="page"/>
          <xsl:call-template name="list.of.titles">
            <xsl:with-param name="titles" select="'equation'"/>
            <xsl:with-param name="nodes" 
                            select=".//d:equation[d:title or d:info/d:title]"/>
          </xsl:call-template>
        </xsl:if>

        <xsl:if test="contains($toc.params,'procedure') and 
                 .//d:procedure[d:title or d:info/d:title]">
          <fo:block break-before="page"/>
          <xsl:call-template name="list.of.titles">
            <xsl:with-param name="titles" select="'procedure'"/>
            <xsl:with-param name="nodes" 
                            select=".//d:procedure[d:title or d:info/d:title]"/>
          </xsl:call-template>
        </xsl:if>

      </xsl:with-param>
    </xsl:call-template>
  </xsl:if>

</xsl:template>

<xsl:template name="list.of.titles">
  <xsl:param name="titles" select="'table'"/>
  <xsl:param name="nodes" select=".//d:table"/>
  <xsl:param name="toc-context" select="."/>

  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>

  <xsl:if test="$nodes">
    <fo:block id="lot...{$titles}...{$id}"
        xsl:use-attribute-sets="toc.margin.properties">
      <xsl:choose>
        <xsl:when test="$titles='table'">
          <xsl:call-template name="list.of.tables.titlepage"/>
        </xsl:when>
        <xsl:when test="$titles='figure'">
          <xsl:call-template name="list.of.figures.titlepage"/>
        </xsl:when>
        <xsl:when test="$titles='equation'">
          <xsl:call-template name="list.of.equations.titlepage"/>
        </xsl:when>
        <xsl:when test="$titles='requirement'">
          <xsl:call-template name="list.of.requirements.titlepage"/>
        </xsl:when>
        <xsl:when test="$titles='editorial-rule'">
          <xsl:call-template name="list.of.editorial-rules.titlepage"/>
        </xsl:when>
        <xsl:when test="$titles='example'">
          <xsl:call-template name="list.of.examples.titlepage"/>
        </xsl:when>
        <xsl:when test="$titles='procedure'">
          <xsl:call-template name="list.of.procedures.titlepage"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="list.of.unknowns.titlepage"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="$nodes" mode="toc">
        <xsl:with-param name="toc-context" select="$toc-context"/>
      </xsl:apply-templates>
    </fo:block>
  </xsl:if>
</xsl:template>

<xsl:template match="d:requirement|d:editorial-rule" mode="toc">
  <xsl:param name="toc-context" select="."/>
  <xsl:call-template name="toc.line">
    <xsl:with-param name="toc-context" select="$toc-context"/>
  </xsl:call-template>
</xsl:template>

<!-- These styles for the title are copied from fo/titlepage.templates.xsl -->
<xsl:template name="list.of.requirements.titlepage">
  <fo:block xsl:use-attribute-sets="list.of.examples.titlepage.recto.style" space-before.minimum="1em" space-before.optimum="1.5em" space-before.maximum="2em" space-after="0.5em" start-indent="0pt" font-size="17.28pt" font-weight="bold" font-family="{$title.fontset}">
    <xsl:call-template name="gentext">
      <xsl:with-param name="key" select="'ListofRequirements'"/>
    </xsl:call-template>
  </fo:block>
</xsl:template>

<xsl:template name="list.of.editorial-rules.titlepage">
  <fo:block xsl:use-attribute-sets="list.of.examples.titlepage.recto.style" space-before.minimum="1em" space-before.optimum="1.5em" space-before.maximum="2em" space-after="0.5em" start-indent="0pt" font-size="17.28pt" font-weight="bold" font-family="{$title.fontset}">
    <xsl:call-template name="gentext">
      <xsl:with-param name="key" select="'ListofEditorialRules'"/>
    </xsl:call-template>
  </fo:block>
</xsl:template>

<!-- These titles are handled by formal.object.heading template,
so these templates do nothing-->
<xsl:template match="d:requirement/d:title"/>
<xsl:template match="d:editorial-rule/d:title"/>

<!-- You can customize the header content with this template -->
<xsl:template name="header.content">
  <xsl:param name="pageclass" select="''"/>
  <xsl:param name="sequence" select="''"/>
  <xsl:param name="position" select="''"/>
  <xsl:param name="gentext-key" select="''"/>

<!--
  <fo:block>
    <xsl:value-of select="$pageclass"/>
    <xsl:text>, </xsl:text>
    <xsl:value-of select="$sequence"/>
    <xsl:text>, </xsl:text>
    <xsl:value-of select="$position"/>
    <xsl:text>, </xsl:text>
    <xsl:value-of select="$gentext-key"/>
  </fo:block>
-->

  <fo:block>

    <!-- sequence can be odd, even, first, blank -->
    <!-- position can be left, center, right -->
    <xsl:choose>
      <xsl:when test="$sequence = 'blank'">
        <!-- nothing -->
      </xsl:when>

      <xsl:when test="$position='left'">
        <!-- Same for odd, even, empty, and blank sequences -->
        <xsl:call-template name="draft.text"/>
      </xsl:when>

      <xsl:when test="($sequence='odd' or $sequence='even') and $position='center'">
        <xsl:if test="$pageclass != 'titlepage'">
          <xsl:apply-templates select="." mode="titleabbrev.markup"/>
        </xsl:if>
      </xsl:when>

      <xsl:when test="$position='right'">
        <!-- Same for odd, even, empty, and blank sequences -->
        <xsl:call-template name="draft.text"/>
      </xsl:when>

      <xsl:when test="$sequence = 'first'">
        <!-- nothing for first pages -->
      </xsl:when>

      <xsl:when test="$sequence = 'blank'">
        <!-- nothing for blank pages -->
      </xsl:when>
    </xsl:choose>
  </fo:block>
</xsl:template>

<!-- you can customize the footer content with this template -->
<xsl:template name="footer.content">
  <xsl:param name="pageclass" select="''"/>
  <xsl:param name="sequence" select="''"/>
  <xsl:param name="position" select="''"/>
  <xsl:param name="gentext-key" select="''"/>

<!--
  <fo:block>
    <xsl:value-of select="$pageclass"/>
    <xsl:text>, </xsl:text>
    <xsl:value-of select="$sequence"/>
    <xsl:text>, </xsl:text>
    <xsl:value-of select="$position"/>
    <xsl:text>, </xsl:text>
    <xsl:value-of select="$gentext-key"/>
  </fo:block>
-->

  <fo:block>
    <!-- pageclass can be front, body, back -->
    <!-- sequence can be odd, even, first, blank -->
    <!-- position can be left, center, right -->
    <xsl:choose>
      <xsl:when test="$pageclass = 'titlepage'">
        <!-- nop; no footer on title pages -->
      </xsl:when>

      <xsl:when test="$position='center'">
        <fo:page-number/>
      </xsl:when>

      <xsl:otherwise>
        <!-- nop -->
      </xsl:otherwise>
    </xsl:choose>
  </fo:block>
</xsl:template>

</xsl:stylesheet>
