CREATE OR REPLACE PROCEDURE update_job_tenure()
LANGUAGE plpgsql
AS $$
DECLARE
    rec RECORD;

    get_tenure CURSOR FOR
        SELECT 
        emp_uid,
        AGE(COALESCE(term_date, CURRENT_DATE), hire_date) AS job_tenure
        FROM hr_emp_f;

BEGIN

    CALL log_status(
        p_status => 'P',
        p_message => 'update_job_tenure Started',
        p_process_name => 'FULL_LOAD'
    );

    OPEN get_tenure;

    LOOP
        FETCH get_tenure INTO rec;
        EXIT WHEN NOT FOUND;

        UPDATE hr_job_dtls_f
        SET job_tenure = rec.job_tenure
        WHERE emp_uid = rec.emp_uid;

    END LOOP;

    CLOSE get_tenure;

    CALL log_status(
        p_status => 'C',
        p_message => 'update_job_tenure Ended',
        p_process_name => 'FULL_LOAD'
    );

EXCEPTION WHEN OTHERS THEN

    CALL log_status(
        p_status => 'E',
        p_message => 'Error in update_job_tenure: ' || SQLERRM,
        p_process_name => 'FULL_LOAD'
    );

END;
$$;