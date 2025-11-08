# TP 03 XSLT

## Objectif
Modifier la feuille de transformation réalisée lors du TP 3.

## Exercice

Ouvrir le testament de Henri Jules Barbier (`will_AN_0409.xml`) et le fichier `teitohtml.xsl` dans Oxygen, puis créez ou modifiez les règles suivantes :

### 3. Add

Ajoutez une règle pour les add comportant un test :

- les `<add/>` disposant d'un attribut `@type` de valeur `"testatorComment"` doivent être supprimés de l'arbre de sortie ;
- p our les autres, appliquer les *templates* entre "`|`"
