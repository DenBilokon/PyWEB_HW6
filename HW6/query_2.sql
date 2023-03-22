SELECT d.name AS discipline, s.fullname AS student, ROUND(AVG(r.rate), 2) AS average_rating 
FROM rating r 
LEFT JOIN students s ON s.id = r.student_id
LEFT JOIN disciplines d ON d.id = r.discipline_id 
WHERE d.id = 1
GROUP by s.fullname 
ORDER by average_rating DESC 
LIMIT 1;