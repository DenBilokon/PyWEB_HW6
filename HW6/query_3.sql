SELECT sg.groups AS [group], d.name AS discipline, ROUND(AVG(r.rate), 2) AS average_rating
FROM rating r 
LEFT JOIN students s ON s.id = r.student_id
LEFT JOIN disciplines d ON d.id = r.discipline_id 
LEFT JOIN study_groups sg ON sg.id = s.group_id 
WHERE d.id = 2
GROUP by sg.groups, d.name
ORDER by ROUND(AVG(r.rate), 2) ASC; 