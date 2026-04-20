with source as (
    select * from {{ ref('stg_customers')}}
),

deduplicated as (
    select 
        customer_id,
        customer_unique_id,
        customer_zip_code_prefix,
        customer_city,
        customer_state,
        row_number() over (
            partition by customer_id
            order by customer_id
        ) as rn
    from source
)

select 
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
from deduplicated
where rn = 1