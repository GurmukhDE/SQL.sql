use nab_practice;
-- ----------------------------------------Inner Join--------------------
select a.account_type, a.balance, c.name, c.city
from accounts as a
inner join customers as c

on a.customer_id = c.customer_id;

-- ------------------------------------------------

Select 
a.account_type, 
a.balance, 
c.name, 
c.city
from accounts a
left join customers c
on a.customer_id = c.customer_id
where balance>1000
order by balance desc;


-- customer name + order_id + total_amount + order_date #only for customers who placed orders

	select 
    c.name,
    o.order_id,
    o.total_amount,
    o.order_date
    from customers c
    left join orders o
    on c.customer_id = o.customer_id;
   -- where o.order_id is not null
    
    -- Total transaction amount per customer
    
    SELECT 
    C.customer_id,
    c.name,
    sum(t.amount) as total_transaction_amount_per_customer
    from customers c
    inner join transactions t
    on c.customer_id = t.customer_id
    group by c.customer_id, c.name
    order by total_transaction_amount_per_customer  desc;
    
    -- “Show ALL customers, even if they have NO transactions”
    
SELECT
c.name,
c.customer_id,
coalesce((t.amount)) as total_txn_per_customer
from customers c
left join transactions t
on c.customer_id =  t.customer_id
group by c.customer_id
order by total_txn_per_customer desc;


-- Get latest transaction per customer 
use nab_practice;
SELECT
t.customer_id,
    t.transaction_id,
    t.amount,
    t.transaction_date
    from (
    select
 t.*, -- it means here I am selection all columns from transactions table
row_number() over( partition by t.customer_id order by t.transaction_date desc) 
as rn
from transactions t)
t
where rn = 1;

    
    
    
    
    

