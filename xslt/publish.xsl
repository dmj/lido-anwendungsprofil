<xsl:transform version="3.0"
               xpath-default-namespace="http://www.w3.org/1999/xhtml"
               xmlns="http://www.w3.org/1999/xhtml"
               xmlns:xs="http://www.w3.org/2001/XMLSchema"
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:mode on-no-match="shallow-copy"/>
  <xsl:mode name="toc" on-no-match="shallow-skip"/>

  <xsl:template match="text()[parent::span[@class = 'line']][starts-with(., ' ')]">
    <xsl:value-of select="replace(., ' ', ' ')"/>
  </xsl:template>

  <xsl:template match="div[@class = 'toc']">
    <div class="toc">
      <h1>Inhaltsverzeichnis</h1>
      <xsl:apply-templates select=".." mode="toc"/>
    </div>
  </xsl:template>

  <xsl:template match="h2|h3|h4">
    <xsl:copy>
      <xsl:attribute name="id" select="generate-id()"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="h2|h3|h4" mode="toc">
    <xsl:copy>
      <a href="#{generate-id()}"><xsl:value-of select="."/></a>
    </xsl:copy>
  </xsl:template>

</xsl:transform>
