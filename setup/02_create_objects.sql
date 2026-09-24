PROMPT Creating demo table and data...

CONNECT app_owner/Oracle123

CREATE TABLE sensitive_data (
    id       NUMBER PRIMARY KEY,
    customer VARCHAR2(50),
    secret   VARCHAR2(100)
);

INSERT INTO sensitive_data VALUES (1, 'Customer A', 'Sensitive Data A');
INSERT INTO sensitive_data VALUES (2, 'Customer B', 'Sensitive Data B');
COMMIT;

CONNECT / AS SYSDBA
