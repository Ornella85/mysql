
/**
* Objectif : Créer dans PHPMyAdmin une base de données haribo dont la modélisation est ci-dessous, les étapes sont détaillées ensuite.
*/

/**
+---------------+----------------+------+------+---------+----------------+
| Field         | Type           | Null | Key  | Default | Extra          |
+---------------+----------------+------+------+---------+----------------+
| id_stagiaire  | int(11)        | NO   | PRI  | NULL    | auto_increment |
| prenom        | varchar(100)   | NO   |      | NULL    |                |
| yeux          | varchar(30)    | NO   |      | NULL    |                |
| genre         | enum('h','f')  | NO   |      | NULL    |                |
+---------------+----------------+------+------+---------+----------------+

+---------------+----------------+------+------+---------+----------------+
| Field         | Type           | Null | Key  | Default | Extra          |
+---------------+----------------+------+------+---------+----------------+
| id_bonbon     | int(11)        | NO   | PRI  | NULL    | auto_increment |
| nom           | varchar(100)   | NO   |      | NULL    |                |
| saveur        | varchar(100)   | NO   |      | NULL    |                |
+---------------+----------------+------+------+---------+----------------+
 
+---------------+----------------+------+------+---------+----------------+
| Field         | Type           | Null | Key  | Default | Extra          |
+---------------+----------------+------+------+---------+----------------+
| id_manger     | int(11)        | NO   | PRI  | NULL    | auto_increment |
| id_bonbon     | int(11)        | YES  |      | NULL    |                |
| id_stagiaire  | int(11)        | YES  |      | NULL    |                |
| date_manger   | date           | NO   |      | NULL    |                |
| quantite      | int(11)        | NO   |      | NULL    |                |
+---------------+----------------+------+------+---------+----------------+

*/

/**
* REQUETES A EFFECTUER dans PHPMyAdmin
*/

--1-- lister toutes les BDD de PHPMyAdmin
MariaDB [haribo]> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| bibliotheque       |
| entreprise         |
| haribo             |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| wordpress          |
+--------------------+
8 rows in set (0.001 sec)

--2-- Créer une base de données SQL nommée HARIBO

MariaDB [(none)]> CREATE DATABASE IF NOT EXISTS haribo;
Query OK, 1 row affected (0.007 sec)

--3--
/**
* créer une table stagiaire
* qui comporte 3 champs :
* - id_stagiaire => nombre qui s'auto-incrémente, requis et clé primaire
* - prenom => 100 caractères, requis
* - couleur des yeux => 30 caractères, requis
* - genre => homme ou femme, requis
*/
MariaDB [haribo]> CREATE TABLE stagiaire(
    ->  id_stagiaire INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    -> prenom VARCHAR(100) NOT NULL,
    -> couleur_des_yeux VARCHAR(30) NOT NULL,
    -> genre ENUM('f', 'h') NOT NULL
    -> ) ENGINE=InnoDB ;
Query OK, 0 rows affected (0.026 sec)

--4--
/**
* insérer dans cette table les informations de votre groupe (faites un copier-coller des lignes ci-dessous) :
*/

MariaDB [haribo]> INSERT INTO stagiaire (prenom, couleur_des_yeux, genre) VALUES
    -> ('Amine', 'marron','h'),
    -> ('Sara', 'marron','f'),
    -> ('Muhammet', 'marron','h'),
    -> ('Rachid', 'marron','h'),
    -> ('Jeremy', 'bleu','h'),
    -> ('Charly', 'marron','h'),
    -> ('Mohammed', 'marron','h'),
    -> ('Niamatullah', 'marron','h'),
    -> ('Zakaria', 'marron','h'),
    -> ('David', 'marron','h'),
    -> ('Ornella', 'marron','f');
Query OK, 11 rows affected (0.002 sec)
Records: 11  Duplicates: 0  Warnings: 0

--5--
/**
* créer une table bonbon
* qui comporte 3 champs :
* - id_bonbon => nombre qui s'auto-incrémente, requis et clé primaire
* - nom => 100 caractères, requis
* - saveur => 100 caractères, requis
*/

