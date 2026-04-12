-- =========================================
-- PROCEDURE: FULL LOAD WORK LOCATION DIMENSION
-- =========================================

CREATE OR REPLACE PROCEDURE full_load_loc_d_data()
LANGUAGE plpgsql
AS $$
BEGIN

call log_status(
    p_status =>'P',
    p_message =>'full_load_loc_d_data Started',
    p_process_name =>'FULL_LOAD'
);

execute 'truncate table hr_work_loc_d';


INSERT INTO hr_work_loc_d (
    location_id,
    location_name,
    dsk,
    last_updated
)
SELECT 
    nextval('hr_work_loc_d_seq') AS location_id,
    s.location_name,
    s.location_name || '_' || s.location_uid,
    s.last_updated
FROM work_loc_src s
WHERE NOT EXISTS (
    SELECT 1 
    FROM hr_work_loc_d t 
    WHERE t.location_name = s.location_name
);

call log_status(
    p_status =>'C',
    p_message =>'full_load_loc_d_data Ended',
    p_process_name =>'FULL_LOAD'
);

exception when others then

call log_status(
    p_status =>'P',
    p_message =>'Error in full_load_loc_d_data: '||SQLERRM,
    p_process_name =>'FULL_LOAD'
);

END;
$$;