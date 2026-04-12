
-- PACKAGE NAME : ETL_DATA_LOAD_PKG BODY
-- PURPOSE      : Employee main ETL Processing
-- AUTHOR       : Ravi Gollapalli
-- =========================================

CREATE OR REPLACE PACKAGE BODY etl_data_load_pkg AS

    PROCEDURE hr_full_load_data IS
    BEGIN
       load_tables_poc_pkg.full_load_dept_d_data;
	   load_tables_poc_pkg.full_load_loc_d_data;
	   load_tables_poc_pkg.full_load_emp_f_data;
	   load_tables_poc_pkg.full_load_job_f_data;
    END;
	
	PROCEDURE hr_incremental_load_data IS
    BEGIN
       load_tables_poc_pkg.hr_incremental_load_data;
    END;
	

END etl_data_load_pkg;