
  create table "public"."product_images" (
    "id" uuid not null default gen_random_uuid(),
    "product_id" uuid not null,
    "image_url" text not null,
    "alt_text" text,
    "display_order" integer not null default 0,
    "is_primary" boolean not null default false,
    "created_at" timestamp with time zone not null default now()
      );


alter table "public"."product_images" enable row level security;

CREATE INDEX product_images_display_order_idx ON public.product_images USING btree (product_id, display_order);

CREATE UNIQUE INDEX product_images_pkey ON public.product_images USING btree (id);

CREATE INDEX product_images_product_id_idx ON public.product_images USING btree (product_id);

alter table "public"."product_images" add constraint "product_images_pkey" PRIMARY KEY using index "product_images_pkey";

alter table "public"."product_images" add constraint "product_images_product_id_fkey" FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE not valid;

alter table "public"."product_images" validate constraint "product_images_product_id_fkey";

create or replace view "public"."products_with_images" as  SELECT p.id,
    p.name,
    p.description,
    p.price,
    p.created_at,
    p.stock_quantity,
    p.low_stock_threshold,
    p.in_stock,
    pi.image_url AS primary_image_url,
    pi.alt_text AS primary_image_alt
   FROM (public.products p
     LEFT JOIN public.product_images pi ON (((p.id = pi.product_id) AND (pi.is_primary = true))));


grant delete on table "public"."product_images" to "anon";

grant insert on table "public"."product_images" to "anon";

grant references on table "public"."product_images" to "anon";

grant select on table "public"."product_images" to "anon";

grant trigger on table "public"."product_images" to "anon";

grant truncate on table "public"."product_images" to "anon";

grant update on table "public"."product_images" to "anon";

grant delete on table "public"."product_images" to "authenticated";

grant insert on table "public"."product_images" to "authenticated";

grant references on table "public"."product_images" to "authenticated";

grant select on table "public"."product_images" to "authenticated";

grant trigger on table "public"."product_images" to "authenticated";

grant truncate on table "public"."product_images" to "authenticated";

grant update on table "public"."product_images" to "authenticated";

grant delete on table "public"."product_images" to "postgres";

grant insert on table "public"."product_images" to "postgres";

grant references on table "public"."product_images" to "postgres";

grant select on table "public"."product_images" to "postgres";

grant trigger on table "public"."product_images" to "postgres";

grant truncate on table "public"."product_images" to "postgres";

grant update on table "public"."product_images" to "postgres";

grant delete on table "public"."product_images" to "service_role";

grant insert on table "public"."product_images" to "service_role";

grant references on table "public"."product_images" to "service_role";

grant select on table "public"."product_images" to "service_role";

grant trigger on table "public"."product_images" to "service_role";

grant truncate on table "public"."product_images" to "service_role";

grant update on table "public"."product_images" to "service_role";


  create policy "Anyone can upload product images"
  on "public"."product_images"
  as permissive
  for insert
  to public
with check (true);



  create policy "Anyone can view product images"
  on "public"."product_images"
  as permissive
  for select
  to public
using (true);



