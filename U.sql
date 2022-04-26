# Jména nejlehčích zvířat (Všechna zvířata, která váží stejně jako nejlehčí)
SELECT jmeno
FROM Zvirata
WHERE Zvirata.vaha = (SELECT MIN(Z.vaha) FROM Zvirata as Z);

# Která zvířata (jméno a druh) ošetřuje nejstarší ošetřovatel?
SELECT jmeno, druh
FROM Zvirata
         JOIN Osetruje ON Osetruje.zvire = Zvirata.id
         JOIN Druhy ON Druhy.id = Zvirata.druh
WHERE Osetruje.osetrovatel IN (
    SELECT Osetrovatele.id
    FROM Osetrovatele
    WHERE narozen = (
        SELECT MIN(O.narozen)
        FROM Osetrovatele as O
    )
);

# Jméno nejlehčího zvířete s více než jedním ošetřovatelem
SELECT *
FROM Zvirata
         JOIN Osetruje ON Osetruje.zvire = Zvirata.id
GROUP BY Zvirata.id
HAVING COUNT(Osetruje.id) > 1
ORDER BY Zvirata.vaha;