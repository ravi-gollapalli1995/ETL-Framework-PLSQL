-- =========================================
-- SCRIPT: LOG TABLE CREATION
-- PROJECT: PL/SQL ETL FRAMEWORK
-- =========================================

-- LOG TABLE
-- =========================================
CREATE TABLE etl_log (
    log_id NUMBER PRIMARY KEY,
    process_name VARCHAR(100),
    status VARCHAR(20),
    message VARCHAR(200),
    log_date DATE DEFAULT current_date
);



-- =========================================
-- END OF SCRIPT
-- =========================================