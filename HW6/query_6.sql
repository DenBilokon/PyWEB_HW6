SELECT s.fullname AS student, sg.groups AS [group]
FROM students s 
LEFT JOIN study_groups sg ON sg.id = s.group_id
WHERE sg.id = 1
ORDER BY s.fullname ASC;