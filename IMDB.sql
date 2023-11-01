CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20),
       species VARCHAR(20), sex CHAR(1), birth DATE, death DATE);


CREATE TABLE netflix_titles (
    show_id VARCHAR(5) PRIMARY KEY,
    type VARCHAR(7),
    title VARCHAR(120),
    director VARCHAR(300),
    actors VARCHAR(800),
    country VARCHAR(150),
    date_added VARCHAR(30),
    release_year INT(4),
    rating VARCHAR(20),
    duration VARCHAR(20),
    listed_in VARCHAR(100),
    descriprion VARCHAR(500)
);


CREATE TABLE netflix_IMDB (
    id_JustWatch VARCHAR(8),
    title VARCHAR(120),
    type VARCHAR(7),
    descriprion VARCHAR(500),
    release_year INT(4),
    age_rating VARCHAR(20),
    duration VARCHAR(20),
    genre VARCHAR(100),
    country VARCHAR(150),
    seasons_number INT(2),
    imdb_id VARCHAR(9) PRIMARY KEY,
    imdb_score FLOAT(2,1),
    imdb_votes INT(7),
    tmdb_popularity FLOAT(12,3),
    tmdb_score FLOAT(2,1)
);

SELECT  DISTINCT * FROM netflix_IMDB;


UPDATE netflix_IMDB
    SET genre = TRIM(LEADING '[' FROM genre);


SELECT IMDB.netflix_titles.show_id, IMDB.title_basics.tconst, IMDB.netflix_titles.title 
    FROM IMDB.netflix_titles
    INNER JOIN IMDB.title_basics 
    ON (IMDB.netflix_titles.title = IMDB.title_basics.primaryTitle
    AND IMDB.netflix_titles.release_year = IMDB.title_basics.startYear
    );


SELECT DISTINCT substring_index(substring_index(country,',', 1), ',', -1) AS c FROM IMDB.netflix_IMDB
    UNION
    SELECT DISTINCT substring_index(substring_index(country,',', 2), ',', -1) FROM IMDB.netflix_IMDB
    UNION 
    SELECT DISTINCT substring_index(substring_index(country,',', 3), ',', -1) FROM IMDB.netflix_IMDB
    UNION 
    SELECT DISTINCT substring_index(substring_index(country,',', 4), ',', -1) FROM IMDB.netflix_IMDB
    UNION 
    SELECT DISTINCT substring_index(substring_index(country,',', 5), ',', -1) FROM IMDB.netflix_IMDB
    UNION 
    SELECT DISTINCT substring_index(substring_index(country,',', 6), ',', -1) FROM IMDB.netflix_IMDB
    UNION 
    SELECT DISTINCT substring_index(substring_index(country,',', 7), ',', -1) FROM IMDB.netflix_IMDB
    ORDER BY c;


SELECT DISTINCT COUNT(*) AS number_of_titles, 
    TRIM(BOTH "'" FROM substring_index(substring_index(country,',', 1), ',', -1)) AS c 
    FROM IMDB.netflix_IMDB
    GROUP BY c
    ORDER BY number_of_titles DESC;
--


-- number of MOVIES and SERIES containing a number
SELECT '1' AS Number, COUNT(*) AS number_of_numbers FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' one | 1 |#1 |1st'
    UNION SELECT '2', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' two | 2 |#2 |2nd'
    UNION SELECT '3', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' three | 3 |#3 |3rd'
    UNION SELECT '4', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' four | 4 |#4 |4th'
    UNION SELECT '5', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' five | 5 |#5 |5th'
    UNION SELECT '6', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' six | 6 |#6 |6th'
    UNION SELECT '7', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' seven | 7 |#7 |7th'
    UNION SELECT '8', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' eight | 8 |#8 |8th'
    UNION SELECT '9', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' nine | 9 |#9 |9th'
    UNION SELECT '10', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' ten | 10 |#10 |10th'
    UNION SELECT '11', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' eleven | 11 |#11 |11th'
    UNION SELECT '12', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' twelve | 12 |#12 |12th'
    UNION SELECT '13', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' thirteen | 13 |#13 |13th'
    UNION SELECT '14', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' fourteen | 14 |#14 |14th'
    UNION SELECT '15', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' fifteen | 15 |#15 |15th'
    UNION SELECT '16', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' sixteen | 16 |#16 |16th'
    UNION SELECT '17', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' seventeen | 17 |#17 |17th'
    UNION SELECT '18', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' eighteen | 18 |#18 |18th'
    UNION SELECT '19', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' nineteen | 19 |#19 |19th'
    UNION SELECT '20', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' twenty | 20 |#20 |20th'
    UNION SELECT '30', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' thirty | 30 |#30 |30th'
    UNION SELECT '40', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' forty | 40 |#40 |40th'
    UNION SELECT '50', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' fifty | 50 |#50 |50th'
    UNION SELECT '60', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' sixty | 60 |#60 |60th'
    UNION SELECT '70', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' seventy | 70 |#70 |70th'
    UNION SELECT '80', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' eighty | 80 |#80 |80th'
    UNION SELECT '90', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' ninety | 90 |#90 |90th'
    UNION SELECT '100', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' hundred | 100 |hundreds |100th'
    UNION SELECT '1000', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' thousand | thousands |#1000 |1000th'
    UNION SELECT '1000000', COUNT(*) FROM title_basics WHERE titleType REGEXP 'movie|series' AND primaryTitle REGEXP ' million | millions '
    ORDER BY number_of_numbers DESC
    LIMIT 10;
--


-- number of all items over the years
SELECT startYear, COUNT(*) AS number_of_items FROM title_basics
    WHERE startYear IS NOT NULL
    GROUP BY startYear
    ORDER BY startYear;

