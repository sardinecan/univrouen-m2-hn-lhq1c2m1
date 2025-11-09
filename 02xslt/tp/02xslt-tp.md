# TP 02 XSLT

## Objectif
Réaliser une feuille de transformation XSLT afin de convertir un document TEI en un document (X)HTML.

## Exercice

Ouvrir le testament de Roland Garros (`will_AN_0384.xml`) et le fichier `teitohtml.xsl` dans Oxygen, puis créer les règles suivantes :

### 1. Nœud document
Définissez une première règle pour le **nœud document** afin d’appliquer les modèles aux nœuds descendants.

### 2. Transformer l’élément `<TEI/>` en `<html/>`
Créez une règle qui transforme l’élément `<TEI/>` en un élément HTML `<html/>` et appliquez les modèles.

### 3. Transformer l’en-tête TEI en `<head/>` HTML
Ajoutez une règle pour l’élément `<teiHeader/>` afin qu’il soit transformé en un élément HTML `<head/>` contenant :

- un élément HTML `<meta charset="utf-8"/>`
- un élément HTML `<title/>` dont la valeur textuelle correspond au titre principal du document TEI.

### 4. Transformer le corps TEI en `<body/>` HTML
Créez une règle qui transforme l’élément TEI `<body/>` en un élément HTML `<body/>`, et appliquer les modèles aux nœuds descendants.

### 5. Transformer les éléments du corps
Établissez des *templates* pour transformer les éléments suivants :

- `head`
- `dateline`
- `p`
- `signed`

Ces éléments TEI doivent être convertis en paragraphes HTML `<p/>`.

Pour les éléments `<head/>` et `<dateline/>`, ajouter un **attribut `@class`** dont la valeur correspond à celle de l’attribut TEI `@rend`.

### 6. Transformer les retours à la ligne
Créez une règle qui transforme les éléments `<lb/>` en éléments HTML `<br/>`.

### 7. Transformer les sauts de page
Créez une règle qui transforme les éléments `<pb/>` en une **valeur textuelle** de la forme "[valeur de l'attribut n] "
