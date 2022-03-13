# Zvířata, která jsou krmena osobou, která je nemá ráda
SELECT distinctrow jmeno
FROM Zvirata
         JOIN Osetruje ON Osetruje.zvire = Zvirata.id
         LEFT JOIN Ma_rad ON Osetruje.osetrovatel = Ma_rad.osetrovatel AND Zvirata.druh = Ma_rad.druh
WHERE Ma_rad.id is null;

# Neošetřovaná, a přesto milovaná zvířata
SELECT DISTINCTROW jmeno
FROM Zvirata
         JOIN Ma_rad ON Ma_rad.druh = Zvirata.druh
         LEFT JOIN Osetruje ON Osetruje.zvire = Zvirata.id
WHERE Osetruje.id is null;

# * Neošetřovaná a současně nemilovaná zvířata ?
SELECT distinctrow jmeno
FROM Zvirata
         LEFT JOIN Ma_rad ON Ma_rad.druh = Zvirata.druh
         LEFT JOIN Osetruje ON Osetruje.zvire = Zvirata.id
WHERE Osetruje.id is null
  AND Ma_rad.id is null;