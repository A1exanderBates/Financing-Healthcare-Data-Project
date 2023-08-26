{{
    config(
        materialized='view',
        schema = 'fin_health_staging'
    )
}}

with annual_healthcare_expenditure_per_capita as (
    select 
        *
    from {{ source('fin_health', 'ANNUAL_HEALTHCARE_EXPENDITURE_PER_CAPITA') }}
)

select
    *
from annual_healthcare_expenditure_per_capita