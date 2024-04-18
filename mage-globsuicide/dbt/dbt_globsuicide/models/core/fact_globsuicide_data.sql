{{ 
    config(
        materialized = 'table',
        partition_by = { 
            "field": "year",
            "data_type": "integer"
        }
    )
}}
select
    region_code,
    region_name,
    country_code,
    country_name,
    year,
    sex,
    age_group,
    generation,
    suicide_count,
    cause_specific_death_percentage,
    death_rate_per_100k,
    population,
    gdp,
    gdp_per_capita,
    gross_national_income,
    gni_per_capita,
    inflation_rate,
    employment_population_ratio
from
    {{ ref('staging_globsuicide_data') }}
WHERE
    year >= 2010