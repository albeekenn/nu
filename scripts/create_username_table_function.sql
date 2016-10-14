--create username table
CREATE TABLE UserLogin
(
   userid            NUMBER CONSTRAINT sh_user_login_pk PRIMARY KEY,
   username          VARCHAR2 (30),
   creation_date      DATE,
   last_update_date   DATE,
   user_password           VARCHAR2 (100),
   user_privileges    VARCHAR2 (100)
);
   
 --create username function
CREATE OR REPLACE FUNCTION bac_authenticate (
 userid_apex IN VARCHAR2, --User_Name
 password_apex IN VARCHAR2 -- Password
)
 RETURN BOOLEAN
AS
 lc_pwd_exit VARCHAR2 (1);
BEGIN
 -- Validate whether the user exits or not
 SELECT 'Y'
 INTO lc_pwd_exit
 FROM UserLogin
 WHERE (userid) = UPPER (userid_apex) AND user_password = password_apex;

RETURN TRUE;
EXCEPTION
 WHEN NO_DATA_FOUND
 THEN
 RETURN FALSE;
END bac_authenticate;
