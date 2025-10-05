# Transformations éditoriales avancées
LHQ1C1M1

---
## XSLT

*eXstensible Stylesheet Language Transformations*

--

![transformation XSLT](https://www.oxygenxml.com/img/ls_xslt_transform.png)

XSLT est un langage de transformation

--
<!-- .slide: class="custom" -->

### Une transformation simplissime

<div class="r-fit-text">

A partir de ceci : 
```xml

<ref  target="http://www.tei-c.org">The TEI website</ref>
```
 on veut produire : 
```xml

<a  href="http://www.tei-c.org">The TEI website</a>
```
 donc on va .... 
* transformer l’élément `&lt;ref&gt;` de la TEI dans un élément `&lt;a&gt;` de (x)HTML

* transformer son attribut `@target` dans un attribut `@href`

</div>

--
<!-- .slide: class="custom" -->


### Comment exprimer cela en XSL?

<div class="r-fit-text">

```xml

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">
  <xsl:template match="ref">
    <a href="{@target}">
      <xsl:apply-templates></xsl:apply-templates>
    </a>
  </xsl:template>
</xsl:stylesheet>
```

</div>

--
<!-- .slide: class="custom" -->


### Une transformation plus typique

<div class="r-fit-text">

A partir de ceci :

```xml

<div  type="recette" n="34">
  <head>Pasta pour les débutants</head>
  <list>
    <item>pates</item>
    <item>fromage râpé</item>
  </list>
  <p>Faire bouiller les pates, et mélanger avec le fromage.</p>
</div>
```

on veut produire :

```xml

<html xmlns="http://www.w3.org/1999/xhtml">
  <h1>34: Pasta pour les novices</h1>
  <p>Ingrédients: pates  fromage râpé</p>
  <p>Faire bouiller les pates, et melanger avec le fromage.</p>
</html>
```

</div>

--
<!-- .slide: class="custom" -->


### Comment exprimer cela en XSL?

<div class="r-fit-text">

```xml

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">
  <xsl:template match="div">
    <html>
      <h1>
        <xsl:value-of select="@n"></xsl:value-of>:
        <xsl:value-of select="head"></xsl:value-of>
      </h1>
      <p>Ingrédients:    
          <xsl:apply-templates select="list/item"></xsl:apply-templates>
      </p>
      <p>
        <xsl:value-of select="p"></xsl:value-of>
      </p>
    </html>
  </xsl:template>
</xsl:stylesheet>
```

</div>

--
<!-- .slide: class="custom" -->


### Une feuille de style XSLT

<div class="r-fit-text">

* est un document XML, contenant des éléments de l’espace de noms `http://www.w3.org/1999/XSL/Transform`

* `&lt;xsl:stylesheet&gt;` (élément racine de tout stylesheet) permet de spécifier tous les noms d’espace utilisés, un nom d’espace par défaut, et la version du norme XSLT employé (1 ou 2)

* `&lt;xsl:output&gt;` : spécifie quelques options pour l’arbre de sortie, par exemple son format (HTML, XML, TEXT...), encodage (ISO-8859-1, UTF-8 ...) etc.

```xml

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">
  <xsl:output method="html" encoding="ISO-8859-1"></xsl:output>
  <xsl:template match="/">
    <xsl:apply-templates></xsl:apply-templates>
  </xsl:template>
</xsl:stylesheet>
```

</div>

--
<!-- .slide: class="custom" -->


### Dix éléments XSLT essentiels

<div class="r-fit-text">

* `&lt;xsl:template&gt;` spécifie un modèle de transformation

* `&lt;xsl:apply-templates&gt;` applique des templates

* `&lt;xsl:value-of&gt;` sort une valeur

* `&lt;xsl:text&gt;` sort un morceau de texte

* `&lt;xsl:element&gt;`, `&lt;xsl:attribute&gt;` et `&lt;xsl:comment&gt;` sortent un élément, attribut, ou commentaire

* `&lt;xsl:if&gt;` et `&lt;xsl:choose&gt;` actions conditionnels

* `&lt;xsl:for-each&gt;` bouclage des actions

* `&lt;xsl:variable&gt;` définition de variable

* `&lt;xsl:number&gt;` effectue une numerotation

* `&lt;xsl:sort&gt;` effectue un tri

</div>

--
<!-- .slide: class="custom" -->


### `&lt;xml:template&gt;`

<div class="r-fit-text">

Cet élément spécifie un modèle (des actions) à appliquer à l’ arborescence spécifiée par son attribut `@match`

Il peut contenir d’autres éléments XSL, des éléments d’autres noms d’espace (qui seront copiés), ou rien de tout.

```xml

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">
  <xsl:template match="div">
    <!--  .... actions pour les éléments div... -->
  </xsl:template>
  <xsl:template match="head">
    <!--  .... actions pour tous les éléments head... -->
  </xsl:template>
  <xsl:template match="div/head">
    <!--  .... actions pour les éléments head contenus par un div....-->
  </xsl:template>
  <xsl:template match="teiHeader"></xsl:template>
</xsl:stylesheet>
```

</div>

--
<!-- .slide: class="custom" -->


### Les règles d’or de XSLT

<div class="r-fit-text">

Par défaut, le document est a traiter élément par élément... 
1. Si aucun template ne correspond à un élément, traiter les éléments qu’il contient 

1. Si aucun élément reste à traiter par regle 1, sortir les morceaux de texte contenus par l’ élément

1. Un élément n’est traite que si un template lui correspond

1. L’ordre des templates dans le stylesheet est sans significance

1. Tout partie du document est traitable part tout template, éventuellement plusieurs fois

1. Un stylesheet ne peut contenir que de XML bien-forme

</div>

--
<!-- .slide: class="custom" -->


### Contenu d’un template

<div class="r-fit-text">

Les éléments XML d’un nom d’espaces autre que le XSL se trouvant dans un template sont sortis sans changement. 

Les fragments textuels (plus ou moins) pareils.

Un template vide requiert la sortie de ... rien, donc (s’il est invoqué) il supprime les noeuds concernes.

</div>

--
<!-- .slide: class="custom" -->


### Plusieurs templates peuvent être spécifies pour un même élément en des contextes divers

<div class="r-fit-text">

Comparer 
```xml

<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="head">
  <!-- ... -->
  </xsl:template>
```
 avec 
```xml

<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="div/head">
  <!-- ... -->
</xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="figure/head">
  <!-- ... -->
</xsl:template>
```


En cas de conflit, c’est le template le plus spécifique qui gagne.

</div>

--
<!-- .slide: class="custom" -->


### `&lt;xsl:apply-templates&gt;`

<div class="r-fit-text">

Cet élément rend disponible dans le contexte courant les règles contenus par les templates indiques dans son attribut `@select`. Si aucun template n’est indiqué, tous les templates sont disponibles.

```xml

<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="/">
  <html>
    <xsl:apply-templates></xsl:apply-templates>
  </html>
</xsl:template>
```

```xml

<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="TEI">
    <xsl:apply-templates select="text"></xsl:apply-templates>
  </xsl:template>
```

Il est très utile pour varier l’ordre des sorties: 
```xml

<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="text">
  <h1>Corps du texte</h1>
  <xsl:apply-templates select="body"></xsl:apply-templates>
  <h1>Pièces liminaires</h1>
  <xsl:apply-templates select="front"></xsl:apply-templates>
  <xsl:apply-templates select="back"></xsl:apply-templates>
</xsl:template>
```

</div>

--
<!-- .slide: class="custom" -->


### `&lt;xsl:value-of&gt;`

<div class="r-fit-text">

Cet élément fait sortir la valeur d’un élément ou d’un attribut : 
```xml

<xsl:value-of xmlns:xsl="http://www.w3.org/1999/XSL/Transform" select="/TEI/teiHeader/fileDesc/titleStmt/title"></xsl:value-of>
```


Attention aux doublons potentiels! 
```xml

<xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="div">
  <h2>
    <xsl:value-of select="@n"></xsl:value-of>
    <xsl:value-of select="head"></xsl:value-of></h2>
    <xsl:apply-templates></xsl:apply-templates>
</xsl:template><xsl:template xmlns:xsl="http://www.w3.org/1999/XSL/Transform" match="div/head"></xsl:template>
```

</div>

--
<!-- .slide: class="custom" -->

<div class="r-fit-text">

</div>


