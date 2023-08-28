--- Data Architect Role -----
USE ROLE USERADMIN;
create or replace role DATA_ARCHITECT comment = 'Role for creating higher-level objects (databases, warehouses, Integrations etc). Roughly same as sysadmin';
  grant role data_architect to role sysadmin;
  use role securityadmin;
  grant manage grants on account to role data_architect;
  use role accountadmin;
  grant create integration on account to role data_architect;
  grant create warehouse on account to role data_architect;
  grant monitor usage on account to role data_architect;
  grant create database on account to role data_architect with grant option;

------------Loader Role------------
USE ROLE USERADMIN;
create or replace role data_loader comment = 'Role for loading raw data into database.';
  grant role data_loader to role data_architect;
  use role accountadmin;
  grant create database on account to role data_loader;
  grant role DATA_LOADER to role DATA_ARCHITECT;
  
-----------Transformer Role------------
USE ROLE USERADMIN;
create or replace role DATA_TRANSFORMER comment = 'Role that can read from Raw and write to Intermediate or Presentation in either Dev or Prod.';
  grant role DATA_TRANSFORMER to role DATA_ARCHITECT;
  
------------Data Explorer Super------------
USE ROLE USERADMIN;
create or replace role data_explorer_super comment = 'Power User Role that can read from All Databases in either Dev or Prod.';
  grant role data_explorer_super to role sysadmin;

----------Analytics----------------
USE ROLE USERADMIN;
create or replace role ANALYTICS comment = 'Role used by a BI tool that can Query from the Presentation database in production.';
  grant role ANALYTICS to role sysadmin;
  
USE ROLE DATA_ARCHITECT;

CREATE WAREHOUSE  TRANSFORM_WH
    warehouse_size = XSMALL
    initially_suspended = True
    auto_resume = True
    auto_suspend = 60
    comment = 'Warehouse that transforms data from Raw to Staging, Intermediate and Presentation';

CREATE WAREHOUSE ANALYTICS_WH
    warehouse_size = XSMALL
    initially_suspended = True
    auto_resume = True
    auto_suspend = 60
    comment = 'Warehouse for internal Snowflake use';

use role data_architect;
create or replace database INTERMEDIATE_DEV;
create or replace database INTERMEDIATE_PROD;
create or replace database INTERMEDIATE_QA;
create or replace database PRESENTATION_DEV;
create or replace schema PRESENTATION_DEV.PRIMARY;
create or replace database PRESENTATION_PROD;
create or replace database PRESENTATION_QA;
create or replace database STAGING_DEV;
create or replace database STAGING_PROD;
create or replace database STAGING_QA;
create or replace database RAW;


