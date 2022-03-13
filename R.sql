SELECT jmeno
FROM Osetrovatele
         LEFT JOIN (
    Ma_rad JOIN Druhy ON Druhy.id = Ma_rad.druh AND Druhy.nazev LIKE 'vrabec'
    ) ON Osetrovatele.id = Ma_rad.osetrovatel;

SELECT jmeno, count(Ma_rad.id) as pocet
FROM Osetrovatele
         LEFT JOIN Ma_rad ON Ma_rad.osetrovatel = Osetrovatele.id
GROUP BY Osetrovatele.id
ORDER BY pocet
LIMIT 1;

SELECT COUNT(Zvirata.id) OVER()
FROM Zvirata
         LEFT JOIN Osetruje ON Osetruje.zvire = Zvirata.id
WHERE vaha > 50
GROUP BY Zvirata.id
HAVING COUNT(Osetruje.id) < 2
LIMIT 1;