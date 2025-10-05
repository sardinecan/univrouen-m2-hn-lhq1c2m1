# Transformations éditoriales avancées
LHQ1C1M1

---
## Calendrier des cours

6 séances :
- 6 octobre (8h30-10h30)
    - **XPath** (et 1re XSLT ?)
- 13 octobre (8h30-10h30)
    - **XSLT**, les *templates*, déclarer éléments et attributs, *copy* et *copy-of*
- 10 novembre (8h30-10h30 **et** 13h30-16h30)
    - **XSLT** : les modes, variables et opérations sur les chaînes
    - **XSLT** : *eval. XPath 1h l'après-midi* ; les conditions et boucles
- 17 novembre (13h30-16h30)
    - **XSLT** : les *templates "name"* et fonctions
- 24 novembre (13h30-16h30)
    - *éval. terminale 3h*

---
## Objectifs du cours

- Introduction aux langages XPath et XSLT…
- …essentiellement pour le traitement de documents XML-TEI
- maîtrise des concepts fondamentaux
- panorama des méthodes de publication de documents XML ?

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

---
## XPath

--
## Bibliographie

- Birnbaum D. J. « What can XPath do for me? ». Disponible sur : <[http://dh.obdurodon.org/introduction-xpath.xhtml](http://dh.obdurodon.org/introduction-xpath.xhtml)>
- Harold E. R., Means W. S. XML en concentré : manuel de référence. Paris, France : O’Reilly, 2005. ISBN : 2-84177-353-1.
- « XML Path Language (XPath) 3.1 ». Disponible sur : <[https://www.w3.org/TR/xpath-31/](https://www.w3.org/TR/xpath-31/)>

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

Une expression *XPath* est un **chemin** composé d'une série d'étapes, où chaque étape correspond à un type de nœud à traverser.

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

- Le point de départ d'un chemin XPath peut être :
    - la racine (`/`), 
    - le nœud contextuel (`.`),
    - le nœud parent (`..`), 
    - ou *n'importe où* (`//`) ;
- chaque étape est séparée de la précédente par l'opérateur `/`.

--

#### Exercice
Ouvrir le fichier `gdpBrice1684.tei.xml` dans OxygenXML.

- donner le chemin de localisation absolu de la `racine`, du nœud `TEI` et du nœud `body`.
- sélectionner tous les nœuds `persName` peut importe où ils se trouvent.

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

##### Exercice axes

- sélectionner tous les nœuds `persName` parents d'un nœud `surName`
- sélectionner tous les nœuds `forename` qui précèdent d'un nœud `surName` et partagent en même parent.

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

Les opérateurs de séquences
- `|` ou `union` : union
- `intersect` : intersection
- `except` : exclusion
- `()` : combinaison



</span>

</div>

--
<!-- .slide: class="custom" -->

Exercice nœuds et jokers

- sélectionner tous les attributs `type`.
- séléctionner tous les nœuds parents d'un attribut `rend`.
- sélectionner tous les commentaires.

--
<!-- .slide: class="custom" -->

#### Les prédicats

Les *prédicats* sont des conditions de sélection. Ce sont des expressions XPath placées entre crochets « `[]` » à la suite d'un nœud. Ils correspondent aux conditions que doivent remplir un nœud pour être retenu. Chaque étape d’un chemin XPath peut contenir *0* ou *n* prédicats.


```XPath
//persName[3]

//choice[orig]
```

--
Exercice Prédicats

- sélectionner tous les nœuds `placeName` qui ont la position 2 dans l'arbre.
- sélectionner tous les nœuds `persName` qui disposent d'un attribut `xml:id`.
- sélectionner tous les nœuds `persName` qui disposent d'un attribut `xml:id` et qui ont pour parent un nœud `p`.

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
'On en a gros !'
"Faut pas respirer la compote, ça fait tousser."
"Moi j'ai appris à lire, et ben je souhaite ça à personne."
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
4 mod 3 <!-- 1 -->
2+2  <!-- 4 -->
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

--
##### Exercice chaînes, nombres et booléens

- Sélectionner toutes les *divisions* de type *section*.
- Sélectionner tous les *nœuds* avec un attribut *rend* égal à *superscript* ou *initial*



---
### Les fonctions XPath

-- 
<!-- .slide: class="custom" -->

#### Fonctions sur les nombres

<div class="r-fit-text">

```xpath
<!-- <node>2</node> -->
/node/number() => 2.0
<!-- ou -->
/number(node)
```

- *number* `number(object?)` : convertit son argument en nombre
- *number* `sum(node-set nodes)` : somme de tous les nœuds en argument
- *number* `floor(number x)` : retourne le plus grand entier inférieur ou égal à x
- *number* `ceiling(number x)` : retourne le plus petit entier supérieur ou égal à x
- *number* `round(number x)` : retourne l’entier le plus proche de x

</div>

--
##### Exercice sur les nombres

Ouvir le fichier `fonctions.xml` dans OxygenXML. Puis, dans le nœud `nombres` :

- Convertire les premier et second nœuds `n` fils de `nombres`
- faire la somme des nœuds `n` fils de `somme`
- faire l'arrondi au plus proche du nœud `arrondi`

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

- *boolean* `boolean(object o)` : convertit l’argument en booléen
- *boolean* `not(boolean)` : inverse la valeur de l’argument (vrai devient faux et faux devient vrai)
- *boolean* `true()` : retourne toujours vrai
- *boolean* `false()` : retourne toujours faux

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

- *number* `position()` : position du nœud courant dans l’ensemble contextuel
- *number* `count(nodeset?)` : compte le nombre de nœuds en argument
- *string* `local-name(node-set?)` : retourne le nom local du nœud
- *string* `name(node-set?)` : retourne le nom qualifié du nœud (préfixe + nom local)
- *string* `namespace-uri(node-set?)` : retourne l’espace de nom du nœud

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

- *string* `string(string?)` : convertit un objet en chaîne de caractères
- *string* `concat(string, string, string*)` : concatène les arguments
- *string* `normalize-space(string?)` : retire les blancs en début ou fin de chaîne, et remplace les groupes d’espaces ou les retour à la ligne par un espace unique
- *number* `string-length(string?)` : retourne la longueur de la chaîne de caractères en argument
- *boolean* `starts-with(string s1, string s2)` : vérifie si la chaîne s1 commence par la chaîne s2

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

- *boolean* `contains(string s1, string s2)` : vérifie que la chaîne s1 contient la chaîne s2
- *string* `substring-before(string s1, string s2)` : retourne la sous-chaîne de s1 placée avant s2
- *string* `substring-after(string s1, string s2)` : retourne la sous-chaîne de s1 placée après s2
- *string* `substring(string s, index, length?)` : retourne la sous-chaîne de s commençant à l’index et de longueur lenght
- *string* `translate(string s1, string s2, string s3)` : remplace dans s1 chaque occurrence de s2 par une occurrence de s3

</div>

--

##### Exerice fonctions sur les chaînes

Ouvrir le fichier `gdpBrice1684.tei.xml` dans OxygenXML.

- pour chaque `persName` fils d'un `respStmt`, effectuer la concaténation des nœuds fils `forename` et `surname`.
- chercher tous les `placeName` qui contiennent le mot *église*.

--- 
## TP XPath

--
<!-- .slide: class="custom" -->

<div class="r-fit-text">

### Chemins simples
1. Écrire le chemin absolu vers le nœud *racine* du document, vers le nœud *text* et vers le nœud *sourceDesc*.
2. Une fois dans le nœud *sourceDesc*, écrire le chemin relatif vers le nom du manuscrit ;

### Jokers et opérateurs
3. Sélectionner tous les nœuds *persName*, quel que soit leur emplacement dans le document
4. Sélectionner à la fois tous les nœuds *lb*, et tous les nœuds *pb*
5. Sélectionner tous les *sic* descendant d'un *choice* n'importe où dans le document, excepté les nœuds qui descendent d'un *paragraphe*
6. Sélectionner tous les *sic* ET les *corr* descendant d'un *choice* n'importe où dans le document, excepté les nœuds qui descendent d'un *paragraphe*

</div>

-- 
<!-- .slide: class="custom" -->

<div class="r-fit-text">

### Prédicats
7. Sélectionner le premier descendant de l'élément *TEI*
8. Sélectionner uniquement les saut de ligne avec une attribut *break*
9. Sélectionner les *placeName* de valeur *'Paris'*
10. Sélectionner les *paragraphes* ayant un descendant *placeName* de valeur *'Paris'*
11. Sélectionner tous les nœuds comportant un attribut *type*
12. Sélectionner tous les nœuds comportant un attribut *type* ou un *xml:id*
13. Sélectionner tous les nœuds comportant un attribut *type* et un *xml:id*
14. Sélectionner tous les placeName possédant un attribut *type* de valeur 'willPlace' ou de valeur 'otherPlace'

### Syntaxe non abrégée
15. Sélectionner le nœud parent de tous les nœuds comportant un attribut *type*
16. Sélectionner tous les *éléments frères* suivant le *premier paragraphe* de la *div*
17. Sélectionner tous les nœuds qui sont ancètres du premier paragraphe de la div

</div>

--
<!-- .slide: class="custom" -->

<div class="r-fit-text">

### Fonctions et tests

#### Fonctions sur les nombres

18. Compter tous les débuts de ligne (*lb*)

#### Fonctions sur les boléens
19. Sélectionner tous les noms de lieu dont le type n'est pas 'willPlace'
20. Sélectionner le dernier nœud *date* dans l'ordre du document (i.e. un nœud date, tel qu'il n'ait pas de successeur du même type dans l'ordre du document)

#### Comparaisons et fonctions sur les nœuds
21. Sélectionner les nœuds dont la position est supérieure à 2

### Exercices (plus) avancés
22. Sélectionner tous les *éléments enfants* de *TEI* dont la *position est supérieure à 1*
23. récupérer le *nom local* de tous les *éléments parents* des attributs *type*
24. modifier l'expression précédente pour récupérer *l'espace de nom* de tous les *éléments parents* des attributs *type*
25. la modifier pour récupérer les deux et les concaténer en les séparant par deux points
26. la modifier pour n'avoir que des valeurs uniques (ou distinctes)
27. Récupérer les éléments *date*, dont l'attribut *when* commence par « 1914 »
</div>


<!-- https://github.com/ArianePinche/coursParisIII_XSLT/blob/main/seance1/seance1.pdf -->
<!-- http://dh.obdurodon.org/introduction-xpath.xhtml -->
<!-- https://github.com/tei-fr/formationEnc2017-10/blob/master/Diapos/12-xsltNuls.html -->
