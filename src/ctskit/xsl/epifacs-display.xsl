<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id: start-edition.xsl 1510 2008-08-14 15:27:51Z zau $ -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:cts="http://chs.harvard.edu/xmlns/cts3">

  <xsl:include href="global-varsandparams.xsl"/>

  <!-- html related stylesheets, these may import tei{element} stylesheets if relevant eg. htm-teigap and teigap -->
  <xsl:include href="epidoc/htm-teiab.xsl"/>
  <xsl:include href="epidoc/htm-teiapp.xsl"/>
  <xsl:include href="epidoc/htm-teidiv.xsl"/>
  <xsl:include href="epidoc/htm-teidivedition.xsl"/>
  <xsl:include href="epidoc/htm-teiforeign.xsl"/>
  <xsl:include href="epidoc/htm-teifigure.xsl"/>
  <xsl:include href="epidoc/htm-teig.xsl"/>
  <xsl:include href="epidoc/htm-teigap.xsl"/>
  <xsl:include href="epidoc/htm-teihead.xsl"/>
  <xsl:include href="epidoc/htm-teihi.xsl"/>
  <xsl:include href="epidoc/htm-teilb.xsl"/>
  <xsl:include href="epidoc/htm-teilgandl.xsl"/>
  <xsl:include href="epidoc/htm-teilistanditem.xsl"/>
  <xsl:include href="epidoc/htm-teilistbiblandbibl.xsl"/>
  <xsl:include href="epidoc/htm-teimilestone.xsl"/>
  <xsl:include href="epidoc/htm-teinote.xsl"/>
  <xsl:include href="epidoc/htm-teinum.xsl"/>
  <xsl:include href="epidoc/htm-teip.xsl"/>
  <xsl:include href="epidoc/htm-teiseg.xsl"/>
  <xsl:include href="epidoc/htm-teispace.xsl"/>
  <xsl:include href="epidoc/htm-teisupplied.xsl"/>
  <xsl:include href="epidoc/htm-teiterm.xsl"/>
  <xsl:include href="epidoc/htm-teiaddanddel.xsl"/>
  
  <xsl:include href="htm-teixref.xsl"/>

  <!-- tei stylesheets that are also used by start-txt -->
  <xsl:include href="epidoc/teiabbrandexpan.xsl"/>
  <xsl:include href="epidoc/teicertainty.xsl"/>
  <xsl:include href="epidoc/teichoice.xsl"/>
  <xsl:include href="epidoc/teihandshift.xsl"/>
  <xsl:include href="epidoc/teiheader.xsl"/>
  <xsl:include href="epidoc/teimilestone.xsl"/>
  <xsl:include href="epidoc/teiorig.xsl"/>
  <xsl:include href="epidoc/teiorigandreg.xsl"/>
  <xsl:include href="epidoc/teiq.xsl"/>
  <xsl:include href="epidoc/teisicandcorr.xsl"/>
  <xsl:include href="epidoc/teispace.xsl"/>
  <xsl:include href="epidoc/teisupplied.xsl"/>
  <xsl:include href="epidoc/teisurplus.xsl"/>
  <xsl:include href="epidoc/teiunclear.xsl"/>

  <!-- html related stylesheets for named templates -->
  <xsl:include href="epidoc/htm-tpl-lang.xsl"/>
  <xsl:include href="epidoc/htm-tpl-license.xsl"/>
  
  <xsl:include href="htm-tpl-scripts.xsl"/>
  <xsl:include href="htm-tpl-apparatus-portlet.xsl"/>
  <!-- xsl:include href="htm-tpl-metadata.xsl"/ -->
  <xsl:include href="htm-tpl-nav-pn.xsl"/>

  <!-- global named templates with no html, also used by start-txt -->
  <xsl:include href="epidoc/tpl-reasonlost.xsl"/>
  <xsl:include href="epidoc/tpl-certlow.xsl"/>
  <xsl:include href="epidoc/tpl-text.xsl"/>

  <xsl:param name="xml-only"/>
  <xsl:param name="blockid"/>
  <xsl:param name="hide"/>
  <xsl:param name="blocktype"/>

  <!-- HTML FILE -->
  <xsl:template match="/">
    <!-- <xsl:param name='leiden-style'>ddbdp</xsl:param> -->
        <!-- Found in htm-tpl-cssandscripts.xsl -->
        <xsl:call-template name="css-script"/>

        <!-- Found in htm-tpl-nav.xsl -->
        <!-- xsl:call-template name="topNavigation"/-->

        <!-- Found in htm-tpl-metadata.xsl -->
        <!-- Would need to change once combined -->
        <xsl:if test="starts-with(//TEI/@id, 'hgv')">
          <xsl:call-template name="metadata"/>
        </xsl:if>
        <div id="{$blockid}">
          <xsl:if test="$hide">
            <xsl:attribute name="style">display:none;</xsl:attribute>
          </xsl:if>
          <xsl:choose>
            <xsl:when test="$xml-only">
              <textarea><xsl:copy-of select="//tei:TEI"/></textarea>
            </xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates select="//tei:TEI//tei:div[@type=$blocktype]"/>
            </xsl:otherwise>
          </xsl:choose>
        </div>
  </xsl:template>
  <xsl:template name="metadata"></xsl:template>

  <!--xsl:template match="tei:w[@rend]">
      <span class="{@rend}" urn="urn:cts:epigraphy.perseus.org:igvii.2543-2545.perseus-grc1:2543.1:Σκῆνος[1]"><xsl:value-of select="."/></span>
  </xsl:template-->

</xsl:stylesheet>
