{{
    config(
        materialized='view',
        schema = 'fin_health_staging'
    )
}}

with life_expectancy_vs_healthcare_expenditure as (
    select 
        *
    from {{ source('fin_health', 'LIFE_EXPECTANCY_VS_HEALTHCARE_EXPENDITURE') }}
)



select
    *
from life_expectancy_vs_healthcare_expenditure