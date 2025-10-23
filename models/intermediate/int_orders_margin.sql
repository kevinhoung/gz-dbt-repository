with margin as (
    select * from {{ref('int_sales_margin')}}
)
select
    margin.orders_id as orders_id,
    margin.date_date as date_date,
    ROUND(SUM(margin.revenue),2) as revenue,
    SUM(margin.quantity) as quantity,
    ROUND(SUM(margin.purchase_cost),2) as purchase_cost,
    ROUND(SUM(margin.margin),2) as margin
    from margin
    where orders_id = 1002561
    group by orders_id, date_date
