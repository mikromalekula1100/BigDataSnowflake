CREATE TABLE D_PRODUCT_CATEGORIES (
    product_category_id SERIAL PRIMARY KEY,
    product_category VARCHAR(50) NOT NULL
);

CREATE TABLE D_PRODUCT_SIZES (
    product_size_id SERIAL PRIMARY KEY,
    product_size VARCHAR(50) NOT NULL
);

CREATE TABLE D_PRODUCT_MATERIALS (
    product_material_id SERIAL PRIMARY KEY,
    product_material VARCHAR(50) NOT NULL
);

CREATE TABLE D_PRODUCT_RELEASE_DATES (
    product_release_date_id SERIAL PRIMARY KEY,
    product_release_date VARCHAR(50) NOT NULL
);

CREATE TABLE D_PRODUCT_EXPIRY_DATES (
    product_expiry_date_id SERIAL PRIMARY KEY,
    product_expiry_date VARCHAR(50) NOT NULL
);

CREATE TABLE D_PRODUCT_COLORS (
    product_color_id SERIAL PRIMARY KEY,
    product_color VARCHAR(50) NOT NULL
);

CREATE TABLE D_PRODUCT_BRANDS (
    product_brand_id SERIAL PRIMARY KEY,
    product_brand VARCHAR(50) NOT NULL
);

CREATE TABLE D_PRODUCTS (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(50),
    product_category_id INTEGER,
    product_price REAL,
    product_quantity INTEGER,
    product_weight REAL,
    product_color_id INTEGER,
    product_size_id INTEGER,
    product_brand_id INTEGER,
    product_material_id INTEGER,
    product_description VARCHAR(1024),
    product_rating REAL,
    product_reviews INTEGER,
    product_release_date_id INTEGER,
    product_expiry_date_id INTEGER,
    
    CONSTRAINT fk_product_category FOREIGN KEY (product_category_id) REFERENCES D_PRODUCT_CATEGORIES(product_category_id),
    CONSTRAINT fk_product_size FOREIGN KEY (product_size_id) REFERENCES D_PRODUCT_SIZES(product_size_id),
    CONSTRAINT fk_product_material FOREIGN KEY (product_material_id) REFERENCES D_PRODUCT_MATERIALS(product_material_id),
    CONSTRAINT fk_product_release_date FOREIGN KEY (product_release_date_id) REFERENCES D_PRODUCT_RELEASE_DATES(product_release_date_id),
    CONSTRAINT fk_product_expiry_date FOREIGN KEY (product_expiry_date_id) REFERENCES D_PRODUCT_EXPIRY_DATES(product_expiry_date_id),
    CONSTRAINT fk_product_color FOREIGN KEY (product_color_id) REFERENCES D_PRODUCT_COLORS(product_color_id),
    CONSTRAINT fk_product_brand FOREIGN KEY (product_brand_id) REFERENCES D_PRODUCT_BRANDS(product_brand_id)
);