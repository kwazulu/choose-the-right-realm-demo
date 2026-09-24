# Recording Script

## Opening

"In this demo I'm going to use the same table, the same three users, and the same Oracle privileges throughout. The only thing I'm going to change is the Database Vault Realm type. That lets us see exactly what Regular and Mandatory Realms do differently."

## 1. Establish the baseline

Show `APP_OWNER`, `APP_USER`, and `POWERFUL_USER` each selecting from `APP_OWNER.SENSITIVE_DATA`.

Narration:

> "Under the normal Oracle privilege model, APP_OWNER can access the table because it owns it. APP_USER can access it because it has a direct SELECT grant. POWERFUL_USER can access it because it has SELECT ANY TABLE."

## 2. Create the Regular Realm

Run:

```sql
@demos/02_create_regular_realm.sql
@demos/03_add_object_to_realm.sql
```

Narration:

> "Now I'm going to protect the table with a Regular Realm."

## 3. Test the Regular Realm

Run:

```sql
@demos/04_test_regular_realm.sql
```

Narration:

> "APP_OWNER still succeeds. APP_USER still succeeds because the direct object grant is still honored. POWERFUL_USER fails because SELECT ANY TABLE cannot cross the Realm boundary."

This is the key Regular Realm result.

## 4. Change to Mandatory

Run:

```sql
@demos/06_change_to_mandatory.sql
```

Narration:

> "Now I'm going to change this same Realm from Regular to Mandatory. I haven't changed the users or their Oracle privileges. I've only changed the Realm type."

## 5. Test Mandatory behavior

Run:

```sql
@demos/07_test_mandatory_realm.sql
```

Narration:

> "The behavior is now different. A Mandatory Realm requires realm authorization in addition to the underlying Oracle privilege. This changes the trust model because object ownership and direct object grants are no longer sufficient by themselves."

## 6. Demonstrate the additional gate

Run:

```sql
@demos/08_authorize_app_user_mandatory.sql
@demos/09_test_mandatory_with_authorization.sql
```

Narration:

> "I've now authorized APP_USER to the Mandatory Realm. APP_USER has both things it needs: SELECT on the object and Realm authorization. The query succeeds. APP_OWNER still fails because ownership alone isn't sufficient, and POWERFUL_USER still fails because SELECT ANY TABLE alone isn't sufficient."

## Closing

> "That's the practical difference. Use a Regular Realm when you primarily want to stop privileged users from leveraging powerful system privileges against protected data without disturbing established object grants. Use a Mandatory Realm when you need Database Vault authorization to become an additional gate on top of ordinary database privileges, including object ownership."