MariaDB [haribo]> CREATE TABLE bonbon(
    -> id_bonbon INT(11) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    -> nom VARCHAR(100) NOT NULL,
    -> saveur VARCHAR(100) NOT NULL
    -> ) ENGINE=InnoDB ;
Query OK, 0 rows affected (0.031 sec)

--6--
/**
* insérer dans cette table des bonbons haribo (faites un copier-coller des lignes ci-dessous) :
*/
MariaDB [haribo]> INSERT INTO bonbon (nom, saveur) VALUES
    -> ('dragibus', 'cola'),
    -> ('Tirlibibi','fraise'),
    -> ('roulette','framboise'),
    -> ('carensac','réglisse'),
    -> ('schtroumpf','pèche');
Query OK, 5 rows affected, 2 warnings (0.004 sec)
Records: 5  Duplicates: 0  Warnings: 2


--7--
/**
* créer une table manger
* qui comporte 5 champs :
* - id_manger => nombre qui s'auto-incrémente, requis et clé primaire
* - id_stagiaire => champs de la table stagiaire
* - id_bonbon => champs de la table bonbon
* - date_manger => type date, requis
* - quantite => nombre, requis
*/
MariaDB [haribo]> CREATE TABLE manger(
    -> id_manger INT(11) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    -> id_stagiaire INT(11) NOT NULL,
    -> id_bonbon INT(11) NOT NULL,
    -> date_manger DATE NOT NULL,
    -> quantite INT(11) NOT NULL,
    -> FOREIGN KEY (id_stagiaire) REFERENCES stagiaire(id_stagiaire),
    -> FOREIGN KEY (id_bonbon) REFERENCES bonbon(id_bonbon)
    -> );
Query OK, 0 rows affected (0.039 sec)

--8--
/**
* insérer dans la table manger des informations sur qui a consommé quel bonbon, quand et dans quelles quantités (faites un copier-coller des lignes ci-dessous) :
*/
MariaDB [haribo]> INSERT INTO manger (id_bonbon, id_stagiaire, date_manger, quantite) VALUES
    -> (4,7,'2018-09-20', 5),
    -> (5,1,'2019-10-25',12),
    -> (2,10,'2020-03-1', 25),
    -> (1,2,'2020-04-2', 30),
    -> (3,12,'2020-01-12', 3),
    -> (1,8,'2021-05-14', 45),
    -> (2,7,'2020-02-7', 20),
    -> (4,5,'2020-06-29', 4);
Query OK, 8 rows affected (0.002 sec)
Records: 8  Duplicates: 0  Warnings: 0

--9-- Lister les tables de la BDD *haribo*
MariaDB [haribo]> SHOW TABLES FROM haribo;
+------------------+
| Tables_in_haribo |
+------------------+
| bonbon           |
| manger           |
| stagiaire        |
+------------------+
3 rows in set (0.001 sec)

--10-- voir les paramètres de la table *bonbon*
MariaDB [haribo]> SELECT id_bonbon, nom, saveur FROM bonbon;
+-----------+------------+-----------+
| id_bonbon | nom        | saveur    |
+-----------+------------+-----------+
|         1 | dragibus   | cola      |
|         2 | Tirlibibi  | fraise    |
|         3 | roulette   | framboise |
|         4 | carensac   | reglisse  |
|         5 | schtroumpf | peche     |
|         6 | tagada     | purple    |
|         7 | dagibus    | cola      |
|         8 | dagibus    | cola      |
|         9 | tagada     | purple    |
+-----------+------------+-----------+
9 rows in set (0.000 sec)
--11-- Sélectionner tous les champs de tous les enregistrements de la table *stagiaire*
SELECT * FROM stagiaire;
+--------------+-------------+------------------+-------+
| id_stagiaire | prenom      | couleur_des_yeux | genre |
+--------------+-------------+------------------+-------+
|            1 | Jordan      | marron           | h     |
|            2 | Amine       | marron           | h     |
|            3 | Sara        | marron           | f     |
|            4 | Muhammet    | marron           | h     |
|            5 | Rachid      | marron           | h     |
|            6 | Jeremy      | bleu             | h     |
|            7 | Charly      | marron           | h     |
|            8 | Mohammed    | marron           | h     |
|            9 | Niamatullah | marron           | h     |
|           10 | Zakaria     | marron           | h     |
|           11 | David       | marron           | h     |
|           12 | Ornella     | marron           | f     |
+--------------+-------------+------------------+-------+
12 rows in set (0.001 sec)

