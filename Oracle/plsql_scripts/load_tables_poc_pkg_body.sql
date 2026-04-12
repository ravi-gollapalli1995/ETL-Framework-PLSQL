-- =========================================
-- PACKAGE BODY : load_tables_poc_pkg
-- =========================================

CREATE OR REPLACE PACKAGE BODY load_tables_poc_pkg AS

-- =========================================
-- LOG PROCEDURE
-- =========================================
PROCEDURE log_status(
    p_status VARCHAR2,
    p_message VARCHAR2,
    p_process_name VARCHAR2
) IS
BEGIN
    INSERT INTO etl_log (log_id, process_name, status, message)
    VALUES (etl_log_seq.NEXTVAL, p_process_name, p_status, p_message);

    COMMIT;
END;

-- =========================================
-- FULL LOAD DEPARTMENT
-- =========================================
PROCEDURE full_load_dept_d_data IS
BEGIN

    INSERT INTO hr_dept_d (
        dept_id,
        dept_name,
        dsk,
        last_updated
    )
    SELECT 
        hr_dept_d_seq.NEXTVAL,
        dept_name,
        dept_name || '_' || dept_uid,
        last_updated
    FROM dept_src;

    COMMIT;

EXCEPTION WHEN OTHERS THEN
    log_status(
        p_status => 'E',
        p_message => 'Error in full_load_dept_d_data: ' || SQLERRM,
        p_process_name => 'FULL_LOAD'
    );
END;

-- =========================================
-- FULL LOAD LOCATION
-- =========================================
PROCEDURE full_load_loc_d_data IS
BEGIN

    INSERT INTO hr_work_loc_d (
        location_id,
        location_name,
        dsk,
        last_updated
    )
    SELECT 
        hr_work_loc_d_seq.NEXTVAL,
        s.location_name,
        s.location_name || '_' || s.location_uid,
        s.last_updated
    FROM work_loc_src s
    WHERE NOT EXISTS (
        SELECT 1 
        FROM hr_work_loc_d t 
        WHERE t.location_name = s.location_name
    );

    COMMIT;

EXCEPTION WHEN OTHERS THEN
    log_status(
        p_status => 'E',
        p_message => 'Error in full_load_loc_d_data: ' || SQLERRM,
        p_process_name => 'FULL_LOAD'
    );
END;

-- =========================================
-- FULL LOAD EMPLOYEE
-- =========================================
PROCEDURE full_load_emp_f_data IS

    TYPE emp_rec_type IS RECORD (
        emp_id          NUMBER,
        first_name      VARCHAR2(100),
        last_name       VARCHAR2(100),
        hire_date       DATE,
        term_date       DATE,
        veteran_status  VARCHAR2(50),
        emp_status      VARCHAR2(50),
        last_updated    DATE
    );

    TYPE emp_tab_type IS TABLE OF emp_rec_type;
    v_emp_data emp_tab_type;

BEGIN

    SELECT 
        emp_id,
        first_name,
        last_name,
        hire_date,
        term_date,
        veteran_status,
        emp_status,
        last_updated
    BULK COLLECT INTO v_emp_data
    FROM emp_dtls_src;

    FORALL i IN 1 .. v_emp_data.COUNT
        INSERT INTO hr_emp_f (
            emp_id,
            emp_uid,
            first_name,
            last_name,
            full_name,
            hire_date,
            term_date,
            veteran_status,
            emp_status,
            dsk,
            last_modified_date
        )
        VALUES (
            hr_emp_f_seq.NEXTVAL,
            v_emp_data(i).emp_id,
            v_emp_data(i).first_name,
            v_emp_data(i).last_name,
            v_emp_data(i).first_name || ' ' || v_emp_data(i).last_name,
            v_emp_data(i).hire_date,
            v_emp_data(i).term_date,
            v_emp_data(i).veteran_status,
            v_emp_data(i).emp_status,
            v_emp_data(i).emp_id,
            v_emp_data(i).last_updated
        );

    COMMIT;

EXCEPTION WHEN OTHERS THEN
    log_status(
        p_status => 'E',
        p_message => 'Error in full_load_emp_f_data: ' || SQLERRM,
        p_process_name => 'FULL_LOAD'
    );
END;