-- number of movies over the years
SELECT startYear, COUNT(*) AS number_of_movies FROM title_basics
    WHERE titleType LIKE '%movie' AND startYear IS NOT NULL
    GROUP BY startYear
    ORDER BY startYear;

-- number of series over the years
SELECT startYear, COUNT(*) AS number_of_series FROM title_basics
    WHERE titleType LIKE '%Series' AND startYear IS NOT NULL
    GROUP BY startYear
    ORDER BY startYear;

-- number of shorts over the years
SELECT startYear, COUNT(*) AS number_of_short FROM title_basics
    WHERE titleType LIKE '%short' AND startYear IS NOT NULL
    GROUP BY startYear
    ORDER BY startYear
    --ORDER BY number_of_short DESC;

SELECT DISTINCT titleType FROM title_basics;

-- All genres in the database
SELECT DISTINCT substring_index(substring_index(genres, ',', 1), ',', -1) AS genre FROM title_basics
    WHERE genres IS NOT NULL
    UNION
    SELECT DISTINCT substring_index(substring_index(genres, ',', 2), ',', -1) AS genre FROM title_basics
    WHERE genres IS NOT NULL
    UNION
    SELECT DISTINCT substring_index(substring_index(genres, ',', 3), ',', -1) AS genre FROM title_basics
    WHERE genres IS NOT NULL
    UNION
    SELECT DISTINCT substring_index(substring_index(genres, ',', 4), ',', -1) AS genre FROM title_basics
    WHERE genres IS NOT NULL
    ORDER BY genre;


-- Number of movies in each genre
SELECT 'Action', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Action%'
    UNION SELECT 'Adult', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%'
    UNION SELECT 'Adventure', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%'
    UNION SELECT 'Animation', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    UNION SELECT 'Biography', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    UNION SELECT 'Comedy', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    UNION SELECT 'Crime', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    UNION SELECT 'Documentary', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    UNION SELECT 'Drama', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    UNION SELECT 'Family', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    UNION SELECT 'Fantasy', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    UNION SELECT 'Film-Noir', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    UNION SELECT 'History', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    UNION SELECT 'Horror', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    UNION SELECT 'Music', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    UNION SELECT 'Musical', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    UNION SELECT 'Mystery', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    UNION SELECT 'Romance', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    UNION SELECT 'Sci-fi', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    UNION SELECT 'Sport', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    UNION SELECT 'Thriller', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    UNION SELECT 'War', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    UNION SELECT 'Western', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%western%';
--

SELECT 'Action', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Action%'
    UNION SELECT 'Adult', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%'
    UNION SELECT 'Adventure', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%'
    UNION SELECT 'Animation', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    UNION SELECT 'Biography', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    UNION SELECT 'Comedy', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    UNION SELECT 'Crime', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    UNION SELECT 'Documentary', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    UNION SELECT 'Drama', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    UNION SELECT 'Family', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    UNION SELECT 'Fantasy', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    UNION SELECT 'Film-Noir', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    UNION SELECT 'History', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    UNION SELECT 'Horror', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    UNION SELECT 'Music', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    UNION SELECT 'Musical', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    UNION SELECT 'Mystery', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    UNION SELECT 'Romance', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    UNION SELECT 'Sci-fi', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    UNION SELECT 'Sport', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    UNION SELECT 'Thriller', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    UNION SELECT 'War', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    UNION SELECT 'Western', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%western%';
--


SELECT COUNT(*) FROM title_basics
    WHERE titleType LIKE '%movie'AND startYear > 1900 AND startYear < 1910;


SELECT 'Action', COUNT(*) AS 'All movies',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Action%' 
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Action%' 
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Action%' 
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Action%' 
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Action%' 
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Action%' 
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Action%' 
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Action%' 
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Action%' 
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Action%' 
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Action%' 
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Action%' 
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Action%' 
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Action%'
    UNION SELECT 'Adult', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%' 
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%' 
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%' 
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%' 
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%' 
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%'  
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%'  
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%' 
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%'  
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%'  
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%'  
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%' 
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%' 
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%'
    UNION SELECT 'Adventure', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%' 
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%' 
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%' 
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%'
    UNION SELECT 'Animation', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%' 
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    UNION SELECT 'Biography', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    UNION SELECT 'Comedy', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    UNION SELECT 'Crime', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    UNION SELECT 'Documentary', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    UNION SELECT 'Drama', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    UNION SELECT 'Family', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    UNION SELECT 'Fantasy', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    UNION SELECT 'Film-Noir', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    UNION SELECT 'History', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    UNION SELECT 'Horror', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    UNION SELECT 'Music', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    UNION SELECT 'Musical', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    UNION SELECT 'Mystery', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    UNION SELECT 'Romance', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    UNION SELECT 'Sci-fi', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    UNION SELECT 'Sport', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    UNION SELECT 'Thriller', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    UNION SELECT 'War', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    UNION SELECT 'Western', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Western%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Western%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Western%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Western%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Western%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Western%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Western%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Western%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Western%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Western%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Western%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Western%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Western%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Western%';


CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20),
       species VARCHAR(20), sex CHAR(1), birth DATE, death DATE);


CREATE TABLE netflix_titles (
    show_id VARCHAR(5) PRIMARY KEY,
    type VARCHAR(7),
    title VARCHAR(120),
    director VARCHAR(300),
    actors VARCHAR(800),
    country VARCHAR(150),
    date_added VARCHAR(30),
    release_year INT(4),
    rating VARCHAR(20),
    duration VARCHAR(20),
    listed_in VARCHAR(100),
    descriprion VARCHAR(500)
);


