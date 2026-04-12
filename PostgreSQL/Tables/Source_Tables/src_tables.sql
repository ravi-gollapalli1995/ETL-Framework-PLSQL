-- =========================================
-- SCRIPT: SOURCE TABLE CREATION
-- PROJECT: PL/SQL ETL FRAMEWORK
-- =========================================

-- DEPARTMENT SOURCE TABLE
-- =========================================
CREATE TABLE dept_src (
    dept_name       VARCHAR(100),
    dept_uid        VARCHAR(100),
    last_updated    DATE
);

-- =========================================
-- WORK LOCATION SOURCE TABLE
-- =========================================
CREATE TABLE work_loc_src (
    location_name   VARCHAR(100),
    location_uid    VARCHAR(100),
    last_updated    DATE
);

-- =========================================
-- EMPLOYEE DETAILS SOURCE TABLE
-- =========================================
CREATE TABLE emp_dtls_src (
    emp_id          INTEGER PRIMARY KEY,
    first_name      VARCHAR(100),
    last_name       VARCHAR(100),
    hire_date       DATE,
    term_date       DATE,
    veteran_status  VARCHAR(50),
    emp_status      VARCHAR(50),
    last_updated    DATE
);

-- =========================================
-- EMPLOYEE JOB DETAILS SOURCE TABLE
-- =========================================
CREATE TABLE emp_job_dtls_src (
    emp_uid         INTEGER,
    job_start_date  DATE,
    job_end_date    DATE,
    job_name        VARCHAR(100),
    dept_name       VARCHAR(100),
    loc_name        VARCHAR(100),
    salary          NUMERIC,
    hourly          VARCHAR(100),
    last_updated    DATE
);

-- =========================================
-- END OF SCRIPT
-- =========================================