--12-- Rajouter un nouveau stagiaire *Patriiiick* en forçant la numérotation de l'id
MariaDB [haribo]> INSERT INTO stagiaire (id_stagiaire, prenom, couleur_des_yeux,genre) VALUES
    ->  (13,'Patriiiick','vert','h');
Query OK, 1 row affected (0.002 sec)
--13-- Rajouter un nouveau stagiaire *Mila* SANS forcer la numérotation de l'id
MariaDB [haribo]>  INSERT INTO stagiaire (prenom, couleur_des_yeux,genre) VALUES
    -> ('Mila','marron','f');
Query OK, 1 row affected (0.001 sec)
--14-- Changer le prénom du stagiaire qui a l'id 100 de *Patriiiick* à *Patrick*
MariaDB [haribo]> UPDATE stagiaire SET prenom='Patrick' WHERE id_stagiaire=13;
Query OK, 1 row affected (0.002 sec)
Rows matched: 1  Changed: 1  Warnings: 0
--15-- Rajouter dans la table manger que Patrick a mangé 5 Tagada purpule le 15 septembre
MariaDB [haribo]> INSERT INTO manger (id_stagiaire, id_bonbon,date_manger,quantite) VALUES
    -> (13,9,'2020-09-15',5);
Query OK, 1 row affected (0.002 sec)
--16-- Sélectionner tous les noms des bonbons
MariaDB [haribo]> SELECT nom FROM bonbon;
+------------+
| nom        |
+------------+
| dragibus   |
| Tirlibibi  |
| roulette   |
| carensac   |
| schtroumpf |
| tagada     |
| dagibus    |
| dagibus    |
| tagada     |
+------------+
9 rows in set (0.000 sec)
--17-- Sélectionner tous les noms des bonbons en enlevant les doublons
MariaDB [haribo]> SELECT DISTINCT nom FROM bonbon;
+------------+
| nom        |
+------------+
| dragibus   |
| Tirlibibi  |
| roulette   |
| carensac   |
| schtroumpf |
| tagada     |
| dagibus    |
+------------+
7 rows in set (0.000 sec)
--18-- Récupérer les couleurs des yeux des stagiaires (Sélectionner plusieurs champs dans une table)
MariaDB [haribo]> SELECT DISTINCT couleur_des_yeux FROM stagiaire;
+------------------+
| couleur_des_yeux |
+------------------+
| marron           |
| bleu             |
| vert             |
+------------------+
3 rows in set (0.001 sec)
--19-- Dédoublonner un résultat sur plusieurs champs
MariaDB [haribo]> SELECT couleur_des_yeux FROM stagiaire;
+------------------+
| couleur_des_yeux |
+------------------+
| marron           |
| marron           |
| marron           |
| marron           |
| marron           |
| bleu             |
| marron           |
| marron           |
| marron           |
| marron           |
| marron           |
| marron           |
| vert             |
| marron           |
+------------------+
14 rows in set (0.000 sec)
--20-- Sélectionner le stagiaire qui a l'id 5
MariaDB [haribo]> SELECT prenom FROM stagiaire WHERE id_stagiaire=5;
+--------+
| prenom |
+--------+
| Rachid |
+--------+
1 row in set (0.001 sec)
--21-- Sélectionner tous les stagiaires qui ont les yeux marrons
MariaDB [haribo]> SELECT prenom, couleur_des_yeux FROM stagiaire WHERE couleur_des_yeux='marron';
+-------------+------------------+
| prenom      | couleur_des_yeux |
+-------------+------------------+
| Jordan      | marron           |
| Amine       | marron           |
| Sara        | marron           |
| Muhammet    | marron           |
| Rachid      | marron           |
| Charly      | marron           |
| Mohammed    | marron           |
| Niamatullah | marron           |
| Zakaria     | marron           |
| David       | marron           |
| Ornella     | marron           |
| Mila        | marron           |
+-------------+------------------+
12 rows in set (0.000 sec)
--22-- Sélectionner tous les stagiaires dont l'id est plus grand que 9
MariaDB [haribo]> SELECT prenom FROM stagiaire WHERE id_stagiaire>9;
+---------+
| prenom  |
+---------+
| Zakaria |
| David   |
| Ornella |
| Patrick |
| Mila    |
+---------+
5 rows in set (0.001 sec)
--23-- Sélectionner tous les stagiaires SAUF celui dont l'id est 13 (soyons supersticieux !) :!\ il y a 2 façons de faire
MariaDB [haribo]> SELECT id_stagiaire,prenom FROM stagiaire WHERE id_stagiaire!=13;
+--------------+-------------+
| id_stagiaire | prenom      |
+--------------+-------------+
|            1 | Jordan      |
|            2 | Amine       |
|            3 | Sara        |
|            4 | Muhammet    |
|            5 | Rachid      |
|            6 | Jeremy      |
|            7 | Charly      |
|            8 | Mohammed    |
|            9 | Niamatullah |
|           10 | Zakaria     |
|           11 | David       |
|           12 | Ornella     |
|           14 | Mila        |
+--------------+-------------+
13 rows in set (0.000 sec)