CREATE TABLE netflix_IMDB (
    id_JustWatch VARCHAR(8),
    title VARCHAR(120),
    type VARCHAR(7),
    descriprion VARCHAR(500),
    release_year INT(4),
    age_rating VARCHAR(20),
    duration VARCHAR(20),
    genre VARCHAR(100),
    country VARCHAR(150),
    seasons_number INT(2),
    imdb_id VARCHAR(9) PRIMARY KEY,
    imdb_score FLOAT(2,1),
    imdb_votes INT(7),
    tmdb_popularity FLOAT(12,3),
    tmdb_score FLOAT(2,1)
);

SELECT  DISTINCT * FROM netflix_IMDB;


UPDATE netflix_IMDB
    SET genre = TRIM(LEADING '[' FROM genre);


SELECT IMDB.netflix_titles.show_id, IMDB.title_basics.tconst, IMDB.netflix_titles.title 
    FROM IMDB.netflix_titles 
    INNER JOIN IMDB.title_basics 
    ON (IMDB.netflix_titles.title = IMDB.title_basics.primaryTitle
    AND IMDB.netflix_titles.release_year = IMDB.title_basics.startYear
    );


SELECT DISTINCT substring_index(substring_index(country,',', 1), ',', -1) AS c FROM IMDB.netflix_IMDB
    UNION
    SELECT DISTINCT substring_index(substring_index(country,',', 2), ',', -1) FROM IMDB.netflix_IMDB
    UNION 
    SELECT DISTINCT substring_index(substring_index(country,',', 3), ',', -1) FROM IMDB.netflix_IMDB
    UNION 
    SELECT DISTINCT substring_index(substring_index(country,',', 4), ',', -1) FROM IMDB.netflix_IMDB
    UNION 
    SELECT DISTINCT substring_index(substring_index(country,',', 5), ',', -1) FROM IMDB.netflix_IMDB
    UNION 
    SELECT DISTINCT substring_index(substring_index(country,',', 6), ',', -1) FROM IMDB.netflix_IMDB
    UNION 
    SELECT DISTINCT substring_index(substring_index(country,',', 7), ',', -1) FROM IMDB.netflix_IMDB
    ORDER BY c;


SELECT DISTINCT COUNT(*) AS number_of_titles, 
    TRIM(BOTH "'" FROM substring_index(substring_index(country,',', 1), ',', -1)) AS c 
    FROM IMDB.netflix_IMDB
    GROUP BY c
    ORDER BY number_of_titles DESC;


-- number of all items containing a number
SELECT '1' AS Number, COUNT(*) AS number_of_numbers FROM title_basics WHERE primaryTitle LIKE '% one %' OR '% 1 %'
    UNION SELECT '2', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% two %' OR '% 2 %';
    UNION SELECT '3', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% three %' OR '% 3 %'
    UNION SELECT '4', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% four %' OR '% 4 %'
    UNION SELECT '5', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% five %' OR '% 5 %'
    UNION SELECT '6', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% six %' OR '% 6 %'
    UNION SELECT '7', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% seven %' OR '% 7 %'
    UNION SELECT '8', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% eight %' OR '% 8 %'
    UNION SELECT '9', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% nine %' OR '% 9 %'
    UNION SELECT '10', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% ten %' OR '% 10 %'
    UNION SELECT '11', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% eleven %' OR '% 11 %'
    UNION SELECT '12', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% twelve %' OR '% 12 %'
    UNION SELECT '13', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% thirteen %' OR '% 13 %'
    UNION SELECT '14', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% fourteen %' OR '% 14 %'
    UNION SELECT '15', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% fifteen %' OR '% 15 %'
    UNION SELECT '16', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% sixteen %' OR '% 16 %'
    UNION SELECT '17', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% seventeen %' OR '% 17 %'
    UNION SELECT '18', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% eighteen %' OR '% 18 %'
    UNION SELECT '19', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% nineteen %' OR '% 19 %'
    UNION SELECT '20', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% twenty %' OR '% 20 %'
    UNION SELECT '30', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% thirty %' OR '% 30 %'
    UNION SELECT '40', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% forty %' OR '% 40 %'
    UNION SELECT '50', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% seventy %' OR '% 50 %'
    UNION SELECT '60', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% sixty %' OR '% 60 %'
    UNION SELECT '70', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% seventy %' OR '% 70 %'
    UNION SELECT '80', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% eighty %' OR '% 80 %'
    UNION SELECT '90', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% ninety %' OR '% 90 %'
    UNION SELECT '100', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% hundred %' OR '% 100 %';
--


-- number of all items over the years
SELECT startYear, COUNT(*) AS number_of_items FROM title_basics
    WHERE startYear IS NOT NULL
    GROUP BY startYear
    ORDER BY startYear;

-- number of movies over the years
SELECT startYear, COUNT(*) AS number_of_movies FROM title_basics
    WHERE titleType LIKE '%movie' AND startYear IS NOT NULL
    GROUP BY startYear
    ORDER BY startYear;

-- number of series over the years
SELECT startYear, COUNT(*) AS number_of_series FROM title_basics
    WHERE titleType LIKE '%Series' AND startYear IS NOT NULL
    GROUP BY startYear
    ORDER BY startYear;

-- number of shorts over the years
SELECT startYear, COUNT(*) AS number_of_short FROM title_basics
    WHERE titleType LIKE '%short' AND startYear IS NOT NULL
    GROUP BY startYear
    ORDER BY startYear
    --ORDER BY number_of_short DESC;


