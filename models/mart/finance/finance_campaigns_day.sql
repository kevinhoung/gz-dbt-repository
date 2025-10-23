-- finance report operations by day combine with marketing tables

with marketing as (
    select * from {{ref('int_campaigns_day')}}
),
finance as (
    select * from {{ref('finance_days')}}
),
financemarketingcombine as (
    select * from finance
    left join marketing
    using (date_date)
)
select
    date_date,
    SUM(op_margin - ads_cost) as ads_margin,
    SUM(average_basket) average_basket,
    SUM(op_margin) as operational_margin,
    SUM(ads_cost) as ads_cost,
    SUM(impression) as ads_impression,
    SUM(click) as ads_clicks,
    SUM(quantity_sold) as quantity,
    SUM(revenue) as revenue,
    SUM(total_purchase_cost) as purchase_cost,
    SUM(revenue) - SUM(total_purchase_cost) as margin,
    SUM(total_shipping_fee) as shipping_fee,
    SUM(total_log_cost) as log_cost,
    SUM(total_ship_cost) as ship_cost
    from financemarketingcombine
group by date_date
