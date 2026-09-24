# Oracle Database Vault 19c: Regular vs Mandatory Realm Demo

Companion demo code for the blog post:

**Choose the Right Realm: Avoiding Unnecessary Database Vault Friction**

This lab demonstrates the difference between a Regular Realm and a Mandatory Realm using the same object, users, and Oracle privileges. The only thing that changes during the demonstration is the Database Vault realm configuration.

## Prerequisites

- Oracle Database 19c with Database Vault configured and enabled in the target PDB.
- A Database Vault administrator account with `DV_OWNER` or `DV_ADMIN` authorization sufficient to run the realm administration calls in this lab.
- SQL*Plus or SQLcl.
- This lab is intended for a disposable/test database. Do not run it against production.

## Demo scenario

The lab creates three users:

| User | Purpose |
|---|---|
| `APP_OWNER` | Owns the protected table. Ownership normally provides inherent access. |
| `APP_USER` | Has a direct `SELECT` object grant. |
| `POWERFUL_USER` | Has `SELECT ANY TABLE`. |

The table is `APP_OWNER.SENSITIVE_DATA`.

Expected access results:

| State | APP_OWNER | APP_USER | POWERFUL_USER |
|---|---:|---:|---:|
| No Realm | YES | YES | YES |
| Regular Realm | YES | YES | NO |
| Mandatory Realm | NO | NO | NO |
| Mandatory Realm + APP_USER realm authorization | NO | YES | NO |

A Mandatory Realm requires the underlying Oracle privilege and Database Vault realm authorization. A Regular Realm allows object owners and users with direct object privileges to query and perform DML without realm authorization, while requiring realm authorization for DDL and for system-privilege-based access. See Oracle Database Vault 19c Administrator's Guide, Chapter 4.

## Run order

Run setup scripts first, then execute the demo scripts in order.

```text
setup/01_create_users.sql
setup/02_create_objects.sql
setup/03_grant_privileges.sql

verification/01_baseline_checks.sql

demos/01_baseline.sql
demos/02_create_regular_realm.sql
demos/03_add_object_to_realm.sql
demos/04_test_regular_realm.sql
demos/05_authorize_app_user_regular.sql
demos/06_change_to_mandatory.sql
demos/07_test_mandatory_realm.sql
demos/08_authorize_app_user_mandatory.sql
demos/09_test_mandatory_with_authorization.sql

verification/02_final_dv_checks.sql

cleanup/cleanup.sql
```

The scripts intentionally separate administration from verification so the recording can pause between each conceptual step.

## Notes on the API

Oracle 19c provides `DBMS_MACADM.CREATE_REALM`, `ADD_OBJECT_TO_REALM`, `ADD_AUTH_TO_REALM`, `UPDATE_REALM`, `UPDATE_REALM_AUTH`, `DELETE_AUTH_FROM_REALM`, and `DELETE_REALM`. The 19c `UPDATE_REALM` API accepts `realm_type`; `0` is Regular and `1` enables Mandatory realm checking.

Realm authorization does not replace ordinary Oracle privileges. The user still needs the privilege required for the operation.

## Credentials

The example passwords are intentionally simple because this is a demo lab. Replace them before using the scripts in any shared environment.
