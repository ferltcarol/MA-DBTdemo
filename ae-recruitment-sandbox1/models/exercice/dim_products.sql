SELECT distinct
products.product_id, 
products.product_category_name,
products.product_description_lenght,
products.product_height_cm, 
products.product_length_cm, 
products.product_name_lenght, 
products.product_photos_qty, 
products.product_weight_g, 
products.product_width_cm, 
count(order_payments.order_id) OVER (partition by payment_value RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as amt_orders,
order_payments.payment_value 
FROM raw.order_items
INNER JOIN raw.products on order_items.product_id = products.product_id
INNER JOIN raw.order_payments on order_items.order_id = order_payments.order_id