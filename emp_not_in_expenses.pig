emp_details = LOAD 'employee_details.txt' USING PigStorage(',') AS (emp_id:int, emp_name:chararray);
emp_expenses = LOAD 'employee_expenses.txt' AS (emp_id:int, expenses:int);
joined_data = join emp_details by emp_id , emp_expenses by emp_id;
filtered_emp = FILTER joined_data by emp_details::emp_id != emp_expenses::emp_id;
emp_not_in_expenses= foreach filtered_emp generate emp_details::emp_id,emp_name;
dump emp_not_in_expenses;
STORE emp_not_in_expenses into 'emp_not_in_expenses';