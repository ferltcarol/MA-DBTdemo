select distinct
customers.customer_id,
customers.customer_city,
customers.customer_state,
customers.customer_unique_id,
customers.customer_zip_code_prefix,
count(orders.order_id) OVER (partition by orders.customer_id RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as amt_orders,
min(orders.order_purchase_timestamp) OVER (partition by orders.customer_id RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as min_orders,
max(orders.order_purchase_timestamp) OVER (partition by orders.customer_id RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as max_orders,
from 
raw.orders 
inner join raw.order_items on 
order_items.order_id = orders.order_id
inner join raw.customers on
orders.customer_id = customers.customer_id 