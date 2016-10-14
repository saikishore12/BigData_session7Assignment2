emp_with_salary = LOAD 'employee_details.txt' USING PigStorage(',') AS (emp_id:int, emp_name:chararray, emp_salary:int, emp_rating:int);
emp = FOREACH emp_with_salary generate emp_id, emp_name, emp_salary;
filtered_emp = FILTER emp by emp_id%2==1;
emp_desc_order = ORDER filtered_emp by emp_salary desc, emp_name asc;
emp_topthree_salary = limit emp_desc_order 3;
store emp_topthree_salary into 'emp_topthree_salary';