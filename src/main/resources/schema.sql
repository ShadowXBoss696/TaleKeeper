-- Author: Arpan Mahanty

CREATE SEQUENCE journal_entry_id_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE journal_entry (
    id INTEGER NOT NULL DEFAULT nextval('journal_entry_id_seq'),
    content TEXT NOT NULL,
    content_preview VARCHAR(32) GENERATED ALWAYS AS SUBSTRING(content, 1, 32),
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    modified_at TIMESTAMP NULL,
    CONSTRAINT journal_entry_pk PRIMARY KEY (id)
);
