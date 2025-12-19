-- Create stock movements table first
create table "public"."stock_movements" (
    "id" uuid not null default gen_random_uuid(),
    "product_id" uuid not null,
    "quantity_change" integer not null,
    "reason" text not null,
    "notes" text,
    "created_by" text,
    "created_at" timestamp with time zone not null default now()
);

alter table "public"."stock_movements" enable row level security;

-- Add columns to products in correct order
-- 1. Add stock_quantity first
alter table "public"."products" add column "stock_quantity" integer not null default 0;

-- 2. Add low_stock_threshold second
alter table "public"."products" add column "low_stock_threshold" integer not null default 10;

-- 3. Add computed column last (after stock_quantity exists)
alter table "public"."products" add column "in_stock" boolean generated always as ((stock_quantity > 0)) stored;

-- Create indexes
CREATE INDEX stock_movements_created_at_idx ON public.stock_movements USING btree (created_at DESC);

CREATE UNIQUE INDEX stock_movements_pkey ON public.stock_movements USING btree (id);

CREATE INDEX stock_movements_product_id_idx ON public.stock_movements USING btree (product_id);

-- Add constraints
alter table "public"."stock_movements" add constraint "stock_movements_pkey" PRIMARY KEY using index "stock_movements_pkey";

alter table "public"."stock_movements" add constraint "stock_movements_product_id_fkey" FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE not valid;

alter table "public"."stock_movements" validate constraint "stock_movements_product_id_fkey";

-- Grant permissions on products (existing table)
grant delete on table "public"."products" to "postgres";
grant insert on table "public"."products" to "postgres";
grant references on table "public"."products" to "postgres";
grant select on table "public"."products" to "postgres";
grant trigger on table "public"."products" to "postgres";
grant truncate on table "public"."products" to "postgres";
grant update on table "public"."products" to "postgres";

-- Grant permissions on stock_movements
grant delete on table "public"."stock_movements" to "anon";
grant insert on table "public"."stock_movements" to "anon";
grant references on table "public"."stock_movements" to "anon";
grant select on table "public"."stock_movements" to "anon";
grant trigger on table "public"."stock_movements" to "anon";
grant truncate on table "public"."stock_movements" to "anon";
grant update on table "public"."stock_movements" to "anon";

grant delete on table "public"."stock_movements" to "authenticated";
grant insert on table "public"."stock_movements" to "authenticated";
grant references on table "public"."stock_movements" to "authenticated";
grant select on table "public"."stock_movements" to "authenticated";
grant trigger on table "public"."stock_movements" to "authenticated";
grant truncate on table "public"."stock_movements" to "authenticated";
grant update on table "public"."stock_movements" to "authenticated";

grant delete on table "public"."stock_movements" to "postgres";
grant insert on table "public"."stock_movements" to "postgres";
grant references on table "public"."stock_movements" to "postgres";
grant select on table "public"."stock_movements" to "postgres";
grant trigger on table "public"."stock_movements" to "postgres";
grant truncate on table "public"."stock_movements" to "postgres";
grant update on table "public"."stock_movements" to "postgres";

grant delete on table "public"."stock_movements" to "service_role";
grant insert on table "public"."stock_movements" to "service_role";
grant references on table "public"."stock_movements" to "service_role";
grant select on table "public"."stock_movements" to "service_role";
grant trigger on table "public"."stock_movements" to "service_role";
grant truncate on table "public"."stock_movements" to "service_role";
grant update on table "public"."stock_movements" to "service_role";

-- Policies
create policy "Anyone can create stock movements"
on "public"."stock_movements"
as permissive
for insert
to public
with check (true);

create policy "Anyone can view stock movements"
on "public"."stock_movements"
as permissive
for select
to public
using (true);

-- Update existing products with initial stock
update "public"."products" 
set stock_quantity = 100, low_stock_threshold = 20
where name = 'Sample Product';

-- Add initial stock movement record
insert into "public"."stock_movements" (product_id, quantity_change, reason, notes)
select id, 100, 'Initial Stock', 'Starting inventory'
from "public"."products" 
where name = 'Sample Product';