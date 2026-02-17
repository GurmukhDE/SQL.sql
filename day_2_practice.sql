use nab_practice;
select * from accounts;
-- Question 1: Find all customers who made transactions above $10,000
Select distinct count(*) customer_id 
from accounts
where balance>10000;

-- Question 2 Count number of transactions per customer
SELECT customer_id,
count(*) as transaction_count
from nab_practice.transactions
group by customer_id
order by transaction_count desc;
-- Question 3 : Count number of transactions per customer
use nab_practice;
SELECT c.customer_id,
c.name
from customers c
left join transactions t on t.customer_id = c.customer_id
where t.customer_id is NULL; 

-- Question 4: Get total amount spent by each customer in last 30 days

WITH max_txn as
(
SELECT customer_id,
amount,
transaction_date,
max(amount) over (partition by customer_id) as customer_max
from transactions
)
SELECT customer_id,
sum(amount) as total_spent
from max_txn
where transaction_date>= transaction_date - interval 30 day
GROUP BY customer_id
order by total_spent DESC;

-- Question 5: Find customers who made transactions on consecutive days
SELECT DISTINCT 
    t1.customer_id
FROM transactions t1
JOIN transactions t2 
    ON t1.customer_id = t2.customer_id
    AND t2.transaction_date = t1.transaction_date + INTERVAL 1 day;

