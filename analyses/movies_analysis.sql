-- ============================================================
-- 1. TOP-RATED MOVIES
-- ============================================================
-- Purpose:
-- Find the top 10 movies based on their average rating.


SELECT
    m.movie_id,
    m.movie_title,
    COUNT(r.rating) AS rating_count,
    ROUND(AVG(r.rating), 2) AS avg_rating
FROM MOVIELENS.RAW.DIM_MOVIES m
JOIN MOVIELENS.RAW.FACT_RATINGS r
    ON m.movie_id = r.movie_id
GROUP BY
    m.movie_id,
    m.movie_title
HAVING COUNT(r.rating) >= 50
ORDER BY avg_rating DESC
LIMIT 10;


-- ============================================================
-- 2. MOVIE RANKING
-- ============================================================
-- Purpose:
-- Rank movies according to their average rating.


WITH movie_stats AS (

    SELECT
        m.movie_id,
        m.movie_title,
        COUNT(r.rating) AS rating_count,
        AVG(r.rating) AS avg_rating

    FROM MOVIELENS.RAW.DIM_MOVIES m

    JOIN MOVIELENS.RAW.FACT_RATINGS r
        ON m.movie_id = r.movie_id

    GROUP BY
        m.movie_id,
        m.movie_title

    HAVING COUNT(r.rating) >= 50
)

SELECT
    movie_id,
    movie_title,
    rating_count,
    ROUND(avg_rating, 2) AS avg_rating,

    RANK() OVER (
        ORDER BY avg_rating DESC
    ) AS movie_rank

FROM movie_stats

ORDER BY movie_rank;


-- ============================================================
-- 3. DATA QUALITY CHECK
-- ============================================================
-- Purpose:
-- Check the fact table for missing or invalid data.


SELECT
    COUNT(*) AS total_rows,

    -- Check for missing user IDs
    COUNT_IF(user_id IS NULL) AS null_users,

    -- Check for missing movie IDs
    COUNT_IF(movie_id IS NULL) AS null_movies,

    -- Check for missing ratings
    COUNT_IF(rating IS NULL) AS null_ratings,

    -- Check for missing timestamps
    COUNT_IF(rating_timestamp IS NULL) AS null_timestamps,

    -- Check for ratings outside the valid 0.5-5 range
    COUNT_IF(rating < 0.5 OR rating > 5) AS invalid_ratings

FROM MOVIELENS.RAW.FACT_RATINGS;