--

CREATE TABLE journal (
    id SERIAL PRIMARY KEY,
    description VARCHAR(32) GENERATED ALWAYS AS SUBSTRING(body, 1, 32),
    body TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    modified_at TIMESTAMP NULL
);
