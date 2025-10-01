--1. How many rows are in the data_analyst_jobs table? 1793 rows
SELECT *
FROM data_analyst_jobs;

--2a. Write a query to look at just the first 10 rows.
SELECT *
FROM data_analyst_jobs
LIMIT 10;
--2b. What company is associated with the job posting on the 10th row? ExxonMobil

--3a. How many postings are in Tennessee? 21
SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location = 'TN';
--3b. How many are there in either Tennessee or Kentucky? 27
SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location IN('TN','KY');

--4. How many postings in Tennessee have a star rating above 4? 3
SELECT COUNT(location)
FROM data_analyst_jobs
WHERE star_rating > 4 AND location = 'TN';

--5. How many postings in the dataset have a review count between 500 and 1000? 151
SELECT COUNT(review_count)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

--6. Which state shows the highest average rating? NE
SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY state
ORDER BY avg_rating DESC;

--7. Select unique job titles from the data_analyst_jobs table. How many are there? 881
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE title IS NOT NULL;

--8. How many unique job titles are there for California companies? 230
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';

--9a. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across.
SELECT company,ROUND(AVG(star_rating),2) AS average_star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company
ORDER BY average_star_rating DESC;
--9b. How many companies are there with more that 5000 reviews? 40
SELECT COUNT(DISTINCT company) AS companies_with_high_reviews
FROM data_analyst_jobs
WHERE review_count > 5000;

--10a.Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? General Motors
SELECT company,ROUND(AVG(star_rating),2) AS average_star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company
ORDER BY average_star_rating DESC;
--10b. What is that rating? 4.20

--11a. Find all the job titles that contain the word ‘Analyst’.
SELECT COUNT(DISTINCT title) AS analyst_job_titles
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';
--11b. How many different job titles are there? 774

--12a. How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? 4
SELECT COUNT(DISTINCT title) AS non_analyst_job_titles
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analy%';
--12b. What word do these positions have in common? Tableau
SELECT title AS non_analyst_job_titles
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analy%';

--BONUS
--a. find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
SELECT domain,COUNT(*) AS hard_to_fill_jobs
FROM data_analyst_jobs
WHERE skill ILIKE '%SQL%'
      AND days_since_posting > 21
	  AND domain IS NOT NULL
GROUP BY domain
ORDER BY hard_to_fill_jobs DESC
LIMIT 4;
--b. Which industries are in the top 4? Internet and Software,Banks and Financial Services,Consulting and Business Services,Health Care.



 
