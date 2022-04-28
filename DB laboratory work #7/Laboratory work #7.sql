CREATE DATABASE lab7;
SELECT * FROM customers;
SELECT * FROM accounts;
SELECT * FROM transactions;

-- Laboratory work #7


-- 1. How can we store large-object types?
-- Solution:
/*
Large objects are stored as a large object:
blob:  binary large object -- object is a large collection of uninterpreted binary data
(whose interpretation is left to an application outside of the database system)
clob: character large object -- object is a large collection of character data
When a query returns a large object, a pointer is returned
rather than the large object itself.
*/


-- 2. What is the difference between privilege, role and user?
-- Solution:
/*
A user privilege is a right to execute a particular type of SQL statement, or a right to access another user's object.
Roles, on the other hand, are created by users (usually administrators) and are used to group together privileges or other roles.
*/


-- 2.1. create accountant, administrator, support roles and grant appropriate privileges
-- Solution:
CREATE ROLE accountant;
CREATE ROLE administrator;
CREATE ROLE support;
-- accountant
GRANT UPDATE ON customers TO accountant;
-- REVOKE UPDATE ON customers FROM accountant;
GRANT ALL PRIVILEGES ON accounts TO accountant;
-- REVOKE ALL PRIVILEGES ON accounts FROM accountant;

-- support
GRANT DELETE ON customers TO support;
-- REVOKE DELETE ON customers FROM support;
GRANT ALL PRIVILEGES ON transactions TO support;
-- REVOKE ALL PRIVILEGES ON transactions FROM support;

-- administrator
GRANT ALL PRIVILEGES ON customers TO administrator;
-- REVOKE ALL PRIVILEGES ON customers FROM administrator;
GRANT ALL PRIVILEGES ON accounts TO administrator;
-- REVOKE ALL PRIVILEGES ON accounts FROM administrator;
GRANT ALL PRIVILEGES ON transactions TO administrator;
-- REVOKE ALL PRIVILEGES ON transactions FROM administrator;


-- 2.2. create some users and assign them roles
-- Solution:
-- user Alex - administrator
-- user Bob - accountant
-- user John - support
CREATE USER Alex WITH PASSWORD '123';
CREATE USER Bob WITH PASSWORD '123';
CREATE USER John WITH PASSWORD '123';
GRANT administrator TO Alex;
GRANT accountant TO Bob;
GRANT support TO John;


-- 2.3. give to some of them permission to grant roles to other users
-- Solution:
GRANT ALL PRIVILEGES ON DATABASE lab7 TO Alex;


-- 2.4. revoke some privilege from particular user
-- Solution:
REVOKE DELETE ON customers FROM John;


-- 3. Add appropriate constraints
-- Solution:
-- SKIPPED


-- 4. Change currency column type to user-defined in accounts table
-- Solution:
-- SKIPPED


-- 5. Create indexes:
-- 5.1. index so that each customer can only have one account of one currency
-- Solution:
-- It is not clear how can I use "index" here.


-- 5.2. index for searching transactions by currency and balance
-- Solution:
-- It is not clear how we can connect tables "accounts" and "transactions"?
-- Should we do it by scr_account?