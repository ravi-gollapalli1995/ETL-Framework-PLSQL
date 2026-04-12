-- =========================================
-- SCRIPT: LOG TABLE CREATION
-- PROJECT: PL/SQL ETL FRAMEWORK
-- =========================================

-- LOG TABLE
-- =========================================
CREATE TABLE etl_log (
    log_id NUMBER PRIMARY KEY,
    process_name VARCHAR2(100),
    status VARCHAR2(20),
    message VARCHAR2(200),
    log_date DATE DEFAULT SYSDATE
);



-- =========================================
-- END OF SCRIPT
-- =========================================