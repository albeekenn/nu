CREATE table "REGIONS" (
    "REGIONID"   VARCHAR2(4) NOT NULL,
    "REGION"     VARCHAR2(40),
    "STATE"      VARCHAR2(5),
    constraint  "REGIONS_PK" primary key ("REGIONID")
)