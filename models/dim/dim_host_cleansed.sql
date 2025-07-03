-- dim_hosts_cleansed.sql
{{ config(
    materialized='view'
) }}


select 
    host_id, 
    NVL(
        host_name,
        'Anonymous'
    ) AS host_name,
    is_superhost, 
    created_at, 
    updated_at
from {{ref('src_hosts')}}