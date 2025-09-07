# Transformations éditoriales avancées
LHQ1C1M1

--- 
## Objectifs du cours

- Introduction aux langages XPath et XSLT…
- …essentiellement pour le traitement de documents XML-TEI
- maîtrise des concepts fondamentaux
- panorama des méthodes de publication de documents XML.

---
## Bibliographie

@todo

---
## Éléments de définition

--
<!-- .slide: class="custom" -->
### XPath/XSLT

- **XPath** : syntaxe non XML pour parcourir un *arbre* XML
- **XSLT** : application XML pour transformer un *arbre* XML

XPath et XSLT sont des standards développés et maintenus par le *World Wide Web Consortium* (W3C)

XPath est un langage *intégré* dans de nombreuses applications XML ou non (DOM, XSLT, XML Schema, XForms, XQuery, etc.)

--
<!-- .slide: class="custom" -->
### Arborescence

<div class="r-fit-text">

Qu'est-ce qu'un *arbre* ?

<span class="fragment">Un *arbre* est une structure hiérarchique composée de **nœuds**.</span>

<span class="fragment">Qu'est-ce qu'un *nœud* ?</span>

<span class="fragment">Un *nœud* correspond à une composante d'un arbre pouvant contenir une sous-arborescence.</span>

</div>

--
<!-- .slide: class="custom" -->
### Arborescence

Exercice : représenter un arbre XML
```xml
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="hello.xsl"?>
<greeting lang="en">Hello World!</greeting>

```
<!-- .element: class="r-frame" -->

--
### Arborescence


Exercice : représenter un arbre XML
```xml
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="hello.xsl"?>
<greeting lang="en">Hello World!</greeting>

```
<!-- .element: class="r-frame" -->


![xmltree](assets/images/xmltree01.svg)
<!-- .element: class="r-stretch" -->

--
### Arborescence


Exercice : représenter un arbre XML
```xml
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="hello.xsl"?>
<greeting lang="en">Hello World!</greeting>

```
<!-- .element: class="r-frame" -->


![xmltree](assets/images/xmltree03.svg)
<!-- .element: class="r-stretch" -->

---
## XPath

--
<!-- .slide: class="custom" -->

<div class="r-fit-text">

*XPath* peut être utilisé pour effectuer des calculs numériques, manipuler des chaînes de caractères, ou encore évaluer des conditions (booléens), mais surtout :

> « XPath est un langage pour sélectionner des nœuds et ensembles de nœuds \[dans une\] arborescence. »<sup>1</sup>

<cite><sup>1</sup>Harold, Elliotte Rusty et Means, W. Scott. « XML en concentré : manuel de référence »</cite>

</div>

---
<!-- .slide: class="custom" -->
### Chemin de localisation

Une expression *XPath* est un **chemin** composé d'une série d'étapes.

Chaque étape correspond à un type de nœud à traverser.

--
<!-- .slide: class="custom" -->

<div class="r-fit-text">

**Exercice**

Par quelles étapes doit-on passer pour arriver à l'élément `<title/>` ?

```xml
<?xml version="1.0" encoding="UTF-8"?>
<fileDesc>
    <titleStmt>
        <title>IDC 2506 : Fuss [à Condorcet], 7 août 1778</title>
    </titleStmt>
    <publicationStmt>
        <p>unknown</p>
    </publicationStmt>
    <sourceDesc xml:id="IDC2506"/>
</fileDesc>
```

<span class="fragment">On commence à l'élément `<fileDesc/>`, puis on passe à l'élément *fils* `<titleStmt/>`  et enfin on arrive au titre `<title/>`.</span>

<span class="fragment">Avec XPath : `/fileDesc/titleStmt/title`</span>

</div>

--
<!-- .slide: class="custom" -->

- Le point de départ d'un chemin XPath peut être la racine (`/`), le nœud contextuel (`.`), le nœud parent (`..`) ou *n'importe où* (`//`) ;
- chaque étape est séparée de la précédente par l'opérateur `/`.

--

Exercice chemins simples

--
<!-- .slide: class="custom" -->
#### Les axes

<div class="r-fit-text">

Sans indication particulière, on *descend* dans l'arborescence, mais il est possible de naviguer selon différents **axes** :

