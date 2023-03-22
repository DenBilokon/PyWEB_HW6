SELECT s.fullname AS student, sg.groups AS [group], d.name AS discipline, r.rate, r.date_rating  
FROM rating r 
LEFT JOIN disciplines d ON d.id = r.discipline_id
LEFT JOIN students s ON s.id = r.student_id 
LEFT JOIN study_groups sg ON s.group_id = sg.id 
WHERE d.id = 1 AND sg.id = 1
ORDER BY s.fullname ASC, r.date_rating ASC;