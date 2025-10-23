select
    date_date,
    SUM(ads_cost),
    SUM(impression),
    SUM(click)
    from {{ref('int_orders_operational')}}
group by date_date