INSERT INTO D_CUSTOMER_PET_TYPE (customer_pet_type)
SELECT DISTINCT customer_pet_type 
FROM mock_data 
WHERE customer_pet_type IS NOT NULL;

-- Заполнение таблицы пород питомцев (уникальные значения)
INSERT INTO D_CUSTOMER_PET_BREED (customer_pet_breed)
SELECT DISTINCT customer_pet_breed 
FROM mock_data 
WHERE customer_pet_breed IS NOT NULL;

-- Заполнение таблицы категорий питомцев (уникальные значения)
INSERT INTO D_CUSTOMER_PET_CATEGORY (pet_category)
SELECT DISTINCT pet_category 
FROM mock_data 
WHERE pet_category IS NOT NULL;

-- Заполнение таблицы питомцев (связи по ID)
INSERT INTO D_PETS (
    customer_pet_name,
    customer_pet_type_id,
    customer_pet_breed_id,
    customer_pet_category_id
)
SELECT DISTINCT
    md.customer_pet_name,
    pt.customer_pet_type_id,
    pb.customer_pet_breed_id,
    pc.customer_pet_category_id
FROM mock_data md
LEFT JOIN D_CUSTOMER_PET_TYPE pt ON md.customer_pet_type = pt.customer_pet_type
LEFT JOIN D_CUSTOMER_PET_BREED pb ON md.customer_pet_breed = pb.customer_pet_breed
LEFT JOIN D_CUSTOMER_PET_CATEGORY pc ON md.pet_category = pc.pet_category
WHERE md.customer_pet_name IS NOT NULL 
   OR md.customer_pet_type IS NOT NULL 
   OR md.customer_pet_breed IS NOT NULL 
   OR md.pet_category IS NOT NULL;

-- Заполнение остальных таблиц (без изменений)
INSERT INTO D_CUSTOMER_COUNTRIES (customer_country_name)
SELECT DISTINCT customer_country 
FROM mock_data 
WHERE customer_country IS NOT NULL;

INSERT INTO D_CUSTOMER_EMAILS (customer_email)
SELECT DISTINCT customer_email 
FROM mock_data 
WHERE customer_email IS NOT NULL;

INSERT INTO D_CUSTOMER_POSTAL_CODES (customer_postal_code)
SELECT DISTINCT customer_postal_code 
FROM mock_data 
WHERE customer_postal_code IS NOT NULL;

INSERT INTO D_CUSTOMERS (
    customer_first_name, 
    customer_last_name, 
    customer_age,
    pet_id,
    customer_country_id,
    customer_email_id,
    customer_postal_code_id
)
SELECT 
    md.customer_first_name,
    md.customer_last_name,
    md.customer_age,
    p.pet_id,
    cc.customer_country_id,
    ce.customer_email_id,
    cpc.customer_postal_code_id
FROM mock_data md
LEFT JOIN D_PETS p ON 
    md.customer_pet_name = p.customer_pet_name AND
    EXISTS (SELECT 1 FROM D_CUSTOMER_PET_TYPE pt 
            WHERE pt.customer_pet_type_id = p.customer_pet_type_id 
            AND pt.customer_pet_type = md.customer_pet_type) AND
    EXISTS (SELECT 1 FROM D_CUSTOMER_PET_BREED pb 
            WHERE pb.customer_pet_breed_id = p.customer_pet_breed_id 
            AND pb.customer_pet_breed = md.customer_pet_breed) AND
    EXISTS (SELECT 1 FROM D_CUSTOMER_PET_CATEGORY pc 
            WHERE pc.customer_pet_category_id = p.customer_pet_category_id 
            AND pc.pet_category = md.pet_category)
LEFT JOIN D_CUSTOMER_COUNTRIES cc ON md.customer_country = cc.customer_country_name
LEFT JOIN D_CUSTOMER_EMAILS ce ON md.customer_email = ce.customer_email
LEFT JOIN D_CUSTOMER_POSTAL_CODES cpc ON md.customer_postal_code = cpc.customer_postal_code;