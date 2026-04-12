-- SCRIPT: SEQUENCE CREATION
-- PROJECT: PL/SQL ETL FRAMEWORK

-- =========================================
-- SEQUENCE: EMP FACT TABLE
-- =========================================
CREATE SEQUENCE hr_emp_f_seq 
START WITH 1 
INCREMENT BY 1 
NOCACHE 
NOCYCLE;

-- =========================================
-- SEQUENCE: JOB FACT TABLE
-- =========================================
CREATE SEQUENCE hr_job_f_seq 
START WITH 1 
INCREMENT BY 1 
NOCACHE 
NOCYCLE;

-- =========================================
-- SEQUENCE: DEPARTMENT DIMENSION
-- =========================================
CREATE SEQUENCE hr_dept_d_seq 
START WITH 1 
INCREMENT BY 1 
NOCACHE 
NOCYCLE;

-- =========================================
-- SEQUENCE: WORK LOCATION DIMENSION
-- =========================================
CREATE SEQUENCE hr_work_loc_d_seq 
START WITH 1 
INCREMENT BY 1 
NOCACHE 
NOCYCLE;

-- =========================================
-- SEQUENCE: ETL LOG TABLE
-- =========================================
CREATE SEQUENCE etl_log_seq 
START WITH 1 
INCREMENT BY 1 
NOCACHE 
NOCYCLE;

-- =========================================
-- END OF SCRIPT
