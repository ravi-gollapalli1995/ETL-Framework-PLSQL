-- =========================================
-- PROCEDURE: INCREMENTAL LOAD EMP FACT
-- =========================================

CREATE OR REPLACE PROCEDURE full_load_job_f_data()
LANGUAGE plpgsql
AS $$
BEGIN

call log_status(
    p_status =>'P',
    p_message =>'full_load_job_f_data Started',
    p_process_name =>'FULL_LOAD'
);


execute 'truncate table hr_job_dtls_f';


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
    SELECT 
        e.emp_id,
        e.emp_uid,
        e.full_name,
        s.job_start_date,
        s.job_end_date,
        d.dept_id,
        l.location_id,
        s.salary,
        s.job_start_date || '_' || e.emp_uid,
        s.last_updated
    FROM emp_job_dtls_src s
    LEFT JOIN hr_emp_f e
        ON e.emp_uid = cast(e.emp_uid as varchar)
    LEFT JOIN hr_dept_d d 
        ON s.dept_name = d.dept_name
    LEFT JOIN hr_work_loc_d l 
        ON s.loc_name = l.location_name;


call log_status(
    p_status =>'C',
    p_message =>'full_load_job_f_data Ended',
    p_process_name =>'FULL_LOAD'
);

exception when others then

call log_status(
    p_status =>'E',
    p_message =>'Error in full_load_job_f_data: '||SQLERRM,
    p_process_name =>'FULL_LOAD'
);

END;
$$;