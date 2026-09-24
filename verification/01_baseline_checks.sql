PROMPT === Baseline Oracle privileges ===

SELECT grantee, privilege
FROM dba_sys_privs
WHERE grantee IN ('APP_USER', 'POWERFUL_USER')
  AND privilege IN ('CREATE SESSION', 'SELECT ANY TABLE')
ORDER BY grantee, privilege;

SELECT grantee, owner, table_name, privilege
FROM dba_tab_privs
WHERE owner = 'APP_OWNER'
  AND table_name = 'SENSITIVE_DATA'
ORDER BY grantee;

PROMPT === Baseline object ownership ===

SELECT owner, object_name, object_type
FROM dba_objects
WHERE owner = 'APP_OWNER'
  AND object_name = 'SENSITIVE_DATA';
