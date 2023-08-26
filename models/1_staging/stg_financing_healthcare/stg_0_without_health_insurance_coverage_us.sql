{{
    config(
        materialized='view',
        schema = 'fin_health_staging'
    )
}}

with without_health_insurance_coverage_us as (
    select 
        *
    from {{ source('fin_health', 'WITHOUT_HEALTH_INSURANCE_COVERAGE_US') }}
)

select
    *
from without_health_insurance_coverage_us