-- All genres in the database
SELECT DISTINCT substring_index(substring_index(genres, ',', 1), ',', -1) AS genre FROM title_basics
    WHERE genres IS NOT NULL
    UNION
    SELECT DISTINCT substring_index(substring_index(genres, ',', 2), ',', -1) AS genre FROM title_basics
    WHERE genres IS NOT NULL
    UNION
    SELECT DISTINCT substring_index(substring_index(genres, ',', 3), ',', -1) AS genre FROM title_basics
    WHERE genres IS NOT NULL
    UNION
    SELECT DISTINCT substring_index(substring_index(genres, ',', 4), ',', -1) AS genre FROM title_basics
    WHERE genres IS NOT NULL
    ORDER BY genre;


-- Number of movies in each genre
SELECT 'Action', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Action%'
    UNION SELECT 'Adult', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%'
    UNION SELECT 'Adventure', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%'
    UNION SELECT 'Animation', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    UNION SELECT 'Biography', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    UNION SELECT 'Comedy', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    UNION SELECT 'Crime', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    UNION SELECT 'Documentary', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    UNION SELECT 'Drama', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    UNION SELECT 'Family', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    UNION SELECT 'Fantasy', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    UNION SELECT 'Film-Noir', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    UNION SELECT 'History', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    UNION SELECT 'Horror', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    UNION SELECT 'Music', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    UNION SELECT 'Musical', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    UNION SELECT 'Mystery', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    UNION SELECT 'Romance', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    UNION SELECT 'Sci-fi', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    UNION SELECT 'Sport', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    UNION SELECT 'Thriller', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    UNION SELECT 'War', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    UNION SELECT 'Western', COUNT(*) AS number_of_movies FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres LIKE '%western%';
--

-- Number of series in each genre
SELECT 'Action', COUNT(*) AS number_of_series FROM title_basics 
    WHERE titleType LIKE '%Series' AND genres LIKE '%Action%'
    UNION SELECT 'Adult', COUNT(*) AS number_of_series FROM title_basics 
    WHERE titleType LIKE '%Series' AND genres LIKE '%Adult%'
    UNION SELECT 'Adventure', COUNT(*) AS number_of_series FROM title_basics 
    WHERE titleType LIKE '%Series' AND genres LIKE '%Adventure%'
    UNION SELECT 'Animation', COUNT(*) AS number_of_series FROM title_basics 
    WHERE titleType LIKE '%Series' AND genres LIKE '%Animation%'
    UNION SELECT 'Biography', COUNT(*) AS number_of_series FROM title_basics 
    WHERE titleType LIKE '%Series' AND genres LIKE '%Biography%'
    UNION SELECT 'Comedy', COUNT(*) AS number_of_series FROM title_basics 
    WHERE titleType LIKE '%Series' AND genres LIKE '%Comedy%'
    UNION SELECT 'Crime', COUNT(*) AS number_of_series FROM title_basics 
    WHERE titleType LIKE '%Series' AND genres LIKE '%Crime%'
    UNION SELECT 'Documentary', COUNT(*) AS number_of_series FROM title_basics 
    WHERE titleType LIKE '%Series' AND genres LIKE '%Documentary%'
    UNION SELECT 'Drama', COUNT(*) AS number_of_series FROM title_basics 
    WHERE titleType LIKE '%Series' AND genres LIKE '%Drama%'
    UNION SELECT 'Family', COUNT(*) AS number_of_series FROM title_basics 
    WHERE titleType LIKE '%Series' AND genres LIKE '%Family%'
    UNION SELECT 'Fantasy', COUNT(*) AS number_of_series FROM title_basics 
    WHERE titleType LIKE '%Series' AND genres LIKE '%Fantasy%'
    UNION SELECT 'Film-Noir', COUNT(*) AS number_of_series FROM title_basics 
    WHERE titleType LIKE '%Series' AND genres LIKE '%Film-Noir%'
    UNION SELECT 'History', COUNT(*) AS number_of_series FROM title_basics 
    WHERE titleType LIKE '%Series' AND genres LIKE '%History%'
    UNION SELECT 'Horror', COUNT(*) AS number_of_series FROM title_basics 
    WHERE titleType LIKE '%Series' AND genres LIKE '%Horror%'
    UNION SELECT 'Music', COUNT(*) AS number_of_series FROM title_basics 
    WHERE titleType LIKE '%Series' AND genres LIKE '%Music%'
    UNION SELECT 'Musical', COUNT(*) AS number_of_series FROM title_basics 
    WHERE titleType LIKE '%Series' AND genres LIKE '%Musical%'
    UNION SELECT 'Mystery', COUNT(*) AS number_of_series FROM title_basics 
    WHERE titleType LIKE '%Series' AND genres LIKE '%Mystery%'
    UNION SELECT 'Romance', COUNT(*) AS number_of_series FROM title_basics 
    WHERE titleType LIKE '%Series' AND genres LIKE '%Romance%'
    UNION SELECT 'Sci-fi', COUNT(*) AS number_of_series FROM title_basics 
    WHERE titleType LIKE '%Series' AND genres LIKE '%Sci-fi%'
    UNION SELECT 'Sport', COUNT(*) AS number_of_series FROM title_basics 
    WHERE titleType LIKE '%Series' AND genres LIKE '%Sport%'
    UNION SELECT 'Thriller', COUNT(*) AS number_of_series FROM title_basics 
    WHERE titleType LIKE '%Series' AND genres LIKE '%Thriller%'
    UNION SELECT 'War', COUNT(*) AS number_of_series FROM title_basics 
    WHERE titleType LIKE '%Series' AND genres LIKE '%War%'
    UNION SELECT 'Western', COUNT(*) AS number_of_series FROM title_basics 
    WHERE titleType LIKE '%Series' AND genres LIKE '%western%';
--

