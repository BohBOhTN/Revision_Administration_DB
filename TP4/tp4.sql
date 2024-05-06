----------------TP n°4 : Architecture de Base de données sous Oracle--------------------------------------

/*

Question 2
Le SGA est une zone de mémoire partagée utilisée par la base de données 
pour stocker des données et des informations de contrôle telles que le 
cache de base de données, le cache de redémarrage, le cache de 
dictionnaire, le cache de curseur partagé, etc.



Cette commande affiche les paramètres de configuration liés à la gestion 
de la mémoire du SGA (System Global Area) dans Oracle Database.

SGA SYSTEM GLOBAL AREA 
PGA PROGRAM GLOBAL AREA
*/


-- Question 3

SHOW USER;


-- Question 4

SHOW PARAMETER SESSIONS;

-- QUESTION 5

SHOW PARAMETER PROCESSES;

-- QUESTION 6

SELECT INSTANCE_NAME , STARTUP_TIME FROM V$INSTANCE;

/*
CETTE COMMANDE AFFICHE LE NOM DE L'INSTANCE ET LE DATE DE DEMMARAGE
*/


--------------------- Exploration des données ---------------------------------


----Affichez les noms des tables créés par l'utilisateur HR.-----

SELECT TABLE_NAME , OWNER
FROM ALL_TABLES
WHERE OWNER='HR';


----Affichez les noms des colonnes de la table DEPARTMENTS.-----


SELECT COLUMN_NAME
FROM ALL_TAB_COLUMNS
WHERE TABLE_NAME = 'DEPARTMENTS'

dsqnlnqlsd


