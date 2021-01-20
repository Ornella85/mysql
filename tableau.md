MariaDB [haribo]> SELECT * FROM stagiaire;
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
|           13 | Patrick     | vert             | h     |
|           14 | Mila        | marron           | f     |
+--------------+-------------+------------------+-------+
14 rows in set (0.001 sec)
MariaDB [haribo]>  SELECT * FROM bonbon;
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

MariaDB [haribo]> SELECT * FROM manger;
+-----------+--------------+-----------+-------------+----------+
| id_manger | id_stagiaire | id_bonbon | date_manger | quantite |
+-----------+--------------+-----------+-------------+----------+
|         1 |            7 |         4 | 2018-09-20  |        5 |
|         2 |            1 |         5 | 2019-10-25  |       12 |
|         3 |           10 |         2 | 2020-03-01  |       25 |
|         4 |            2 |         1 | 2020-04-02  |       30 |
|         5 |           12 |         3 | 2020-01-12  |        3 |
|         6 |            8 |         1 | 2021-05-14  |       45 |
|         7 |            7 |         2 | 2020-02-07  |       20 |
|         8 |            5 |         4 | 2020-06-29  |        4 |
+-----------+--------------+-----------+-------------+----------+
8 rows in set (0.001 sec)
