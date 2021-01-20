## liens utiles


Merise => 
https://ineumann.developpez.com/tutoriels/merise/initiation-merise/

https://www.techno-science.net/definition/739.html

BDD =>
https://www.lebigdata.fr/base-de-donnees



## Exercice :
Pour vous entrainer, voici quelques questions qui vous permettront d'élaborer des requêtes et mener vers la réponse :
1. Afficher la profession de l'employé 547.
2. Afficher la date d'embauche de : Amandine.
3. Afficher le nombre de commerciaux.
4. Afficher le coût des commerciaux sur 1 année.
5. Afficher le salaire moyen par service.
6. Afficher le nombre de recrutements sur l'année 2010.
7. Augmenter le salaire pour chaque employé de 100€.
8. Afficher le nombre de services (différents).
9. Afficher les informations de l'employé du service commercial gagnant le salaire le plus élevé
10. Afficher l'employé ayant été embauché en dernier.


1. MariaDB [entreprise]> SELECT service FROM EMPLOYES WHERE id_employes=547;
+------------+
| service    |
+------------+
| commercial |
+------------+
1 row in set (0.001 sec)

2. MariaDB [entreprise]> SELECT date_embauche FROM employes WHERE prenom='Amandine';
+---------------+
| date_embauche |
+---------------+
| 2010-01-23    |
+---------------+
1 row in set (0.000 sec)

3. MariaDB [entreprise]> SELECT COUNT(*) FROM employes WHERE service='commercial';
+----------+
| COUNT(*) |
+----------+
|        6 |
+----------+
1 row in set (0.001 sec)

4. MariaDB [entreprise]> SELECT SUM(salaire*12) FROM employes WHERE service='commercial';
+-----------------+
| SUM(salaire*12) |
+-----------------+
|          184200 |
+-----------------+
1 row in set (0.001 sec)

5. MariaDB [entreprise]> SELECT service, ROUND(AVG(salaire)) FROM employes GROUP BY service;
+---------------+---------------------+
| service       | ROUND(AVG(salaire)) |
+---------------+---------------------+
| assistant     |                1775 |
| commercial    |                2558 |
| communication |                1500 |
| comptabilite  |                1900 |
| direction     |                4750 |
| informatique  |                1983 |
| juridique     |                3200 |
| production    |                2225 |
| secretariat   |                1497 |
+---------------+---------------------+
9 rows in set (0.002 sec)


6. MariaDB [entreprise]> SELECT nom, prenom, date_embauche FROM employes WHERE date_embauche BETWEEN '2010-01-01' AND '2010-12-31';
+--------+----------+---------------+
| nom    | prenom   | date_embauche |
+--------+----------+---------------+
| Thoyer | Amandine | 2010-01-23    |
| Durand | Damien   | 2010-07-05    |
+--------+----------+---------------+
2 rows in set (0.001 sec)

MariaDB [entreprise]> SELECT COUNT(*) as 'nb_de_recutement' FROM employes WHERE date_embauche BETWEEN '2010-01-01' AND '2010-12-31';
+------------------+
| nb_de_recutement |
+------------------+
|                2 |
+------------------+
1 row in set (0.000 sec)

MariaDB [entreprise]> SELECT COUNT(*) as 'nb_de_recutement' FROM employes WHERE date_embauche LIKE '2010%';
+------------------+
| nb_de_recutement |
+------------------+
|                2 |
+------------------+
1 row in set (0.000 sec)

MariaDB [entreprise]> SELECT COUNT(*) as 'nb_de_recutement' FROM employes WHERE date_embauche >= '2010-01-01' AND date_embauche <='2010-12-31';
+------------------+
| nb_de_recutement |
+------------------+
|                2 |
+------------------+
1 row in set (0.000 sec)


7. MariaDB [entreprise]> UPDATE employes SET salaire=salaire+100;
Query OK, 20 rows affected (0.001 sec)
Rows matched: 20  Changed: 20  Warnings: 0

8. MariaDB [entreprise]> SELECT COUNT(DISTINCT service) FROM employes;
+-------------------------+
| COUNT(DISTINCT service) |
+-------------------------+
|                       9 |
+-------------------------+
1 row in set (0.001 sec)

9. MariaDB [entreprise]> SELECT nom, prenom, service, salaire FROM employes WHERE service='commercial' AND salaire=(SELECT MAX(salaire) FROM employes WHERE service='commercial');
+--------+--------+------------+---------+
| nom    | prenom | service    | salaire |
+--------+--------+------------+---------+
| Winter | Thomas | commercial |    3650 |
+--------+--------+------------+---------+
1 row in set (0.000 sec)

10. MariaDB [entreprise]> SELECT * FROM employes WHERE date_embauche=(SELECT MAX(date_embauche) FROM employes);
+-------------+-----------+--------+------+-----------+---------------+---------+
| id_employes | prenom    | nom    | sexe | service   | date_embauche | salaire |
+-------------+-----------+--------+------+-----------+---------------+---------+
|         990 | Stephanie | Lafaye | f    | assistant | 2015-06-02    |    1875 |
+-------------+-----------+--------+------+-----------+---------------+---------+
1 row in set (0.001 sec)



## tableau pour les exercices bibliothèque

MariaDB [bibliotheque]> SELECT * FROM abonne;
+-----------+-----------+
| id_abonne | prenom    |
+-----------+-----------+
|         1 | Guillaume |
|         2 | Benoit    |
|         3 | Chloe     |
|         4 | Laura     |
+-----------+-----------+
4 rows in set (0.001 sec)

MariaDB [bibliotheque]> SELECT * FROM livre;
+----------+-------------------+-------------------------+
| id_livre | auteur            | titre                   |
+----------+-------------------+-------------------------+
|      100 | GUY DE MAUPASSANT | Une vie                 |
|      101 | GUY DE MAUPASSANT | Bel-Ami                 |
|      102 | HONORE DE BALZAC  | Le p?re Goriot          |
|      103 | ALPHONSE DAUDET   | Le Petit chose          |
|      104 | ALEXANDRE DUMAS   | La Reine Margot         |
|      105 | ALEXANDRE DUMAS   | Les Trois Mousquetaires |
+----------+-------------------+-------------------------+
6 rows in set (0.000 sec)

MariaDB [bibliotheque]> SELECT * FROM emprunt;
+------------+----------+-----------+-------------+------------+
| id_emprunt | id_livre | id_abonne | date_sortie | date_rendu |
+------------+----------+-----------+-------------+------------+
|          1 |      100 |         1 | 2014-12-17  | 2014-12-18 |
|          2 |      101 |         2 | 2014-12-18  | 2014-12-20 |
|          3 |      100 |         3 | 2014-12-19  | 2014-12-22 |
|          4 |      103 |         4 | 2014-12-19  | 2014-12-22 |
|          5 |      104 |         1 | 2014-12-19  | 2014-12-28 |
|          6 |      105 |         2 | 2015-03-20  | 2015-03-26 |
|          7 |      105 |         3 | 2015-06-13  | NULL       |
|          8 |      100 |         2 | 2015-06-15  | NULL       |
+------------+----------+-----------+-------------+------------+
8 rows in set (0.000 sec)



## Nouvelle série d'exercices

