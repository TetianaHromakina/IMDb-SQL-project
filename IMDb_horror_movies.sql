-- Avg rating for all the movies
SELECT COUNT(*), AVG(averageRating) FROM title_basics
    JOIN title_ratings ON title_basics.tconst = title_ratings.tconst
    WHERE titleType LIKE '%movie' AND genres LIKE '%horror%' AND startYear > '1921' AND startYear < '2023';
--

-- Average rating and No. of horror movies
SELECT COUNT(*), AVG(averageRating) FROM title_basics
    INNER JOIN title_ratings ON title_basics.tconst = title_ratings.tconst
    WHERE titleType LIKE '%movie' AND genres LIKE '%horror%'
;

SELECT COUNT(*) FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%horror%'
;

-- Average rating and No. of horror movies
SELECT COUNT(*), AVG(averageRating) FROM title_basics
    JOIN title_ratings ON title_basics.tconst = title_ratings.tconst
    WHERE titleType LIKE '%movie' AND genres LIKE '%horror%'
;

-- Top 10 horror sub-genres
SELECT genres, COUNT(genres) AS num_movies, COUNT(genres)/17599*100 AS frac_movies, AVG(averageRating) FROM title_basics
    JOIN title_ratings ON title_basics.tconst = title_ratings.tconst
    WHERE titleType LIKE '%movie' AND genres LIKE '%horror%'
    GROUP BY genres
    ORDER BY num_movies DESC
;

SELECT count(DISTINCT genres) FROM title_basics
    JOIN title_ratings ON title_basics.tconst = title_ratings.tconst
    WHERE titleType LIKE '%movie' AND genres LIKE '%horror%'
    LIMIT 100
;

-- rating distribution
SELECT title_basics.tconst, averageRating FROM title_basics
    JOIN title_ratings ON title_basics.tconst = title_ratings.tconst
    WHERE titleType LIKE '%movie' AND genres LIKE '%horror%';


-- Top 20 horror movies (with min 10000 votes)
SELECT title_basics.primaryTitle, averageRating, num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst = title_ratings.tconst
    WHERE titleType LIKE '%movie' AND genres LIKE '%horror%' AND num_votes > '10000'
    ORDER BY averageRating DESC
    LIMIT 20
;

-- Top 20 most popular horror movies and their rating
SELECT title_basics.primaryTitle AS just_horror, averageRating, num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst = title_ratings.tconst
    WHERE titleType LIKE '%movie' AND genres LIKE 'horror'
    ORDER BY num_votes DESC
    LIMIT 20
;

-- Top 20 most popular NOT JUST horror movies and their rating
SELECT title_basics.primaryTitle AS not_just_horror, averageRating, num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst = title_ratings.tconst
    WHERE titleType LIKE '%movie' AND genres LIKE '%horror%'
    ORDER BY num_votes DESC
    LIMIT 20
;

-- Rating VS. popularity
SELECT  title_basics.tconst, averageRating, num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst = title_ratings.tconst
    WHERE titleType LIKE '%movie' AND genres LIKE '%horror%'
;

-- 10 most popular horror movies directors
SELECT primaryName, COUNT(directors) AS number_movies, AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst = title_ratings.tconst
    JOIN title_crew ON title_basics.tconst = title_crew.tconst
    JOIN name_basics ON title_crew.directors = name_basics.nconst
    WHERE titleType LIKE '%movie' AND genres LIKE '%horror%'
    GROUP BY directors
    ORDER BY SUM(num_votes) DESC
    LIMIT 10
;

-- 10 most productive horror movies directors
SELECT primaryName, COUNT(directors) AS number_movies, AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst = title_ratings.tconst
    JOIN title_crew ON title_basics.tconst = title_crew.tconst
    JOIN name_basics ON title_crew.directors = name_basics.nconst
    WHERE titleType LIKE '%movie' AND genres LIKE '%horror%'
    GROUP BY directors
    ORDER BY number_movies DESC
    LIMIT 10
;

-- moves and the total number of movies and average rating
SELECT startYear, COUNT(*) AS num_horror, AVG(averageRating) AS avg_rating FROM title_basics
    JOIN title_ratings ON title_basics.tconst = title_ratings.tconst
    WHERE titleType LIKE '%movie' AND genres LIKE 'horror'
    GROUP BY startYear
    HAVING startYear > '1921' AND startYear < '2023'
    ORDER BY startYear
;

SELECT startYear, COUNT(*) AS num_movies, AVG(averageRating) AS avg_rating FROM title_basics
    JOIN title_ratings ON title_basics.tconst = title_ratings.tconst
    WHERE titleType LIKE '%movie'
    GROUP BY startYear 
    HAVING startYear > '1921' AND startYear < '2023'
    ORDER BY startYear
;