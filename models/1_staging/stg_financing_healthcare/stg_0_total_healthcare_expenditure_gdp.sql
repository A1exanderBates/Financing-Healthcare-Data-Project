{{
    config(
        materialized='view',
        schema = 'fin_health_staging'
    )
}}

with total_healthcare_expenditure_gdp as (
    select 
        *
    from {{ source('fin_health', 'TOTAL_HEALTHCARE_EXPENDITURE_GDP') }}
)

select
    *
from total_healthcare_expenditure_gdp