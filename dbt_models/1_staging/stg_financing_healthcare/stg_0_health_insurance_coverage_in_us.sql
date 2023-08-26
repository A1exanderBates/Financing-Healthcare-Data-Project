{{
    config(
        materialized='view',
        schema = 'fin_health_staging'
    )
}}

with health_insurance_coverage_in_us as (
    select 
        *
    from {{ source('fin_health', 'HEALTH_INSURANCE_COVERAGE_IN_US') }}
)

select
    *
from health_insurance_coverage_in_us