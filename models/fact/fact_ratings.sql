{{ config(
    materialized='incremental',
    unique_key=['user_id', 'movie_id', 'rating_timestamp']
) }}

SELECT
    user_id,
    movie_id,
    rating,
    rating_timestamp

FROM {{ ref('src_ratings') }}

{% if is_incremental() %}

WHERE rating_timestamp > (
    SELECT MAX(rating_timestamp)
    FROM {{ this }}
)

{% endif %}