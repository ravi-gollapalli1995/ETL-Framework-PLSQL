CREATE OR REPLACE PROCEDURE update_term_flag()
LANGUAGE plpgsql
AS $$
DECLARE
   

    get_terms CURSOR FOR
        SELECT 
        emp_uid,
        case when term_date is null then 'Y'
		else 'N'end as term_falg
        FROM hr_emp_f;

BEGIN

    CALL log_status(
        p_status => 'P',
        p_message => 'update_term_fla Started',
        p_process_name => 'FULL_LOAD'
    );

for i in get_terms
    LOOP
       

        UPDATE hr_job_dtls_f
        SET is_term_flag = i.term_falg
        WHERE emp_uid = i.emp_uid;

    END LOOP;

    CALL log_status(
        p_status => 'C',
        p_message => 'update_term_fla Ended',
        p_process_name => 'FULL_LOAD'
    );

EXCEPTION WHEN OTHERS THEN

    CALL log_status(
        p_status => 'E',
        p_message => 'Error in update_term_fla: ' || SQLERRM,
        p_process_name => 'FULL_LOAD'
    );

END;
$$;