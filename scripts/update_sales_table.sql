--Insert random month dates into Sales table
UPDATE sales
SET month = TRUNC(DBMS_RANDOM.VALUE(1, 13))

--Add Saleprice data from Appliances data
UPDATE SALES s
SET Saleprice = (Select saleprice
                  FROM Appliances a
                  where a.itemid = s.itemid)