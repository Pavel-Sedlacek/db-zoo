# Alfa1: Vypište všechna zvířata, která neošetřuje žádný Franta, Alois ani Jan (tedy nikdo z nich)
SELECT *
FROM Osetruje
         JOIN Osetrovatele ON Osetruje.osetrovatel = Osetrovatele.id AND
                              (jmeno LIKE 'Alois %' OR jmeno LIKE 'Jan %' OR jmeno LIKE 'Franta %')
         RIGHT JOIN Zvirata ON Osetruje.zvire = Zvirata.id
WHERE Osetruje.id IS NULL;

# Alfa2: Vypište všechny mloky, které nemá rád nikdo, kdo má rád pávy.


# Alfa3: Vypište všechny ošetřovatele, kteří mají rádi stonožky a současně orly.
