CREATE TABLE D_SELLER_COUNTRIES (
    seller_country_id SERIAL PRIMARY KEY,
    seller_country_name VARCHAR(50) NOT NULL
);

CREATE TABLE D_SELLER_POSTAL_CODES (
    seller_postal_code_id SERIAL PRIMARY KEY,
    seller_postal_code VARCHAR(50) NOT NULL
);

CREATE TABLE D_SELLER_EMAILS (
    seller_email_id SERIAL PRIMARY KEY,
    seller_email VARCHAR(50) NOT NULL
);

CREATE TABLE D_SELLERS (
    seller_id SERIAL PRIMARY KEY,
    seller_first_name VARCHAR(50) NULL,
    seller_last_name VARCHAR(50) NULL,
    seller_country_id INTEGER NULL,
    seller_email_id INTEGER NULL,
    seller_postal_code_id INTEGER NULL,
    CONSTRAINT fk_seller_country FOREIGN KEY (seller_country_id) REFERENCES D_SELLER_COUNTRIES(seller_country_id),
    CONSTRAINT fk_seller_email FOREIGN KEY (seller_email_id) REFERENCES D_SELLER_EMAILS(seller_email_id),
    CONSTRAINT fk_seller_postal_code FOREIGN KEY (seller_postal_code_id) REFERENCES D_SELLER_POSTAL_CODES(seller_postal_code_id)
);