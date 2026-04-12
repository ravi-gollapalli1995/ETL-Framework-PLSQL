-- SCRIPT: SEQUENCE CREATION
-- PROJECT: PL/SQL ETL FRAMEWORK

-- =========================================
-- SEQUENCE: EMP FACT TABLE
-- =========================================
CREATE SEQUENCE hr_emp_f_seq 
START WITH 1 
INCREMENT BY 1 
NO CYCLE;

-- =========================================
-- SEQUENCE: JOB FACT TABLE
-- =========================================
CREATE SEQUENCE hr_job_f_seq 
START WITH 1 
INCREMENT BY 1 
NO CYCLE;

-- =========================================
-- SEQUENCE: DEPARTMENT DIMENSION
-- =========================================
CREATE SEQUENCE hr_dept_d_seq 
START WITH 1 
INCREMENT BY 1 
NO CYCLE;

-- =========================================
-- SEQUENCE: WORK LOCATION DIMENSION
-- =========================================
CREATE SEQUENCE hr_work_loc_d_seq 
START WITH 1 
INCREMENT BY 1 
NO CYCLE;

-- =========================================
-- SEQUENCE: ETL LOG TABLE
-- =========================================
CREATE SEQUENCE etl_log_seq 
START WITH 1 
INCREMENT BY 1 
NO CYCLE;

-- =========================================
-- END OF SCRIPT
-- =========================================