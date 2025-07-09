{{ config(
    materialized='incremental',
    on_schema_changes='append_new_columns',
    transient=true,
    incremental_strategy='merge',
    unique_key=['listing_id', 'review_date']
) }}


With src_reviews as
(
    SELECT * FROM {{ref("src_reviews")}}
)
SELECT *, {{ dbt_utils.generate_surrogate_key(['listing_id', 'review_date', 'reviewer_name', 'review_text']) }} AS review_id,
FROM src_reviews WHERE review_text is not null

{% if is_incremental() %}
and review_date > (select max(review_date) from {{ this }})
{% endif %}