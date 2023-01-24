
-- get all book released before 1980
SELECT 
    *
FROM
    books
WHERE
    released_year < 1980;

-- get books written by Eggers or Chabon
SELECT 
    *
FROM
    books
WHERE
    author_lname = 'Eggers'
        OR author_lname = 'Chabon';

-- get all boks written by Lahiri and published after 2000
SELECT 
    *
FROM
    books
WHERE
    author_lname = 'Lahiri'
        AND released_year > 2000;

-- get all books with number of pages between 100 and 200
SELECT 
    *
FROM
    books
WHERE
    pages BETWEEN 100 AND 200;

-- get all books where author last name starts with S or C
SELECT 
    title, author_lname
FROM
    books
WHERE
    author_lname LIKE 'C%'
        OR author_lname LIKE 'S%';

SELECT 
    title, author_lname
FROM
    books
WHERE
    SUBSTR(author_lname, 1, 1) IN ('C' , 'S');

--
SELECT 
    title,
    author_lname,
    CASE
        WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN title = 'Just Kids' THEN 'Memoir'
        WHEN title = 'A Heartbreking Work of Staggering Genius' THEN 'Memoir'
        ELSE 'Novel'
    END AS type
FROM
    books;

-- 