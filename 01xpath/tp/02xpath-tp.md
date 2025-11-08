# TP XPath 01

Effectuez les requêtes suivantes sur le fichier `gdpBrice1684.tei.xml`

- Écrire le chemin absolu vers les éléments `<fileDesc/>`, `<group/>` et `<titlePage/>`
- sélectionnez tous les éléments `<fw/>`
- sélectionnez tous les éléments `<fw/>` et `<pb/>`
- sélectionnez tous les éléments `<note/>`
- sélectionnez tous les éléments `<note/>` sauf ceux qui sont dans le `<teiHeader/>`
- sélectionnez tous les éléments `<div/>` disposant d'un attribut `type`
- sélectionnez tous les éléments `<div/>` disposant d'un attribut `type` ET d'un attribut `xml:id`
- sélectionnez tous les éléments `<div/>` disposant d'un attribut `type` OU d'un attribut `xml:id`
- sélectionnez tous les attributs `rend`
- sélectionnez tous les éléments dispostant d'un attribut `rend`
- donnez toutes les valeurs uniques des attributs `rend`
- séléctionnez tous les éléments `<metamark/>` disposant d'un attribut `rend` de valeur `tailpiece`
- séléctionnez tous les éléments `<metamark/>` disposant d'un attribut `rend` dont la valeur n'est pas `tailpiece`
- sélectionnez tous les éléments `<item/>` qui ont un élément fils `persName`
- comptez tous les éléments `<pb/>`
- compter tous les éléments `<pb/>` du premier volume (élément `<text/>` de type `volume`)


- sélectionnez l'avant dernier élément `<metamark/>` (tel qu'il ne dispose que d'un seul successeur dans l'ordre du document)