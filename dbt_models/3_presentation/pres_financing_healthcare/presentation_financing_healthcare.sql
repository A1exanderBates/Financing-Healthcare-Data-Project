{{
    config(
        materialized='view',
        schema = 'fin_health_presentation'
    )
}}

with final_wide_table as (
    select *
    from {{ ref('int_0_fin_health_all_joined') }}
)

select
    *
from final_wide_table