-- Movie genres over decades
SELECT 'Action', COUNT(*) AS 'All movies',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Action%' 
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Action%' 
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Action%' 
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Action%' 
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Action%' 
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Action%' 
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Action%' 
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Action%' 
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Action%' 
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Action%' 
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Action%' 
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Action%' 
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Action%' 
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Action%'
    UNION SELECT 'Adult', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%' 
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%' 
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%' 
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%' 
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%' 
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%'  
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%'  
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%' 
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%'  
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%'  
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%'  
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%' 
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%' 
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Adult%'
    UNION SELECT 'Adventure', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%' 
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%' 
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%' 
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Adventure%'
    UNION SELECT 'Animation', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%' 
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Animation%'
    UNION SELECT 'Biography', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Biography%'
    UNION SELECT 'Comedy', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Comedy%'
    UNION SELECT 'Crime', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Crime%'
    UNION SELECT 'Documentary', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Documentary%'
    UNION SELECT 'Drama', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Drama%'
    UNION SELECT 'Family', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Family%'
    UNION SELECT 'Fantasy', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Fantasy%'
    UNION SELECT 'Film-Noir', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Film-Noir%'
    UNION SELECT 'History', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%History%'
    UNION SELECT 'Horror', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Horror%'
    UNION SELECT 'Music', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Music%'
    UNION SELECT 'Musical', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    UNION SELECT 'Mystery', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Mystery%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Musical%'
    UNION SELECT 'Romance', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Romance%'
    UNION SELECT 'Sci-fi', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Sci-fi%'
    UNION SELECT 'Sport', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Sporti%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Sport%'
    UNION SELECT 'Thriller', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Thriller%'
    UNION SELECT 'War', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%War%'
    UNION SELECT 'Western', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Western%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Western%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Western%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Western%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Western%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Western%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Western%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Western%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Western%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Western%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Western%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Western%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%movie' AND genres LIKE '%Western%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%movie' AND genres LIKE '%Western%';
--

-- Series genres over years
SELECT 'Action', COUNT(*) AS 'All series',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Action%' 
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Action%' 
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Action%' 
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Action%' 
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Action%' 
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Action%' 
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Action%' 
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Action%' 
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Action%' 
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Action%' 
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Action%' 
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Action%' 
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Action%' 
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%Series' AND genres LIKE '%Action%'
    UNION SELECT 'Adult', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Adult%' 
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Adult%' 
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Adult%' 
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Adult%' 
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Adult%' 
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Adult%'  
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Adult%'  
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Adult%' 
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Adult%'  
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Adult%'  
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Adult%'  
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Adult%' 
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Adult%' 
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%Series' AND genres LIKE '%Adult%'
    UNION SELECT 'Adventure', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Adventure%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Adventure%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Adventure%' 
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Adventure%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Adventure%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Adventure%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Adventure%' 
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Adventure%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Adventure%' 
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Adventure%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Adventure%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Adventure%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Adventure%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%Series' AND genres LIKE '%Adventure%'
    UNION SELECT 'Animation', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Animation%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Animation%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Animation%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Animation%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Animation%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Animation%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Animation%' 
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Animation%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Animation%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Animation%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Animation%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Animation%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Animation%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%Series' AND genres LIKE '%Animation%'
    UNION SELECT 'Biography', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Biography%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Biography%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Biography%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Biography%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Biography%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Biography%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Biography%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Biography%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Biography%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Biography%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Biography%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Biography%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Biography%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%Series' AND genres LIKE '%Biography%'
    UNION SELECT 'Comedy', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Comedy%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Comedy%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Comedy%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Comedy%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Comedy%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Comedy%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Comedy%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Comedy%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Comedy%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Comedy%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Comedy%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Comedy%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Comedy%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%Series' AND genres LIKE '%Comedy%'
    UNION SELECT 'Crime', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Crime%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Crime%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Crime%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Crime%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Crime%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Crime%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Crime%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Crime%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Crime%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Crime%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Crime%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Crime%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Crime%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%Series' AND genres LIKE '%Crime%'
    UNION SELECT 'Documentary', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Documentary%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Documentary%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Documentary%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Documentary%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Documentary%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Documentary%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Documentary%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Documentary%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Documentary%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Documentary%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Documentary%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Documentary%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Documentary%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%Series' AND genres LIKE '%Documentary%'
    UNION SELECT 'Drama', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Drama%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Drama%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Drama%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Drama%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Drama%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Drama%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Drama%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Drama%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Drama%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Drama%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Drama%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Drama%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Drama%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%Series' AND genres LIKE '%Drama%'
    UNION SELECT 'Family', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Family%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Family%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Family%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Family%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Family%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Family%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Family%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Family%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Family%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Family%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Family%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Family%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Family%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%Series' AND genres LIKE '%Family%'
    UNION SELECT 'Fantasy', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Fantasy%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Fantasy%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Fantasy%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Fantasy%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Fantasy%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Fantasy%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Fantasy%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Fantasy%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Fantasy%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Fantasy%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Fantasy%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Fantasy%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Fantasy%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%Series' AND genres LIKE '%Fantasy%'
    UNION SELECT 'Film-Noir', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Film-Noir%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Film-Noir%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Film-Noir%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Film-Noir%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Film-Noir%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Film-Noir%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Film-Noir%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Film-Noir%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Film-Noir%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Film-Noir%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Film-Noir%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Film-Noir%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Film-Noir%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%Series' AND genres LIKE '%Film-Noir%'
    UNION SELECT 'History', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%History%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%History%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%History%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%History%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%History%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%History%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%History%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%History%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%History%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%History%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%History%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%History%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%History%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%Series' AND genres LIKE '%History%'
    UNION SELECT 'Horror', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Horror%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Horror%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Horror%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Horror%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Horror%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Horror%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Horror%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Horror%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Horror%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Horror%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Horror%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Horror%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Horror%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%Series' AND genres LIKE '%Horror%'
    UNION SELECT 'Music', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Music%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Music%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Music%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Music%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Music%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Music%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Music%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Music%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Music%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Music%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Music%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Music%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Music%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%Series' AND genres LIKE '%Music%'
    UNION SELECT 'Musical', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Musical%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Musical%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Musical%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Musical%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Musical%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Musical%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Musical%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Musical%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Musical%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Musical%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Musical%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Musical%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Musical%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%Series' AND genres LIKE '%Musical%'
    UNION SELECT 'Mystery', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Mystery%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Mystery%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Mystery%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Mystery%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Mystery%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Mystery%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Mystery%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Mystery%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Mystery%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Mystery%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Mystery%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Mystery%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Mystery%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%Series' AND genres LIKE '%Musical%'
    UNION SELECT 'Romance', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Romance%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Romance%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Romance%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Romance%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Romance%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Romance%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Romance%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Romance%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Romance%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Romance%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Romance%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Romance%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Romance%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%Series' AND genres LIKE '%Romance%'
    UNION SELECT 'Sci-fi', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Sci-fi%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Sci-fi%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Sci-fi%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Sci-fi%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Sci-fi%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Sci-fi%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Sci-fi%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Sci-fi%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Sci-fi%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Sci-fi%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Sci-fi%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Sci-fi%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Sci-fi%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%Series' AND genres LIKE '%Sci-fi%'
    UNION SELECT 'Sport', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Sport%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Sport%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Sport%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Sport%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Sport%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Sport%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Sport%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Sport%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Sport%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Sport%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Sport%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Sport%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Sporti%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%Series' AND genres LIKE '%Sport%'
    UNION SELECT 'Thriller', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Thriller%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Thriller%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Thriller%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Thriller%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Thriller%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Thriller%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Thriller%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Thriller%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Thriller%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Thriller%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Thriller%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Thriller%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Thriller%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%Series' AND genres LIKE '%Thriller%'
    UNION SELECT 'War', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%War%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%War%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%War%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series'AND genres LIKE '%War%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%War%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%War%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%War%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%War%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%War%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%War%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%War%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%War%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series'AND genres LIKE '%War%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%Series' AND genres LIKE '%War%'
    UNION SELECT 'Western', COUNT(*) AS 'All',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Western%'
    AND startYear>=1900 AND startYear<1910) AS '1900-1909',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Western%'
    AND startYear>=1910 AND startYear<1919) AS '1910-1919',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Western%'
    AND startYear>=1920 AND startYear<1929) AS '1920-1929',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Western%'
    AND startYear>=1930 AND startYear<1939) AS '1930-1939',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Western%'
    AND startYear>=1940 AND startYear<1949) AS '1940-1949',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Western%'
    AND startYear>=1950 AND startYear<1959) AS '1950-1959',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Western%'
    AND startYear>=1960 AND startYear<1969) AS '1960-1969',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Western%'
    AND startYear>=1970 AND startYear<1979) AS '1970-1979',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Western%'
    AND startYear>=1980 AND startYear<1989) AS '1980-1989',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Western%'
    AND startYear>=1990 AND startYear<1999) AS '1990-1999',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Western%'
    AND startYear>=2000 AND startYear<2009) AS '2000-2009',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Western%'
    AND startYear>=2010 AND startYear<2019) AS '2010-2019',
    (SELECT COUNT(*) FROM title_basics WHERE titleType LIKE '%Series' AND genres LIKE '%Western%'
    AND startYear>=2020) AS '2020-present' FROM title_basics
    WHERE titleType LIKE '%Series' AND genres LIKE '%Western%';
