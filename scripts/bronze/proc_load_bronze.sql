/*
=================
stored Procedure: Load Bronze Layer(source -> Bronze)
=================
Script Purpose:
  This stored procedure loads data into the 'bronze' schema from external CSV files.
  It performs the following actions:
  - Truncates the bronze tables before loading data.
  - Uses the 'BULK INSERT' command to load data from csv Files to bronze tables.
Parameters:
  None.
This stored procedure does not accept any parameters or return any values.

Usage Eample:
  EXEC bronze.load_bronze;
=================
*/
-- USE Datawarehouse;
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @START_TIME DATETIME,@end_time DATETIME
	BEGIN TRY
			PRINT '================ lOADING BRONZE LAYER================='
			PRINT '---------------- LOADING CRM TABLES ------------------'
				SET @START_TIME = GETDATE();
				PRINT '>>>> TRUNCATING TABLE:bronze.crm_cust_info'
				TRUNCATE TABLE bronze.crm_cust_info
				PRINT '>> INSERTING DATA INTO: bronze.crm_cust_info'
				BULK INSERT bronze.crm_cust_info
				FROM 'D:\DataEngineer\SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'

				with(
					FIRSTROW = 2,
					FIELDTERMINATOR =',',
					TABLOCK

				);
				SET @END_TIME=GETDATE();
				PRINT'>> LOAD DURATION:'+ CAST(DATEDIFF(SECOND,@START_TIME,@END_TIME) AS NVARCHAR)+'SECONDS';
	
				SET @START_TIME = GETDATE();
				PRINT '>>>> TRUNCATING TABLE:bronze.crm_prd_info'
				TRUNCATE TABLE bronze.crm_prd_info
				PRINT '>>>> NSERTING DATA INTO:bronze.crm_prd_info'
				BULK INSERT bronze.crm_prd_info
				FROM 'D:\DataEngineer\SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
				with(
					FIRSTROW = 2,
					FIELDTERMINATOR =',',
					TABLOCK

				);
				SET @END_TIME=GETDATE();
				PRINT'>> LOAD DURATION:'+ CAST(DATEDIFF(SECOND,@START_TIME,@END_TIME) AS NVARCHAR)+'SECONDS';
	
				SET @START_TIME = GETDATE();
				PRINT '>>>> TRUNCATING TABLE:bronze.crm_sales_details'
				TRUNCATE TABLE bronze.crm_sales_details
				PRINT '>>>> INSERTING DATA INTO:bronze.crm_sales_details'
				BULK INSERT bronze.crm_sales_details
				FROM 'D:\DataEngineer\SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'

				with(
					FIRSTROW = 2,
					FIELDTERMINATOR =',',
					TABLOCK
				 );
				SET @END_TIME=GETDATE();
				PRINT'>> LOAD DURATION:'+ CAST(DATEDIFF(SECOND,@START_TIME,@END_TIME) AS NVARCHAR)+'SECONDS';

				SET @START_TIME = GETDATE();
				PRINT '>>>> TRUNCATING TABLE:bronze.erp_cust_az12'
				TRUNCATE TABLE bronze.erp_cust_az12
				PRINT '>>>> INSERTING DATA INTO:bronze.erp_cust_az12'
				BULK INSERT bronze.erp_cust_az12
				FROM 'D:\DataEngineer\SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
				with(
					FIRSTROW =2,
					FIELDTERMINATOR=',',
					TABLOCK
				);
				SET @END_TIME=GETDATE();
				PRINT'>> LOAD DURATION:'+ CAST(DATEDIFF(SECOND,@START_TIME,@END_TIME) AS NVARCHAR)+'SECONDS';

				SET @START_TIME = GETDATE();
				PRINT '>>>> TRUNCATING TABLE:bronze.erp_loc_a101'
				TRUNCATE TABLE bronze.erp_loc_a101
				PRINT '>>>> INSERTING DATA INTO:bronze.erp_loc_a101'
				BULK INSERT bronze.erp_loc_a101
				FROM 'D:\DataEngineer\SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
				with(
					FIRSTROW=2,
					FIELDTERMINATOR=',',
					TABLOCK
				);
				SET @END_TIME=GETDATE();
				PRINT'>> LOAD DURATION:'+ CAST(DATEDIFF(SECOND,@START_TIME,@END_TIME) AS NVARCHAR)+'SECONDS';

				SET @START_TIME = GETDATE();
				PRINT '>>>> TRUNCATING TABLE:bronze.erp_px_cat_g1v2'
				TRUNCATE TABLE bronze.erp_px_cat_g1v2
				PRINT '>>>> INSERTING DATA INTO:bronze.erp_px_cat_g1v2'
				BULK INSERT bronze.erp_px_cat_g1v2
				FROM 'D:\DataEngineer\SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
				WITH(
					FIRSTROW=2,
					FIELDTERMINATOR=',',
					TABLOCK
				);
				SET @END_TIME=GETDATE();
				PRINT'>> LOAD DURATION:'+ CAST(DATEDIFF(SECOND,@START_TIME,@END_TIME) AS NVARCHAR) +'SECONDS';
	END TRY
	BEGIN CATCH
		PRINT '============ERROR OCCUR DURING LOADING BRONZE LAYER=========='
		PRINT 'ERROR MESSAGE'+ ERROR_MESSAGE();
		PRINT 'ERROR MESSAGE'+ CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'ERROR MESSAGE'+ CAST(ERROR_STATE() AS NVARCHAR);
	END CATCH
END
Select count(*) from bronze.crm_sales_details;
Select count(*) from bronze.crm_cust_info;
Select count(*) from bronze.crm_prd_info;
