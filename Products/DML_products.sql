INSERT INTO D_PRODUCT_CATEGORIES (product_category)
SELECT DISTINCT product_category FROM public.mock_data WHERE product_category IS NOT NULL;

INSERT INTO D_PRODUCT_SIZES (product_size)
SELECT DISTINCT product_size FROM public.mock_data WHERE product_size IS NOT NULL;

INSERT INTO D_PRODUCT_MATERIALS (product_material)
SELECT DISTINCT product_material FROM public.mock_data WHERE product_material IS NOT NULL;

INSERT INTO D_PRODUCT_RELEASE_DATES (product_release_date)
SELECT DISTINCT product_release_date FROM public.mock_data WHERE product_release_date IS NOT NULL;

INSERT INTO D_PRODUCT_EXPIRY_DATES (product_expiry_date)
SELECT DISTINCT product_expiry_date FROM public.mock_data WHERE product_expiry_date IS NOT NULL;

INSERT INTO D_PRODUCT_COLORS (product_color)
SELECT DISTINCT product_color FROM public.mock_data WHERE product_color IS NOT NULL;

INSERT INTO D_PRODUCT_BRANDS (product_brand)
SELECT DISTINCT product_brand FROM public.mock_data WHERE product_brand IS NOT NULL;

INSERT INTO D_PRODUCTS (
    product_name,
    product_category_id,
    product_price,
    product_quantity,
    product_weight,
    product_color_id,
    product_size_id,
    product_brand_id,
    product_material_id,
    product_description,
    product_rating,
    product_reviews,
    product_release_date_id,
    product_expiry_date_id
)
SELECT 
    md.product_name,
    pc.product_category_id,
    md.product_price,
    md.product_quantity,
    md.product_weight,
    pcl.product_color_id,
    ps.product_size_id,
    pb.product_brand_id,
    pm.product_material_id,
    md.product_description,
    md.product_rating,
    md.product_reviews,
    prd.product_release_date_id,
    ped.product_expiry_date_id
FROM 
    public.mock_data md
LEFT JOIN D_PRODUCT_CATEGORIES pc ON md.product_category = pc.product_category
LEFT JOIN D_PRODUCT_COLORS pcl ON md.product_color = pcl.product_color
LEFT JOIN D_PRODUCT_SIZES ps ON md.product_size = ps.product_size
LEFT JOIN D_PRODUCT_BRANDS pb ON md.product_brand = pb.product_brand
LEFT JOIN D_PRODUCT_MATERIALS pm ON md.product_material = pm.product_material
LEFT JOIN D_PRODUCT_RELEASE_DATES prd ON md.product_release_date = prd.product_release_date
LEFT JOIN D_PRODUCT_EXPIRY_DATES ped ON md.product_expiry_date = ped.product_expiry_date
GROUP BY
    md.product_name,
    pc.product_category_id,
    md.product_price,
    md.product_quantity,
    md.product_weight,
    pcl.product_color_id,
    ps.product_size_id,
    pb.product_brand_id,
    pm.product_material_id,
    md.product_description,
    md.product_rating,
    md.product_reviews,
    prd.product_release_date_id,
    ped.product_expiry_date_id;