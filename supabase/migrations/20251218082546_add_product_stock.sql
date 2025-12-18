alter table public.products 
add column stock_quantity integer default 0 not null,
add column in_stock boolean generated always as (stock_quantity > 0) stored;