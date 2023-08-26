{{
    config(
        materialized='view',
        schema = 'fin_health_intermediate'
    )
}}

-- Our primary table
with health_expenditure_vs_gdp as (
    select
        *
    from {{ ref('stg_0_health_expenditure_vs_gdp') }}
)

,table2 as (
    select
        *
    from {{ ref('stg_0_annual_health_expenditure') }}
)

,table3 as (
    select
        *
    from {{ ref('stg_0_child_mortality_vs_health_expenditure') }}
)

,table4 as (
    select
        *
    from {{ ref('stg_0_expenditure_of_nhs_uk') }}
)

,table5 as (
    select
        *
    from {{ ref('stg_0_health_insurance_coverage_in_us') }}
)

,table6 as (
    select
        *
    from {{ ref('stg_0_health_protection_coverage') }}
)

,table7 as (
    select
        *
    from {{ ref('stg_0_life_expectancy_vs_healthcare_expenditure') }}
)

,table8 as (
    select
        *
    from {{ ref('stg_0_life_expectancy_vs_health_expenditure') }}
)

,table9 as (
    select
        *
    from {{ ref('stg_0_public_health_expenditure_share_gdp') }}
)

,table10 as (
    select
        *
    from {{ ref('stg_0_share_of_public_expenditure_on_healthcare_by_country') }}
)

,table11 as (
    select
        *
    from {{ ref('stg_0_share_pocket_expenditure_on_healthcare') }}
)

,table12 as (
    select
        *
    from {{ ref('stg_0_share_pocket_expenditure_vs_gdp_per_capita') }}
)

,table13 as (
    select
        *
    from {{ ref('stg_0_tax_revenue_per_capita') }}
)

,table14 as (
    select
        *
    from {{ ref('stg_0_total_healthcare_expenditure_gdp') }}
)

,table15 as (
    select
        *
    from {{ ref('stg_0_without_health_insurance_coverage_us') }}
)

