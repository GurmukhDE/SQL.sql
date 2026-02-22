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
inner join customers c
on a.customer_id = c.customer_id
where account_type = "checking" and balance<1
order by balance desc;




