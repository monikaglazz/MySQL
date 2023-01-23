USE book_storage;

-- All titles with 'stories' in them
SELECT 
    title
FROM
    books
WHERE
    title LIKE '%stories%';

-- select the title with the greatest number of pages
SELECT 
    title, pages
FROM
    books
ORDER BY pages DESC
LIMIT 1;

-- get the title and year for 3 most recent books
SELECT 
    CONCAT(title, ' - ', released_year) AS summary
FROM
    books
ORDER BY released_year DESC
LIMIT 3;

-- get all books with author last name that contains a space
SELECT 
    title, author_lname
FROM
    books
WHERE
    author_lname LIKE '% %';

-- get 3 books with the lowest stock
SELECT 
    title, released_year, stock_quantity
FROM
    books
ORDER BY stock_quantity
LIMIT 3;

-- get title ans author last name and sort it by author and title
SELECT 
    title, author_lname
FROM
    books
ORDER BY author_lname , title;

SELECT 
    CONCAT('MY FAVOURITE AUTHOR IS ',
            UPPER(CONCAT(author_fname, ' ', author_lname)),
            '!') AS yell
FROM
    books
ORDER BY author_lname;

