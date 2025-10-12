# TP 02 XSLT

## Objectif
Réaliser une feuille de transformation XSLT afin de convertir un document TEI simple en un document HTML.

## Exercice

Ouvrir le testament de Roland Garros (`will_AN_0384.xml`) et le fichier `teitohtml.xsl` dans Oxygen, puis créer les règles suivantes :

### 1. Nœud document
Définir une première règle pour le **nœud document** afin d’appliquer les modèles aux nœuds descendants.


### 2. Transformer l’élément `<TEI>` en `<html>`
Créer une règle qui transforme l’élément `TEI` en un élément HTML `<html>`.


### 3. Transformer l’en-tête TEI en `<head>` HTML
Créer une règle pour l’élément `teiHeader` afin qu’il soit transformé en un élément HTML `<head>` contenant :

- un élément HTML `<meta charset="utf-8"/>`
- un élément HTML `<title>` dont la valeur textuelle correspond au titre principal du document TEI.


### 4. Transformer le corps TEI en `<body>` HTML
Créer une règle qui transforme l’élément TEI `body` en un élément HTML `<body>`, et appliquer les modèles aux nœuds descendants pour continuer la transformation.

### 5. Transformer les éléments du corps
Créer des règles pour transformer les éléments suivants :

- `head`
- `dateline`
- `p`
- `signed`

Ces éléments TEI doivent être convertis en paragraphes HTML `<p>`.

Pour les éléments `head` et `dateline`, ajouter un **attribut `@class`** dont la valeur correspond à celle de l’attribut TEI `@rend`.


### 6. Transformer les retours à la ligne
Créer une règle qui transforme les éléments `lb` en éléments HTML `<br/>`.


### 7. Transformer les sauts de page
Créer une règle qui transforme les éléments `pb` en une **valeur textuelle** de la forme "[valeur de l'attribut n] "
