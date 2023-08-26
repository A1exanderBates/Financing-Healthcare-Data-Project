{{
    config(
        materialized='view',
        schema = 'fin_health_staging'
    )
}}

with health_protection_coverage as (
    select 
        *
    from {{ source('fin_health', 'HEALTH_PROTECTION_COVERAGE') }}
)

select
    *
from health_protection_coverage