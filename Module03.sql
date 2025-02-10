/***********************************************************************/

/* MODULE 3 */ /* NO CODE */
/* OBJECTIVE: Create Virtual Warehouse in the Web UI */

Basic_WH
MCluster_WH

/* EXERCISE: Confirm the role being used is the ACCOUNTADMIN role */

/* EXERCISE: Access the  Warehouses Menu Option in the Web UI */

/* EXERCISE: Click on the Button to Create a New Warehouse */

/* EXERCISE: Create a new X-Small Single Cluster Warehouse */

/* EXERCISE: Edit warehouse details */

/* EXERCISE: Create a new Small Multi Cluster Warehouse */

/* EXERCISE: Drop (Remove) Warehouses you previously created */



/***********************************************************************/

/* MODULE 3 */ /* SQL CODE */
/* OBJECTIVE: Create and Manage Virtual Warehouses in the Worksheet */


/* EXERCISE: Create single cluster warehouse in a suspended state */
/* ---->  Set Context */
USE ROLE ACCOUNTADMIN;
/* ---->  Create Virtual Warehouse in a Suspended State */
CREATE WAREHOUSE Module3_WH WITH WAREHOUSE_SIZE = MEDIUM
	AUTO_SUSPEND = 300 
	AUTO_RESUME = true 
	INITIALLY_SUSPENDED = true;


/* EXERCISE: Create a multi-cluster virtual warehouse */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Create a Multi-Cluster Virtual Warehouse */
CREATE WAREHOUSE MCmodule3_WH
	WITH WAREHOUSE_SIZE = MEDIUM
	MIN_CLUSTER_COUNT = 1
	MAX_CLUSTER_COUNT = 6 
SCALING_POLICY = 'STANDARD';



/* EXERCISE: Scale Up a Virtual Warehouse */
/* ---->  Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Scale Warehouse Up Using the ALTER Command */
ALTER WAREHOUSE Module3_WH
SET WAREHOUSE_SIZE = LARGE;


/* EXERCISE: Change Scaling Policy of a Multi Cluster Warehouse */
/* ---->  Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Change Scaling Policy */
ALTER WAREHOUSE MCmodule3_WH
SET SCALING_POLICY = 'ECONOMY';



/***********************************************************************/

/* MODULE 3 */ /* SQL CODE */
/* OBJECTIVE: Create and Manage Resource Monitors in the Worksheet */



/* EXERCISE: Create Account-Level Resource Monitor */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Create Account-Level Resource Monitor */
CREATE OR REPLACE RESOURCE MONITOR MonitorAll_RM 
WITH CREDIT_QUOTA = 20000
	TRIGGERS ON 50 percent do notify
	ON 75 PERCENT DO NOTIFY
	ON 100 PERCENT DO NOTIFY
	ON 110 PERCENT DO NOTIFY
	ON 125 PERCENT DO NOTIFY;


/* EXERCISE: Create Resource Monitor for Virtual Warehouses */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Create Resource Monitor */
CREATE RESOURCE MONITOR Monitor1_RM WITH CREDIT_QUOTA = 1000
TRIGGERS ON 75 PERCENT DO NOTIFY
	ON 90 PERCENT DO SUSPEND
	ON 105 PERCENT DO SUSPEND_IMMEDIATE;


/* EXERCISE: Assign Resource Monitor to the Account */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Assign the Resource Monitor to the Account */
ALTER ACCOUNT SET RESOURCE_MONITOR = MonitorAll_RM;


/* EXERCISE: Assign First Virtual Warehouse to Resource Monitor */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Assign Warehouse to Resource Monitor */
ALTER WAREHOUSE Module3_WH SET RESOURCE_MONITOR = Monitor1_RM;


/* EXERCISE: Assign Second Virtual Warehouse to Resource Monitor */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Assign Warehouse to Resource Monitor */
ALTER WAREHOUSE MCmodule3_WH SET RESOURCE_MONITOR = Monitor1_RM;


/* EXERCISE: Display (Show) a List of Resource Monitors */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Display a List of Resource Monitor */
SHOW RESOURCE MONITORS;


/* EXERCISE: Display (Show)  Warehouses Not Assigned to a Monitor*/
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Display Warehouses not Assigned to a Resource Monitor */
SHOW WAREHOUSES;
SELECT "name" FROM TABLE(result_scan(last_query_id())) 
     WHERE "resource_monitor" = 'null';


/***********************************************************************/

/* MODULE 3 */ /* SQL CODE */
/* OBJECTIVE: Querying Semi-Structured Data in the Worksheet */


