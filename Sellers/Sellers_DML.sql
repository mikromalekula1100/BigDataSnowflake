INSERT INTO D_SELLER_COUNTRIES (seller_country_name)
SELECT DISTINCT seller_country 
FROM public.mock_data 
WHERE seller_country IS NOT NULL;

-- Вставка уникальных почтовых индексов продавцов
INSERT INTO D_SELLER_POSTAL_CODES (seller_postal_code)
SELECT DISTINCT seller_postal_code 
FROM public.mock_data 
WHERE seller_postal_code IS NOT NULL;

-- Вставка уникальных email продавцов
INSERT INTO D_SELLER_EMAILS (seller_email)
SELECT DISTINCT seller_email 
FROM public.mock_data 
WHERE seller_email IS NOT NULL;

-- Вставка данных о продавцах с ссылками на нормализованные таблицы
INSERT INTO D_SELLERS (
    seller_first_name, 
    seller_last_name, 
    seller_country_id, 
    seller_email_id, 
    seller_postal_code_id
)
SELECT 
    md.seller_first_name,
    md.seller_last_name,
    c.seller_country_id,
    e.seller_email_id,
    p.seller_postal_code_id
FROM 
    public.mock_data md
LEFT JOIN 
    D_SELLER_COUNTRIES c ON md.seller_country = c.seller_country_name
LEFT JOIN 
    D_SELLER_EMAILS e ON md.seller_email = e.seller_email
LEFT JOIN 
    D_SELLER_POSTAL_CODES p ON md.seller_postal_code = p.seller_postal_code
GROUP BY 
    md.seller_first_name,
    md.seller_last_name,
    c.seller_country_id,
    e.seller_email_id,
    p.seller_postal_code_id;