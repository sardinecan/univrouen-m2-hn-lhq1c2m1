# TP 03 XSLT

## Objectif
Modifier la feuille de transformation réalisée lors du TP 3.

## Exercice

Ouvrir le testament de Maurice Moreau (`will_AD95_0048.xml`) et le fichier `teitohtml.xsl` dans Oxygen, puis créez ou modifiez les règles suivantes :

### 1. hi

Ajoutez une règle pour les éléments `hi` disposant d’un attribut `@rend` de valeur `"superscript"` afin d’avoir un rendu HTML en exposant.

### 2. teiHeader et body

#### 2.1 structure HTML
- Créez un template *nommé* `html` contenant une structure HTML classique (`html>head+body`)
- dans l'élément `<head/>`, placez un élément `<meta charset="utf-8"/>` pour l'encodage des caractères
- l’élément HTML `title` doit prendre la valeur du titre principal dans le document TEI (voir règle déjà existante pour le `teiHeader`). *NB. Pensez à utiliser un chemin absolu*
- dans le corps de la page HTML ajoutez une navigation composée d’une liste de 3 liens :
    - Accueil : `index.html`
    - Testament : `testament.html`
    - Codicille : `codicille.html`
- supprimez les règles déjà existantes pour les éléments `TEI`, `teiHeader` et `body`

#### 2.2 paramètre

- ajoutez un paramètre `content` au template `html` ;
- appliquez ce paramètre dans le `<body/>`


### 3. nœud document

Modifiez règle du nœud document :

- supprimez le modèle existant ;
- ajoutez une première instruction `result-document` afin de créer un fichier `index.html`
    - appelez le template `html` en lui passant comme paramètre `content` l’élément `abstract`
- effectuez une transformation (pensez à indiquer à Oxygen un dossier de sortie)

Répétez l'opération pour le testament (`testament.html` ; `content`  : `<div type="will"/>`) et le codicille (`condicille.html` ; `content` : `<div type="codicil"`)

### 4. Bonus

En utilisant des tests et boucles (cf. cours XSLT 03) simplifiez et automatisez le traitements des éléments TEI `div`, afin de ne pas avoir à répéter manuellement les instructions `result-document`.

Faites de même avec la navigation.