--



-- Days of the week in the title (all items)
SELECT 'Monday', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '%Monday%'
    UNION SELECT 'Tuesday', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '%Tuesday%'
    UNION SELECT 'Wendesday', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '%Wednesday%'
    UNION SELECT 'Thursday', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '%Thursday%'
    UNION SELECT 'Friday', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '%Friday%'
    UNION SELECT 'Saturday', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '%Saturday%'
    UNION SELECT 'Sunday', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '%Sunday%';
--

-- Rainbow and more colors
SELECT '1', 'White' AS 'Color', COUNT(*) AS number_of_titles FROM title_basics WHERE primaryTitle LIKE '% white %'
    UNION SELECT '2', 'Red' AS 'Color', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% red %'
    UNION SELECT '3', 'Orange', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% orange %'
    UNION SELECT '4', 'Yellow', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% yellow %'
    UNION SELECT '5', 'Green', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% green %'
    UNION SELECT '6', 'Blue', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% blue %'
    UNION SELECT '7', 'Violet', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% violet %' OR primaryTitle LIKE '% purple %'
    UNION SELECT '8', 'Pink', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% pink %'
    UNION SELECT '9', 'Black' AS 'Color', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% black %'
    UNION SELECT '10', 'Grey', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '% grey %' OR primaryTitle LIKE '% gray %';
--

SELECT * FROM title_basics WHERE primaryTitle LIKE '% lavender %';



-- Black/white/gray/grey
SELECT 'Black' AS 'Color', COUNT(*) AS number_of_titles FROM title_basics 
    WHERE primaryTitle LIKE '% black %'
    UNION SELECT 'White', COUNT(*) FROM title_basics 
    WHERE primaryTitle LIKE '% white %'
    UNION SELECT 'Grey', COUNT(*) FROM title_basics 
    WHERE primaryTitle LIKE '% grey %' OR primaryTitle LIKE '% gray %';
--

