
-- FULL_LOAD

call hr_full_load_data(p_load =>'FULL_LOAD');


-- Incremental  

call hr_full_load_data(p_load =>'INCR');

