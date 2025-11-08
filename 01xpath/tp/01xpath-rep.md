# Correction TP XPath 01

1. `/ ; /TEI/text ; /TEI/teiHeader/fileDesc/sourceDesc`
2. `./msDesc/msIdentifier/msName`
3. `//persName`
4. `//lb | //pb`
5. `//choice/sic except //choice/sic/ancestor::p`
6. `//choice/(sic | corr) except //choice/(sic | corr)/ancestor::p`
7. `/TEI/node()[1]`
8. `//lb[@break]`
9. `//placeName[.='Paris']`
10. `//p[descendant::placeName='Paris']`
11. `//*[@type]`
12. `//*[@type or @xml:id]`
13. `//*[@type and @xml:id]`
14. `//placeName[@type = 'willPlace' or @type='otherPlace']`
15. `//*[@type]/parent::*`
16. `//div/p[1]/following-sibling::*`
17. `//div/p[1]/ancestor::*`
18. `count(//lb)`
19. `//placeName[@type != 'willPlace']`
20. `//date[not(following::date)]`
21. `//node()[position() > 2]`
22. `/TEI/*[position() > 1]`
23. `//*[@type]/local-name() ou //@type/parent::*/local-name()`
24. `//@type/parent::*/namespace-uri()`
25. `//@type/parent::*/concat( namespace-uri(), ' : ', local-name() )`
26. `distinct-values(//@type/parent::*/concat( namespace-uri(), ' : ', local-name() ))`
27. `//date[starts-with(@when, '1914')]`
28. `//div[@type='will']/*[position() mod 2 = 0]`

