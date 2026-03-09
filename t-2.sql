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

    
    
    
    
    

