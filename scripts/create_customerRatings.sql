CREATE table "CUSTOMERRATINGS" (
    "RATINGSID"  VARCHAR2(20) NOT NULL,
    "EMPLOYEEID" VARCHAR2(20),
    "RATING"     VARCHAR2(10),
    "VALUE"      VARCHAR2(10),
    constraint  "CUSTOMERRATINGS_PK" primary key ("RATINGSID")
)
/

CREATE sequence "CUSTOMERRATINGS_SEQ" 
/

CREATE trigger "BI_CUSTOMERRATINGS"  
  before insert on "CUSTOMERRATINGS"              
  for each row 
begin  
  if :NEW."RATINGSID" is null then
    select "CUSTOMERRATINGS_SEQ".nextval into :NEW."RATINGSID" from dual;
  end if;
end;
/   

ALTER TABLE "CUSTOMERRATINGS" ADD CONSTRAINT "CUSTOMERRATINGS_FK" 
FOREIGN KEY ("EMPLOYEEID")
REFERENCES "EMPLOYEE" ("EMPLOYEEID")

/
