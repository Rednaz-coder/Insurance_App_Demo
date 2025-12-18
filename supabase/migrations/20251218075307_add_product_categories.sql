create table public.categories (
  id uuid default gen_random_uuid() primary key,
  name text not null unique,
  description text,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Add foreign key to products
alter table public.products 
add column category_id uuid references public.categories(id);

alter table public.categories enable row level security;

create policy "Anyone can view categories"
  on public.categories
  for select
  to public
  using (true);