/*EXERCISE: Create New Database and Schema */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Create New Database and Schema */
CREATE DATABASE VEXAMPLE;
CREATE SCHEMA SALES;


/*EXERCISE: Create New Table and Insert Data into VARIANT Column */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Create New Table with Data into a VARIANT Column */
CREATE OR REPLACE TABLE auto_sales (sourcedata VARIANT) AS
     SELECT PARSE_JSON(column1) AS sourcedata FROM VALUES
('{ 
    "date" : "2022-11-22", 
    "state" : "Texas",
    "dealership" : "Five Star Ford Dallas",
    "salesperson" : {"rep": "149", "name": "Sam Hargrave"},
    "customer" : {"name": "Sarah Ackerman", "phone": "18175555555", 
                  "email": "sarah555@gmail.com", "address": 
                  "Arlington, TX"},
    "vehicle" : {"make": "Ford", "model": "Explorer", "year": "2024",
                 "price": "42570", "addons":["extended warranty", 
                 "window tinting", "fabric protection", "floor mats",
                 "car cover"]}
}'),
('{ 
    "date" : "2022-12-07", 
    "state" : "Texas",
    "dealership" : "Grand Prairie Ford",
    "salesperson" : { "rep": "201","name": "Adam Mossier"},
    "customer" : {"name": "Marie Forrester", "phone": "12145555555",
                  "email": "marie555@gmail.com", "address": 
                  "Grand Prairie, TX"},
    "vehicle" : {"make": "Ford", "model": "Edge", "year": "2024", 
                 "price": "36080", "addons":["extended warranty", 
                 "rust proofing", "paint protection"]}  
}') Column1;


/*EXERCISE: Query the Inserted JSON Data */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Query the Inserted JSON Data */
SELECT * FROM auto_sales;


/*EXERCISE: Query the Inserted JSON Data */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Query the Inserted JSON Data */
SELECT sourcedata:state FROM auto_sales;


/*EXERCISE: Query the Inserted JSON Data */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Query the Inserted JSON Data */
SELECT Sourcedata:state FROM auto_sales;



/*EXERCISE: Query the Inserted JSON Data */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Query the Inserted JSON Data */
SELECT sourcedata:State FROM auto_sales;



/*EXERCISE: Query the Inserted JSON Data */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Query the Inserted JSON Data */
SELECT sourcedata:vehicle FROM auto_sales;


/*EXERCISE: Query the Inserted JSON Data */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Query the Inserted JSON Data */
SELECT sourcedata:vehicle FROM auto_sales;

/*EXERCISE: Query the Inserted JSON Data */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Query the Inserted JSON Data */
SELECT sourcedata:customer.address FROM auto_sales;


/*EXERCISE: Query the Inserted JSON Data */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Query the Inserted JSON Data */
SELECT sourcedata:vehicle.addons FROM auto_sales;


/*EXERCISE: Query the Inserted JSON Data */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Query the Inserted JSON Data */
SELECT sourcedata ['state'] FROM auto_sales;


/*EXERCISE: Query the Inserted JSON Data */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Query the Inserted JSON Data */
SELECT sourcedata ['State'] FROM auto_sales;


/*EXERCISE: Query the Inserted JSON Data */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Query the Inserted JSON Data */
SELECT sourcedata ['customer']  ['address'] FROM auto_sales;


/*EXERCISE: Query the Inserted JSON Data */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Query the Inserted JSON Data */
SELECT sourcedata:salesperson.rep AS ID, 
sourcedata:salesperson.name AS name FROM auto_sales;


/*EXERCISE: Query the Inserted JSON Data */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Query the Inserted JSON Data */
SELECT sourcedata:salesperson.rep::varchar AS ID, 
sourcedata:salesperson.name::varchar AS name FROM auto_sales;


/***********************************************************************/

/* MODULE 3 */ /* SQL CODE */
/* OBJECTIVE: Time Travel and Failsafe */


/*EXERCISE: Create a New Database */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Create a New Database */
CREATE DATABASE Mod3_DB;
/* ----> Use the SHOW Command */
SHOW DATABASES;


/*EXERCISE: Change Data Retention Time */
/* ----> Set Context */
USE ROLE ACCOUNTADMIN;
/* ----> Change Data Retention Time */
ALTER DATABASE Mod3_DB
SET DATA_RETENTION_TIME_IN_DAYS = 10;
/* ----> Use the SHOW Command */
SHOW DATABASES;


/***********************************************************************/

/* MODULE 3 */ /* SQL CODE */
/* OBJECTIVE: Queries Not Using Compute Resources */


/***********************************************************************/
