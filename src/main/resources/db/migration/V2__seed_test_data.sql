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
