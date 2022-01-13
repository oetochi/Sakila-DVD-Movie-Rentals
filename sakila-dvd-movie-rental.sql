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

/*QUESTION SET 2 QUESTION 1.
Write a query that returns the store ID for the store, the year and month and the number of rental orders each store
has fulfilled for that month. Your table should include a column
for each of the following: year, month, store ID and count of
rental orders fulfilled during that month.*/

SELECT
  DATE_TRUNC('month', rental_date) rental_month,
  st.store_id,
  COUNT(r.rental_id)
FROM
  rental r
  JOIN staff s ON r.staff_id = s.staff_id
  JOIN store st ON st.store_id = s.store_id
GROUP BY 
  DATE_TRUNC('month', rental_date),
  st.store_id
ORDER BY
  rental_month;

/* QUESTION SET 2 QUESTION 2
Can you write a query to capture the customer name, month and year of payment, 
and total payment amount for each month by these top 10 paying customers?*/

SELECT 
  DATE_TRUNC('month', payment_date) month_paid,
  customer_name,
  SUM(amount) sum_amnt
FROM
  (
    SELECT
      customer_id,
      CONCAT (first_name, ' ', last_name) customer_name
    FROM
      customer
   ) sub
   JOIN payment p ON sub.customer_id = p.customer_id
GROUP BY 
  DATE_TRUNC('month', payment_date),
  customer_name
ORDER BY
  sum_amnt DESC
LIMIT
  10;