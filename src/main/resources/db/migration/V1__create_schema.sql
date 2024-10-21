--
-- Build Schema
--

-- // Clean the current database

--DROP SCHEMA IF EXISTS public CASCADE;
--CREATE SCHEMA public AUTHORIZATION CURRENT_USER;


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
