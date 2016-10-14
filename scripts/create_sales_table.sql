CREATE table "SALES" (
    "ORDERID"    VARCHAR2(20) NOT NULL,
    "EMPLOYEEID" VARCHAR2(20),
    "ITEMID"     VARCHAR2(20),
    "VALUE"      VARCHAR2(20),
    "MONTH"      VARCHAR2(3),
    constraint  "SALES_PK" primary key ("ORDERID")
)
/

CREATE sequence "SALES_SEQ" 
/

CREATE trigger "BI_SALES"  
  before insert on "SALES"              
  for each row 
begin  
  if :NEW."ORDERID" is null then
    select "SALES_SEQ".nextval into :NEW."ORDERID" from dual;
  end if;
end;
/   

ALTER TABLE "SALES" ADD CONSTRAINT "SALES_FK" 
FOREIGN KEY ("EMPLOYEEID")
REFERENCES "EMPLOYEE" ("EMPLOYEEID")

/
ALTER TABLE "SALES" ADD CONSTRAINT "SALES_FK2" 
FOREIGN KEY ("ITEMID")
REFERENCES "APPLIANCES" ("ITEMID")

/
