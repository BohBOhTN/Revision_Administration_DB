------------------------TP 3 LES VUES--------------------------


--Question 1

CREATE VIEW V_EMP AS
SELECT
    E.EMPNUM,
    E.EMPNAME,
    E.DEPTNUM,
    E.EMPSAL + E.EMPCOMMISSION AS GAINS,
    D.LOC
FROM 
    EMPLOYER E
JOIN
    DEPARTEMENT D
ON
    E.DEPTNUM = D.DEPTNUM ;


--Question 2 

SELECT * FROM V_EMP
WHERE GAINS>2500 ;

--Question 3

UPDATE V_EMP
SET EMPNAME = 'MARTINN'
WHERE EMPNAME = 'MARTIN';

--Question 4

UPDATE V_EMP
SET LOC = 'SFAX'
WHERE EMPNAME = 'MARTINN';

--Question 5

CREATE VIEW V_EMP_10 AS
SELECT *
FROM
    EMPLOYER
WHERE
    DEPTNUM = 10 ;

--Question 5.1

INSERT INTO 
V_EMP_10 (EMPNUM, EMPNAME, EMPJOB, REQDATE, EMPSAL, EMPCOMMISSION, DEPTNUM, EMPMGR)
VALUES (1224, 'SALAH', 'ANALYST', TO_DATE('01/01/2022', 'DD/MM/YYYY'), 1500, NULL, 20, 7839);

--Question 5.2

SELECT * FROM V_EMP_10
WHERE EMPNAME='SALAH';
--This code returns 0 rows since the view only accepts department 10 employees 
--but it inserts the new ligne to the main table EMPLOYER


SELECT * FROM EMPLOYER
WHERE EMPNAME='SALAH';


--Question 6 


CREATE VIEW V_EMP_10 AS
SELECT *
FROM
    EMPLOYER
WHERE
    DEPTNUM = 10 
WITH
    CHECK OPTION;

--Question 7

INSERT INTO 
V_EMP_10 (EMPNUM, EMPNAME, EMPJOB, REQDATE, EMPSAL, EMPCOMMISSION, DEPTNUM, EMPMGR)
VALUES (1224, 'BALARD', 'ANALYST', TO_DATE('21/04/2018', 'DD/MM/YYYY'), 1500, NULL, 30, 7839);


UPDATE V_EMP_10
SET DEPTNUM=20
WHERE EMPSAL=750;

/*vous ne pouvez insérer un employé avec DEPTNUM = 30 dans la vue V_EMP_10 
ni modifier le département d'un employé à une valeur autre que 10 via 
la vue V_EMP_10. Ces opérations vont à l'encontre de la condition 
de la vue et ne sont donc pas autorisées.*/


--Question 8

--Créaction de la vue
--Méthode 1
CREATE VIEW TOTAL_SAL_PAR_DEP AS
SELECT 
    DEPTNUM, SUM(EMPSAL) AS TOTAL_SAL
FROM
    EMPLOYER
GROUP BY DEPTNUM;



SELECT
    E.EMPNAME,
    E.EMPSAL,
    (E.EMPSAL / T.TOTAL_SAL * 100) AS pourcentage_salaire
FROM
    EMPLOYER E
JOIN
    TOTAL_SAL_PAR_DEP T ON E.DEPTNUM = T.DEPTNUM;


--Méthode 2 

SELECT
    E.EMPNAME,
    E.EMPSAL,
    (E.EMPSAL / T.TOTAL_SAL * 100) AS pourcentage_salaire
FROM
    EMPLOYER E
JOIN
    (SELECT DEPTNUM, SUM(EMPSAL) AS TOTAL_SAL
     FROM EMPLOYER
     GROUP BY DEPTNUM) T ON E.DEPTNUM = T.DEPTNUM;

