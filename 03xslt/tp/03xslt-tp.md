# TP 03 XSLT

## Objectif
Modifier la feuille de transformation réalisée lors du TP 02.

## Exercice

Ouvrir le testament de Henri Jules Barbier (`will_AN_0409.xml`) et le fichier XSLT réalisé lors du TP 02 dans Oxygen, puis créer ou modifier les règles suivantes :

### 1. head, dateline, p, signed

Réécrirez les règles pour les éléments `<head/>`, `<dateline/>`, `<p/>` et `<signed/>` afin de les regrouper en une règle unique, et implémentez un test afin d'ajouter une classe (`@class`) si un attribut `@rend` est présent.

### 2. div

Ajoutez une règles pour transformer les éléments TEI `<div/>` en élément HTML `<section/>`. L'attribut `@type` doit devenir une classe. N'oubliez pas d'appliquer les templates.

### 3. choice

Ajoutez une règle afin que seuls les éléments `<corr/>` et `<expan/>` soient instanciés dans les éléments `<choice/>`

### 4. del et add

Créez une règle pour supprimer les nœuds `<del/>` et `<add type='testatorComment'/>` en sortie

### 5. supplied

Créez une règle afin d’instancier les éléments `<supplied/>` entre crochets droits `[]`

### 6. hi

À l'aide d'une requête XPath, recherchez les valeurs uniques des attributs `@rend`.

Créez une règle pour chaque valeur de `hi/@rend` en utilisant un `test`.

### 7. pb

Ajoutez une règle pour les éléments `<pb/>` et créez une variable pour numéroter les changements de page.

En sortie, placez le numéro de page entre crochets `[]`.

### 8. Notes

#### 8.1. Appels

Ajoutez une règle pour les éléments `<note/>`. :

- créez une variable pour numéroter l’élément `note`
- en sortie, placer le numéro de la note en exposant (balise HTML `<sup/>`)

#### 8.2 pieds de page

Ajouter une règle modale pour les éléments `<note/>` (p. ex. `mode="footnote"`)

- numérotez les notes comme ci-dessus
- instanciez l'appel de note et le contenu de la note dans un élément `<p/>`
- modifiez le modèle de l’élément `<div/>` afin d’appliquez la règle modale
