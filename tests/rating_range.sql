-- SELECT *
-- FROM {{ ref('fact_ratings') }}
-- WHERE rating < 0.5
--    OR rating > 5.0

{{ check_nulls(ref('dim_movies'), 'movie_id') }}