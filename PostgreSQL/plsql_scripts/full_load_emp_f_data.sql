-- =========================================
-- PROCEDURE: FULL LOAD EMP FACT
-- =========================================

CREATE OR REPLACE PROCEDURE full_load_emp_f_data()
LANGUAGE plpgsql
AS $$
DECLARE

    -- Record variable
    v_emp_data RECORD;

BEGIN

call log_status(
    p_status =>'P',
    p_message =>'full_load_emp_f_data Started',
    p_process_name =>'FULL_LOAD'
);


execute 'truncate table hr_emp_f';

    FOR v_emp_data IN
        SELECT 
            emp_id,
            first_name,
            last_name,
            hire_date,
            term_date,
            veteran_status,
            emp_status,
            last_updated
        FROM emp_dtls_src
    LOOP

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
            nextval('hr_emp_f_seq'),
            v_emp_data.emp_id,
            v_emp_data.first_name,
            v_emp_data.last_name,
            v_emp_data.first_name || ' ' || v_emp_data.last_name,
            v_emp_data.hire_date,
            v_emp_data.term_date,
            v_emp_data.veteran_status,
            v_emp_data.emp_status,
            v_emp_data.emp_id,
            v_emp_data.last_updated
        );

    END LOOP;

call log_status(
    p_status =>'C',
    p_message =>'full_load_emp_f_data Ended',
    p_process_name =>'FULL_LOAD'
);

exception when others then

call log_status(
    p_status =>'P',
    p_message =>'Error in full_load_emp_f_data: '||SQLRRM,
    p_process_name =>'FULL_LOAD'
);


END;
$$;