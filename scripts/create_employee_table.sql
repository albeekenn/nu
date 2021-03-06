CREATE TABLE EMPLOYEE 
(
  EMPLOYEEID VARCHAR2(20) NOT NULL 
, NAME VARCHAR2(20) 
, SALARYBAND VARCHAR2(20) NOT NULL 
, BASESALARY NUMBER 
, STORENUMBER VARCHAR2(20) NOT NULL 
, CONSTRAINT EMPLOYEE_PK PRIMARY KEY 
  (
    EMPLOYEEID
  , STORENUMBER 
  )
  ENABLE 
);

ALTER TABLE EMPLOYEE
ADD CONSTRAINT EMPLOYEE_FK1 FOREIGN KEY
(
  STORENUMBER 
)
REFERENCES STORES
(
  STORENUMBER 
)
ENABLE;
