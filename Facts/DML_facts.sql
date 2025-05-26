INSERT INTO public.F_SALES (
    sale_date,
    sale_customer_id,
    sale_seller_id,
    sale_product_id,
    sale_store_id,
    supplier_id,
    sale_quantity,
    sale_total_price
)
SELECT 
--    md.sale_date,
--    dc.customer_id,
--    ds.seller_id,
--    dp.product_id,
--    dst.store_id,
--    dsp.supplier_id
	md.sale_date,
    dc.customer_id,
    ds.seller_id,
    dp.product_id,
    dst.store_id,
    dsp.supplier_id,
    md.sale_quantity,
    md.sale_total_price
FROM 
    public.mock_data md
LEFT JOIN 
    public.D_CUSTOMERS dc ON md.sale_customer_id = dc.customer_id
LEFT JOIN 
    public.D_SELLERS ds ON md.sale_seller_id = ds.seller_id
LEFT JOIN 
    public.D_PRODUCTS dp ON md.sale_product_id = dp.product_id
LEFT JOIN
    public.D_STORE_EMAILS dse ON dse.store_email = md.store_email    
LEFT JOIN
    public.D_STORES dst ON dst.store_email_id = dse.store_email_id
LEFT JOIN
    public.D_SUPPLIER_EMAILS se ON se.supplier_email = md.supplier_email
LEFT JOIN
    public.D_SUPPLIERS dsp ON dsp.supplier_email_id = se.supplier_email_id;
    