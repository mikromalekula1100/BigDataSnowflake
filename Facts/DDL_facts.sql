CREATE TABLE public.F_SALES (
    sale_id SERIAL PRIMARY KEY,
    sale_date varchar(50) not NULL,
    sale_customer_id integer not NULL,
    sale_seller_id integer not NULL,
    sale_product_id integer not NULL,
    sale_store_id integer not null,
    
    supplier_id integer not null,
    
    sale_quantity integer not NULL,
    sale_total_price real not NULL,
    
    CONSTRAINT fk_customer FOREIGN KEY (sale_customer_id) REFERENCES public.D_CUSTOMERS(customer_id),
    CONSTRAINT fk_seller FOREIGN KEY (sale_seller_id) REFERENCES public.D_SELLERS(seller_id),
    CONSTRAINT fk_product FOREIGN KEY (sale_product_id) REFERENCES public.D_PRODUCTS(product_id),
    CONSTRAINT fk_store FOREIGN KEY (sale_store_id) REFERENCES public.D_STORES(store_id),
    CONSTRAINT fk_supplier FOREIGN KEY (supplier_id) REFERENCES public.D_SUPPLIERS(supplier_id);
);
