/* Challenge 1 - Most Profiting Authors */
/* Step 1: Calculate the royalties of each sales for each author */

SELECT 
	titles.title_id AS 'title_ID',
	titleauthor.au_id AS 'author_ID',
	(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS 'sales_royalty'
FROM
	titles
	JOIN titleauthor ON titles.title_id=titleauthor.title_id
	JOIN sales ON sales.title_id = titles.title_id
;




/* Step 2: Aggregate the total royalties for each title for each author */

WITH
	step_1 AS
(
SELECT 
	titles.title_id AS 'title_ID',
	titleauthor.au_id AS 'author_ID',
	(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS 'sales_royalty'
FROM
	titles
	JOIN titleauthor ON titles.title_id=titleauthor.title_id
	JOIN sales ON sales.title_id = titles.title_id
)
SELECT
	step_1.title_ID,
	step_1.author_ID,
	SUM(step_1.sales_royalty) AS 'sales_royalty_sum'
FROM
	step_1
GROUP BY
	step_1.author_ID,
	step_1.title_id
;



/* Step 3: Calculate the total profits of each author */

WITH step_2 AS 
(
	WITH
		step_1 AS
	(
		SELECT 
			titles.title_id AS 'title_ID',
			titleauthor.au_id AS 'author_ID',
			(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS 'sales_royalty'
		FROM
			titles
			JOIN titleauthor ON titles.title_id=titleauthor.title_id
			JOIN sales ON sales.title_id = titles.title_id
	)
	SELECT
		step_1.title_ID,
		step_1.author_ID,
		SUM(step_1.sales_royalty) AS 'sales_royalty_sum'
	FROM
		step_1
	GROUP BY
		step_1.author_ID,
		step_1.title_id
)
SELECT
	step_2.author_ID,
	SUM(step_2.sales_royalty_sum + titles.advance) AS 'total_royalties'
FROM
	step_2
	JOIN titles ON titles.title_id = step_2.title_ID
GROUP BY
	step_2.author_ID
ORDER BY
	total_royalties DESC
LIMIT 3
;



/* Challenge 2 - Alternative Solution */

CREATE TEMPORARY TABLE step_1 AS
SELECT 
	titles.title_id AS 'title_ID',
	titleauthor.au_id AS 'author_ID',
	(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS 'sales_royalty'
FROM
	titles
	JOIN titleauthor ON titles.title_id=titleauthor.title_id
	JOIN sales ON sales.title_id = titles.title_id
;


CREATE TEMPORARY TABLE step_2 AS
SELECT
	step_1.title_ID AS 'title_ID',
	step_1.author_ID AS 'author_ID',
	SUM(step_1.sales_royalty) AS 'sales_royalty_sum'
FROM
	step_1
GROUP BY
	step_1.author_ID,
	step_1.title_ID
;


CREATE TEMPORARY TABLE step_3 AS
SELECT
	step_2.author_ID,
	SUM(step_2.sales_royalty_sum + titles.advance) AS 'total_royalties'
FROM
	step_2
	JOIN titles ON titles.title_id = step_2.title_ID
GROUP BY
	step_2.author_ID
ORDER BY
	total_royalties DESC
LIMIT 3
;

/* ...testing temporary tables... */
SELECT * FROM step_3;



/* Challenge 3 */

CREATE TABLE most_profiting_authors AS
WITH step_2 AS 
(
	WITH
		step_1 AS
	(
		SELECT 
			titles.title_id AS 'title_ID',
			titleauthor.au_id AS 'author_ID',
			(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS 'sales_royalty'
		FROM
			titles
			JOIN titleauthor ON titles.title_id=titleauthor.title_id
			JOIN sales ON sales.title_id = titles.title_id
	)
	SELECT
		step_1.title_ID,
		step_1.author_ID,
		SUM(step_1.sales_royalty) AS 'sales_royalty_sum'
	FROM
		step_1
	GROUP BY
		step_1.author_ID,
		step_1.title_id
)
SELECT
	step_2.author_ID,
	SUM(step_2.sales_royalty_sum + titles.advance) AS 'total_royalties'
FROM
	step_2
	JOIN titles ON titles.title_id = step_2.title_ID
GROUP BY
	step_2.author_ID
ORDER BY
	total_royalties DESC
LIMIT 3
;

/* ...testing permanent table... */
SELECT * FROM most_profiting_authors
;
