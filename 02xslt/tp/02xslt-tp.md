# TP 02 XSLT

## Objectif
Réaliser une feuille de transformation XSLT permettant de convertir un document TEI simple en un document HTML.

---

## Étapes à suivre

### 1. Créer la règle principale pour le document
Définir une première règle correspondant au **nœud racine du document** afin d’appliquer les modèles aux nœuds descendants.

---

### 2. Transformer l’élément `<TEI>` en `<html>`
Créer une règle qui transforme l’élément racine `TEI` du document TEI en un élément HTML `<html>`.

---

### 3. Transformer l’en-tête TEI en `<head>` HTML
Créer une règle pour l’élément `teiHeader` afin qu’il soit transformé en un élément HTML `<head>` contenant :

- Un élément `<meta charset="utf-8"/>`
- Un élément `<title>` dont la valeur textuelle correspond au contenu du nœud `<title type="main">` du document TEI.

---

### 4. Transformer le corps TEI en `<body>` HTML
Créer une règle qui transforme l’élément `body` du document TEI en un élément HTML `<body>`,  
et appliquer les modèles aux nœuds descendants pour continuer la transformation.

---

### 5. Transformer les éléments textuels du corps
Créer des règles pour transformer les éléments suivants :

- `head`
- `dateline`
- `p`
- `signed`

Ces éléments TEI doivent être convertis en paragraphes HTML `<p>`.

Pour les éléments `head` et `dateline`, ajouter un **attribut `class`** dont la valeur correspond à celle de l’attribut TEI `@rend`.

---

### 6. Transformer les retours à la ligne
Créer une règle qui transforme les éléments `lb` (line break) du TEI en éléments HTML `<br/>`.

---

### 7. Transformer les sauts de page
Créer une règle qui transforme les éléments `pb` (page break) du TEI en une **valeur textuelle** de la forme "[valeur de l'attribut n] "
---

## Résultat attendu
À la fin de ce TP, vous devez obtenir une feuille XSLT capable de produire un document HTML correctement structuré à partir d’un document TEI simple.
