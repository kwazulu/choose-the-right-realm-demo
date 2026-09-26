PROMPT ============================================================
PROMPT DEMO 4: Regular Realm behavior
PROMPT ============================================================

PROMPT APP_OWNER: should succeed because ownership still permits SELECT in a Regular Realm
CONNECT app_owner/ChangeMe234@pdb1
SELECT * FROM app_owner.sensitive_data ORDER BY id;

PROMPT APP_USER: should succeed because direct SELECT grant is still honored in a Regular Realm
CONNECT app_user/ChangeMe234@pdb1
SELECT * FROM app_owner.sensitive_data ORDER BY id;

PROMPT POWERFUL_USER: should fail because SELECT ANY TABLE cannot cross the Realm boundary
CONNECT powerful_user/ChangeMe234@pdb1
SELECT * FROM app_owner.sensitive_data ORDER BY id;