-- =========================================
-- INCREMENTAL LOAD EMPLOYEE
-- =========================================
PROCEDURE incremental_load_emp_f_data IS

    TYPE emp_rec_type IS RECORD (
        emp_id          NUMBER,
        first_name      VARCHAR2(100),
        last_name       VARCHAR2(100),
        hire_date       DATE,
        term_date       DATE,
        veteran_status  VARCHAR2(50),
        emp_status      VARCHAR2(50),
        last_updated    DATE
    );

    TYPE emp_tab_type IS TABLE OF emp_rec_type;

    v_emp_data emp_tab_type;
    v_last_load_date DATE;

BEGIN

    SELECT NVL(MAX(last_modified_date), DATE '1900-01-01')
    INTO v_last_load_date
    FROM hr_emp_f;

    SELECT 
        emp_id,
        first_name,
        last_name,
        hire_date,
        term_date,
        veteran_status,
        emp_status,
        last_updated
    BULK COLLECT INTO v_emp_data
    FROM emp_dtls_src
    WHERE last_updated > v_last_load_date;

    FORALL i IN 1 .. v_emp_data.COUNT
        INSERT INTO hr_emp_f (
            emp_id,
            emp_uid,
            first_name,
            last_name,
            full_name,
            hire_date,
            term_date,
            veteran_status,
            emp_status,
            dsk,
            last_modified_date
        )
        VALUES (
            hr_emp_f_seq.NEXTVAL,
            v_emp_data(i).emp_id,
            v_emp_data(i).first_name,
            v_emp_data(i).last_name,
            v_emp_data(i).first_name || ' ' || v_emp_data(i).last_name,
            v_emp_data(i).hire_date,
            v_emp_data(i).term_date,
            v_emp_data(i).veteran_status,
            v_emp_data(i).emp_status,
            v_emp_data(i).emp_id,
            v_emp_data(i).last_updated
        );

    COMMIT;

EXCEPTION WHEN OTHERS THEN
    log_status(
        p_status => 'E',
        p_message => 'Error in incremental_load_emp_f_data: ' || SQLERRM,
        p_process_name => 'INCR_LOAD'
    );
END;

-- =========================================
-- FULL LOAD JOB FACT
-- =========================================
PROCEDURE full_load_job_f_data IS

    TYPE job_rec_type IS RECORD (
        emp_id         NUMBER,
        emp_uid        VARCHAR2(100),
        full_name      VARCHAR2(240),
        job_start_date DATE,
        job_end_date   DATE,
        salary         NUMBER,
        last_updated   DATE,
        dept_id        NUMBER,
        loc_id         NUMBER
    );

    TYPE job_tab_type IS TABLE OF job_rec_type;
    v_job_data job_tab_type;

BEGIN

    SELECT 
        s.emp_id,
        e.emp_uid,
        e.full_name,
        s.job_start_date,
        s.job_end_date,
        s.salary,
        s.last_updated,
        d.dept_id,
        l.location_id
    BULK COLLECT INTO v_job_data
    FROM emp_job_dtls_src s
    LEFT JOIN hr_emp_f e
        ON e.emp_uid = s.emp_id
    LEFT JOIN hr_dept_d d 
        ON s.dept_name = d.dept_name
    LEFT JOIN hr_work_loc_d l 
        ON s.loc_name = l.location_name;

    FORALL i IN 1 .. v_job_data.COUNT
        INSERT INTO hr_job_dtls_f (
            emp_id,
            emp_uid,
            full_name,
            start_date,
            end_date,
            dept_id,
            loc_id,
            salary,
            dsk,
            last_modified_date
        )
        VALUES (
            v_job_data(i).emp_id,
            v_job_data(i).emp_uid,
            v_job_data(i).full_name,
            v_job_data(i).job_start_date,
            v_job_data(i).job_end_date,
            v_job_data(i).dept_id,
            v_job_data(i).loc_id,
            v_job_data(i).salary,
            v_job_data(i).job_start_date || '_' || v_job_data(i).emp_id,
            v_job_data(i).last_updated
        );

    COMMIT;

EXCEPTION WHEN OTHERS THEN
    log_status(
        p_status => 'E',
        p_message => 'Error in full_load_job_f_data: ' || SQLERRM,
        p_process_name => 'FULL_LOAD'
    );
END;

END load_tables_poc_pkg;
/

