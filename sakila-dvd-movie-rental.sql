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