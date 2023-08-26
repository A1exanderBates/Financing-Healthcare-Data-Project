{{
    config(
        materialized='view',
        schema = 'fin_health_staging'
    )
}}

with expenditure_of_nhs_uk as (
    select 
        *
    from {{ source('fin_health', 'EXPENDITURE_OF_NHS_UK') }}
)

select
    *
from expenditure_of_nhs_uk