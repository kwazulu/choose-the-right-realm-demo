PROMPT ============================================================
PROMPT DEMO 1: Normal Oracle privilege model
PROMPT ============================================================

PROMPT APP_OWNER: owner access
CONNECT app_owner/Oracle123@pdb1
SELECT * FROM app_owner.sensitive_data ORDER BY id;

PROMPT APP_USER: direct object grant
CONNECT app_user/Oracle123@pdb1
SELECT * FROM app_owner.sensitive_data ORDER BY id;

PROMPT POWERFUL_USER: SELECT ANY TABLE
CONNECT powerful_user/Oracle123@pdb1
SELECT * FROM app_owner.sensitive_data ORDER BY id;

