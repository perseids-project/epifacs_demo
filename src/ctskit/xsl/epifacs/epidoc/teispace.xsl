<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id$ -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:t="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
   exclude-result-prefixes="t" version="1.0">
   <!-- Found in [htm|txt]-teispace.xsl -->

   <xsl:template match="t:space">
      <xsl:if test="following::t:*[1][local-name() = 'lb'][@type='inWord']">
         <xsl:text>- </xsl:text>
      </xsl:if>
      <xsl:choose>
         <xsl:when test="$edition-type = 'diplomatic'">
            <xsl:choose>
               <xsl:when test="@unit='line'">
                  <xsl:text>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;</xsl:text>
                  <xsl:call-template name="dip-space"/>
               </xsl:when>
               <xsl:when test="@unit='character' or not(@unit)">
                  <xsl:variable name="sp-ext">
                     <xsl:choose>
                        <xsl:when test="number(@extent)">
                           <xsl:number value="@extent"/>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:number value="3"/>
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:variable>
                  <xsl:call-template name="nbsp">
                     <xsl:with-param name="extent" select="$sp-ext"/>
                  </xsl:call-template>
               </xsl:when>
               <xsl:otherwise/>
            </xsl:choose>
         </xsl:when>

         <xsl:otherwise>
            <xsl:choose>
               <xsl:when test="($leiden-style = 'ddbdp' or $leiden-style = 'sammelbuch')">
                  <xsl:text>vac.</xsl:text>
                  <xsl:choose>
                     <xsl:when test="@quantity">
                        <xsl:if test="@precision='low'">
                           <xsl:text>ca.</xsl:text>
                        </xsl:if>
                        <xsl:value-of select="@quantity"/>
                     </xsl:when>
                     <xsl:when test="@atLeast and @atMost">
                        <xsl:value-of select="@atLeast"/>
                        <xsl:text>-</xsl:text>
                        <xsl:value-of select="@atMost"/>
                     </xsl:when>
                     <xsl:when test="@atLeast ">
                        <xsl:text>&#x2265;</xsl:text>
                        <xsl:value-of select="@atLeast"/>
                     </xsl:when>
                     <xsl:when test="@atMost ">
                        <xsl:text>&#x2264;</xsl:text>
                        <xsl:value-of select="@atMost"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text>?</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <xsl:if test="@unit='line'">
                        <xsl:text> line</xsl:text>
                        <xsl:if test="@quantity > 1 or @extent='unknown' or @atLeast or @atMost">
                           <xsl:text>s</xsl:text>
                        </xsl:if>
                     </xsl:if>
                  
                  <xsl:if test="child::t:certainty[@match='..']">
                     <xsl:text>(?)</xsl:text>
                  </xsl:if>
               </xsl:when>
               
               <xsl:when test="$leiden-style='london'">
                  <xsl:choose>
                     <xsl:when test="@extent = 'unknown'">
                        <!-- Found in [htm|txt]-teispace.xsl -->
                        <xsl:call-template name="space-content">
                           <xsl:with-param name="vacat" select="'vac '"/>
                        </xsl:call-template>
                     </xsl:when>
                     <xsl:when test="@quantity = string(1) and @unit='character'">
                        <xsl:call-template name="space-content">
                           <xsl:with-param name="vacat" select="'v '"/>
                        </xsl:call-template>
                     </xsl:when>
                     <xsl:when test="@quantity = string(2) and @unit='character'">
                        <xsl:call-template name="space-content">
                           <xsl:with-param name="vacat" select="'vv '"/>
                        </xsl:call-template>
                     </xsl:when>
                     <xsl:when test="contains('345', @quantity) and @unit='character'">
                        <!-- Found in [htm|txt]-teispace.xsl -->
                        <xsl:call-template name="space-content">
                           <xsl:with-param name="vacat" select="'vac '"/>
                        </xsl:call-template>
                     </xsl:when>
                     <xsl:when test="@quantity &gt;= 6 and @unit='character'">
                        <xsl:call-template name="space-content">
                           <xsl:with-param name="vacat" select="'vacat '"/>
                        </xsl:call-template>
                     </xsl:when>
                     <xsl:when test="@unit='line'">
                        <xsl:text>&#160;&#160;&#160;&#160;&#160;</xsl:text>
                        <xsl:call-template name="space-content">
                           <xsl:with-param name="vacat" select="'vacat '"/>
                        </xsl:call-template>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:call-template name="space-content">
                           <xsl:with-param name="vacat" select="'vac '"/>
                        </xsl:call-template>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:when>


               <xsl:when test="$leiden-style='panciera'">
                  <xsl:variable name="precision">
                     <xsl:if test="@precision = 'low'">?</xsl:if>
                  </xsl:variable>

                  <xsl:choose>
                     <xsl:when test="@extent = 'unknown'">
                        <!-- Found in [htm|txt]-teispace.xsl -->
                        <xsl:call-template name="space-content">
                           <xsl:with-param name="vacat" select="'vac. '"/>
                        </xsl:call-template>
                     </xsl:when>
                     <xsl:when test="@quantity and @unit='character'">
                        <xsl:call-template name="space-content">
                           <xsl:with-param name="vacat">vac.</xsl:with-param>
                           <xsl:with-param name="extent">
                              <xsl:value-of select="@quantity"/>
                              <xsl:value-of select="$precision"/>
                           </xsl:with-param>
                        </xsl:call-template>
                     </xsl:when>
                     <xsl:when test="@quantity and @unit='line'">
                        <xsl:call-template name="space-content">
                        <!-- Found in [htm|txt]-teispace.xsl -->
                           <xsl:with-param name="vacat">vac.</xsl:with-param>
                           <xsl:with-param name="extent">
                              <xsl:value-of select="@quantity"/>
                              <xsl:text> line</xsl:text>
                              <xsl:if test="@quantity > 1">
                                 <xsl:text>s</xsl:text>
                              </xsl:if>
                              <xsl:value-of select="$precision"/>
                           </xsl:with-param>
                        </xsl:call-template>
                     </xsl:when>
                     <xsl:when test="@quantity and @unit != 'line' and @unit != 'character'">
                        <xsl:call-template name="space-content">
                           <xsl:with-param name="vacat">vac.</xsl:with-param>
                           <xsl:with-param name="extent">
                              <xsl:value-of select="@quantity"/>
                              <xsl:text> </xsl:text>
                              <xsl:value-of select="@unit"/>
                              <xsl:value-of select="$precision"/>
                           </xsl:with-param>
                        </xsl:call-template>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:call-template name="space-content">
                           <xsl:with-param name="vacat" select="'vac. '"/>
                        </xsl:call-template>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:when>


               <xsl:otherwise>
                  <xsl:call-template name="space-content">
                     <xsl:with-param name="vacat" select="'vac. '"/>
                  </xsl:call-template>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template name="nbsp">
      <xsl:param name="extent"/>
      <xsl:if test="$extent &gt; 0">
         <xsl:text>&#xa0;&#xa0;</xsl:text>
         <xsl:call-template name="nbsp">
            <xsl:with-param name="extent" select="$extent - 1"/>
         </xsl:call-template>
      </xsl:if>
   </xsl:template>

   <!-- Called from [htm|txt]-teispace.xsl -->
   <xsl:template name="space-content-1">
      <xsl:param name="vacat"/>

      <xsl:text> </xsl:text>
      <xsl:if test="child::t:certainty[@match='..']">
         <xsl:text>(?)</xsl:text>
      </xsl:if>
      <xsl:value-of select="$vacat"/>
   </xsl:template>


   <!-- Called from [htm|txt]-teispace.xsl -->
   <xsl:template name="space-content-2">
      <xsl:param name="vacat"/>
      <xsl:param name="extent"/>

      <xsl:text>(</xsl:text>
      <xsl:value-of select="$vacat"/>
      <xsl:if test="child::t:certainty[@match='..']">
         <xsl:text>(?)</xsl:text>
      </xsl:if>
      <xsl:text> </xsl:text>
      <xsl:if test="string-length($extent) &gt; 0">
         <xsl:text> </xsl:text>
         <xsl:value-of select="$extent"/>
      </xsl:if>
      <xsl:text>)</xsl:text>
   </xsl:template>

</xsl:stylesheet>
