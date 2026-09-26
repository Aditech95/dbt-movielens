SELECT
    user_id,
    movie_id,
    tag,
    tag_timestamp
FROM {{ ref('src_tags') }}