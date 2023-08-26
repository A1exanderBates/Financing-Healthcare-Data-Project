{{
    config(
        materialized='view',
        schema = 'fin_health_staging'
    )
}}

with tax_revenue_per_capita as (
    select 
        *
    from {{ source('fin_health', 'TAX_REVENUE_PER_CAPITA') }}
)

select
    *
from tax_revenue_per_capita