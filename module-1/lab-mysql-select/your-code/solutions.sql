+++ VICTOR GALÁN +++

/* Challenge 1 - Who Have Published What At Where? */

SELECT 
	authors.au_id AS 'AUTHOR ID', 
	authors.au_lname AS 'LAST NAME', 
	authors.au_fname AS 'FIRS NAME', 
	titles.title AS 'TITLE', 
	publishers.pub_name AS 'PUBLISHER' 
FROM 
	titles
	join publishers on titles.pub_id = publishers.pub_id
	join titleauthor on titleauthor.title_id = titles.title_id
	join authors on authors.au_id = titleauthor.au_id
;


/* Challenge 2 - Who Have Published How Many At Where? */

SELECT 
	authors.au_id AS 'AUTHOR ID', 
	authors.au_lname AS ' LAST NAME', 
	authors.au_fname AS 'FIRST NAME', 
	publishers.pub_name AS 'PUBLISHER', 
	COUNT(titles.title) AS 'TITLE COUNT'
FROM 
	titles
	JOIN publishers ON titles.pub_id = publishers.pub_id 
	JOIN titleauthor ON titleauthor.title_id = titles.title_id
	JOIN authors ON authors.au_id = titleauthor.au_id
GROUP BY 
	authors.au_id
ORDER BY 
	authors.au_id DESC
;


/* Challenge 3 - Best Selling Authors */

SELECT
	authors.au_id AS 'AUTHOR ID',
	authors.au_lname AS 'LAST NAME',
	authors.au_fname AS 'FIRST NAME',
	SUM(sales.qty) AS 'TOTAL'
FROM 
	titles
	JOIN sales ON titles.title_id = sales.title_id
	JOIN titleauthor ON titles.title_id = titleauthor.title_id
	JOIN authors ON titleauthor.au_id = authors.au_id
GROUP BY 
	authors.au_id
ORDER BY 
	TOTAL DESC
LIMIT 
	3
;


/* Challenge 4 - Best Selling Authors Ranking */

SELECT
	authors.au_id AS 'AUTHOR ID',
	authors.au_lname AS 'LAST NAME',
	authors.au_fname AS 'FIRST NAME',
	IFNULL(titles.ytd_sales,0) AS 'TOTAL'
FROM 
	authors
	LEFT JOIN titleauthor ON titleauthor.au_id = authors.au_id
	LEFT JOIN titles ON titles.title_id = titleauthor.title_id 
GROUP BY 
	authors.au_id
ORDER BY 
	TOTAL DESC
;


/* Bonus Challenge - Most Profiting Authors */

SELECT
	authors.au_id AS 'AUTHOR ID',
	authors.au_lname AS 'LAST NAME',
	authors.au_fname AS 'FIRST NAME',
	titles.advance + (titles.royalty * titles.ytd_sales) AS 'PROFIT'
FROM 
	titles
	JOIN sales ON titles.title_id = sales.title_id
	JOIN titleauthor ON titles.title_id = titleauthor.title_id
	JOIN authors ON titleauthor.au_id = authors.au_id
GROUP BY 
	authors.au_id
ORDER BY 
	PROFIT DESC
LIMIT 
	3
;

 
