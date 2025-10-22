with margin as (
    select * from {{ref('int_orders_margin')}}
),
shipcost as (
    select * from {{ref('stg_raw__ship')}}
),
joinedtable as (
    select
        margin.*,
        shipcost.shipping_fee,
        shipcost.logcost,
        shipcost.ship_cost
        from margin
    left join shipcost
    USING(orders_id)
)
select
    orders_id as orders_id,
    date_date as date_date,
    SUM(revenue) as revenue,
    SUM(purchase_cost) as purchase_cost,
    SUM(margin) as margin,
    SUM(quantity) as quantity,
    SUM(shipping_fee) as shipping_fee,
    SUM(logcost) as log_cost,
    SUM(ship_cost) as ship_cost,
    SUM(margin + shipping_fee - logcost - ship_cost) as operational_margin
    from joinedtable
    GROUP BY orders_id, date_date