{{ 
    config(
        materialized='view'
    )
}} 

with globsuicide_data as (
    select * from {{ source('staging', 'globsuicide_data') }}
),
staging_globsuicide_data as (
    select
        {{ adapter.quote("RegionCode") }} as region_code,
        {{ adapter.quote("RegionName") }} as region_name,
        {{ adapter.quote("CountryCode") }} as country_code,
        {{ adapter.quote("CountryName") }} as country_name,
        {{ dbt.safe_cast("Year", api.Column.translate_type("int")) }} as year,
        {{ adapter.quote("Sex") }} as sex,
        {{ adapter.quote("AgeGroup") }} as age_group,
        {{ adapter.quote("generation") }} as generation,
        {{ dbt.safe_cast("SuicideCount", api.Column.translate_type("float")) }} as suicide_count,
        {{ dbt.safe_cast("CauseSpecificDeathPercentage", api.Column.translate_type("float")) }} as cause_specific_death_percentage,
        {{ dbt.safe_cast("DeathRatePer100K", api.Column.translate_type("float")) }} as death_rate_per_100k,
        {{ dbt.safe_cast("Population", api.Column.translate_type("float")) }} as population,
        {{ dbt.safe_cast("GDP", api.Column.translate_type("float")) }} as gdp,
        {{ dbt.safe_cast("GDPPerCapita", api.Column.translate_type("float")) }} as gdp_per_capita,
        {{ dbt.safe_cast("GrossNationalIncome", api.Column.translate_type("float")) }} as gross_national_income,
        {{ dbt.safe_cast("GNIPerCapita", api.Column.translate_type("float")) }} as gni_per_capita,
        {{ dbt.safe_cast("InflationRate", api.Column.translate_type("float")) }} as inflation_rate,
        {{ dbt.safe_cast("EmploymentPopulationRatio", api.Column.translate_type("float")) }} as employment_population_ratio
    from
        globsuicide_data
)
select
    *
from
    staging_globsuicide_data 
    
-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
{% if var('is_test_run', default=true) %}

  limit 1000

{% endif %}