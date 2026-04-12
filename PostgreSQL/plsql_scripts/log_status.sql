-- =========================================
-- PROCEDURE: LOG STATUS
-- =========================================

CREATE OR REPLACE PROCEDURE log_status(
    p_status VARCHAR,
    p_message VARCHAR,
    p_process_name VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN

    INSERT INTO etl_log (log_id, process_name, status, message)
    VALUES (nextval('etl_log_seq'), p_process_name, p_status, p_message);


END;
$$;