,all_joined as (
    select
        md5(base.code) as COUNTRY_SK_ID
        ,base.code as country_code
        ,base.year::INT
        ,base.ENTITY
        ,base.CURRENT_HEALTH_EXPENDITURE_PER_CAPITA_PPP as CURRENT_HEALTH_EXPENDITURE_PER_CAPITA_PPP_HEVGDP
        ,base.GDP_PER_CAPITA_PPP as GDP_PER_CAPITA_PPP_HEVGDP
        ,base.POPULATION_HISTORICAL_ESTIMATES as POPULATION_HISTORICAL_ESTIMATES_HEVGDP
        ,base.CONTINENT as CONTINENT_HEVGDP
        ,table2.CURRENT_HEALTH_EXPENDITURE_PER_CAPITA_PPP as CURRENT_HEALTH_EXPENDITURE_PER_CAPITA_PPP_AHEPC
        ,table3.MORTALITY_RATE_UNDER_5_PER_1000_LIVE_BIRTHS as MORTALITY_RATE_UNDER_5_PER_1000_LIVE_BIRTHS_CMVHE
        ,table3.CURRENT_HEALTH_EXPENDITURE_PER_CAPITA_PPP as CURRENT_HEALTH_EXPENDITURE_PER_CAPITA_PPP_CMVHE
        ,table3.POPULATION_HISTORICAL_ESTIMATES as POPULATION_HISTORICAL_ESTIMATES_CMVHE
        ,table4.NHS_EXPENDITURE_PERCENT_GDP as NHS_EXPENDITURE_PERCENT_GDP_ENHSUK
        ,table5.HEALTH_INSURANCE_COVERAGE_US_GOVT_PLAN as HEALTH_INSURANCE_COVERAGE_US_GOVT_PLAN_HICUS
        ,table5.HEALTH_INSURANCE_COVERAGE_US_PRIVATE_PLAN as HEALTH_INSURANCE_COVERAGE_US_GOVT_PRIVATE_PLAN_HICUS
        ,table5.HEALTH_INSURANCE_COVERAGE_US_ANY_PLAN as HEALTH_INSURANCE_COVERAGE_US_GOVT_ANY_PLAN_HICUS
        ,table6.SHARE_OF_POPULATION_COVERED_BY_HEALTH_INSURANCE as SHARE_OF_POPULATION_COVERED_BY_HEALTH_INSURANCE_HPC
        ,table7.LIFE_EXPECTANCY_AT_BIRTH_TOTAL_YEARS as LIFE_EXPECTANCY_AT_BIRTH_TOTAL_YEARS_LEVHCE
        ,table7.LIFE_EXPECTANCY_AT_BIRTH_TOTAL_YEARS as CURRENT_HEALTH_EXPENDITURE_PER_CAPITA_PPP_LEVHCE
        ,table7.LIFE_EXPECTANCY_AT_BIRTH_TOTAL_YEARS as POPULATION_HISTORICAL_ESTIMATES_LEVHCE
        ,table8.LIFE_EXPECTANCY_AT_BIRTH_TOTAL_YEARS as LIFE_EXPECTANCY_AT_BIRTH_TOTAL_YEARS_LEVHE
        ,table8.LIFE_EXPECTANCY_AT_BIRTH_TOTAL_YEARS as HEALTH_EXPENDITURE_AND_FINANCING_PER_CAPITA_LEVHE
        ,table8.LIFE_EXPECTANCY_AT_BIRTH_TOTAL_YEARS as POPULATION_HISTORICAL_ESTIMATES_LEVHE
        ,table9.PUBLIC_HEALTH_EXPENDITURE_PC_GDP as PUBLIC_HEALTH_EXPENDITURE_PC_GDP_PHESGDP
        ,table10.DOMESTIC_GOVERNMENT_HEALTH_EXPENDITURE_PERCENT as DOMESTIC_GOVERNMENT_HEALTH_EXPENDITURE_PERCENT_SOPEOHBC
        ,table11.OUT_OF_POCKET_EXPENDITURE_PERCENT as OUT_OF_POCKET_EXPENDITURE_PERCENT_SPEOHC
        ,table12.OUT_OF_POCKET_EXPENDITURE_PERCENT_GDP as OUT_OF_POCKET_EXPENDITURE_PERCENT_GDP_SPEVGPC
        ,table12.OUT_OF_POCKET_EXPENDITURE_PERCENT_GDP as GDP_PER_CAPITA_PPP_SPEVGPC
        ,table12.OUT_OF_POCKET_EXPENDITURE_PERCENT_GDP as POPULATION_HISTORICAL_ESTIMATES_SPEVGPC
        ,table13.TAX_REVENUES_PER_CAPITA_IN_DEVELOPING_COUNTRIES_PPP as TAX_REVENUES_PER_CAPITA_IN_DEVELOPING_COUNTRIES_PPP_TRPC
        ,table13.PUBLIC_EXPENDITURE_ON_HEALTH_PER_CAPITA_IN_DEVELOPING_COUNTRIES_PPP as PUBLIC_EXPENDITURE_ON_HEALTH_PER_CAPITA_IN_DEVELOPING_COUNTRIES_PPP_TRPC
        ,table13.POPULATION_HISTORICAL_ESTIMATES as POPULATION_HISTORICAL_ESTIMATES_TRPC
        ,table14.CURRENT_HEALTH_EXPENDITURE_AS_PERCENTA_OF_GDP as CURRENT_HEALTH_EXPENDITURE_AS_PERCENTA_OF_GDP_THEGDP
        ,table15.PERCENTAGE_OF_PERSONS_WITHOUT_HEALTH_INSURANCE as PERCENTAGE_OF_PERSONS_WITHOUT_HEALTH_INSURANCE_WHICUS
  -- ... Add other metrics as required
  
    {{ left_join_tables(
        'health_expenditure_vs_gdp', 
            ['table2'
            ,'table3'
            ,'table4'
            ,'table5'
            ,'table6'
            ,'table7'
            ,'table8'
            ,'table9'
            ,'table10'
            ,'table11'
            ,'table12'
            ,'table13'
            ,'table14'
            ,'table15']
            ) 
        }}

)

select *
from all_joined