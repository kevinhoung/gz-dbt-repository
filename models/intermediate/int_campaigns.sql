-- int_campaigns.sql

select * from {{ref('stg_raw__adwords')}}
UNION ALL
select * from {{ref('stg_raw__bing')}}
UNION ALL
select * from {{ref('stg_raw__criteo')}}
UNION ALL
select * from {{ref('stg_raw__facebook')}}