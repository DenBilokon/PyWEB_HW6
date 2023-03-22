SELECT t.fullname AS teacher, s.fullname AS student, ROUND(AVG(r.rate), 2) AS average_rating
FROM rating r 
LEFT JOIN disciplines d ON r.discipline_id = d.id 
LEFT JOIN teachers t ON t.id = d.teacher_id 
LEFT JOIN students s ON s.id = r.student_id 
WHERE t.id = 2 AND s.id = 1;