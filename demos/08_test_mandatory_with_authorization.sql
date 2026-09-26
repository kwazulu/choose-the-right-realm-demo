PROMPT ============================================================
PROMPT DEMO 9: Mandatory Realm + Realm authorization
PROMPT ============================================================

PROMPT APP_OWNER: still fails because ownership alone is not sufficient
CONNECT app_owner/ChangeMe234@pdb1
SELECT * FROM app_owner.sensitive_data ORDER BY id;

PROMPT APP_USER: succeeds because it has BOTH SELECT and Realm authorization
CONNECT app_user/ChangeMe234@pdb1
SELECT * FROM app_owner.sensitive_data ORDER BY id;

PROMPT POWERFUL_USER: fails because SELECT ANY TABLE is not enough
CONNECT powerful_user/ChangeMe234@pdb1
SELECT * FROM app_owner.sensitive_data ORDER BY id;

