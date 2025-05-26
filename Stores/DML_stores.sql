INSERT INTO D_STORE_EMAILS (store_email)
SELECT DISTINCT store_email FROM public.mock_data WHERE store_email IS NOT NULL;

INSERT INTO D_STORE_PHONES (store_phone)
SELECT DISTINCT store_phone FROM public.mock_data WHERE store_phone IS NOT NULL;

INSERT INTO D_STORE_CITIES (store_city)
SELECT DISTINCT store_city FROM public.mock_data WHERE store_city IS NOT NULL;

INSERT INTO D_STORE_COUNTRIES (store_country_name)
SELECT DISTINCT store_country FROM public.mock_data WHERE store_country IS NOT NULL;

INSERT INTO D_STORE_STATES (store_state)
SELECT DISTINCT store_state FROM public.mock_data WHERE store_state IS NOT NULL;

INSERT INTO D_STORE_LOCATIONS (store_location)
SELECT DISTINCT store_location FROM public.mock_data WHERE store_location IS NOT NULL;

INSERT INTO D_STORES (store_name, store_location_id, store_city_id, store_state_id, 
                     store_country_id, store_phone_id, store_email_id)
SELECT 
    md.store_name,
    loc.store_location_id,
    city.store_city_id,
    state.store_state_id,
    country.store_country_id,
    phone.store_phone_id,
    email.store_email_id
FROM 
    public.mock_data md
LEFT JOIN D_STORE_LOCATIONS loc ON md.store_location = loc.store_location
LEFT JOIN D_STORE_CITIES city ON md.store_city = city.store_city
LEFT JOIN D_STORE_STATES state ON md.store_state = state.store_state
LEFT JOIN D_STORE_COUNTRIES country ON md.store_country = country.store_country_name
LEFT JOIN D_STORE_PHONES phone ON md.store_phone = phone.store_phone
LEFT JOIN D_STORE_EMAILS email ON md.store_email = email.store_email
GROUP BY 
    md.store_name,
    loc.store_location_id,
    city.store_city_id,
    state.store_state_id,
    country.store_country_id,
    phone.store_phone_id,
    email.store_email_id;