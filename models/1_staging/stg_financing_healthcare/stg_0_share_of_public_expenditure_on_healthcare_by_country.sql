{{
    config(
        materialized='view',
        schema = 'fin_health_staging'
    )
}}

with share_of_public_expenditure_on_healthcare_by_country as (
    select 
        *
    from {{ source('fin_health', 'SHARE_OF_PUBLIC_EXPENDITURE_ON_HEALTHCARE_BY_COUNTRY') }}
)

select
    *
from share_of_public_expenditure_on_healthcare_by_country