# TP 03 XSLT

## Objectif
Modifier la feuille de transformation réalisée lors du TP 2.

## Exercice

Ouvrir le testament de Henri Jules Barbier (`will_AN_0409.xml`) et le fichier `teitohtml.xsl` dans Oxygen, puis créez ou modifiez les règles suivantes :

### 1. choice

Ajoutez une règle afin que seuls les éléments `<corr/>` et `<expan/>` soient instanciés dans les éléments `<choice/>`

### 2. del

Créez une règle pour supprimer les nœuds `<del/>` en sortie

### 3. supplied

Créez une règle afin d’instancier les éléments `<supplied/>` entre crochets droits `[]`

### 6. hi

À l'aide d'une requête XPath, recherchez les valeurs uniques des attributs `@rend`.

Créez une règle pour chaque valeur de `hi/@rend`.

### 4. pb

Ajoutez une règle pour les éléments `<pb/>` et créez une variable pour numéroter les changements de page.
En sortie, placez le numéro de page entre crochets `[]`.

### 5. Notes

#### 5.1. Appels

Ajoutez une règle pour les éléments `<note/>`. :
- créez une variable pour numéroter l’élément `note`
- en sortie, placer le numéro de la note en exposant (balise HTML `<sup/>`)

#### 5.2 pieds de page

Ajouter une règle modale pour les éléments `<note/>` (p. ex. `mode="footnote"`)
- numérotez les notes comme ci-dessus
- instanciez l'appel de note et le contenu de la note dans un élément `<p/>`
- modifiez le modèle de l’élément `<body/>` pour appliquez la règle modale
