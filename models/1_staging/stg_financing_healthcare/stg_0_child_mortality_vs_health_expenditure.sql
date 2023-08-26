{{
    config(
        materialized='view',
        schema = 'fin_health_staging'
    )
}}

with child_mortality_vs_health_expenditure as (
    select 
        *
    from {{ source('fin_health', 'CHILD_MORTALITY_VS_HEALTH_EXPENDITURE') }}
)

select
    *
from child_mortality_vs_health_expenditure