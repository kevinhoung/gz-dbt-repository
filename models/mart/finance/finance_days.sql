-- finance report operations

with op_orders as (
    select * from {{ref('int_orders_operational')}}
)
select
    date_date,
    COUNT(orders_id) as nb_transactions,
    ROUND(SUM(revenue),2) as revenue,
    ROUND(SUM(revenue) / COUNT(orders_id),2) as average_basket,
    ROUND(AVG(operational_margin),2) as avg_op_margin,
    ROUND(SUM(purchase_cost),2) as total_purchase_cost,
    ROUND(SUM(shipping_fee),2) as total_shipping_fee,
    ROUND(SUM(log_cost),2) as total_log_cost,
    ROUND(SUM(quantity),2) as quantity_sold
    from op_orders
    group by date_date