-- Months
SELECT 'January' AS 'Month', COUNT(*) AS number_of_titles FROM title_basics WHERE primaryTitle LIKE '%january%'
    UNION SELECT 'February', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '%february%'
    UNION SELECT 'March', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '%march%'
    UNION SELECT 'April', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '%april%'
    UNION SELECT 'May', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '%May%'
    UNION SELECT 'June', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '%june%'
    UNION SELECT 'July', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '%july%'
    UNION SELECT 'August', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '%august%'
    UNION SELECT 'September', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '%september%'
    UNION SELECT 'October', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '%october%'
    UNION SELECT 'November', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '%november%'
    UNION SELECT 'December', COUNT(*) FROM title_basics WHERE primaryTitle LIKE '%december%';
--


-- average rating and number of votes for each MOVIE genre
SELECT 'Action', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%movie' AND title_basics.genres REGEXP 'Action'
    UNION SELECT 'Adult', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%movie' AND title_basics.genres REGEXP 'Adult'
    UNION SELECT 'Adventure', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%movie' AND title_basics.genres REGEXP 'Adventure'
    UNION SELECT 'Animation', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%movie' AND title_basics.genres REGEXP 'Animation'
    UNION SELECT 'Biography', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%movie' AND title_basics.genres REGEXP 'Biography'
    UNION SELECT 'Comedy', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%movie' AND title_basics.genres REGEXP 'Comedy'
    UNION SELECT 'Crime', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%movie' AND title_basics.genres REGEXP 'Crime'
    UNION SELECT 'Documentary', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%movie' AND title_basics.genres REGEXP 'Documentary'
    UNION SELECT 'Drama', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%movie' AND title_basics.genres REGEXP 'Drama'
    UNION SELECT 'Family', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%movie' AND title_basics.genres REGEXP 'Family'
    UNION SELECT 'Fantasy', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%movie' AND title_basics.genres REGEXP 'Fantasy'
    UNION SELECT 'Film-Noir', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%movie' AND title_basics.genres REGEXP 'Film-Noir'
    UNION SELECT 'History', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%movie' AND title_basics.genres REGEXP 'History'
    UNION SELECT 'Horror', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%movie' AND title_basics.genres REGEXP 'Horror'
    UNION SELECT 'Music', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%movie' AND title_basics.genres REGEXP 'Music'
    UNION SELECT 'Musical', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%movie' AND title_basics.genres REGEXP 'Musical'
    UNION SELECT 'Mystery', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%movie' AND title_basics.genres REGEXP 'Mystery'
    UNION SELECT 'Romance', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%movie' AND title_basics.genres REGEXP 'Romance'
    UNION SELECT 'Sci-fi', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%movie' AND title_basics.genres REGEXP 'Sci-Fi'
    UNION SELECT 'Sport', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%movie' AND title_basics.genres REGEXP 'Sport'
    UNION SELECT 'Thriller', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%movie' AND title_basics.genres REGEXP 'Thriller'
    UNION SELECT 'War', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%movie' AND title_basics.genres REGEXP 'War'
    UNION SELECT 'Western', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%movie' AND title_basics.genres REGEXP 'Western';
--

-- average rating and number of votes for each SERIES genre
SELECT 'Action', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%Series' AND title_basics.genres REGEXP 'Action'
    UNION SELECT 'Adult', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%Series' AND title_basics.genres REGEXP 'Adult'
    UNION SELECT 'Adventure', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%Series' AND title_basics.genres REGEXP 'Adventure'
    UNION SELECT 'Animation', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%Series' AND title_basics.genres REGEXP 'Animation'
    UNION SELECT 'Biography', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%Series' AND title_basics.genres REGEXP 'Biography'
    UNION SELECT 'Comedy', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%Series' AND title_basics.genres REGEXP 'Comedy'
    UNION SELECT 'Crime', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%Series' AND title_basics.genres REGEXP 'Crime'
    UNION SELECT 'Documentary', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%Series' AND title_basics.genres REGEXP 'Documentary'
    UNION SELECT 'Drama', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%Series' AND title_basics.genres REGEXP 'Drama'
    UNION SELECT 'Family', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%Series' AND title_basics.genres REGEXP 'Family'
    UNION SELECT 'Fantasy', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%Series' AND title_basics.genres REGEXP 'Fantasy'
    UNION SELECT 'Film-Noir', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%Series' AND title_basics.genres REGEXP 'Film-Noir'
    UNION SELECT 'History', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%Series' AND title_basics.genres REGEXP 'History'
    UNION SELECT 'Horror', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%Series' AND title_basics.genres REGEXP 'Horror'
    UNION SELECT 'Music', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%Series' AND title_basics.genres REGEXP 'Music'
    UNION SELECT 'Musical', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%Series' AND title_basics.genres REGEXP 'Musical'
    UNION SELECT 'Mystery', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%Series' AND title_basics.genres REGEXP 'Mystery'
    UNION SELECT 'Romance', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%Series' AND title_basics.genres REGEXP 'Romance'
    UNION SELECT 'Sci-fi', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%Series' AND title_basics.genres REGEXP 'Sci-Fi'
    UNION SELECT 'Sport', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%Series' AND title_basics.genres REGEXP 'Sport'
    UNION SELECT 'Thriller', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%Series' AND title_basics.genres REGEXP 'Thriller'
    UNION SELECT 'War', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%Series' AND title_basics.genres REGEXP 'War'
    UNION SELECT 'Western', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType LIKE '%Series' AND title_basics.genres REGEXP 'Western';
--

-- Distribution of title_types
SELECT titleType, COUNT(*) AS num_titles FROM title_basics
    GROUP BY titleType
    ORDER BY num_titles DESC;
--


-- same title moveis, most friesquent movie and series titles
SELECT primaryTitle, COUNT(*) AS num_titles FROM title_basics
    WHERE titleType REGEXP 'movie|series'
    GROUP BY primaryTitle
    ORDER BY COUNT(*) DESC
    LIMIT 10;
