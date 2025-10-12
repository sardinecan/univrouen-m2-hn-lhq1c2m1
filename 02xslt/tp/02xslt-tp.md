# TP 02 XSLT

Transformer un document TEI simple en document HTML.

- Créer une premiere règle pour le **nœud document** afin d'appliquer les modèles pour les nœuds descendants.
- Créer une règle pour l'élément TEI => élément xHTML <HTML/>
Créer une règle pour l'élément teiHeader => élément xhtml <head/> comportant un élément meta @charset utf8 et un élément title ayant pour valeur la valeur textuelle du noeud tei <title type="main">
- tranformer l'élément tei body en élément html body  et appliquer les modèles pour les nœuds descendants
- créer des règles pour transformer les éléments tei head, tei dateline tei p et tei signed en paragraphe html. pour les élément head et dateline vous veillerez à ajouter un attribut class prenant pour valeur le tei @rend 
- créer une règle pour transformer les tei lb en élément html br
- créer une règle pour transformer les élements pb en valeur "[@n] "
