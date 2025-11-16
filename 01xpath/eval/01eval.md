# Évaluation XPath - 10 novembre 2025

Prenez un instant pour prendre connaissance du fichier `moliere_avare.xml`, puis donnez les chemins XPath suivants :

1. Donnez les **chemins absolus** vers l’élément `bibl` contenu dans le `sourceDesc` ; l’élément `creation` ; et le *nœud document*

`/TEI/teiHeader/fileDesc/sourceDesc/bibl ; /TEI/teiHeader/profileDesc/creation ; /`

2. sélectionnez tous les éléments `name`

`//name`

3. Sélectionnez tous les éléments `name` et `speaker`

`//name | //speaker`

4. Séléctionnez tous les éléments `speaker` sauf ceux qui sont dans l’acte premier

`//speaker except //div[@type='acte'][@n='1']//speaker`


5. Sélectionnez toutes les scènes où `"Valère"` est présent

`//div[@type='scene'][descendant::sp[@who = '#valere']]`

6. Modifiez l’expression précédente afin de récupérer l’identifiant des scènes

`//div[@type='scene'][descendant::sp[@who = '#valere']]/@xml:id`

7. Sélectionnez toutes les répliques (`sp`) de `Cléante`

`//sp[@who='#cleante']`

8. Comptez les répliques de `Cléante`

`count(//sp[@who='#cleante'])`

9. Sélectionnez tous les attributs `who`

`//@who`

10. Donnez les valeurs uniques des attributs `who`

`distinct-values(//@who)`

11. Sélectionnez toutes les répliques (`sp`) disposant de plusieurs didascalies (`stage`)

`//sp[stage[2]]`

12. Sélectionnez tous les nœuds fils de `sp`

`//sp/node()`

13. Sélectionnez tous les attributs `rend` dont la valeur n'est pas `i`

`//@rend[.!='i']`

14. Sélectionnez toutes les scènes impaires

`//div[@type='scene'][position() mod 2 != 0]`

15. Sélectionnez toutes les répliques qui suivent directement une réplique de `"Valère"` et qui ne sont pas d’`"Élise"`

`//sp[@who = "#valere"]/following-sibling::sp[1][@who != '#elise']`
