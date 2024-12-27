USE [films_data]
GO


---Applying filtering 'WHERE' clause
-- Select film_id and imdb_score with an imdb_score over 7.0
SELECT film_id, imdb_score
FROM reviews
WHERE imdb_score > 7.0;
GO

-- Select film_id and facebook_likes for ten records with less than 1000 likes 
SELECT TOP(10) film_id, facebook_likes
FROM reviews
WHERE facebook_likes < 1000;
GO

-- Count the records with at least 100,000 votes
SELECT COUNT(num_votes) AS films_over_100K_votes
FROM reviews
WHERE num_votes >= 100000;
GO

-- Count the Spanish-language films
SELECT COUNT(language) AS count_spanish
FROM films
WHERE language = 'Spanish';
GO

-- Select the title and release_year for all German-language films released before 2000
SELECT title, release_year
FROM films
WHERE language = 'German' 
	AND release_year < 2000;
GO

-- Select all records for German-language films released after 2000 and before 2010
SELECT *
FROM films
WHERE language = 'German'
    AND release_year > 2000 
	AND release_year < 2010;
GO

-- Find the title and year of films from the 1990 or 1999
--Language of the film is English or Spanish
-- Filter films with more than $2,000,000 gross
SELECT title, release_year
FROM films
WHERE (release_year = 1990 OR release_year = 1999)
	AND (language = 'English' OR language = 'Spanish')
	AND gross > 2000000;
GO

-- Select the title and release_year for films released between 1990 and 2000
-- Narrow down your query to films with budgets > $100 million
-- - And the query to include Spanish or French-language films
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
	AND budget > 100000000
	SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
	AND budget > 100000000
	AND (language = 'Spanish' OR language = 'French');
GO

-- Select the names that start with B
SELECT name
FROM people
WHERE name LIKE 'B%';

-- Select names that don't start with A
SELECT name
FROM people
WHERE name NOT LIKE 'A%';
GO

-- Find the title and release_year for all films over two hours in length released in 1990 and 2000
SELECT title, release_year
FROM films
WHERE release_year IN (1990, 2000)
    AND duration > 120;
GO

-- Find the title and language of all films in English, Spanish, and French
SELECT title, language
FROM films
WHERE language IN ('English', 'Spanish', 'French');
GO

-- Find the title, certification, and language all films certified NC-17 or R that are in English, Italian, or Greek
SELECT title, certification, language
FROM films
WHERE certification IN ('NC-17', 'R')
    AND language IN ('English', 'Italian', 'Greek');
GO

-- Count the unique titles
-- Filter to release_years to between 1990 and 1999
-- Filter to English-language films
-- Narrow it down to G, PG, and PG-13 certifications
SELECT COUNT(DISTINCT(title)) AS nineties_english_films_for_teens
FROM films
WHERE release_year BETWEEN 1990 AND 1999
	AND language = 'English'
	AND certification IN ('G', 'PG', 'PG-13');
GO

-- List all film titles with missing budgets
SELECT title AS no_budget_info
FROM films
WHERE budget IS NULL;
GO

-- Count the number of films we have language data for
SELECT COUNT(language) count_language_known
FROM films
WHERE language IS NOT NULL;
GO


