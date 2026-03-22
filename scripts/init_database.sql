/*
==========================
create Database and schema
===========================
Script Purpose:
  This script creates a new datasbase named 'Datawarehouse' after checking if it already exists.
  Id the database exist, it is dropped and recreated additionally, the script sets up three schemas within the database:'bronze','silver' and 'gold'

WARNING:
  Running this script will drop the entire 'datawarehouse' database if it exists.
  All data in teh database will be permanently deleted.Proceed with caution
  and ensure you have proper backups before running this script.
*/

USE master;
GO

-- Drop and recreate the 'Datawarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases where name='Datawarehouse')
BEGIN
  Alter database datawarehouse set Singel_user with Rollback Immediate;
  Drop Database Datawarehouse;
END;
Go
-- create the 'datawarehouse' database

Create Database Datawarehouse;

use Datawarehouse;

--create schemas
Create Schema bronze;
Go
Create Schema Silver;
Go
Create schema gold;
Go
















