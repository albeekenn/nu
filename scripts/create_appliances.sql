CREATE table "APPLIANCES" (
    "ITEMID"               VARCHAR2(20) NOT NULL,
    "APPLIANCEDESCRIPTION" VARCHAR2(50),
    "MANUFACTURER"         VARCHAR2(30),
    "CLASS"                VARCHAR2(4),
    "SALEPRICE"            NUMBER(10),
    "SALECOST"             NUMBER(10),
    constraint  "APPLIANCES_PK" primary key ("ITEMID")
)