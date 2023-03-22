SELECT s.fullname AS student, ROUND(AVG(r.rate), 2) AS average_rating 
FROM rating r 
LEFT JOIN students s ON s.id = r.student_id
GROUP by s.fullname 
ORDER by average_rating DESC 
LIMIT 5;