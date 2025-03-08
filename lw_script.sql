--Question 1: Rankings

--Question 1a: Warmup Question
--Write a query which retrieves each teamid and number of wins (w) for the 2016 season. 
--Apply three window functions to the number of wins (ordered in descending order) - ROW_NUMBER, RANK, AND DENSE_RANK. 
--Compare the output from these three functions. What do you notice?

SELECT 
	teamid, 
	w,
	ROW_NUMBER() OVER(ORDER BY w DESC) AS row_number_window,
	RANK() OVER(ORDER BY w DESC)  AS rank_window,
	DENSE_RANK() OVER(ORDER BY w DESC)  AS dense_rank_window
FROM teams
WHERE yearid = 2016
LIMIT 25;

--Question 1b:
--Which team has finished in last place in its division (i.e. with the least number of wins) the most number of times? 
--A team's division is indicated by the divid column in the teams table.

WITH ranked_teams AS(
	SELECT 
    	teamid,
    	divid,
    	w,
    	yearid,
    	DENSE_RANK() OVER(PARTITION BY divid, yearid ORDER BY w DESC) AS franchise_rank
	FROM teams
)















SELECT *
FROM teams