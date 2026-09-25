PROMPT ============================================================
PROMPT DEMO 3: Add the table to the Regular Realm
PROMPT ============================================================

CONNECT dbv_owner_pdb1/Oracle123@pdb1

BEGIN
    DBMS_MACADM.ADD_OBJECT_TO_REALM(
        realm_name   => 'Sensitive Data Realm',
        object_owner => 'APP_OWNER',
        object_name  => 'SENSITIVE_DATA',
        object_type  => 'TABLE'
    );
END;
/


SELECT realm_name, owner, object_name, object_type
FROM dvsys.dba_dv_realm_object
WHERE realm_name = 'Sensitive Data Realm';
