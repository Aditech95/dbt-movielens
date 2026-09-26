{{ config(materialized = 'table') }}

WITH fact_ratings AS (
    SELECT * FROM {{ ref('fact_ratings') }}
),
seed_dates AS (
    SELECT * FROM {{ ref('movie_release_date') }}
)

SELECT 
    f.*,
    CASE
        WHEN d.release_date IS NULL THEN 'unknown'
        ELSE 'known'
    END AS release_info_available
FROM fact_ratings f
LEFT JOIN seed_dates d
ON f.movie_id = d.movie_id