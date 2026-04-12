-- =========================================
-- DEPARTMENT TARGET DIMENSION TABLE
-- =========================================
CREATE TABLE hr_dept_d (
    dept_name      VARCHAR(100),
    dept_id        numeric primary key,
    dsk            VARCHAR(240),
    last_updated   DATE
);

-- =========================================
-- WORK LOCATION TARGET DIMENSION TABLE
-- =========================================
CREATE TABLE hr_work_loc_d (
    location_name  VARCHAR(100),
    location_id     numeric primary key,
    dsk            VARCHAR(240),
    last_updated   DATE
);

-- =========================================
-- EMPLOYEE DETAILS TARGET FACT TABLE
-- =========================================
CREATE TABLE hr_emp_f (
    emp_id          INTEGER PRIMARY KEY,
    emp_uid         VARCHAR(240),
    first_name      VARCHAR(100),
    last_name       VARCHAR(100),
    full_name       VARCHAR(240),
    hire_date       DATE,
    term_date       DATE,
    veteran_status  VARCHAR(50),
    emp_status      VARCHAR(50),
    dsk             VARCHAR(240),
    last_modified_date DATE
);

-- =========================================
-- EMPLOYEE JOB DETAILS TARGET FACT TABLE
-- =========================================
CREATE TABLE hr_job_dtls_f (
    emp_id           INTEGER,
    emp_uid          VARCHAR(240),
    full_name        VARCHAR(240),
    start_date       DATE,
    end_date         DATE,
    job_id           INTEGER,
    dept_id          INTEGER,
    loc_id           INTEGER,
    salary           NUMERIC,
    salary_flag      VARCHAR(100),
    is_term_flag     VARCHAR(2),
    job_tenure       VARCHAR(100),
    dsk              VARCHAR(240),
    last_modified_date DATE
);