<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id$ -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:t="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="t" 
                version="1.0">
  <!-- Imported from [htm|txt]-teinote.xsl -->

  <xsl:template match="t:note">
      <xsl:text>(</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>)</xsl:text>
  </xsl:template>


</xsl:stylesheet>