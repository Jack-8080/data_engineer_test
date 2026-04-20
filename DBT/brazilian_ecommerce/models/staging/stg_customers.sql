with source as (
    select *
    from raw_customers
),
cleaned as (
    select 
        customer_id,
        customer_unique_id,
        cast(customer_zip_code_prefix as integer)  customer_zip_code_prefix,
        lower(trim(customer_city)) as customer_city,
        lower(trim(customer_state)) as customer_state
    from source
    where customer_id is not null
)

select * from cleaned