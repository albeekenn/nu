--auto insert primary key into customer ratings table
CREATE OR REPLACE TRIGGER CUSTOMERRATINGS_on_insert
  BEFORE INSERT ON CUSTOMERRATINGS
  FOR EACH ROW
BEGIN
  SELECT CUSTOMERRATINGS_SEQ.nextval
  INTO :new.RATINGSID
  FROM dual;
END;
--auto insert primary key into sales table
create or replace TRIGGER sales_on_insert
  BEFORE INSERT ON SALES
  FOR EACH ROW
BEGIN
  SELECT SALES_SEQ.nextval
  INTO :new.ORDERID
  FROM dual;
END;