- `self::` : nœud courant (`.`) ;
- `attribute::` : nœud attribut – c’est un axe particulier (`@nomAttribut`) ;
- `child::` : nœud enfant – seuls les nœuds racine et éléments ont des enfants ;
- `parent::` : le nœud parent (`..`)
- `descendant::` tous les nœuds contenus par le nœud courant (`//`)
- `ancestor::` tous les nœuds qui contiennent le nœud courant
- `ancestor-or-self::` tous les nœuds qui contiennent le nœud courant, y compris ce dernier
- `descendant-or-self::` tous les nœuds contenus par le nœud courant, y compris ce dernier
- `following::` tous les nœuds qui suivent le nœud courant
- `preceding::` tous les nœuds qui précèdent le nœud courant
- `following-sibling::` tous les nœuds qui partagent un parent et suivent le nœud courant
- `preceding-sibling::` tous les nœuds qui partagent un parent et précèdent le nœud courant

</div>

--

#### Les axes

![Axes XPath](https://jrebecchi.github.io/xpath-helper/_images/xpath-axes.jpg)
<!-- .element: class="r-stretch" -->

--

Exercice axes 

--
<!-- .slide: class="custom" -->

#### Les nœuds XML

<div class="r-fit-text">

Il existe **7** types de **nœuds** :

- le nœud *racine* (≠ de l’**élément racine**, on parle aussi de nœud *document*), il est unique (`/`)
- les nœuds *éléments* (`nomElement`)
- les nœuds *attributs* (`@nomAttribut`)
- les nœuds *texte* (`text()`)
- les nœuds *commentaires* (`comment()`)
- les nœuds *instructions de traitement* (`processing-instruction()`)
- les nœuds d’*espace de nom*

<span class="fragment">

Les *Jokers*

- `*` : tout nœud élément
- `node()` : n'importe quel nœud
- `@*` : tout nœud attribut

</span>

</div>

--
<!-- .slide: class="custom" -->

Exercice avancé avec joker



--
<!-- .slide: class="custom" -->

#### Les prédicats

Les *prédicats* sont des conditions de sélection. Ce sont des expressions XPath placées entre crochets « `[]` » à la suite d'un nœud. Ils correspondent à une condition que doit remplir le nœud pour être retenu. Chaque étape d’un chemin XPath peut contenir 0 ou n prédicats. 


```XPath
//persName[3]

//choice[orig]
```

--

Exercice Prédicat

--
<!-- .slide: class="custom" -->


---
### Autres expressions XPath

<!--
Les chemins de localisation ne sont pas les seules expression XPath qui existent.
En revanche, ce sont les seules qui peuvent être utilisées avec les attributs @match des templates XSLT, mais nous verrons cela lors de la prochaine séance.

Les autres expressions XPath peuvent être utilisées pour retourner des valeurs peuvent être des chaines de caractères, des nombres ou encore de booléens.-->

--
<!-- .slide: class="custom" -->
#### Les chaînes de caractères

Les chaînes de caractères (*string*) sont notées entre guillemets simples ou doubles :

```xpath
'Hello World!'
"¡Hola, mundo!"
"Je m'appelle Monde, Raymonde !"
```

--
<!-- .slide: class="custom" -->
#### Les nombres

<div class="r-fit-text">

Une expression XPath peut aussi retourner une nombre entier ou décimal :

```xpath
3

3.14159265359
```

XPath dispose également des 5 opérateurs arithmétiques traditionnels

- addition « `+` »
- soustraction « `-` »
- multiplication « `*` »
- division « `div` »
- modulo « `mod` »

```xpath
4 mod 3 #1
2+2 #4
```

</div>

--
<!-- .slide: class="custom" -->
#### Les booléens

<div class="r-fit-text">

Un **booléen** est une valeur qui a exactement deux états : *vrai* ou *faux*. XPath ne propose pas de représentation littérale des booléens. On utilise plutôt :

- les fonctions `true()` et `false()` ;
- des expressions booléennes avec des opérateurs de comparaison :
    - égal « `=` »,
    - différent « `!=` »,
    - inférieur* « `<` » et inférieur ou égal* « `<=` »,
    - supérieur* « `>` » et supérieur ou égal* « `>=` ».

Les opérateur "et" « `and` » et "ou" « `or` » permettent de combiner les expressions booléennes.

```xpath
//p[position() > 1]
//chapitre[head != 'Introduction']
//chapitre/[@type = 'Introduction' or @type = 'conclusion']
```

</div>

---
### Les fonctions XPath

-- 
<!-- .slide: class="custom" -->

#### Fonctions sur les nombres

<div class="r-fit-text">

```xpath
<!-- <node>string</node> -->
number(node) => NaN
<!-- <node>2</node> -->
/node/number() => 2.0
<!-- <node>3.14</node> -->
ceiling(node) => 4.0
<!-- <node>3.14</node> -->
round(node) => 3.0
```

- number number(object?) : convertit son argument en nombre
- number sum(node-set nodes) : somme de tous les nœuds en argument
- number floor(number x) : retourne le plus grand entier inférieur ou égal à x
- number ceiling(number x) : retourne le plus petit entier supérieur ou égal à x
- number round(number x) : retourne l’entier le plus proche de x

</div>

--
<!-- .slide: class="custom" -->

#### Fonctions sur les booléens

<div class="r-fit-text">

```xpath
<!-- <node>string</node> -->
boolean(node) => true
<!-- <node>string</node> -->
boolean(node/sub)=> false
<!-- <node>string</node> -->
not(boolean(node/sub))=> true
```

- true() => true
- boolean boolean(object o) : convertit l’argument en booléen
- boolean not(boolean) : inverse la valeur de l’argument (vrai devient faux et faux devient vrai)
- boolean true() : retourne toujours vrai
- boolean false() : retourne toujours faux

</div>

--
<!-- .slide: class="custom" -->

#### Fonctions sur les nœuds

<div class="r-fit-text">

```xpath
<!-- <root><node/><node/></root> -->
//node/position() => (1, 2)
<!-- <root><node/><node/></root> -->
count(//node) => 2
<!--
<ns:root xmlns:ns="http://ns">
<ns:node/>
</ns:root>-->
name(/ns:root) => ns:root (préfixe + nom)
local-name(/ns:root) => root
```

- number position() : position du nœud courant dans l’ensemble contextuel
- number count(nodeset?) : compte le nombre de nœuds en argument
- string local-name(node-set?) : retourne le nom local du nœud
- string name(node-set?) : retourne le nom qualifié du nœud (préfixe + nom local)
- string namespace-uri(node-set?) : retourne l’espace de nom du nœud

</div>

--
<!-- .slide: class="custom" -->

#### Fonctions sur les chaînes de caractères

<div class="r-fit-text">

```xpath<!-- <root><node>10</node></root> -->
/root/node/string() => '10'
<!-- <root><node>10</node></root> -->
/root/node/string-length() => 2
concat('Hello', ' World') => 'Hello World'
<!-- <node att="Hello">World</node> -->
/node/concat(@att, .) => 'HelloWorld'
```

- string string(string?) : convertit un objet en chaîne de caractères
- string normalize-space(string?) : retire les blancs en début ou fin de chaîne, et remplace les groupes d’espaces ou les retour à la ligne par un espace unique
- string concat(string, string, string*) : concatène les arguments
- number string-length(string?) : retourne la longueur de la chaîne de caractères en argument
- boolean starts-with(string s1, string s2) : vérifie si la chaîne s1 commence par la chaîne s2

</div>

--
<!-- .slide: class="custom" -->

#### Fonctions sur les chaînes de caractères

<div class="r-fit-text">

```xpath
<!-- <root><node>Hello</node></root> -->
/root/node/contains(., 'Hello') => true
<!-- <root>Hello World</root> -->
substring-before(/root, ' World') => 'Hello'
<!-- <root>Hello World</root> -->
substring(/root, 7, 5) => World
substring(/root, 7) => World
```

- boolean contains(string s1, string s2) : vérifie que la chaîne s1 contient la chaîne s2
- string substring-before(string s1, string s2) : retourne la sous-chaîne de s1 placée avant s2
- string substring-after(string s1, string s2) : retourne la sous-chaîne de s1 placée après s2
- string substring(string s, index, length?) : retourne la sous-chaîne de s commençant à l’index et de longueur lenght
- string translate(string s1, string s2, string s3) : remplace dans s1 chaque occurrence de s2 par une occurrence de s3

</div>

<!-- https://github.com/ArianePinche/coursParisIII_XSLT/blob/main/seance1/seance1.pdf -->
<!-- http://dh.obdurodon.org/introduction-xpath.xhtml -->
<!-- https://github.com/tei-fr/formationEnc2017-10/blob/master/Diapos/12-xsltNuls.html -->
