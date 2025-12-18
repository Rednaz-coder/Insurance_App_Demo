create table public.products (
  id uuid default gen_random_uuid() primary key,
  name text not null,
  description text,
  price numeric(10,2),
  created_at timestamp with time zone default now()
);

alter table public.products enable row level security;

create policy "Anyone can view products"
on public.products for select to public using (true);