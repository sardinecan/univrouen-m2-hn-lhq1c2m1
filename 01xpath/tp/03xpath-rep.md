# Correction TP XPath 02

- `//objectName[contains(., 'chapelle')]`
- `//date[starts-with(@when, '16')]`
- `//respStmt[1]/concat(persName/forename, persName/surname)`
- `string-length(//respStmt[1]/concat(persName/forename, persName/surname))`
- `distinct-values(//@xml:lang)`
