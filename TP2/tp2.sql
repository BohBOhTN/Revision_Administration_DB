CREATE TABLE DEPARTEMENT(
    DEPTNUM NUMBER(4) ,
    DEPTNAME CHAR(20),
    LOC VARCHAR(20),
    CONSTRAINT PK_DEPTNUM PRIMARY KEY(DEPTNUM),
    CONSTRAINT UPPER_DEPTNAME CHECK (DEPTNAME = UPPER(DEPTNAME)),
    CONSTRAINT DEPTS_DEPTNAME CHECK (DEPTNAME IN ('ACCOUNTING','RESEARCH','SALES','OPERATIONS'))

);

ALTER TABLE DEPARTEMENT
    ADD CONSTRAINT UNIQUE_LOC UNIQUE (LOC);