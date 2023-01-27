USE films_ratings;

-- get title and rating
SELECT title, rating FROM series JOIN reviews ON series.series_id = reviews.series_id;

-- get title and average rating
SELECT title, AVG(rating) AS avg_rating FROM series JOIN reviews ON series.series_id = reviews.series_id GROUP BY title ORDER BY avg_rating;

-- get first and last name of reviever and ratings
SELECT first_name, last_name, rating FROM reviewers JOIN reviews ON reviewers.reviewers_id = reviews.reviewer_id;

-- get unreviewed series
SELECT title AS unreviewed_series FROM series LEFT JOIN reviews ON series.series_id = reviews.series_id WHERE rating IS NULL;  

-- get average for every genre
SELECT genre, AVG(rating) AS avg_rating FROM series JOIN reviews ON series.series_id = reviews.series_id GROUP BY genre;


-- get reviewer, min i max rating, avg rating and status with CASE
SELECT 
    first_name,
    last_name,
    COUNT(rating) AS count,
    IFNULL(MIN(rating), 0) AS min,
    IFNULL(MAX(rating), 0) AS max,
    ROUND(IFNULL(AVG(rating), 0), 2) AS avge,
    CASE
        WHEN COUNT(rating) >= 10 THEN 'POWERUSER'
        WHEN COUNT(rating) > 0 THEN 'ACTIVE'
        ELSE 'INACTIVE'
    END AS statu
FROM
    reviewers
        JOIN
    reviews ON reviewers.reviewers_id = reviews.reviewers_id
GROUP BY first_name , last_name;

-- get reviewer, min i max rating, avg rating and status with IF
SELECT 
    first_name,
    last_name,
    COUNT(rating) AS count,
    IFNULL(MIN(rating), 0) AS min,
    IFNULL(MAX(rating), 0) AS max,
    ROUND(IFNULL(AVG(rating), 0), 2) AS avge,
    IF(COUNT(rating) > 0,
        'ACTIVE',
        'INACTIVE') AS statu
FROM
    reviewers
        JOIN
    reviews ON reviewers.reviewers_id = reviews.reviewers_id
GROUP BY first_name , last_name;