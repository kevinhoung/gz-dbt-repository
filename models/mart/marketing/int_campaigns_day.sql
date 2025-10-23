select
    date_date as date_date,
    SUM(ads_cost) as ads_cost,
    SUM(impression) as impression,
    SUM(click) as click
    from {{ref('int_orders_operational')}}
group by date_date