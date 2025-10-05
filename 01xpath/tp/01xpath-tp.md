# TP XPath

Effectuer les requêtes suivantes sur le fichier `will_AN_0440.xml`

## Chemins simples
1. Écrire le chemin absolu vers le nœud *racine* du document, vers le nœud *text* et vers le nœud *sourceDesc*.
2. Une fois dans le nœud *sourceDesc*, écrire le chemin relatif vers le nom du manuscrit ;

## Jokers et opérateurs
3. Sélectionner tous les nœuds *persName*, quel que soit leur emplacement dans le document
4. Sélectionner à la fois tous les nœuds *lb*, et tous les nœuds *pb*
5. Sélectionner tous les *sic* descendant d'un *choice* n'importe où dans le document, sauf s'ils descendent d'un *paragraphe*
6. Sélectionner tous les *sic* ET les *corr* descendant d'un *choice* n'importe où dans le document, sauf d'ils descendent d'un *paragraphe*

## Prédicats
7. Sélectionner le premier descendant de l'élément *TEI*
8. Sélectionner uniquement les saut de ligne avec une attribut *break*
9. Sélectionner les *placeName* de valeur *'Paris'*
10. Sélectionner les *paragraphes* ayant un descendant *placeName* de valeur *'Paris'*
11. Sélectionner tous les nœuds comportant un attribut *type*
12. Sélectionner tous les nœuds comportant un attribut *type* ou un *xml:id*
13. Sélectionner tous les nœuds comportant un attribut *type* et un *xml:id*
14. Sélectionner tous les placeName possédant un attribut *type* de valeur 'willPlace' ou de valeur 'otherPlace'

## Syntaxe non abrégée
15. Sélectionner le nœud parent de tous les nœuds comportant un attribut *type*
16. Sélectionner tous les *éléments frères* suivant le *premier paragraphe* de la *div*
17. Sélectionner tous les nœuds qui sont ancètres du premier paragraphe de la div

## Fonctions et tests
### Fonctions sur les nombres

18. Compter tous les débuts de ligne (*lb*)

### Fonctions sur les boléens
19. Sélectionner tous les noms de lieu dont le type n'est pas 'willPlace'
20. Sélectionner le dernier nœud *date* dans l'ordre du document (i.e. un nœud date, tel qu'il n'ait pas de successeur du même type dans l'ordre du document)

### Comparaisons et fonctions sur les nœuds
21. Sélectionner les nœuds dont la position est supérieure à 2

## Exercices (plus) avancés
22. Sélectionner tous les *éléments enfants* de *TEI* dont la *position est supérieure à 1*
23. récupérer le *nom local* de tous les *éléments parents* des attributs *type*
24. modifier l'expression précédente pour récupérer *l'espace de nom* de tous les *éléments parents* des attributs *type*
25. la modifier pour récupérer les deux et les concaténer en les séparant par deux points
26. la modifier pour n'avoir que des valeurs uniques (ou distinctes)
27. Récupérer les éléments *date*, dont l'attribut *when* commence par « 1914 »

## GOAT
28. Récupérer tous les nœuds éléments paires, fils de la division de type *will*.