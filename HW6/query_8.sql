SELECT t.fullname AS teacher, d.name AS discipline, ROUND(AVG(r.rate), 2) AS average_rating
FROM rating r 
LEFT JOIN disciplines d ON d.id = r.discipline_id 
LEFT JOIN teachers t ON t.id = d.teacher_id 
WHERE t.id = 2
GROUP BY t.fullname, d.name;