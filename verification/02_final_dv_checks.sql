PROMPT === Final Database Vault realm definition, run as dv_owner ===

CONNECT dbv_owner_pdb1/ChangeMe234@pdb1

SELECT name,
       description,
       enabled,
       audit_options,
       realm_type
FROM dvsys.dba_dv_realm
WHERE name = 'Sensitive Data Realm';

PROMPT === Protected object ===

SELECT realm_name,
       owner,
       object_name,
       object_type
FROM dvsys.dba_dv_realm_object
WHERE realm_name = 'Sensitive Data Realm';

PROMPT === Realm authorizations ===

SELECT realm_name,
       grantee,
       auth_options,
       auth_rule_set_name
FROM dvsys.dba_dv_realm_auth
WHERE realm_name = 'Sensitive Data Realm';
