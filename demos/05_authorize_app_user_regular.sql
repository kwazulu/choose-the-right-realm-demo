PROMPT ============================================================
PROMPT DEMO 5: Add APP_USER as a Regular Realm participant
PROMPT ============================================================

CONNECT C##DVOWNER/Oracle123

BEGIN
    DBMS_MACADM.ADD_AUTH_TO_REALM(
        realm_name   => 'Sensitive Data Realm',
        grantee      => 'APP_USER',
        rule_set_name => NULL,
        auth_options => DBMS_MACUTL.G_REALM_AUTH_PARTICIPANT
    );
END;
/

CONNECT / AS SYSDBA

SELECT realm_name, grantee, auth_options, rule_set_name
FROM dvsys.dba_dv_realm_auth
WHERE realm_name = 'Sensitive Data Realm';
