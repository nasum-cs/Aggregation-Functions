USE [films_data]
GO

-- Find the release_year, country, and max_budget, then group and order by release_year and country
SELECT release_year, country, MAX(budget) AS max_budget
FROM films
GROUP BY release_year,country;
GO


--Using the films table: which release_year had the most language diversity
SELECT release_year, COUNT(DISTINCT language) AS dis_language
FROM films
GROUP BY release_year
ORDER BY dis_language DESC;
GO


-- Select the country and distinct count of certification as certification_count
SELECT country, COUNT(DISTINCT certification) AS certification_count
FROM films
-- Group by country
GROUP BY country
-- Filter results to countries with more than 10 different certifications
HAVING COUNT(DISTINCT certification) > 10;
GO


-- Select the country and average_budget from films
SELECT country, AVG(budget) AS average_budget
FROM films
-- Group by country
GROUP BY country
-- Filter to countries with an average_budget of more than one billion
HAVING AVG(budget) > 1000000000
-- Order by descending order of the aggregated budget
ORDER BY average_budget DESC;
GO


--write a query that returns the average budget and gross earnings for films each year after 1990 
--if the average budget is greater than 60 million.
SELECT TOP(1) release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > '1990'
GROUP BY release_year
HAVING AVG(budget) > 60000000
ORDER BY avg_gross DESC;
GO