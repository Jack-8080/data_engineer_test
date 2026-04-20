with order_items as (
    select * 
    from {{ ref('stg_order_items') }}
),
orders as (
    select * 
    from {{ ref('stg_orders') }}
)

select
    oi.order_id,
    oi.order_item_id,
    oi.product_id,
    o.customer_id,
    o.order_status,
    o.order_purchase_timestamp,
    oi.price,
    oi.freight_value,
    (oi.price + oi.freight_value) as total_amount
from order_items oi
left join orders o
    on oi.order_id = o.order_id