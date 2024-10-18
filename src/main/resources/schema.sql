-- Build Schema

--
-- Clean the current database
--

DROP SCHEMA IF EXISTS public CASCADE;

CREATE SCHEMA public AUTHORIZATION CURRENT_USER;


--
--  Table: Journal Entry
--

CREATE SEQUENCE journal_entry_id_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE journal_entry (
    id INTEGER NOT NULL DEFAULT nextval('journal_entry_id_seq'),
    date_of_entry TIMESTAMP NOT NULL DEFAULT current_timestamp,
    content TEXT NOT NULL,
    content_preview VARCHAR(32) GENERATED ALWAYS AS (substring(content for 32)) STORED,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT current_timestamp,
    updated_at TIMESTAMP WITH TIME ZONE NULL,
    deleted_at TIMESTAMP WITH TIME ZONE NULL,
    CONSTRAINT journal_entry_pk PRIMARY KEY (id)
);
