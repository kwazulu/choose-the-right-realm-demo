PROMPT ============================================================
PROMPT DEMO 8: Demonstrate Mandatory Realm authorization change
PROMPT ============================================================

-- First remove APP_USER from the realm, then add it back.
-- This makes the before/after behavior visually obvious in a recording.

CONNECT dbv_owner_pdb1/Oracle123@pdb1

BEGIN
    DBMS_MACADM.ADD_AUTH_TO_REALM(
        realm_name    => 'Sensitive Data Realm',
        grantee       => 'APP_USER',
        rule_set_name => NULL,
        auth_options  => DBMS_MACUTL.G_REALM_AUTH_PARTICIPANT
    );
END;
/

CONNECT sys@pdb1 AS SYSDBA
