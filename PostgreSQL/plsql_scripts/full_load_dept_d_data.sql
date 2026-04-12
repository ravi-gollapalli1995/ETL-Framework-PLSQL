-- =========================================
-- PROCEDURE: FULL LOAD DEPT DIMENSION
-- =========================================

CREATE OR REPLACE PROCEDURE full_load_dept_d_data()
LANGUAGE plpgsql
AS $$
BEGIN

call log_status(
    p_status =>'P',
    p_message =>'full_load_dept_d_data Started',
    p_process_name =>'FULL_LOAD'
);

raise notice 'start';

execute 'truncate table hr_dept_d';

execute 'INSERT INTO hr_dept_d (
    dept_id,
    dept_name,
    dsk,
    last_updated
)
SELECT 
    nextval(''hr_dept_d_seq'') AS dept_id,
    dept_name AS dept_name,
    dept_name || ''_'' || dept_uid AS dsk,
    last_updated AS last_updated
FROM dept_src';


call log_status(
    p_status =>'C',
    p_message =>'full_load_dept_d_data Ended',
    p_process_name =>'FULL_LOAD'
);

Exception when others then

call log_status(
    p_status =>'E',
    p_message =>'Error in full_load_dept_d_data: '||SQLERRM,
    p_process_name =>'FULL_LOAD'
);


END;
$$;