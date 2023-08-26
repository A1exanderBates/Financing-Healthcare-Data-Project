{{
    config(
        materialized='view',
        schema = 'fin_health_staging'
    )
}}

with public_health_expenditure_share_gdp as (
    select 
        *
    from {{ source('fin_health', 'PUBLIC_HEALTH_EXPENDITURE_SHARE_GDP') }}
)

select
    *
from public_health_expenditure_share_gdp