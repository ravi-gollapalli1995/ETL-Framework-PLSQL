
-- PACKAGE NAME : ETL_DATA_LOAD_PKG BODY
-- PURPOSE      : Employee main ETL Processing
-- AUTHOR       : Ravi Gollapalli
-- =========================================

CREATE OR REPLACE PROCEDURE hr_full_load_data(p_load varchar)
LANGUAGE plpgsql
AS $$
BEGIN

IF p_load='FULL_LOAD' then

call full_load_dept_d_data();
call full_load_loc_d_data();
call full_load_emp_f_data();
call full_load_job_f_data();
call update_job_tenure();
call update_term_flag();

ELSE 

call incremental_load_emp_f_data();

END IF;

END;
$$;
