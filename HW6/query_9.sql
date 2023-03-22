SELECT s.fullname AS student, d.name AS discipline
FROM rating r 
LEFT JOIN students s ON s.id = r.student_id 
LEFT JOIN disciplines d ON d.id = r.discipline_id
GROUP BY s.fullname, d.name
ORDER BY s.fullname ASC, d.name ASC;