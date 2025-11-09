---
title:
    \textbf{Transformations éditoriales avancées}
subtitle:
    LHQ1C1M1\newline
    Master 2 Humanités numériques
lang: fr-FR
beamer: true
urlcolor: red
theme: metropolis
aspectratio: 169
syntax-highlighting: tango
mainfont: "IBM Plex Sans"
monofont: "IBM Plex Mono"
---

## XSLT

*eXstensible Stylesheet Language Transformations*

---

## Paramètres de sortie - `<xsl:output/>`

L’élément `<xsl:output/>` permet de configurer les paramètres de sortie :

- `@method` : format de sortie (`"xml"` par défaut | `"html"` | `"xhtml"` | `"text"` | `"json"` )
- `@encoding` : encodage des caractères (`"UFT-8"`)
- `@indent` : règle d'indentation (`"true"` | `"false"` | `"1"` | `"0"`)

[Liste des autres paramètres](https://www.saxonica.com/html/documentation12/xsl-elements/output.html)

---

## `<xsl:result-document/>`

L’élément `<xsl:result-document/>` est utilisé pour diriger la sortie vers une destination secondaire, par exemple un fichier, un mail, une URI, etc.

Il est très intéressant pour produire plusieurs fichiers automatiquement.

---

## `<xsl:result-document/>`

```xml
<xsl:template match="div[@type='chapter']">
    <xsl:result-document href="{./@xml:id}.html" method="xhtml">
        <html>
            <head><xsl:value-of select="head"/></head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
        <xsl:apply-templates/>
    </xsl:result-document>
</xsl:template>
```

---

## Copier `<xsl:copy-of/>` et `<xsl:copy-of/>`

L'élément `<xsl:copy-of/>` permet d'ajouter dans l'arbre de sortie un élément de l'arbre d'entrée, sans le modifier.

```xml
<xsl:template match="ref">
    <a href="{ ./@target }"><xsl:apply-templates/></a>
    <xsl:copy-of select="."/>
</xsl:template>

<xsl:template match="emph">
    <em><xsl:apply-templates/></em>
</xsl:template>
```

Résultat :

```xml
<a href="www.w3.org/TR/xslt-30/">The <em>XSLT</em> Standard</a>
<ref target="www.w3.org/TR/xslt-30/">The <emph>XSLT</emph> Standard</ref>
```

---

## Copier `<xsl:copy-of/>` et `<xsl:copy-of/>`

L'élément `<xsl:copy/>` crée une paire de balises (ouvrante et fermante) dont le nom est celui de l'élément courant, mais ni les nœuds descendants, ni les attributs ne sont copiés.

```xml
<xsl:template match="ref">
    <xsl:copy><xsl:apply-templates/></xsl:copy>
</xsl:template>

<xsl:template match="emph">
    <em><xsl:apply-templates/></em>
</xsl:template>
```

Résultat :

```xml
<ref>The <em>XSLT</em> Standard</ref>
```
---

## Copier `<xsl:copy-of/>` et `<xsl:copy-of/>` - Copie intégrale

```xml
<xsl:template match="node() | @*">
    <xsl:copy>
        <xsl:apply-templates match="node() | @*"/>
    </xsl:copy>
</xsl:template>
```

---

## Trier avec `<xsl:sort/>`

L’instruction `<xsl:sort/>` permet de trier des nœuds afin, par exemple de les ordonner alphabétiquement.

Il s'utilise comme enfant des éléments `<xsl:apply-templates/>` et `<xsl:for-each/>`.

- l'attribut `@select` correspond à la clé de tri ;
- l'attribut `@order` définie le sens du tri (ascendant ou descendant)
- l'attribut `@data-type` permet de préciser si l’on souhaite un tri alphabétique ou numérique

---

## Trier avec `<xsl:sort/>`

```xml
<list>
   <item>c</item>
   <item>a</item>
   <item>b</item>
</list>

<xsl:template match="list">
    <xsl:apply-templates select="item">
        <xsl:sort select="."/>
    </xsl:apply-templates>
</xsl:template>
```

résultat : `abc`

---

## Les boucles `<xsl:for-each-group/>`

L'instruction `<xsl:for-each-group/>` permet d’itérer non pas sur un ensemble de nœuds, mais sur des **groupes** de nœuds.

- l'attribut `@select` identifie les nœuds à grouper ;
- les attributs `@group-by`, `@group-adjacent`, `@group-starting-with` et `@group-ending-with` indiquent comment les grouper.

- la fonction `current-groupin-key()` retourne la clé de regroupement (si `@group-by`) ;
- la fonction `current-group()` retourne le groupe courant.

---

## Les règles modèles nommées

---

## Les fonctions

---
