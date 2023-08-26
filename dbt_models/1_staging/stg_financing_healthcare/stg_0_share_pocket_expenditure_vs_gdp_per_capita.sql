{{
    config(
        materialized='view',
        schema = 'fin_health_staging'
    )
}}

with share_pocket_expenditure_vs_gdp_per_capita as (
    select 
        *
    from {{ source('fin_health', 'SHARE_POCKET_EXPENDITURE_VS_GDP_PER_CAPITA') }}
)

select
    *
from share_pocket_expenditure_vs_gdp_per_capita