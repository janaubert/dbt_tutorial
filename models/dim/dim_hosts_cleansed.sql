{{
    config(
        materialized = 'view',
        on_schema_change = 'fail'
        )
}}

WITH src_hosts AS (
    SELECT * FROM {{ ref('src_hosts')}}
    )

SELECT 	
    host_id,
    CASE WHEN host_name IS NULL THEN 'Anonymous'
    ELSE host_name END AS host_name,
    IS_SUPERHOST,
    CREATED_AT,
    UPDATED_AT
FROM src_hosts