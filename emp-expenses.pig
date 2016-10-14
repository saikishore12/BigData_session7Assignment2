emp_details = LOAD 'employee_details.txt' USING PigStorage(',') AS (emp_id:int, emp_name:chararray);
emp_expenses = LOAD 'employee_expenses.txt' AS (emp_id:int, expenses:int);
joined_data = join emp_details by emp_id , emp_expenses by emp_id;
emp= foreach joined_data generate emp_details::emp_id,emp_name,expenses;
emp_desc_order = ORDER emp by expenses desc, emp_name asc;
dump emp_desc_order;
STORE emp_desc_order into 'emp_desc_order';