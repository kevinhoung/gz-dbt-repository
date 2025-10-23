-- finance report operations by day combine with marketing tables

with marketing as (
    select * from {{ref('int_campaigns_day')}}
)
select
    finance.date_date,
    SUM(finance.op_margin - marketing.ads_cost) as ads_margin,
    SUM(finance.average_basket) average_basket,
    SUM(finance.op_margin) as operational_margin,
    SUM(marketing.ads_cost) as ads_cost,
    SUM(marketing.impression) as ads_impression,
    SUM(marketing.click) as ads_clicks,
    SUM(finance.quantity_sold) as quantity,
    SUM(finance.revenue) as revenue,
    SUM(finance.total_purchase_cost) as purchase_cost,
    SUM(finance.revenue) - SUM(finance.total_purchase_cost) as margin,
    SUM(finance.total_shipping_fee) as shipping_fee,
    SUM(finance.total_log_cost) as log_cost,
    SUM(finance.total_ship_cost) as ship_cost
    from {{ref('finance_days')}} as finance
left join marketing
using (date_date)
group by date_date
