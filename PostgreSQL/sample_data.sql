--dept_src

INSERT INTO dept_src (dept_name, dept_uid, last_updated) VALUES
('Human Resources', 'D001', '2024-01-10'),
('Finance', 'D002', '2024-01-12'),
('IT Support', 'D003', '2024-01-15'),
('Software Development', 'D004', '2024-01-18'),
('Quality Assurance', 'D005', '2024-01-20'),
('Sales', 'D006', '2024-01-22'),
('Marketing', 'D007', '2024-01-25'),
('Customer Service', 'D008', '2024-01-28'),
('Procurement', 'D009', '2024-02-01'),
('Legal', 'D010', '2024-02-03'),
('Administration', 'D011', '2024-02-05'),
('Operations', 'D012', '2024-02-08'),
('Logistics', 'D013', '2024-02-10'),
('Research and Development', 'D014', '2024-02-12'),
('Business Intelligence', 'D015', '2024-02-15'),
('Data Engineering', 'D016', '2024-02-18'),
('Cyber Security', 'D017', '2024-02-20'),
('Product Management', 'D018', '2024-02-22'),
('Training and Development', 'D019', '2024-02-25'),
('Corporate Strategy', 'D020', '2024-02-28');


--work_loc_src

INSERT INTO work_loc_src (location_name, location_uid, last_updated) VALUES
('Hyderabad', 'L001', '2024-01-05'),
('Bangalore', 'L002', '2024-01-07'),
('Chennai', 'L003', '2024-01-10'),
('Mumbai', 'L004', '2024-01-12'),
('Delhi', 'L005', '2024-01-15'),
('Pune', 'L006', '2024-01-18'),
('Kolkata', 'L007', '2024-01-20'),
('Noida', 'L008', '2024-01-22'),
('Gurgaon', 'L009', '2024-01-25'),
('Ahmedabad', 'L010', '2024-01-28'),
('Jaipur', 'L011', '2024-02-01'),
('Visakhapatnam', 'L012', '2024-02-03'),
('Coimbatore', 'L013', '2024-02-05'),
('Indore', 'L014', '2024-02-08'),
('Nagpur', 'L015', '2024-02-10'),
('Chandigarh', 'L016', '2024-02-12'),
('Lucknow', 'L017', '2024-02-15'),
('Bhubaneswar', 'L018', '2024-02-18'),
('Trivandrum', 'L019', '2024-02-20'),
('Mysore', 'L020', '2024-02-22');



--emp_dtls_src

INSERT INTO emp_dtls_src (
    emp_id, first_name, last_name, hire_date, term_date, veteran_status, emp_status, last_updated
) VALUES
(1001, 'Ravi', 'Kumar', '2020-01-15', NULL, 'No', 'Active', '2024-01-10'),
(1002, 'Anjali', 'Sharma', '2019-03-20', NULL, 'No', 'Active', '2024-01-12'),
(1003, 'Vikram', 'Reddy', '2018-07-10', '2023-12-31', 'Yes', 'Terminated', '2024-01-15'),
(1004, 'Sneha', 'Iyer', '2021-05-05', NULL, 'No', 'Active', '2024-01-18'),
(1005, 'Arjun', 'Patel', '2017-09-25', '2022-11-30', 'Yes', 'Terminated', '2024-01-20'),
(1006, 'Pooja', 'Mehta', '2022-02-14', NULL, 'No', 'Active', '2024-01-22'),
(1007, 'Kiran', 'Naidu', '2020-08-01', NULL, 'No', 'Active', '2024-01-25'),
(1008, 'Rahul', 'Verma', '2016-06-18', '2021-06-30', 'Yes', 'Terminated', '2024-01-28'),
(1009, 'Divya', 'Nair', '2023-01-10', NULL, 'No', 'Active', '2024-02-01'),
(1010, 'Suresh', 'Babu', '2015-11-11', '2020-10-10', 'Yes', 'Terminated', '2024-02-03'),
(1011, 'Neha', 'Kapoor', '2021-03-03', NULL, 'No', 'Active', '2024-02-05'),
(1012, 'Manoj', 'Singh', '2019-12-12', NULL, 'No', 'Active', '2024-02-08'),
(1013, 'Amit', 'Das', '2018-04-22', '2023-05-15', 'No', 'Terminated', '2024-02-10'),
(1014, 'Priya', 'Menon', '2020-10-30', NULL, 'No', 'Active', '2024-02-12'),
(1015, 'Naveen', 'Joshi', '2017-01-17', NULL, 'Yes', 'Active', '2024-02-15'),
(1016, 'Swathi', 'Rao', '2022-07-19', NULL, 'No', 'Active', '2024-02-18'),
(1017, 'Deepak', 'Yadav', '2016-02-29', '2022-02-28', 'Yes', 'Terminated', '2024-02-20'),
(1018, 'Kavya', 'Shetty', '2023-06-01', NULL, 'No', 'Active', '2024-02-22'),
(1019, 'Rohit', 'Agarwal', '2019-09-09', NULL, 'No', 'Active', '2024-02-25'),
(1020, 'Lakshmi', 'Prasad', '2018-11-11', '2024-01-31', 'No', 'Terminated', '2024-02-28');



