CREATE TABLE D_CUSTOMER_PET_TYPE (
    customer_pet_type_id SERIAL PRIMARY KEY,
    customer_pet_type VARCHAR(50) NULL
);

-- Создание таблицы пород питомцев
CREATE TABLE D_CUSTOMER_PET_BREED (
    customer_pet_breed_id SERIAL PRIMARY KEY,
    customer_pet_breed VARCHAR(50) NULL
);

-- Создание таблицы категорий питомцев
CREATE TABLE D_CUSTOMER_PET_CATEGORY (
    customer_pet_category_id SERIAL PRIMARY KEY,
    pet_category VARCHAR(50) NULL
);

-- Создание таблицы питомцев (обновленная версия)
CREATE TABLE D_PETS (
    pet_id SERIAL PRIMARY KEY,
    customer_pet_name VARCHAR(50) NULL,
    customer_pet_type_id INTEGER NULL,
    customer_pet_breed_id INTEGER NULL,
    customer_pet_category_id INTEGER NULL,
    CONSTRAINT fk_pet_type FOREIGN KEY (customer_pet_type_id) 
        REFERENCES D_CUSTOMER_PET_TYPE(customer_pet_type_id),
    CONSTRAINT fk_pet_breed FOREIGN KEY (customer_pet_breed_id) 
        REFERENCES D_CUSTOMER_PET_BREED(customer_pet_breed_id),
    CONSTRAINT fk_pet_category FOREIGN KEY (customer_pet_category_id) 
        REFERENCES D_CUSTOMER_PET_CATEGORY(customer_pet_category_id)
);

-- Остальные таблицы остаются без изменений
CREATE TABLE D_CUSTOMER_COUNTRIES (
    customer_country_id SERIAL PRIMARY KEY,
    customer_country_name VARCHAR(50) NULL
);

CREATE TABLE D_CUSTOMER_EMAILS (
    customer_email_id SERIAL PRIMARY KEY,
    customer_email VARCHAR(50) NULL
);

CREATE TABLE D_CUSTOMER_POSTAL_CODES (
    customer_postal_code_id SERIAL PRIMARY KEY,
    customer_postal_code VARCHAR(50) NULL
);

CREATE TABLE D_CUSTOMERS (
    customer_id SERIAL PRIMARY KEY,
    customer_first_name VARCHAR(50) NULL,
    customer_last_name VARCHAR(50) NULL,
    customer_age INTEGER NULL,
    pet_id INTEGER NULL,
    customer_country_id INTEGER NULL,
    customer_email_id INTEGER NULL,
    customer_postal_code_id INTEGER NULL,
    CONSTRAINT fk_pet FOREIGN KEY (pet_id) REFERENCES D_PETS(pet_id),
    CONSTRAINT fk_country FOREIGN KEY (customer_country_id) REFERENCES D_CUSTOMER_COUNTRIES(customer_country_id),
    CONSTRAINT fk_email FOREIGN KEY (customer_email_id) REFERENCES D_CUSTOMER_EMAILS(customer_email_id),
    CONSTRAINT fk_postal_code FOREIGN KEY (customer_postal_code_id) REFERENCES D_CUSTOMER_POSTAL_CODES(customer_postal_code_id)
);