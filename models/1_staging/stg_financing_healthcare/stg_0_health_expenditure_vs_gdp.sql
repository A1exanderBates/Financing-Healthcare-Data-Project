{{
    config(
        materialized='view',
        schema = 'fin_health_staging'
    )
}}

with health_expenditure_vs_gdp as (
    select 
        *
    from {{ source('fin_health', 'HEALTH_EXPENDITURE_VS_GDP') }}
)

select
    *
from health_expenditure_vs_gdp
