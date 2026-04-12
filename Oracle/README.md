# 🚀 Oracle ETL Framework – Employee Data Warehouse

## 📌 Overview

This project demonstrates a **complete ETL pipeline using Oracle PL/SQL Packages**.
It simulates a real-world data warehouse where data flows from source tables into **dimension and fact tables**, with transformations, logging, and incremental loading.

The implementation uses:

* Oracle PL/SQL Packages
* Bulk processing (`BULK COLLECT`, `FORALL`)
* Sequence-based surrogate keys
* Logging and error handling

---

## 🏗️ Architecture

**Source Layer → ETL Package → Target Layer**

### Source Tables

* `dept_src`
* `work_loc_src`
* `emp_dtls_src`
* `emp_job_dtls_src`

### Target Tables

* `hr_dept_d` (Department Dimension)
* `hr_work_loc_d` (Location Dimension)
* `hr_emp_f` (Employee Fact)
* `hr_job_dtls_f` (Job Details Fact)

### ETL Package

* `load_tables_poc_pkg`

---

## 🔄 ETL Flow

### 1️⃣ Load Department Dimension

* Uses sequence `hr_dept_d_seq`
* Generates surrogate keys
* Creates `dsk` (data surrogate key)

---

### 2️⃣ Load Location Dimension

* Uses sequence `hr_work_loc_d_seq`
* Avoids duplicate inserts using `NOT EXISTS`

---

### 3️⃣ Full Load Employee Fact

* Bulk loads data using:

  * `BULK COLLECT`
  * `FORALL`
* Generates:

  * `emp_uid` (business key)
  * `full_name`
  * `dsk`

---

### 4️⃣ Incremental Load Employee Fact

* Loads only new/updated records based on:

  * `last_updated`
* Uses:

  ```sql
  MAX(last_modified_date)
  ```

---

### 5️⃣ Load Job Fact Table

* Joins:

  * Employee table
  * Department dimension
  * Location dimension
* Generates:

  * `dsk`
  * Salary mapping
* Handles multiple job records per employee

---

### 6️⃣ Logging & Monitoring

* Central logging procedure:

  * `log_status`
* Logs:

  * Process start
  * Errors
  * Status updates

---

## ⚙️ Key Features

* ✅ Oracle PL/SQL Package-based ETL
* ✅ Bulk processing for performance
* ✅ Surrogate key generation using sequences
* ✅ Incremental load support
* ✅ Error logging with exception handling
* ✅ Multi-table joins for fact loading

---

## 🧠 Key Concepts Used

* `BULK COLLECT`
* `FORALL`
* `SEQUENCE.NEXTVAL`
* `NVL()`
* `LEFT JOIN`
* Exception handling (`WHEN OTHERS`)
* PL/SQL Packages

---

## 📊 Sample Logic

### Full Name Generation

```sql
first_name || ' ' || last_name
```

### Incremental Load Condition

```sql
last_updated > MAX(last_modified_date)
```

### Surrogate Key

```sql
hr_emp_f_seq.NEXTVAL
```

---

## 🚀 How to Run

1. Create all source and target tables
2. Create sequences:

   * `hr_dept_d_seq`
   * `hr_work_loc_d_seq`
   * `hr_emp_f_seq`
   * `etl_log_seq`
3. Compile package:

   ```sql
   @load_tables_poc_pkg.sql
   ```
4. Execute procedures:

BEGIN 
etl_data_load_pkg.hr_full_load_data;
END;
/

hr_full_load_data procedure executes: 

       full_load_dept_d_data;
       full_load_loc_d_data;
       full_load_emp_f_data;
       full_load_job_f_data;
   END;
   /
   ```

---

## 📁 Project Structure

```
/oracle-etl-project
  ├── source_tables.sql
  ├── target_tables.sql
  ├── sequences.sql
  ├── sample_data.sql
  ├── etl_data_load_pkg.hr_full_load_data.sql
  ├── screenshots/
```

---

## ⚠️ Design Notes

* Uses bulk processing instead of row-by-row operations
* Sequence-based surrogate keys for dimensions
* Logging implemented for traceability
* Incremental logic based on timestamp

---

## 📈 Future Enhancements

* MERGE-based upsert logic
* Slowly Changing Dimensions (SCD Type 2)
* Indexing and performance tuning
* Partitioning fact tables
* Integration with scheduling tools (DBMS_SCHEDULER)

---

## 💡 Learning Outcome

This project demonstrates:

* Real-world ETL implementation in Oracle
* Transition-ready skills for data engineering roles
* Strong understanding of PL/SQL performance techniques
* Data warehouse modeling concepts

---

## 👨‍💻 Author

**Ravi**
SQL / PL-SQL / PostgreSQL Developer

---
