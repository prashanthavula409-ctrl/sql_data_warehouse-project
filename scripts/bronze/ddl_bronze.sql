/*
===============
DDl script: Create Bronze Tables
================
Scripts Purpose:
    This script creates tables in the 'bronze' schema,dropping existing tables if they aleady exists
    Run this script to redefine the DDl structure of bronze Tables
===============
*/
use Datawarehouse;
IF OBJECT_ID ('crm_cust_info','u') IS NOT NULL
 DROP TABLE crm_cust_info
GO
Create Table bronze.crm_cust_info(

cst_id INT,
cst_key NVARCHAR(50),
cst_firstname NVARCHAR(50),
cst_lastname Nvarchar(50),
cst_maternal_status NVARCHAR(50),
cst_gndr Nvarchar(50),
cst_creat_date date
);

Create table bronze.prd_info(
prd_id int,
prd_key	NVARCHAR(50),
prd_nm NVARCHAR(50),
prd_cost int,
prd_line NVARCHAR(50),
prd_start_dt date,
prd_end_dt date
);

create table bronze.sales_details(
sls_ord_num int,
sls_prd_key	VARCHAR(50),
sls_cust_id	int,
sls_order_dt date,
sls_ship_dt	date,
sls_due_dt	date,
sls_sales	int,
sls_quantity int,
sls_price int
);

-- Alter table bronze.crm_sales_details
-- ALTER column sls_order_dt NVARCHAR(50);

Create table bronze.erp_loc_a101(
cid NVARCHAR(50),
cntry NVARCHAR(50)
);

CREATE Table bronze.erp_cust_az12(
cid NVARCHAR(50),
bdate DATE,
gen NVARCHAR(50)
);

create table bronze.erp_px_cat_g1v2(
id NVARCHAR(50),
cat NVARCHAR(50),
subcat NVARCHAR(50),
maintenance NVARCHAR(50)
);



