with source as (
    select * 
    from {{ ref('stg_products') }}
),
deduplicated as (
    select
        product_id,
        product_category_name,
        product_name_length,
        product_description_length,
        product_photos_qty,
        product_weight_g,
        product_length_cm,
        product_height_cm,
        product_width_cm,
        row_number() over (
            partition by product_id 
            order by product_id
        ) as rn
    from source
)

select
    product_id,
    product_category_name,
    product_name_length,
    product_description_length,
    product_photos_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
from deduplicated
where rn = 1