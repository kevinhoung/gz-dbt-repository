-- left join

with sales as (
    select * from {{ref('stg_raw__sales')}}
),
product as (
    select * from {{ref('stg_raw__product')}}
),
joinedtable as (
    select
        sales.*,
        product.purchase_price as purchase_cost
        from sales
    left join product
    USING(products_id)
)
select * from joinedtable