-- =========================================
-- PACKAGE NAME : LOAD_TABLES_POC_PKG
-- PURPOSE      : Employee ETL Processing
-- AUTHOR       : Ravi Gollapalli
-- =========================================

CREATE OR REPLACE PACKAGE load_tables_poc_pkg AS


	PROCEDURE log_status(p_status VARCHAR2, p_message VARCHAR2,p_process_name VARCHAR2);


	-- =====================================
    -- PROCEDURE: FULL_LOAD_DEPT_D_DATA
    -- PURPOSE  : Loads full_load data only from source to target
    -- =====================================
    PROCEDURE full_load_dept_d_data;
	

	-- =====================================
    -- PROCEDURE: FULL_LOAD_LOC_D_DATA
    -- PURPOSE  : Loads full_load data only from source to target
    -- =====================================
    PROCEDURE full_load_loc_d_data;
    -- =====================================
	
	
    -- PROCEDURE: FULL_LOAD_EMP_F_DATA
    -- PURPOSE  : Loads data from source to target
    -- =====================================
    PROCEDURE full_load_emp_f_data;
	
	
	-- =====================================
    -- PROCEDURE: INCREMENTAL_LOAD_EMP_F_DATA
    -- PURPOSE  : Loads incremental data only from source to target
    -- =====================================
    PROCEDURE incremental_load_emp_f_data;
	
	
	-- =====================================
    -- PROCEDURE: FULL_LOAD_JOB_F_DATA
    -- PURPOSE  : Loads incremental data only from source to target
    -- =====================================
    PROCEDURE full_load_job_f_data;
	

END load_tables_poc_pkg;
/