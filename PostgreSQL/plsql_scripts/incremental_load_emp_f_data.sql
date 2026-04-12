-- =========================================
-- PROCEDURE: INCREMENTAL LOAD EMP FACT
-- =========================================

CREATE OR REPLACE PROCEDURE incremental_load_emp_f_data()
LANGUAGE plpgsql
AS $$
DECLARE

    v_emp_data RECORD;
    v_last_load_date DATE;

BEGIN

call log_status(
    p_status =>'P',
    p_message =>'incremental_load_emp_f_data Started',
    p_process_name =>'INCR_LOAD'
);


    -- Get last load date
    SELECT COALESCE(MAX(last_modified_date), DATE '1900-01-01')
    INTO v_last_load_date
    FROM hr_emp_f;

    -- Loop through incremental data
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
        WHERE last_updated > v_last_load_date
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
    p_message =>'incremental_load_emp_f_data Ended',
    p_process_name =>'INCR_LOAD'
);

exception when others then

call log_status(
    p_status =>'E',
    p_message =>'Error in incremental_load_emp_f_data: '||SQLERRM,
    p_process_name =>'INCR_LOAD'
);
END;
$$;