--24-- Sélectionner tous les stagiaires qui ont un id inférieur ou égal à 10
MariaDB [haribo]> SELECT id_stagiaire,prenom FROM stagiaire WHERE id_stagiaire<10;
+--------------+-------------+
| id_stagiaire | prenom      |
+--------------+-------------+
|            1 | Jordan      |
|            2 | Amine       |
|            3 | Sara        |
|            4 | Muhammet    |
|            5 | Rachid      |
|            6 | Jeremy      |
|            7 | Charly      |
|            8 | Mohammed    |
|            9 | Niamatullah |
+--------------+-------------+
9 rows in set (0.001 sec)
--25-- Sélectionner tous les stagiaires dont l'id est compris entre 7 et 11
MariaDB [haribo]> SELECT id_stagiaire,prenom FROM stagiaire WHERE id_stagiaire BETWEEN '7' AND '11';
+--------------+-------------+
| id_stagiaire | prenom      |
+--------------+-------------+
|            7 | Charly      |
|            8 | Mohammed    |
|            9 | Niamatullah |
|           10 | Zakaria     |
|           11 | David       |
+--------------+-------------+
5 rows in set (0.001 sec)
--26-- Sélectionner les stagiaires dont le prénom commence par un *S*
MariaDB [haribo]> SELECT prenom FROM stagiaire WHERE prenom LIKE 's%';
+--------+
| prenom |
+--------+
| Sara   |
+--------+
1 row in set (0.000 sec)
--27-- Trier les stagiaires femmes par id décroissant
MariaDB [haribo]> SELECT prenom, genre, id_stagiaire FROM stagiaire WHERE genre=('f') ORDER BY id_stagiaire DESC;
+---------+-------+--------------+
| prenom  | genre | id_stagiaire |
+---------+-------+--------------+
| Mila    | f     |           14 |
| Ornella | f     |           12 |
| Sara    | f     |            3 |
+---------+-------+--------------+
3 rows in set (0.000 sec)

--28-- Trier les stagiaires hommes par prénom dans l'ordre alphabétique
MariaDB [haribo]> SELECT prenom, genre FROM stagiaire WHERE genre=('h') ORDER BY prenom;
+-------------+-------+
| prenom      | genre |
+-------------+-------+
| Amine       | h     |
| Charly      | h     |
| David       | h     |
| Jeremy      | h     |
| Jordan      | h     |
| Mohammed    | h     |
| Muhammet    | h     |
| Niamatullah | h     |
| Patrick     | h     |
| Rachid      | h     |
| Zakaria     | h     |
+-------------+-------+
11 rows in set (0.001 sec)

--29-- Trier les stagiaires en affichant les femmes en premier et en classant les couleurs des yeux dans l'ordre alphabétique
MariaDB [haribo]> SELECT prenom, couleur_des_yeux FROM stagiaire ORDER BY genre ASC,  couleur_des_yeux;
+-------------+------------------+
| prenom      | couleur_des_yeux |
+-------------+------------------+
| Mila        | marron           |
| Ornella     | marron           |
| Sara        | marron           |
| Jeremy      | bleu             |
| David       | marron           |
| Zakaria     | marron           |
| Niamatullah | marron           |
| Mohammed    | marron           |
| Charly      | marron           |
| Rachid      | marron           |
| Muhammet    | marron           |
| Amine       | marron           |
| Jordan      | marron           |
| Patrick     | vert             |
+-------------+------------------+
14 rows in set (0.001 sec)

