<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id: htm-teigap.xsl 1725 2012-01-10 16:08:31Z gabrielbodard $ -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:t="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="t" 
                version="2.0">
  <!-- Imported templates can be found in teigap.xsl -->
  <xsl:import href="teigap.xsl"/>
  
  <xsl:template match="t:gap[@reason = 'lost']">
      <xsl:if test="@extent='unknown' and @reason='lost' and @unit='line' and ($leiden-style = 'ddbdp' or $leiden-style = 'sammelbuch') 
         and not(preceding-sibling::t:*[1][local-name() = 'lb'])">
         <!--     adds a newline character before gap-extent-line in DDbDP unless <lb/> present    -->
         <br/>
      </xsl:if>
      <xsl:apply-imports/>
  </xsl:template>
  
</xsl:stylesheet>