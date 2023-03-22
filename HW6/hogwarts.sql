-- Table: study_groups
DROP TABLE IF EXISTS study_groups;
CREATE TABLE study_groups (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    groups STRING UNIQUE
);

-- Table: teachers
DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fullname STRING
);

-- Table: students
DROP TABLE IF EXISTS students;
CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    fullname STRING,
    group_id REFERENCES study_groups (id)
);


-- Table: disciplines
DROP TABLE IF EXISTS disciplines;
CREATE TABLE disciplines (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name STRING,
    teacher_id REFERENCES teachers (id)
);

-- Table: rating
DROP TABLE IF EXISTS rating;
CREATE TABLE rating (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    discipline_id REFERENCES disciplines (id),
    student_id REFERENCES students (id),
    rate INTEGER,
    date_rating DATE
);