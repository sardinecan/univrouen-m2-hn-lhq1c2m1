# Correction TP XPath 02

- `/TEI/teiHeader/fileDesc ; /TEI/text/group ; /TEI/text/group/text/front/titlePage`
- `//fw`
- `//fw | //pb`
- `//note`
- `//note except //teiHeader//note`
- `//div[@type]`
- `//div[@type or @xml:id]`
- `//@rend`
- `//*[@rend]`
- `distinct-values(//@rend)`
- `//metamark[@rend = 'tailpiece']`
- `//metamark[@rend != 'tailpiece']`
- `//item[persName]`
- `count(//pb)`
- `count(//text[@type='volume'][1]//pb)`

- `//metamark[count(following::metamark) = 1]`