--emp_job_dtls_src

INSERT INTO emp_job_dtls_src (
    emp_uid, job_start_date, job_end_date, job_name,
    dept_name, loc_name, salary, hourly, last_updated
) VALUES
(1001, '2020-01-15', '2021-06-30', 'Junior Developer', 'Software Development', 'Hyderabad', 30000, 'No', '2024-01-10'),
(1001, '2021-07-01', NULL, 'Senior Developer', 'Software Development', 'Hyderabad', 60000, 'No', '2024-01-12'),

(1002, '2019-03-20', NULL, 'HR Executive', 'Human Resources', 'Bangalore', 40000, 'No', '2024-01-12'),

(1003, '2018-07-10', '2020-12-31', 'QA Analyst', 'Quality Assurance', 'Chennai', 35000, 'No', '2024-01-15'),
(1003, '2021-01-01', '2023-12-31', 'QA Lead', 'Quality Assurance', 'Chennai', 55000, 'No', '2024-01-15'),

(1004, '2021-05-05', NULL, 'Business Analyst', 'Business Intelligence', 'Mumbai', 50000, 'No', '2024-01-18'),

(1005, '2017-09-25', '2019-12-31', 'Sales Executive', 'Sales', 'Delhi', 30000, 'No', '2024-01-20'),
(1005, '2020-01-01', '2022-11-30', 'Sales Manager', 'Sales', 'Delhi', 60000, 'No', '2024-01-20'),

(1006, '2022-02-14', NULL, 'Data Engineer', 'Data Engineering', 'Pune', 70000, 'No', '2024-01-22'),

(1007, '2020-08-01', NULL, 'System Admin', 'IT Support', 'Kolkata', 45000, 'No', '2024-01-25'),

(1008, '2016-06-18', '2019-06-30', 'Support Engineer', 'Customer Service', 'Noida', 28000, 'No', '2024-01-28'),
(1008, '2019-07-01', '2021-06-30', 'Senior Support Engineer', 'Customer Service', 'Noida', 40000, 'No', '2024-01-28'),

(1009, '2023-01-10', NULL, 'Intern', 'Software Development', 'Gurgaon', 15000, 'Yes', '2024-02-01'),

(1010, '2015-11-11', '2018-12-31', 'Accountant', 'Finance', 'Ahmedabad', 32000, 'No', '2024-02-03'),
(1010, '2019-01-01', '2020-10-10', 'Senior Accountant', 'Finance', 'Ahmedabad', 50000, 'No', '2024-02-03'),

(1011, '2021-03-03', NULL, 'Legal Advisor', 'Legal', 'Jaipur', 55000, 'No', '2024-02-05'),

(1012, '2019-12-12', NULL, 'Operations Manager', 'Operations', 'Visakhapatnam', 65000, 'No', '2024-02-08'),

(1013, '2018-04-22', '2023-05-15', 'Logistics Coordinator', 'Logistics', 'Coimbatore', 42000, 'No', '2024-02-10'),

(1014, '2020-10-30', NULL, 'Product Manager', 'Product Management', 'Indore', 75000, 'No', '2024-02-12'),

(1015, '2017-01-17', NULL, 'Trainer', 'Training and Development', 'Nagpur', 48000, 'No', '2024-02-15'),

(1016, '2022-07-19', NULL, 'Cyber Security Analyst', 'Cyber Security', 'Chandigarh', 70000, 'No', '2024-02-18');