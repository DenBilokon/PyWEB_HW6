import sqlite3


def create_db():
    with open('hogwarts.sql', 'r') as f:
        sql = f.read()

    with sqlite3.connect('hogwarts.db') as con:
        cur = con.cursor()
        cur.executescript(sql)


if __name__ == "__main__":
    create_db()
