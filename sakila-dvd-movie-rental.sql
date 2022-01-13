/*QUESTION SET 1 QUESTION 1
Create a query that lists each movie, the film category it is classified in, and the number of times it has been rented out.*/

SELECT c.name category_name,
       COUNT(*) rental_count
FROM
  category c
  JOIN film_category fc ON c.category_id = fc.category_id
  JOIN film f ON f.film_id = fc.film_id
  JOIN inventory i ON f.film_id = i.film_id
  JOIN rental r ON r.inventory_id = i.inventory_id
WHERE
  c.name IN (
    'Animation', 'Children', 'Comedy',
    'Family', 'Music'
  )
GROUP BY 
  c.name
ORDER BY
  COUNT(*);


/*QUESTION SET1 QUESTION 2
Provide a table with the movie titles and divide them into 4 levels (first_quarter, second_quarter, third_quarter, and final_quarter) based on the quartiles (25%, 50%, 75%) of the rental duration for movies across all categories*/ 
WITH t1 AS (
  SELECT
    film_id,
    title,
    rental_duration,
    NTILE (4) OVER (
      ORDER BY 
       rental_duration
    ) standard_quartile
   FROM
     film
),
                                                                                                                                                                                                                                            
t2 AS (
  SELECT
    *
  FROM
    category c
    JOIN film_category fc ON c.category_id = fc.category_id
)
SELECT 
  t2.name category_name,
  SUM(t1.rental_duration),
  t1.standard_quartile
FROM
  t1
  JOIN t2 ON t1.film_id = t2.film_id
WHERE
  t2.name IN (
    'Animation', 'Children', 'Classics',
    'Comedy', 'Family', 'Music'
  )
GROUP BY
  t2.name,
  t1.standard_quartile
ORDER BY 
  t2.name;