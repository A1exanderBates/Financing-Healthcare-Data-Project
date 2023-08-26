{{
    config(
        materialized='view',
        schema = 'fin_health_staging'
    )
}}

with src as (
    select 
        *
    from {{ source('fin_health', 'LIFE_EXPECTANCY_VS_HEALTH_EXPENDITURE') }}
)

,life_expectancy_vs_health_expenditure as (
    select
        ENTITY
        ,CODE
        ,"YEAR"
        ,LIFE_EXPECTANCY_AT_BIRTH_TOTAL_YEARS
        ,POPULATION_HISTORICAL_ESTIMATES
        ,CONTINENT
        ,CASE
            WHEN HEALTH_EXPENDITURE_AND_FINANCING_PER_CAPITA = '..' THEN NULL
            ELSE TRY_CAST(HEALTH_EXPENDITURE_AND_FINANCING_PER_CAPITA AS INT) 
        END AS HEALTH_EXPENDITURE_AND_FINANCING_PER_CAPITA_INT
    from src
)


select
    *
from life_expectancy_vs_health_expenditure