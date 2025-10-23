-- int_campaigns.sql
/*
select * from {{ref('stg_raw__adwords')}}
UNION ALL
select * from {{ref('stg_raw__bing')}}
UNION ALL
select * from {{ref('stg_raw__criteo')}}
UNION ALL
select * from {{ref('stg_raw__facebook')}}
*/

{{ dbt_utils.union_relations(
    relations = [
        ref('stg_raw__adwords'),
        ref('stg_raw__bing'),
        ref('stg_raw__criteo'),
        ref('stg_raw__facebook')
    ],
     source_column_name = None
) }}