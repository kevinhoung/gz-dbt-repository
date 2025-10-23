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
select
    date_date,
    surrogate_key,
    orders_id,
    products_id,
    revenue,
    quantity,
    purchase_price,
    purchase_cost,
    revenue - purchase_cost as margin,
    {{ margin_percent('revenue', 'purchase_cost') }} as margin_percent
    from joinedtable