-- Creating and populatig the tables

CREATE TABLE name_basics (
    nconst VARCHAR(9) PRIMARY KEY,
    primaryName VARCHAR(40),
    birthYear INT(4),
    deathYear INT(4),
    primaryProfession VARCHAR(50),
    knownForTitles VARCHAR(100)
    );

CREATE TABLE title_basics (
    tconst VARCHAR(9) PRIMARY KEY,
    titleType VARCHAR(50),
    primaryTitle VARCHAR(50),
    originalTitle VARCHAR(50),
    priisAdult TINYINT(1),
    startYear INT(4),
    endYear INT(4),
    runtimeMinutes INT(6),
    genres VARCHAR(50)
    );

CREATE TABLE title_crew (
    tconst VARCHAR(9) PRIMARY KEY,
    directors VARCHAR(100),
    writers VARCHAR(100)
    );

CREATE TABLE title_episode (
    tconst VARCHAR(9) PRIMARY KEY,
    parentTconst VARCHAR(9),
    seasonNumber INT(2),
    episodeNumber INT(4),
    FOREIGN KEY (parentTconst)
        REFERENCES title_basics(tconst)
        ON DELETE CASCADE
    );

CREATE TABLE title_principals (
    tconst VARCHAR(9) PRIMARY KEY,
    ordering INT(2),
    nconst VARCHAR(9),
    category VARCHAR(50),
    job VARCHAR(50),
    characters VARCHAR(50),
    FOREIGN KEY (nconst)
        REFERENCES name_basics(nconst)
        ON DELETE CASCADE
    );

    CREATE TABLE title_ratings (
    tconst VARCHAR(9) PRIMARY KEY,
    averageRating FLOAT(2,1),
    num_votes INT(6)
    );
    

LOAD DATA LOCAL INFILE 'D:\\IMDB\\name.basics.tsv' INTO TABLE IMDB.name_basics IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'D:\\IMDB\\title.principals.tsv' INTO TABLE IMDB.title_principals IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'D:\\IMDB\\title.basics.tsv' INTO TABLE IMDB.title_basics IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'D:\\IMDB\\title.crew.tsv' INTO TABLE IMDB.title_crew IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'D:\\IMDB\\title.ratings.tsv' INTO TABLE IMDB.title_ratings IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'D:\\IMDB\\title.episode.tsv' INTO TABLE IMDB.title_episode IGNORE 1 LINES;
--------------------------------------------------------------------------------------------

-- Number of all items over the years
SELECT startYear, COUNT(*) AS number_total FROM title_basics
    WHERE startYear IS NOT NULL
    GROUP BY startYear
    ORDER BY startYear;

-- Number of movies over the years
SELECT startYear, COUNT(*) AS number_movies FROM title_basics
    WHERE titleType LIKE '%movie' AND startYear IS NOT NULL
    GROUP BY startYear
    ORDER BY startYear;

-- Number of TV shows over the years
SELECT startYear, COUNT(*) AS number_series FROM title_basics
    WHERE titleType LIKE '%Series' AND startYear IS NOT NULL
    GROUP BY startYear
    ORDER BY startYear;

-- Distribution of title_types
SELECT titleType, COUNT(*) AS num_titles FROM title_basics
    GROUP BY titleType
    ORDER BY num_titles DESC;
--

-- Calculating percentages
SELECT COUNT(tconst) AS number_of_items, 
    SUM(ISNULL(genres)) AS genre_not_defined,
    SUM(ISNULL(genres))/COUNT(tconst)*100 AS percent_no_genre
    FROM IMDB.title_basics;
--

-- All distinct genres in the database
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

-- Number of TV shows in each genre
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

-- TV show genres over the decades
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

-- Counting some colors names in the titles
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


-- Counting number of times each month is mentioned in the title
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


-- Average rating and number of votes for each MOVIE genre
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

-- Average rating and number of votes for each SERIES genre
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

-- Most friequent movie and series titles
SELECT primaryTitle, COUNT(*) AS num_titles FROM title_basics
    WHERE titleType REGEXP 'movie|series'
    GROUP BY primaryTitle
    ORDER BY COUNT(*) DESC
    LIMIT 10;
--

-- average title lengh (number of characters)
SELECT startYear, AVG(LENGTH(primaryTitle)) AS title_length FROM title_basics
    WHERE titleType REGEXP 'movie|series' AND startYear < 2024
    GROUP BY startYear
    ORDER BY startYear;
--

-- average number of words in a title
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
--