--30-- Limiter l'affichage d'une requête de sélection de tous les stagiaires aux 3 premires résultats
MariaDB [haribo]> SELECT * FROM stagiaire LIMIT 3;
+--------------+--------+------------------+-------+
| id_stagiaire | prenom | couleur_des_yeux | genre |
+--------------+--------+------------------+-------+
|            1 | Jordan | marron           | h     |
|            2 | Amine  | marron           | h     |
|            3 | Sara   | marron           | f     |
+--------------+--------+------------------+-------+
3 rows in set (0.000 sec)

--31-- Limiter l'affichage d'une requête de sélection de tous les stagiaires à partir du 3ème résultat et des 5 suivants
MariaDB [haribo]> SELECT * FROM stagiaire LIMIT 3, 5 ;
+--------------+----------+------------------+-------+
| id_stagiaire | prenom   | couleur_des_yeux | genre |
+--------------+----------+------------------+-------+
|            4 | Muhammet | marron           | h     |
|            5 | Rachid   | marron           | h     |
|            6 | Jeremy   | bleu             | h     |
|            7 | Charly   | marron           | h     |
|            8 | Mohammed | marron           | h     |
+--------------+----------+------------------+-------+
5 rows in set (0.001 sec)

--32-- Afficher les 4 premiers stagiaires qui ont les yeux marron
MariaDB [haribo]> SELECT prenom, couleur_des_yeux FROM stagiaire WHERE couleur_des_yeux='marron' LIMIT 4;
+----------+------------------+
| prenom   | couleur_des_yeux |
+----------+------------------+
| Jordan   | marron           |
| Amine    | marron           |
| Sara     | marron           |
| Muhammet | marron           |
+----------+------------------+
4 rows in set (0.000 sec)

--33-- Pareil mais en triant les prénoms dans l'ordre alphabétique
MariaDB [haribo]> SELECT prenom, couleur_des_yeux FROM stagiaire WHERE couleur_des_yeux='marron' ORDER BY prenom LIMIT 4;
+--------+------------------+
| prenom | couleur_des_yeux |
+--------+------------------+
| Amine  | marron           |
| Charly | marron           |
| David  | marron           |
| Jordan | marron           |
+--------+------------------+
4 rows in set (0.001 sec)

--34-- Compter le nombre de stagiaires


--35-- Compter le nombre de stagiaires hommes mais en changeant le nom de la colonne de résultat par *nb_stagiaires_H*

--36-- Compter le nombre de couleurs d'yeux différentes

--37-- Afficher le prénom et les yeux du stagiaire qui a l'id le plus petit

--38-- Afficher le prénom et les yeux du stagiaire qui a l'id le plus grand /!\ c'est une requête imbriquée qu'il faut faire (requête sur le résultat d'une autre requête)

--39-- Afficher les stagiaires qui ont les yeux bleu et vert

--40-- A l'inverse maintenant, afficher les stagiaires qui n'ont pas les yeux bleu ni vert

--41-- récupérer tous les stagiaires qui ont mangé des bonbons, avec le détail de leurs consommations

--42-- récupérer que les stagiaires qui ont mangé des bonbons, avec le détail de leurs consommations

--43-- prénom du stagiaire, le nom du bonbon, la date de consommation pour tous les stagiaires qui ont mangé au moins une fois

--44-- Afficher les quantités consommées par les stagiaires (uniquement ceux qui ont mangé !)

--45-- Calculer combien de bonbons ont été mangés au total par chaque stagiaire et afficher le nombre de fois où ils ont mangé

--46-- Afficher combien de bonbons ont été consommés au total

--47-- Afficher le total de *Tagada* consommées

--48-- Afficher les prénoms des stagiaires qui n'ont rien mangé

--49-- Afficher les saveurs des bonbons (sans doublons)

--50-- Afficher le prénom du stagiaire qui a mangé le plus de bonbons