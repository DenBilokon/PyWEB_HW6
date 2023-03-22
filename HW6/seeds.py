from datetime import datetime, date, timedelta
from random import randint
from faker import Faker
import sqlite3

disciplines = [
    'Астрологія',
    'Заклинання',
    'Захист від темних мистецтв',
    'Зілляваріння',
    'Історія Магії',
    'Травологія',
    'Пророцтва',
    'Польоти на мітлах'
]

groups = ['Гріффіндор', 'Слізерін', 'Пуффендуй', 'Когтевран']
teachers = [
    'Северус Снейп',
    'Аластор Грюм',
    'Мінерва МакГонагал',
    'Рубеус Хагрід',
    'Роланда Трюк'
]

NUMBER_STUDENTS = 50

fake = Faker('uk_UA')
connect = sqlite3.connect('hogwarts.db')
cur = connect.cursor()


def seed_teachers():
    sql = "INSERT INTO teachers(fullname) VALUES(?);"
    cur.executemany(sql, zip(teachers, ))


def seed_disciplines():
    sql = "INSERT INTO disciplines(name, teacher_id) VALUES(?, ?);"
    cur.executemany(sql, zip(disciplines, iter(randint(1, len(teachers)) for _ in range(len(disciplines)))))


def seed_groups():
    sql = "INSERT INTO study_groups(groups) VALUES(?);"
    cur.executemany(sql, zip(groups, ))


def seed_students():
    students = [fake.name() for _ in range(NUMBER_STUDENTS)]
    sql = "INSERT INTO students(fullname, group_id) VALUES(?, ?);"
    cur.executemany(sql, zip(students, iter(randint(1, len(groups)) for _ in range(len(students)))))


def seed_rating():
    start_date = datetime.strptime("2022-09-01", '%Y-%m-%d')
    end_date = datetime.strptime("2023-06-30", '%Y-%m-%d')
    sql = "INSERT INTO rating(discipline_id, student_id, rate, date_rating) VALUES(?, ?, ?, ?);"

    def get_list_date(start: date, end: date):
        result = []
        current_date = start
        while current_date <= end:
            if current_date.isoweekday() < 6:
                result.append(current_date)
            current_date += timedelta(1)
        return result

    list_dates = get_list_date(start_date, end_date)
    rates = []
    for day in list_dates:
        random_discipline = randint(1, len(disciplines))
        random_students = [randint(1, NUMBER_STUDENTS) for _ in range(4)]
        for student in random_students:
            rates.append((random_discipline, student, randint(1, 100), day.date()))
    cur.executemany(sql, rates)


if __name__ == '__main__':
    try:
        seed_teachers()
        seed_disciplines()
        seed_groups()
        seed_students()
        seed_rating()
        connect.commit()
    except sqlite3.Error as error:
        print(error)
    finally:
        connect.close()
