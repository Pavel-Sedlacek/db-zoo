# PV0: Vyhynulé druhy (nemají žádné zvíře)
SELECT Druhy.nazev
FROM Druhy
         LEFT JOIN Zvirata ON Druhy.id = Zvirata.druh
WHERE Zvirata.id IS NULL;

# PV1: Všechna zvířata, která nemá nikdo rád
SELECT Zvirata.jmeno
FROM Zvirata
         LEFT JOIN Ma_rad ON Zvirata.druh = Ma_rad.druh
WHERE Ma_rad.id IS NULL;

# PV2: Všechny ošetřovatele, kteří nikoho neošetřují
SELECT Osetrovatele.jmeno
FROM Osetrovatele
         LEFT JOIN Osetruje ON Osetruje.osetrovatel = Osetrovatele.id
WHERE Osetruje.id IS NULL;

# PV3: Všechny kachny, které nemá nikdo rád
SELECT *
FROM Zvirata
         JOIN Druhy ON Zvirata.druh = Druhy.id
         LEFT JOIN Ma_rad ON Ma_rad.druh = Zvirata.druh
WHERE Ma_rad.id IS NULL
  AND Druhy.nazev LIKE 'kacena';

# PV4: Ošetřovatele, kteří neošetřují kachny
SELECT *
FROM Osetruje
         JOIN Zvirata ON Osetruje.zvire = Zvirata.id
         JOIN Druhy ON Druhy.nazev LIKE 'kacena' AND Druhy.id = Zvirata.druh
         RIGHT JOIN Osetrovatele ON Osetrovatele.id = Osetruje.osetrovatel
WHERE Osetruje.id IS NULL;

# PV5: Ošetřovatele, kteří neošetřují kachny ani husy
SELECT *
FROM Osetruje
         JOIN Zvirata ON Osetruje.zvire = Zvirata.id
         JOIN Druhy ON (Druhy.nazev LIKE 'kacena' OR Druhy.nazev LIKE 'husa') AND Druhy.id = Zvirata.druh
         RIGHT JOIN Osetrovatele ON Osetrovatele.id = Osetruje.osetrovatel
WHERE Osetruje.id IS NULL;

# PV6: Ošetřovatele, kteří neošetřují těžké osly
SELECT *
FROM Osetruje
         JOIN Zvirata ON Osetruje.zvire = Zvirata.id
         JOIN Druhy ON (Druhy.nazev LIKE 'osel' AND Zvirata.vaha > 50) AND Druhy.id = Zvirata.druh
         RIGHT JOIN Osetrovatele ON Osetrovatele.id = Osetruje.osetrovatel
WHERE Osetruje.id IS NULL;

# PV7: Všechny těžké osly, které nikdo neošetřuje
SELECT *
FROM Zvirata
         JOIN Druhy ON (Zvirata.druh = Druhy.id AND Druhy.nazev LIKE 'osel' AND Zvirata.vaha > 50)
         LEFT JOIN Osetruje ON (Zvirata.id = Osetruje.zvire)
WHERE Osetruje.id IS NULL;

# PV8: Ošetřovatele, kteří ošetřují někoho, koho nemají rádi
# PV9: Kdo ošetřuje všechny slepice

# PV10: Ošetřovatele, kteří ošetřují pouze koroptve
SELECT Osetrovatele.jmeno
FROM Osetrovatele
         JOIN Osetruje ON Osetrovatele.id = Osetruje.osetrovatel
         JOIN Zvirata ON Zvirata.id = Osetruje.zvire
         JOIN Druhy ON Zvirata.druh = Druhy.id
GROUP BY Osetrovatele.id
HAVING MIN(Druhy.nazev) LIKE 'koroptev' AND MAX(Druhy.nazev) LIKE 'koroptev';


# PV12: Ošetřovatele, kteří mají rádi pouze ta zvířata, která ošetřují
# PV12: Ošetřovatele, kteří ošetřují všechna zvířata, která mají rádi
