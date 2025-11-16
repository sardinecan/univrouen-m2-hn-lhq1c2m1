<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xpath-default-namespace="http://www.tei-c.org/ns/1.0"
   exclude-result-prefixes="xs"
   version="2.0">
   <!-- On n'oublie pas d'ajouter l'attribut 
   xpath-default-namespace afin de ne pas avoir à préfixer nos chemins
   xpath avec *: ou tei: par exemple-->
   
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   
   <!-- Il n'est pas nécessaire d'appeler un nœud avec un chemin absolu
   il suffit juste d'indiquer son nom dans @match-->
   <xsl:template match="TEI">
      <html>
         <xsl:apply-templates/>
      </html>
   </xsl:template>
   
   <xsl:template match="teiHeader">
      <head>
         <meta charset="UTF-8"/>
         <title>
            <!-- On n'est pas obligé d'appliquer les templates
            on peut juste créer un élément en sortie, qui peut être vide cf. ci-dessous sur les lb
            ou bien appeler la valeur spécifique d'un nœud avec value-of-->
            <xsl:value-of select="fileDesc/titleStmt/title[@type = 'main']"/>
         </title>
      </head>
   </xsl:template>
   
<!--
   Ou bien, 
   si on utilise la logique fonctionnelle de XSLT
   on créer une règle pour le nœud et on applique un template spécifique
-->
   
   <!--<xsl:template match="teiHeader">
      <head>
         <meta charset="UTF-8"/>
         
         <xsl:apply-templates select="fileDesc/titleStmt/title[@type='main']"/>
      </head>
   </xsl:template>
   
   <xsl:template match="title[@type='main']">
      <title><xsl:value-of select="."/></title>
   </xsl:template>-->
   
   <xsl:template match="body">
      <body>
         <xsl:apply-templates/>
      </body>
   </xsl:template>
   
   <!-- Plutôt que de créer une règle pour head et p
   On peut les combiner en utilisant union ou |
   -->
   
   <xsl:template match="head | p">
      <xsl:element name="p">
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>
   
   <xsl:template match="dateline | signed">
      <xsl:element name="p">
         <xsl:attribute name="class" select="@rend"/>
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>
   
   <xsl:template match="lb">
      <br/>
   </xsl:template>
   
   <xsl:template match="pb">
      <xsl:value-of select="concat('[', @n, ']')"/>
      <!--[<xsl:value-of select="@n"/>]-->
      <!--<xsl:text>[</xsl:text><xsl:value-of select="@n"/><xsl:text>]</xsl:text>-->
   </xsl:template>
   
</xsl:stylesheet>