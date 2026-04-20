with source as (
    select * 
    from raw_order_items
),
cleaned as (
    select
        order_id,
        order_item_id,
        product_id,
        seller_id,
        cast(shipping_limit_date as timestamp) as shipping_limit_date,
        cast(price as numeric(18,2)) as price,
        cast(freight_value as numeric(18,2)) as freight_value
    from source
    where order_id is not null
      and product_id is not null
)

select * from cleaned