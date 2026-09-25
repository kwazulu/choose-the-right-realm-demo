PROMPT ============================================================
PROMPT Cleanup
PROMPT ============================================================

CONNECT dbv_owner_pdb1/Oracle123@pdb1

BEGIN
    DBMS_MACADM.DELETE_REALM_CASCADE('Sensitive Data Realm');
END;
/

CONNECT dv_acctmgr_pdb1@pdb1

BEGIN
    EXECUTE IMMEDIATE 'DROP USER app_user CASCADE';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -01918 THEN RAISE; END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP USER powerful_user CASCADE';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -01918 THEN RAISE; END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP USER app_owner CASCADE';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -01918 THEN RAISE; END IF;
END;
/
