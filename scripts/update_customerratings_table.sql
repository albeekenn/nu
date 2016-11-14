--Remove the all Star(s) text from rating column
UPDATE CUSTOEMRRATINGS
SET RATING = RTRIM(rating,SUBSTR(rating, 2));

--replace all zero ratings value with 1
UPDATE CUSTOMERRATINGS
SET value = 5
WHERE value = 0;
