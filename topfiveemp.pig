emp_with_rating = LOAD 'employee_details.txt' USING PigStorage(',') AS (emp_id:int, emp_name:chararray, emp_salary:int, emp_rating:int);
emp = FOREACH emp_with_rating generate emp_id, emp_name, emp_rating;
emp_desc_order = ORDER emp_with_rating by emp_rating desc, emp_name asc;
emp_topfive = limit emp_desc_order 5;
dump emp_topfive;
STORE emp_topfive into 'emp_topfive';