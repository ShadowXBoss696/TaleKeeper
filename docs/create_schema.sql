--
-- Build Schema
--

-- // Clean the current database

DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public AUTHORIZATION CURRENT_USER;


-- // Create User table

CREATE SEQUENCE user_id_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE users (
    id integer NOT NULL DEFAULT nextval('user_id_seq'),
	uname varchar(255) NOT NULL,
	first_name varchar(128) NOT NULL,
	last_name varchar(128),
	email varchar(255),
	phone varchar(20),
	hashed_password varchar(255) NOT NULL,
	is_active boolean NOT NULL DEFAULT true,
	created_at timestamp with time zone NOT NULL DEFAULT current_timestamp,
    updated_at timestamp with time zone NULL,
    CONSTRAINT user_pk PRIMARY KEY (id)
);

CREATE UNIQUE INDEX user_uname_uk ON users (uname);
CREATE UNIQUE INDEX user_email_uk ON users (lower(email));
CREATE UNIQUE INDEX user_phone_uk ON users (phone);


-- // Create Entry Table

CREATE SEQUENCE journal_id_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE journal (
    id integer NOT NULL DEFAULT nextval('journal_id_seq'),
    date_of_entry timestamp NOT NULL DEFAULT current_timestamp,
    body text NOT NULL,
	preview varchar(80) GENERATED ALWAYS AS ('journal_preview(body)') STORED,
    owner_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL DEFAULT current_timestamp,
    updated_at timestamp with time zone NULL,
    deleted_at timestamp with time zone NULL,
    CONSTRAINT journal_pk PRIMARY KEY (id),
    CONSTRAINT journal_owner FOREIGN KEY (owner_id) REFERENCES users (id)
);


-- // Functions

CREATE OR REPLACE FUNCTION journal_preview (body text)
RETURNS varchar(80) AS $$
BEGIN
	RETURN substring(body for 80);
END;
$$ language plpgsql IMMUTABLE;



--
-- Populate Test Data
--


-- // Populate test users

INSERT INTO
	users (first_name, last_name, uname, hashed_password)
VALUES
	('John', 'Doe', 'jdoe', 'password123'),
	('Jane', 'Smith', 'jsmith', 'securePass456'),
	('Emily', 'Davis', 'edavis', 'mySecret789'),
	('Michael', 'Brown', 'mbrown', 'brownie!234'),
	('Sophia', 'Johnson', 'sjohnson', 'Sophi@1982'),
	('William', 'Miller', 'wmiller', 'WillM*007'),
	('Olivia', 'Garcia', 'ogarcia', 'Olivia#789'),
	('James', 'Martinez', 'jmartinez', 'James2024$'),
	('Isabella', 'Lopez', 'ilopez', 'IsabellaP@ss'),
	('David', 'Wilson', 'dwilson', 'D@vidW123');



-- // Populate test journals

INSERT INTO
    journal (body, date_of_entry, owner_id, updated_at)
VALUES
    (
        'Today was a productive day. I managed to complete all the tasks I had planned and even found time to work on some new ideas for my project.',
        '2024-10-12 08:30:00',
		(SELECT id FROM users WHERE uname = 'jdoe'),
        NULL
    ),
    (
        'Had a meeting with the team to discuss the upcoming project features. It went well, and we agreed on the next steps moving forward.',
        '2024-10-11 14:45:00',
		(SELECT id FROM users WHERE uname = 'jdoe'),
        NULL
    ),
    (
        'Spent the afternoon debugging an issue with the database. Finally figured out the problem was with the indexing, and it was a relief to resolve it.',
        '2024-10-10 16:20:00',
		(SELECT id FROM users WHERE uname = 'jdoe'),
        '2024-10-11 09:00:00'
    ),
    (
        'Started reading a new book on modern JavaScript frameworks. It has some interesting insights that I plan to incorporate into the project.',
        '2024-10-09 10:15:00',
		(SELECT id FROM users WHERE uname = 'jdoe'),
        NULL
    ),
    (
        'Had a relaxing weekend. I spent time outdoors and caught up with friends. It was a great way to recharge after a busy week.',
        '2024-10-08 18:00:00',
		(SELECT id FROM users WHERE uname = 'jsmith'),
        NULL
    );