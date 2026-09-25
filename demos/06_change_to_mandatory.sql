PROMPT ============================================================
PROMPT DEMO 6: Change the Realm from Regular to Mandatory
PROMPT ============================================================

-- Preserve the existing description, enabled state, and audit setting.
-- Only realm_type changes here.

CONNECT dbv_owner_pdb1/Oracle123@pdb1

BEGIN
    DBMS_MACADM.UPDATE_REALM(
        realm_name    => 'Sensitive Data Realm',
        description   => 'Demo realm for Regular vs Mandatory behavior',
        enabled       => DBMS_MACUTL.G_YES,
        audit_options => DBMS_MACUTL.G_REALM_AUDIT_FAIL,
        realm_type    => 1
    );
END;
/


SELECT name, description, enabled, audit_options, realm_type
FROM dvsys.dba_dv_realm
WHERE name = 'Sensitive Data Realm';
