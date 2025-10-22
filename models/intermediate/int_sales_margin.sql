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
        product.purchase_price,
        product.purchase_price * sales.quantity as purchase_cost
        from sales
    left join product
    USING(products_id)
)
select *,
    revenue - purchase_cost as margin
    from joinedtable