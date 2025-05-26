CREATE TABLE D_STORE_EMAILS (
    store_email_id SERIAL PRIMARY KEY,
    store_email VARCHAR(50) NULL
);

CREATE TABLE D_STORE_PHONES (
    store_phone_id SERIAL PRIMARY KEY,
    store_phone VARCHAR(50) NULL
);

CREATE TABLE D_STORE_CITIES (
    store_city_id SERIAL PRIMARY KEY,
    store_city VARCHAR(50) NULL
);

CREATE TABLE D_STORE_COUNTRIES (
    store_country_id SERIAL PRIMARY KEY,
    store_country_name VARCHAR(50) NULL
);

CREATE TABLE D_STORE_STATES (
    store_state_id SERIAL PRIMARY KEY,
    store_state VARCHAR(50) NULL
);

CREATE TABLE D_STORE_LOCATIONS (
    store_location_id SERIAL PRIMARY KEY,
    store_location VARCHAR(50) NULL
);

CREATE TABLE D_STORES (
    store_name VARCHAR(50) NULL,
    store_location_id INTEGER NULL,
    store_city_id INTEGER NULL,
    store_state_id INTEGER NULL,
    store_country_id INTEGER NULL,
    store_phone_id INTEGER NULL,
    store_email_id INTEGER NULL,
    CONSTRAINT fk_store_location FOREIGN KEY (store_location_id) REFERENCES D_STORE_LOCATIONS(store_location_id),
    CONSTRAINT fk_store_city FOREIGN KEY (store_city_id) REFERENCES D_STORE_CITIES(store_city_id),
    CONSTRAINT fk_store_state FOREIGN KEY (store_state_id) REFERENCES D_STORE_STATES(store_state_id),
    CONSTRAINT fk_store_country FOREIGN KEY (store_country_id) REFERENCES D_STORE_COUNTRIES(store_country_id),
    CONSTRAINT fk_store_phone FOREIGN KEY (store_phone_id) REFERENCES D_STORE_PHONES(store_phone_id),
    CONSTRAINT fk_store_email FOREIGN KEY (store_email_id) REFERENCES D_STORE_EMAILS(store_email_id)
);