CREATE TABLE d_supplier_emails (
    supplier_email_id SERIAL PRIMARY KEY,
    supplier_email VARCHAR(50),
    CONSTRAINT uq_supplier_email UNIQUE (supplier_email)
);

CREATE TABLE d_supplier_countries (
    supplier_country_id SERIAL PRIMARY KEY,
    supplier_country_name VARCHAR(50),
    CONSTRAINT uq_supplier_country UNIQUE (supplier_country_name)
);

CREATE TABLE d_supplier_addresses (
    supplier_address_id SERIAL PRIMARY KEY,
    supplier_address VARCHAR(50),
    CONSTRAINT uq_supplier_address UNIQUE (supplier_address)
);

CREATE TABLE d_supplier_phones (
    supplier_phone_id SERIAL PRIMARY KEY,
    supplier_phone VARCHAR(50),
    CONSTRAINT uq_supplier_phone UNIQUE (supplier_phone)
);

CREATE TABLE d_supplier_cities (
    supplier_city_id SERIAL PRIMARY KEY,
    supplier_city VARCHAR(50),
    CONSTRAINT uq_supplier_city UNIQUE (supplier_city)
);

CREATE TABLE d_suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(50),
    supplier_contact VARCHAR(50),
    supplier_email_id INT,
    supplier_country_id INT,
    supplier_address_id INT,
    supplier_phone_id INT,
    supplier_city_id INT,
    
    CONSTRAINT fk_supplier_email FOREIGN KEY (supplier_email_id) REFERENCES d_supplier_emails(supplier_email_id),  
    CONSTRAINT fk_supplier_country FOREIGN KEY (supplier_country_id) REFERENCES d_supplier_countries(supplier_country_id),    
    CONSTRAINT fk_supplier_address FOREIGN KEY (supplier_address_id) REFERENCES d_supplier_addresses(supplier_address_id),    
    CONSTRAINT fk_supplier_phone FOREIGN KEY (supplier_phone_id) REFERENCES d_supplier_phones(supplier_phone_id),    
    CONSTRAINT fk_supplier_city FOREIGN KEY (supplier_city_id) REFERENCES d_supplier_cities(supplier_city_id)
);
    
    
    