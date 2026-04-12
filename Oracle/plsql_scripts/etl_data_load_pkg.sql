-- PACKAGE NAME : ETL_DATA_LOAD_PKG
-- PURPOSE      : Employee ETL Processing
-- AUTHOR       : Ravi Gollapalli
-- =========================================

CREATE OR REPLACE PACKAGE etl_data_load_pkg AS

    -- =====================================
    -- PROCEDURE: FULL_LOAD_DATA
    -- PURPOSE  : Loads data from source to target
    -- =====================================
    PROCEDURE hr_full_load_data;
	
	-- =====================================
    -- PROCEDURE: INCREMENTAL_LOAD_DATA
    -- PURPOSE  : Loads incremental data only from source to target
    -- =====================================
    PROCEDURE hr_incremental_load_data;

END etl_data_load_pkg;
/

