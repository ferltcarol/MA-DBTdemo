select distinct
orders.order_id,
orders.order_purchase_timestamp,
customers.customer_id,
products.product_id,
order_payments.payment_value,
from 
raw.orders 
inner join raw.order_payments on 
orders.order_id = order_payments.order_id
inner join raw.customers on
orders.customer_id = customers.customer_id
inner join raw.order_items on 
orders.order_id = order_items.order_id 
inner join raw.products on
products.product_id = order_items.product_id