--

-- average title lengh
SELECT startYear, AVG(LENGTH(primaryTitle)) AS title_length FROM title_basics
    WHERE titleType REGEXP 'movie|series' AND startYear < 2024
    GROUP BY startYear
    ORDER BY startYear;
--

-- average number of words 
SELECT startYear, LENGTH(primaryTitle) - LENGTH(REPLACE(primaryTitle, ' ',''))+1) AS num_words FROM title_basics
    WHERE titleType REGEXP 'movie|series' AND startYear < 2024
    GROUP BY startYear
    ORDER BY startYear;
--




-- Sci-fi vs. fantasy movies and series
SELECT 'sci-fi movies (fantasy excluded)', COUNT(*) AS 'number of items' FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres REGEXP 'sci-fi' AND genres NOT REGEXP 'fantasy'
    UNION
    SELECT 'fantasy movies (sci-fi excluded)', COUNT(*) FROM title_basics
    WHERE titleType LIKE '%movie' AND genres REGEXP 'fantasy' AND genres NOT REGEXP 'sci-fi'
    UNION
    SELECT 'sci-fi series (fantasy excluded)', COUNT(*) FROM title_basics 
    WHERE titleType LIKE '%Series' AND genres REGEXP 'sci-fi' AND genres NOT REGEXP 'fantasy'
    UNION
    SELECT 'fantasy series (sci-fi excluded)', COUNT(*) FROM title_basics
    WHERE titleType LIKE '%Series' AND genres REGEXP 'fantasy' AND genres NOT REGEXP 'sci-fi';


-- Number of sci-fi movies over the years (up to 2023)
SELECT startYear, COUNT(*) AS 'number of sci-fi movies' FROM title_basics
    WHERE titleType LIKE '%movie' 
    AND genres REGEXP 'sci-fi' 
    AND genres NOT REGEXP 'fantasy' 
    AND startYear IS NOT NULL
    AND startYear < 2023
    GROUP BY startYear
    ORDER BY startYear;

-- Number of fantasy movies over the years (up to 2023)
SELECT startYear AS 'Year', COUNT(*) AS 'number of fantasy movies'  FROM title_basics
    WHERE titleType LIKE '%movie'
    AND genres REGEXP 'fantasy' 
    AND genres NOT REGEXP 'sci-fi' 
    AND startYear IS NOT NULL
    AND startYear < 2023
    GROUP BY startYear
    ORDER BY startYear;

-- Sci-fi vs. fantasy movies and series
SELECT 'sci-fi movies (fantasy excluded)', COUNT(*) AS 'number of items' FROM title_basics 
    WHERE titleType LIKE '%movie' AND genres REGEXP 'sci-fi' AND genres NOT REGEXP 'fantasy'
    UNION
    SELECT 'fantasy movies (sci-fi excluded)', COUNT(*) FROM title_basics
    WHERE titleType LIKE '%movie' AND genres REGEXP 'fantasy' AND genres NOT REGEXP 'sci-fi'
    UNION
    SELECT 'sci-fi series (fantasy excluded)', COUNT(*) FROM title_basics 
    WHERE titleType LIKE '%Series' AND genres REGEXP 'sci-fi' AND genres NOT REGEXP 'fantasy'
    UNION
    SELECT 'fantasy series (sci-fi excluded)', COUNT(*) FROM title_basics
    WHERE titleType LIKE '%Series' AND genres REGEXP 'fantasy' AND genres NOT REGEXP 'sci-fi';


-- Number of sci-fi movies over the years (up to 2023)
SELECT startYear, COUNT(*) AS 'number of sci-fi movies' FROM title_basics
    WHERE titleType LIKE '%movie' 
    AND genres REGEXP 'sci-fi' 
    AND genres NOT REGEXP 'fantasy' 
    AND startYear IS NOT NULL
    AND startYear < 2023
    GROUP BY startYear
    ORDER BY startYear;

-- Number of fantasy movies over the years (up to 2023)
SELECT startYear AS 'Year', COUNT(*) AS 'number of fantasy movies'  FROM title_basics
    WHERE titleType LIKE '%movie'
    AND genres REGEXP 'fantasy' 
    AND genres NOT REGEXP 'sci-fi' 
    AND startYear IS NOT NULL
    AND startYear < 2023
    GROUP BY startYear
    ORDER BY startYear;



-- average rating and number of votes for each SERIES genre
SELECT 'Fantasy', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType REGEXP 'movie|series' AND title_basics.genres REGEXP 'Fantasy'
    UNION SELECT 'Sci-fi', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType REGEXP '%movie|series' AND title_basics.genres REGEXP 'Sci-Fi';
--


-- average rating and number of votes for fantasy and sci-fi over the years
SELECT startYear, 'Fantasy', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType REGEXP 'movie|series' AND title_basics.genres REGEXP 'Fantasy'
    GROUP BY 
    UNION SELECT startYear, 'Sci-fi', AVG(averageRating) AS avg_rating, SUM(num_votes) AS num_votes FROM title_basics
    JOIN title_ratings ON title_basics.tconst=title_ratings.tconst 
    WHERE titleType REGEXP '%movie|series' AND title_basics.genres REGEXP 'Sci-Fi';
--


SELECT title_episode.tconst, title_episode.seasonNumber, title_episode.episodeNumber, title_ratings.averageRating, title_ratings.num_votes FROM title_episode
    JOIN title_ratings ON title_episode.tconst = title_ratings.tconst
    WHERE title_episode.parentTconst = "tt0238784"
    ORDER BY seasonNumber, episodeNumber;
--



SELECT * FROM title_episode
    WHERE parentTconst = 'tt0238784';





-- HORROR MOVIES

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

