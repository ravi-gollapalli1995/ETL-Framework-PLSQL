# 🚀 PostgreSQL ETL Framework – Employee Data Pipeline

## 📌 Overview

This project demonstrates a **complete ETL pipeline built using PostgreSQL (PL/pgSQL)**.
It simulates a real-world data warehouse scenario where employee data is loaded from source tables into **dimension and fact tables**, followed by data enrichment and transformation.

The focus is on:

* Set-based processing (PostgreSQL best practice)
* Data transformation & enrichment
* Performance-oriented SQL design
* Real-time ETL concepts used in industry

---

## 🏗️ Architecture

**Source Layer → Transformation → Target Layer**

* **Source Tables**

  * `dept_src`
  * `work_loc_src`
  * `emp_dtls_src`
  * `emp_job_dtls_src`

* **Target Tables**

  * `hr_dept_d` (Department Dimension)
  * `hr_work_loc_d` (Location Dimension)
  * `hr_emp_f` (Employee Fact)
  * `hr_job_dtls_f` (Job Details Fact)

---

## 🔄 ETL Flow

### 1. Load Dimension Tables

* Departments and locations are loaded from source tables
* Business keys (`dept_uid`, `location_uid`) mapped to surrogate keys

### 2. Load Employee Fact

* Employee details transformed and inserted into `hr_emp_f`
* Full name derived using concatenation
* Status and attributes standardized

### 3. Load Job Fact

* Job details joined with:

  * Employee table
  * Department dimension
  * Location dimension
* Surrogate keys assigned
* Derived column `dsk` created for uniqueness

### 4. Data Enrichment

* Job tenure calculated using PostgreSQL `AGE()` function
* Converted into numeric years for reporting
* Flags can be added:

  * `is_term_flag`
  * `salary_flag`

---

## ⚙️ Key Features

* ✅ **Set-Based ETL (No row-by-row processing)**
* ✅ **Join-based transformations**
* ✅ **Surrogate key handling**
* ✅ **Null handling using COALESCE**
* ✅ **Accurate tenure calculation using AGE()**
* ✅ **Procedure-based orchestration**
* ✅ **Error logging support**

---

## 🧠 Key SQL Concepts Used

* `INSERT INTO ... SELECT`
* `UPDATE ... FROM`
* `COALESCE()` for null handling
* `AGE()` for date difference
* `EXTRACT()` for numeric tenure calculation
* `CASE WHEN` for flag logic
* PostgreSQL Procedures (`CALL`)

---

## 📊 Sample Transformation Logic

### Job Tenure Calculation

```sql
ROUND(
    EXTRACT(YEAR FROM AGE(COALESCE(term_date, CURRENT_DATE), hire_date)) +
    EXTRACT(MONTH FROM AGE(COALESCE(term_date, CURRENT_DATE), hire_date)) / 12.0,
2)
```

---

## 🚀 How to Run

1. Create all source and target tables
2. Insert sample data into source tables
3. Run dimension load scripts
4. Run employee fact load procedure
5. Run job fact load procedure
6. Execute tenure update procedure

---

## 📁 Project Structure

```
/sql
  ├── source_tables.sql
  ├── target_tables.sql
  ├── sample_data.sql
  ├── load_dimensions.sql
  ├── load_emp_fact.sql
  ├── load_job_fact.sql
  ├── update_job_tenure.sql
```

---

## ⚠️ Design Decisions

* Avoided cursors for performance (used only where necessary)
* Used set-based operations for scalability
* Separated source, dimension, and fact layers
* Numeric tenure stored instead of formatted strings

---

## 📈 Future Enhancements

* Incremental load using `last_updated`
* Slowly Changing Dimensions (SCD Type 2)
* Indexing for performance tuning
* Partitioning large fact tables
* Integration with cloud tools (Azure Data Factory / AWS)

---

## 💡 Learning Outcome

This project demonstrates:

* Transition from Oracle PL/SQL to PostgreSQL
* Writing efficient ETL pipelines
* Real-world data warehouse design
* Performance-focused SQL development

---

## 🤝 Author

**Ravi**
SQL / PL-SQL / PostgreSQL Developer

---
