SELECT sg.groups AS group_name, s.fullname AS student, d.name AS discipline, r.rate  AS rate, r.date_rating AS date_of
FROM rating r 
JOIN disciplines d ON d.id = r.discipline_id 
JOIN students s ON s.id = r.student_id
JOIN study_groups sg ON sg.id = s.group_id
WHERE sg.id = 1 AND d.id = 1 AND r.date_rating = (
  SELECT MAX(date_rating)
  FROM rating r2 
  JOIN students s2 ON s2.id = r2.student_id
  JOIN study_groups sg2 ON sg2.id = s2.group_id
  WHERE r2.discipline_id = r.discipline_id AND sg2.id = sg.id
)
ORDER BY student;