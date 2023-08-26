{{
    config(
        materialized='view',
        schema = 'fin_health_staging'
    )
}}

with share_pocket_expenditure_on_healthcare as (
    select 
        *
    from {{ source('fin_health', 'SHARE_POCKET_EXPENDITURE_ON_HEALTHCARE') }}
)

select
    *
from share_pocket_expenditure_on_healthcare