<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xpath-default-namespace="http://www.tei-c.org/ns/1.0"
   exclude-result-prefixes="xs"
   version="2.0">
   
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   
   <xsl:template match="TEI">
      <html>
         <xsl:apply-templates/>
      </html>
   </xsl:template>
   
   <xsl:template match="teiHeader">
      <head>
         <meta charset="utf-8"/>
         <title><xsl:value-of select="./fileDesc/titleStmt/title[@type='main']"/></title>
      </head>
   </xsl:template>
   
   <xsl:template match="body">
      <body>
         <xsl:apply-templates/>
      </body>
   </xsl:template>
   
   <xsl:template match="head | signed | dateline">
      <p class="{ @rend }"><xsl:apply-templates/></p>
   </xsl:template>
   
   <xsl:template match="p">
      <p><xsl:apply-templates/></p>
   </xsl:template>
   
   <xsl:template match="lb">
      <br/>
   </xsl:template>
   
   <xsl:template match="pb">
      <xsl:value-of select="concat('[', @n, '] ')"/>
   </xsl:template>
   
</xsl:stylesheet>