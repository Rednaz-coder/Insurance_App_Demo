SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict 1aBtSqi9PMjeTqkJLfbbixVLdnzKzhVjQXsLiiFLsBjV34oaPsdBaOeIEjWsGHy

-- Dumped from database version 15.8
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
-- SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."audit_log_entries" ("instance_id", "id", "payload", "created_at", "ip_address") VALUES
	('00000000-0000-0000-0000-000000000000', '0623667c-d9f9-4f9b-80af-a901a2d68a1c', '{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"zander@gabzus.co.za","user_id":"c3ada5ed-b670-4068-96e4-685415b613e4","user_phone":""}}', '2025-12-17 15:19:19.053197+00', ''),
	('00000000-0000-0000-0000-000000000000', '5fcc05c0-a354-45c6-baca-882dc96a7b64', '{"action":"login","actor_id":"c3ada5ed-b670-4068-96e4-685415b613e4","actor_username":"zander@gabzus.co.za","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-12-17 15:20:28.669359+00', '');


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") VALUES
	('00000000-0000-0000-0000-000000000000', 'c3ada5ed-b670-4068-96e4-685415b613e4', 'authenticated', 'authenticated', 'zander@gabzus.co.za', '$2a$10$20kkSkMLA8boYSZRXNpIIOV/3xaKgGMTIhFrEgV99fnJ6bShIIt3y', '2025-12-17 15:19:19.054966+00', NULL, '', NULL, '', NULL, '', '', NULL, '2025-12-17 15:20:28.670076+00', '{"provider": "email", "providers": ["email"]}', '{"email_verified": true}', NULL, '2025-12-17 15:19:19.048589+00', '2025-12-17 15:20:28.673872+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false);


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") VALUES
	('c3ada5ed-b670-4068-96e4-685415b613e4', 'c3ada5ed-b670-4068-96e4-685415b613e4', '{"sub": "c3ada5ed-b670-4068-96e4-685415b613e4", "email": "zander@gabzus.co.za", "email_verified": false, "phone_verified": false}', 'email', '2025-12-17 15:19:19.05189+00', '2025-12-17 15:19:19.051955+00', '2025-12-17 15:19:19.051955+00', '8736a24a-92dd-4f80-8e91-71038f5da830');


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag") VALUES
	('d19d1b19-c41d-4a78-9943-3dd5704a93f3', 'c3ada5ed-b670-4068-96e4-685415b613e4', '2025-12-17 15:20:28.670154+00', '2025-12-17 15:20:28.670154+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', '213.172.155.58', NULL);


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") VALUES
	('d19d1b19-c41d-4a78-9943-3dd5704a93f3', '2025-12-17 15:20:28.674468+00', '2025-12-17 15:20:28.674468+00', 'password', '0bae4614-ae99-4917-b1ff-6401bf281e51');


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") VALUES
	('00000000-0000-0000-0000-000000000000', 1, 'p2ioqonmaxfy', 'c3ada5ed-b670-4068-96e4-685415b613e4', false, '2025-12-17 15:20:28.671657+00', '2025-12-17 15:20:28.671657+00', NULL, 'd19d1b19-c41d-4a78-9943-3dd5704a93f3');


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: instruments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."instruments" ("id", "name", "rating") OVERRIDING SYSTEM VALUE VALUES
	(1, 'violin', 8),
	(2, 'viola', 8),
	(3, 'cello', 9);


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 1, true);


--
-- Name: instruments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."instruments_id_seq"', 3, true);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('"supabase_functions"."hooks_id_seq"', 1, false);


--
-- PostgreSQL database dump complete
--

-- \unrestrict 1aBtSqi9PMjeTqkJLfbbixVLdnzKzhVjQXsLiiFLsBjV34oaPsdBaOeIEjWsGHy

RESET ALL;
