# Alfa1: Vypište všechna zvířata, která neošetřuje žádný Franta, Alois ani Jan (tedy nikdo z nich)
SELECT *
FROM Osetruje
         JOIN Osetrovatele ON Osetruje.osetrovatel = Osetrovatele.id AND
                              (jmeno LIKE 'Alois %' OR jmeno LIKE 'Jan %' OR jmeno LIKE 'Franta %')
         RIGHT JOIN Zvirata ON Osetruje.zvire = Zvirata.id
WHERE Osetruje.id IS NULL;

# Alfa2: Vypište všechny mloky, které nemá rád nikdo, kdo má rád pávy.
SELECT *
FROM Zvirata
         JOIN Druhy ON Druhy.id = Zvirata.druh AND Druhy.nazev LIKE 'mlok'
         LEFT JOIN Ma_rad ON Ma_rad.druh = Zvirata.druh
         LEFT JOIN Osetrovatele ON Ma_rad.osetrovatel = Osetrovatele.id
         LEFT JOIN Ma_rad M1 ON M1.osetrovatel = Osetrovatele.id
         LEFT JOIN Druhy D1 ON D1.id = M1.id AND D1.nazev LIKE 'pav'
WHERE D1.id IS NULL;

# Alfa3: Vypište všechny ošetřovatele, kteří mají rádi stonožky a současně orly.
SELECT Osetrovatele.id
FROM Osetrovatele
         JOIN Ma_rad ON Ma_rad.osetrovatel = Osetrovatele.id
         LEFT JOIN Druhy D1 ON D1.id = Ma_rad.druh AND D1.nazev LIKE 'orel'
         LEFT JOIN Druhy D2 ON D2.id = Ma_rad.druh ANd D2.nazev LIKE 'stonozka'
WHERE D1.id IS NOT NULL
  AND D2.id IS NOT NULL;