<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id$ -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:t="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="t" 
                version="1.0">
  <xsl:include href="teilgandl.xsl"/>

  <xsl:template match="t:lg">
      <div class="textpart">
      <!-- Found in htm-tpl-lang.xsl -->
      <xsl:call-template name="attr-lang"/>
         <xsl:apply-templates/>
      </div>
  </xsl:template>


  <xsl:template match="t:l">
      <xsl:choose>
         <xsl:when test="$verse-lines = 'on'">   
            <xsl:variable name="div-loc">
               <xsl:for-each select="ancestor::t:div[@type='textpart']">
                  <xsl:value-of select="@n"/>
                  <xsl:text>-</xsl:text>
               </xsl:for-each>
            </xsl:variable>
            <br id="a{$div-loc}l{@n}"/>
            <xsl:if test="@n mod $line-inc = 0 and not(@n = 0)">
               <span class="linenumber">
                  <xsl:value-of select="@n"/>
               </span>
            </xsl:if>
            <!-- found in teilgandl.xsl -->
        <xsl:call-template name="line-context"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates/>
         </xsl:otherwise>
      </xsl:choose>
  </xsl:template>

</xsl:stylesheet>