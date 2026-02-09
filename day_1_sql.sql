SELECT SUM(ci.POPULATION)
FROM CITY ci
JOIN COUNTRY co
  ON ci.CountryCode = co.Code
WHERE co.CONTINENT = 'Asia';

#✅ Q1: Second highest salary

SELECT MAX(salary)
FROM employees
WHERE salary < (
    SELECT MAX(salary) FROM employees
);

#✅ Q2: Running total using window function
SELECT
    date,
    SUM(sales) OVER (ORDER BY date) AS running_total
FROM sales_table;


#✅ Q3: Find duplicate records
SELECT name, COUNT(*)
FROM customers
GROUP BY name
HAVING COUNT(*) > 1;


#✅ Q4: Join + aggregation (very common)
SELECT d.department_name, COUNT(e.employee_id)
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;

