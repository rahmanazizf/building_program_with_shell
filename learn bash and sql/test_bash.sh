#!/bin/bash

# Menyimpan string command psql untuk digunakan nanti
PSQL="psql -X --username=postgres --dbname=test_shell"

# Menampilkan pesan pembuatan tabel
echo -e "\nCreating table books in test_bash"

# Menggunakan psql dengan delimiter EOF
$PSQL << EOF | read RESULT
BEGIN;
    CREATE TABLE IF NOT EXISTS books(
        book_id serial primary key,
        title varchar(100) not null,
        author varchar(100) not null,
        year_published int
    );

    INSERT INTO books(title, author, year_published) VALUES(
        'Laskar Pelangi',
        'Andrea Hirata',
        2008
    );

    SELECT * FROM books;
COMMIT;
EOF

# DROP_TABLE= "$($PSQL "DROP TABLE books;")"
# if [ '$DROP_TABLE' == 'DROP TABLE' ]; then
#     echo Successfully dropped table books
# else
#     echo Failed to drop table
# fi
echo Result: $RESULT