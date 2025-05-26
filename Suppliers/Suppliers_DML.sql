INSERT INTO d_supplier_emails (supplier_email)
SELECT DISTINCT supplier_email FROM mock_data 
WHERE supplier_email IS NOT NULL;

INSERT INTO d_supplier_countries (supplier_country_name)
SELECT DISTINCT supplier_country FROM mock_data 
WHERE supplier_country IS NOT NULL;

INSERT INTO d_supplier_addresses (supplier_address)
SELECT DISTINCT supplier_address FROM mock_data 
WHERE supplier_address IS NOT NULL;

INSERT INTO d_supplier_phones (supplier_phone)
SELECT DISTINCT supplier_phone FROM mock_data 
WHERE supplier_phone IS NOT NULL;

INSERT INTO d_supplier_cities (supplier_city)
SELECT DISTINCT supplier_city FROM mock_data 
WHERE supplier_city IS NOT NULL;

INSERT INTO d_suppliers (
    supplier_name,
    supplier_contact,
    supplier_email_id,
    supplier_country_id,
    supplier_address_id,
    supplier_phone_id,
    supplier_city_id
)
SELECT 
    m.supplier_name,
    m.supplier_contact,
    e.supplier_email_id,
    c.supplier_country_id,
    a.supplier_address_id,
    p.supplier_phone_id,
    ci.supplier_city_id
FROM (
    SELECT 
        DISTINCT 
        supplier_name,
        supplier_contact,
        supplier_email,
        supplier_country,
        supplier_address,
        supplier_phone,
        supplier_city
    FROM mock_data
) m
LEFT JOIN d_supplier_emails e ON e.supplier_email = m.supplier_email
LEFT JOIN d_supplier_countries c ON c.supplier_country_name = m.supplier_country
LEFT JOIN d_supplier_addresses a ON a.supplier_address = m.supplier_address
LEFT JOIN d_supplier_phones p ON p.supplier_phone = m.supplier_phone
LEFT JOIN d_supplier_cities ci ON ci.supplier_city = m.supplier_city;


