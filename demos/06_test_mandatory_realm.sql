PROMPT ============================================================
PROMPT DEMO 7: Mandatory Realm behavior
PROMPT ============================================================

PROMPT APP_OWNER: should fail without Mandatory Realm authorization
CONNECT app_owner/Oracle123@pdb1
SELECT * FROM app_owner.sensitive_data ORDER BY id;

PROMPT APP_USER: should fail without Mandatory Realm authorization
PROMPT NOTE: This verifies that realm authorization is the additional gate.
CONNECT app_user/Oracle123@pdb1
SELECT * FROM app_owner.sensitive_data ORDER BY id;

PROMPT POWERFUL_USER: should fail because SELECT ANY TABLE alone is still insufficient
CONNECT powerful_user/Oracle123@pdb1
SELECT * FROM app_owner.sensitive_data ORDER BY id;

CONNECT sys@pdb1 AS SYSDBA
