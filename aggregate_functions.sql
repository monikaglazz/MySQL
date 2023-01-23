-- number of books
SELECT 
    COUNT(*)
FROM
    books;

-- number of books in each year
SELECT 
    released_year, COUNT(*)
FROM
    books
GROUP BY released_year;

-- total number of books in stock
SELECT 
    SUM(stock_quantity)
FROM
    books;

-- average year for each author
SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author,
    ROUND(AVG(released_year), 2) AS average_year
FROM
    books
GROUP BY author;

-- get the author with the longest book
SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author
FROM
    books
ORDER BY pages DESC
LIMIT 1;

SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author
FROM
    books
WHERE
    pages = (SELECT 
            MAX(PAGES)
        FROM
            books);

-- 
SELECT 
    released_year AS 'year',
    COUNT(title) AS amount_books,
    AVG(pages) AS avg_pages
FROM
    books
GROUP BY released_year
ORDER BY released_year;