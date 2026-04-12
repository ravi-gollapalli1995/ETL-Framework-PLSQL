-- =========================================
-- SCRIPT: TARGET TABLE CREATION
-- PROJECT: PL/SQL ETL FRAMEWORK
-- =========================================

-- DEPARTMENT TARGET DIMENSION TABLE
-- =========================================
CREATE TABLE hr_dept_d (
    dept_name      VARCHAR2(100),
    dept_id        number primary key,
	dsk            VARCHAR2(240),
    last_updated   DATE
);

-- =========================================
-- WORK LOCATION TARGET DIMENSION TABLE
-- =========================================
CREATE TABLE hr_work_loc_d (
    location_name  VARCHAR2(100),
    location_id     number primary key,
	dsk            VARCHAR2(240),
    last_updated   DATE
);


-- =========================================
-- EMPLOYEE DETAILS TARGET FACT TABLE
-- =========================================
CREATE TABLE hr_emp_f (
    emp_id          NUMBER PRIMARY KEY, 
	emp_uid         VARCHAR2(240), 
    first_name      VARCHAR2(100),
    last_name       VARCHAR2(100),
	full_name       VARCHAR2(240),
    hire_date       DATE,
    term_date       DATE,
    veteran_status  VARCHAR2(50),
    emp_status      VARCHAR2(50),
	dsk             VARCHAR2(240),
    last_modified_date    DATE
);

-- =========================================
-- EMPLOYEE JOB DETAILS TARGET FACT TABLE
-- =========================================
CREATE TABLE hr_job_dtls_f(
    emp_id           NUMBER,
    emp_uid          VARCHAR2(240),
	full_name        VARCHAR2(240),
    start_date       DATE,
    end_date         DATE,
    job_id           NUMBER,
    dept_id          NUMBER,
    loc_id           NUMBER,
    salary           NUMBER,
	salary_flag      VARCHAR2(100),
	is_term_flag     VARCHAR2(2),
	Job_tenure		 VARCHAR2(200),
	dsk              VARCHAR2(240),
    last_modified_date    DATE
);



-- =========================================
-- END OF SCRIPT
-- =========================================
