
/***********************************************************************/

/* MODULE 2 * / /* NO CODE */
/* OBJECTIVE: Create New Database Objects in the Web UI */

/* EXERCISE: Confirm the role being used is the ACCOUNTADMIN role */

/* EXERCISE: Access the Databases Menu option in the Web UI */

/* EXERCISE: Create a new database - “Module2_DB”  */

/* EXERCISE: Show (Display) a current list of schemas within the Module2_DB */

/* EXERCISE: Create a new schema - “Tutorial” */

/* EXERCISE: (Display) a current list of schemas in the new database */

/* EXERCISE: Explore the options that are possible by clicking on the Create button */

/* EXERCISE: Drop (Remove) the database you previously created */

/***********************************************************************/

/* MODULE 2 */ /* SQL CODE */
/* OBJECTIVE: Create New Database Objects in the Worksheet */

/* EXERCISE: Access the worksheet */

/* EXERCISE: Create a new database */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Create a new database */
CREATE DATABASE Demo2_DB
COMMENT = 'New Database for Module 2';

/* EXERCISE: Show (Display) current database list 
for which your role has access */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Obtain a list of databases */
SHOW DATABASES;

/* EXERCISE: Alter (Edit) the database properties */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Change data retention time of database */
ALTER DATABASE Demo2_DB
SET DATA_RETENTION_TIME_IN_DAYS=10;

/* EXERCISE: Drop (Remove) the Database */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Drop the database */
DROP DATABASE Demo2_DB;

/* EXERCISE: Undrop (Restore) Database */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Restore the database */
UNDROP DATABASE Demo2_DB;

/* EXERCISE: Undrop (Restore) Database */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Restore the database */
UNDROP DATABASE Module2_DB;

/* EXERCISE: Show (Display) a current list of 
databases for which your role has access */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Obtain a list of databases */
SHOW DATABASES;

/* EXERCISE: Create New Schema */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
USE DATABASE Demo2_DB;
/* ----> Create a new schema */
CREATE SCHEMA Lesson;

/* EXERCISE: Rename the Schema - Option #1 */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
USE DATABASE Demo2_DB;
/* ----> Alter Schema */
ALTER SCHEMA Lesson RENAME TO Lesson2;

/* EXERCISE: Rename the Schema - Option #2 */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Alter Schema */
ALTER SCHEMA Demo2_DB.Lesson RENAME TO Lesson2;

/* EXERCISE: Show (Display) List of schemas - Option #1 */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
USE DATABASE Demo2_DB;
/* ----> Show Schemas for which the role has access */
SHOW SCHEMAS;

/* EXERCISE: Show (Display) List of schemas - Option #2 */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Show Schemas for which the role has access */
SHOW SCHEMAS IN DATABASE Demo2_DB;

/* EXERCISE: Create a table */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Create a new database, schema, 
and a new table */
CREATE DATABASE Training_DB;
CREATE SCHEMA Training;
CREATE TABLE New_Table
	(Customer_Account int,
	Amount int,
	Transaction_ts Timestamp);

/* EXERCISE: Create table from an existing table */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Create a new table from existing table */
CREATE TABLE Newer_Table LIKE New_Table;
/* -----> Confirm the details of the table */
DESC TABLE Newer_Table;

/* EXERCISE: Insert values into a new table */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
USE WAREHOUSE COMPUTE_WH;
Use SCHEMA Training_DB.Training;
/* ----> Create new table */
CREATE TABLE New_Table2 (a varchar); 
/* ----> Insert values */
INSERT INTO New_Table2 VALUES ('A');

/* EXERCISE: View list of tables within schema */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
USE DATABASE Training_DB;
USE SCHEMA Training;
/* ----> Show a list of tables */
SHOW TABLES;


/* EXERCISE: View the contents of a table */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
USE WAREHOUSE COMPUTE_WH;
/* ----> View the contents of a table */
SELECT * FROM Training_DB.Training.New_Table2;


/* EXERCISE: Cleanup: drop databases */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Drop databases */
DROP DATABASE Training_DB;
DROP DATABASE Demo2_DB;
DROP DATABASE Module2_DB;

/***********************************************************************/

/* MODULE 2 */ /* NO CODE */
/* OBJECTIVE: Review Data Shares and Data Marketplace*/

/* EXERCISE: Review Direct Shares (Private Sharing) of the Account */
/* —--> Navigate to the Private Sharing SubMenu */

/* EXERCISE: Review the Public Snowflake Marketplace */
/* —--> Navigate to the Marketplace SubMenu */


/***********************************************************************/
