-- SCRIPT: SCHEDULER JOB CREATION
-- PROJECT: PL/SQL ETL FRAMEWORK
-- PURPOSE: Automate ETL execution
-- =========================================


-- FULL LOAD

BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
        job_name        => 'FULL_ETL',                 -- Job name
        job_type        => 'PLSQL_BLOCK',                 -- Type of job
        job_action      => 'BEGIN etl_data_load_pkg.hr_full_load_data; END;', -- Procedure call
        start_date      => SYSDATE,                       -- Start immediately
        repeat_interval => 'FREQ=HOURLY',                 -- Run every hour
        enabled         => TRUE                           -- Enable job
    );
END;
/

-- INCREMENTAL

BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
        job_name        => 'FULL_ETL',                 -- Job name
        job_type        => 'PLSQL_BLOCK',                 -- Type of job
        job_action      => 'BEGIN etl_data_load_pkg.hr_incremental_load_data; END;', -- Procedure call
        start_date      => SYSDATE,                       -- Start immediately
        repeat_interval => 'FREQ=HOURLY',                 -- Run every hour
        enabled         => TRUE                           -- Enable job
    );
END;
/


