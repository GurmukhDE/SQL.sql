SELECT
c.name,
c.customer_id,
coalesce((t.amount)) as total_txn_per_customer
from customers c
left join transactions t
on c.customer_id =  t.customer_id
group by c.customer_id
order by total_txn_per_customer desc;
