-- stg_raw__sales.sql

with 

source as (

    select * from {{ source('raw', 'sales') }}

),

renamed as (

    select
        date_date,
        concat(orders_id,'-',pdt_id) as surrogate_key,
        orders_id,
        pdt_id as products_id,
        revenue,
        quantity

    from source

)

select * from renamed