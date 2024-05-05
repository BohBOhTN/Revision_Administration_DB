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