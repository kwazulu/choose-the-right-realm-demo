PROMPT ============================================================
PROMPT DEMO 2: Create a Regular Realm
PROMPT ============================================================

-- Run as the designated Database Vault administrator.
-- Adjust the CONNECT statement for the local DV owner in your lab.

CONNECT dbv_owner_pdb1/Oracle123@pdb1

BEGIN
    DBMS_MACADM.CREATE_REALM(
        realm_name    => 'Sensitive Data Realm',
        description   => 'Demo realm for Regular vs Mandatory behavior',
        enabled       => DBMS_MACUTL.G_YES,
        audit_options => DBMS_MACUTL.G_REALM_AUDIT_FAIL,
        realm_type    => 0
    );
END;
/

SELECT name, description, enabled, audit_options, realm_type
FROM dvsys.dba_dv_realm
WHERE name = 'Sensitive Data Realm';
