create extension if not exists "pgjwt" with schema "extensions";


  create table "public"."instruments" (
    "id" bigint generated always as identity not null,
    "name" text not null,
    "rating" smallint
      );


alter table "public"."instruments" enable row level security;


  create table "public"."products" (
    "id" uuid not null default gen_random_uuid(),
    "name" text not null,
    "description" text,
    "price" numeric(10,2),
    "created_at" timestamp with time zone not null default timezone('utc'::text, now())
      );


alter table "public"."products" enable row level security;

CREATE UNIQUE INDEX instruments_pkey ON public.instruments USING btree (id);

CREATE UNIQUE INDEX products_pkey ON public.products USING btree (id);

alter table "public"."instruments" add constraint "instruments_pkey" PRIMARY KEY using index "instruments_pkey";

alter table "public"."products" add constraint "products_pkey" PRIMARY KEY using index "products_pkey";

grant delete on table "public"."instruments" to "anon";

grant insert on table "public"."instruments" to "anon";

grant references on table "public"."instruments" to "anon";

grant select on table "public"."instruments" to "anon";

grant trigger on table "public"."instruments" to "anon";

grant truncate on table "public"."instruments" to "anon";

grant update on table "public"."instruments" to "anon";

grant delete on table "public"."instruments" to "authenticated";

grant insert on table "public"."instruments" to "authenticated";

grant references on table "public"."instruments" to "authenticated";

grant select on table "public"."instruments" to "authenticated";

grant trigger on table "public"."instruments" to "authenticated";

grant truncate on table "public"."instruments" to "authenticated";

grant update on table "public"."instruments" to "authenticated";

grant delete on table "public"."instruments" to "service_role";

grant insert on table "public"."instruments" to "service_role";

grant references on table "public"."instruments" to "service_role";

grant select on table "public"."instruments" to "service_role";

grant trigger on table "public"."instruments" to "service_role";

grant truncate on table "public"."instruments" to "service_role";

grant update on table "public"."instruments" to "service_role";

grant delete on table "public"."products" to "anon";

grant insert on table "public"."products" to "anon";

grant references on table "public"."products" to "anon";

grant select on table "public"."products" to "anon";

grant trigger on table "public"."products" to "anon";

grant truncate on table "public"."products" to "anon";

grant update on table "public"."products" to "anon";

grant delete on table "public"."products" to "authenticated";

grant insert on table "public"."products" to "authenticated";

grant references on table "public"."products" to "authenticated";

grant select on table "public"."products" to "authenticated";

grant trigger on table "public"."products" to "authenticated";

grant truncate on table "public"."products" to "authenticated";

grant update on table "public"."products" to "authenticated";

grant delete on table "public"."products" to "postgres";

grant insert on table "public"."products" to "postgres";

grant references on table "public"."products" to "postgres";

grant select on table "public"."products" to "postgres";

grant trigger on table "public"."products" to "postgres";

grant truncate on table "public"."products" to "postgres";

grant update on table "public"."products" to "postgres";

grant delete on table "public"."products" to "service_role";

grant insert on table "public"."products" to "service_role";

grant references on table "public"."products" to "service_role";

grant select on table "public"."products" to "service_role";

grant trigger on table "public"."products" to "service_role";

grant truncate on table "public"."products" to "service_role";

grant update on table "public"."products" to "service_role";


  create policy "public can read instruments"
  on "public"."instruments"
  as permissive
  for select
  to authenticated, anon
using (true);



  create policy "Anyone can view products"
  on "public"."products"
  as permissive
  for select
  to public
using (true);



