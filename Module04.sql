
/***********************************************************************/

/* MODULE 4 */ /* SQL CODE */
/* OBJECTIVE: Create New Custom Roles in the Worksheet */

/* EXERCISE: Create a new worksheet */

/* EXERCISE: Display Current and Inherited Roles */
/* -----> Set Context */
USE ROLE SECURITYADMIN;
/* -----> Display Current and Inherited Roles */
SHOW ROLES;

/* EXERCISE: Create New Custom Account Roles */
/* -----> Set Context */
USE ROLE SECURITYADMIN;
/* -----> Create Two New Roles */ 
CREATE ROLE DEV_ROLE;
CREATE ROLE TEMP_ROLE;
/* -----> Best Practice Grant Custom Roles
 to the System Admin Role */
GRANT ROLE DEV_ROLE TO ROLE SYSADMIN;
GRANT ROLE TEMP_ROLE TO ROLE SYSADMIN; 

/* EXERCISE: Create New Database and Database Role */
/* -----> Set Context */
USE ROLE SYSADMIN;
/* -----> Create New Database and New Database Role */
CREATE DATABASE Temp_DB;
/* —--> Context not required if you create role
 Immediately after creating database */
USE DATABASE Temp_DB;
/* —--> Create Database Role */
CREATE DATABASE ROLE TempDB;

/* EXERCISE: Assign Database Role to a 
Custom Account Role */
/* -----> Set Context */
USE ROLE SYSADMIN;
/* -----> Grant Database Role to a 
Custom Account Role */
GRANT DATABASE ROLE Temp_DB.TempDB TO ROLE Dev_Role;

/* EXERCISE: Determine your primary role */
/* -----> See your current primary role */
SELECT CURRENT_ROLE();

/* EXERCISE: Change roles */
/* -----> Switch role which changes context */
USE ROLE USERADMIN;

/* EXERCISE: Display a list of current users */
SHOW USERS;

/* EXERCISE: Create and assign role to user */
/* -----> Set Context */
USE ROLE USERADMIN;
/* -----> Assign Role to User */
/* -----> Substitute your username */
CREATE ROLE New_Role;
GRANT ROLE New_Role TO USER JoyceKayAvila;

/* EXERCISE: Display a list of roles granted 
To your user account */
SHOW GRANTS;

/* EXERCISE: Display a list of roles and users for 
which a specific custom role has been granted */
SHOW GRANTS OF ROLE New_Role;

/* EXERCISE: Use All Secondary Roles in a Session */
USE SECONDARY ROLES ALL;

/* EXERCISE: Remove the use of all secondary roles 
in a session */
USE SECONDARY ROLES NONE;

/* EXERCISE: Grant Usage Privileges */
/* -----> Set Context */
USE ROLE SYSADMIN;
/* -----> Create new database and schema */
CREATE DATABASE Test_DB;
CREATE SCHEMA Test_DB.Test;
/* -----> Set Context for Granting Privileges */
USE ROLE SECURITYADMIN;
/* -----> Grant Usage on a Database */
GRANT USAGE ON DATABASE Test_DB TO ROLE Temp_Role;
/* -----> Grant Usage on a Schema */
GRANT USAGE ON SCHEMA Test_DB.Test TO ROLE Dev_Role;

/* EXERCISE: Display permission assignments for schema */
/* -----> Set Context */
USE ROLE SECURITYADMIN;
/* -----> Display assignments for a schema */
SHOW GRANTS ON SCHEMA Test_DB.Test;

/* EXERCISE: Grant SELECT Privileges on Tables to a Role*/
/* -----> Set Context */
USE ROLE SECURITYADMIN;
/* -----> Grant Select Privileges on All Schema Tables */
GRANT SELECT ON ALL TABLES IN SCHEMA Test_DB.Test 
      TO ROLE Temp_Role;

/* EXERCISE: Grant All Privileges on a Schema to a Role */
/* -----> Set Context */
USE ROLE SYSADMIN;
/* -----> Grant ALL Privileges on Schema in a Database */
GRANT ALL ON SCHEMA Test_DB.Test TO ROLE Dev_Role;

/* EXERCISE: Use Insufficient Privileges to
Grant ACCOUNTADMIN role to new user */
/* -----> Set Context */
USE ROLE USERADMIN;
/* ----- Create new user */
CREATE USER TestUser;
/* ----- Assign the ACCOUNTADMIN role */
GRANT ROLE ACCOUNTADMIN TO USER TestUser;

/* EXERCISE: Change Role and Re-Attempt to 
Grant Account Admin Role */
/* -----> Set Context */
USE ROLE ACCOUNTADMIN;
/* -----> Grant Account Admin Role to a User */
GRANT ROLE ACCOUNTADMIN TO USER TestUser;

/* EXERCISE: Create New User then Change User Details */
/* -----> Set Context */
USE ROLE USERADMIN;
/* -----> Create a new user */
CREATE USER User101
PASSWORD = '123'
LOGIN_NAME = CDAVIS
DISPLAY_NAME = CARLOS
LAST_NAME = DAVIS
EMAIL = 'CDAVIS@COMPANY.COM'
MUST_CHANGE_PASSWORD = TRUE;
/* -----> Change so that access expires in 30 days */
ALTER USER User101 SET DAYS_TO_EXPIRY = 30;

/* EXERCISE:  Set Default Role for a New User 
(Note: Warning) */
/* -----> Set Context */
USE ROLE USERADMIN;
/* -----> Set Default Role that doesn't exist */
ALTER USER USER101 SET DEFAULT_ROLE = IMAGINARY_ROLE;

/* EXERCISE: Set Default Role for New User and Confirm 
Default Role Has Been Set */
/* -----> Set Context */
USE ROLE USERADMIN;
/* -----> Set Default Role */
ALTER USER User101 SET DEFAULT_ROLE = SYSADMIN;
/* -----> Confirm default role has been set */
DESC USER User101;

/* EXERCISE: Immediately Reset the Lockout Timer */
/* -----> Set Context */
USE ROLE USERADMIN;
/* -----> Immediately Reset the Lockout Timer */
ALTER  USER User101 SET MINS_TO_UNLOCK = 0;

/* EXERCISE: Reset a User's Password 
(Using Invalid Password) */
/* Set Context */
USE ROLE USERADMIN;
/* Attempt to Reset Password */
ALTER USER User101 SET PASSWORD = '123';

/* EXERCISE: Reset a User's Password Successfully */
/* -----> Set Context */
USE ROLE USERADMIN;
/* -----> Reset a User's Password */
ALTER USER USER101 SET PASSWORD = '123456Aa'
MUST_CHANGE_PASSWORD = TRUE;

/* EXERCISE: Show you a list of all users */
USE ROLE USERADMIN;
SHOW USERS;

/* EXERCISE: Remove a user from the account */
USE ROLE USERADMIN;
DROP USER User101;

/* MODULE 4 */ /* NO CODE */
/* OBJECTIVE: Manage Roles and Users in the Web UI */

/* EXERCISE: In the WebUI, Drop User TestUser */

/* EXERCISE: In the WebUI, Change default role to SecurityAdmin role */

/* EXERCISE: In the WebUI, review the Graph version of the Snowflake Roles */

/* EXERCISE: In the WebUI, review the Table version of the Snowflake Roles */

/* EXERCISE: In the WebUI, Drop the following roles: Dev_Role, New_Role, and Temp_Role */

/* EXERCISE: In the WebUI, Drop the following databases: Temp_DB, Test_DB.  Be sure to change your role first to SECURITYADMIN or ACCOUNTADMIN */

/***********************************************************************/
