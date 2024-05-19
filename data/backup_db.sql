--
-- PostgreSQL database cluster dump
--

-- Started on 2024-05-19 17:22:37

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.18 (Debian 12.18-1.pgdg120+2)
-- Dumped by pg_dump version 15.3

-- Started on 2024-05-19 17:22:37

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2975 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-05-19 17:22:37

--
-- PostgreSQL database dump complete
--

--
-- Database "lab_one" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.18 (Debian 12.18-1.pgdg120+2)
-- Dumped by pg_dump version 15.3

-- Started on 2024-05-19 17:22:37

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2975 (class 1262 OID 16384)
-- Name: lab_one; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE lab_one WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE lab_one OWNER TO postgres;

\connect lab_one

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-05-19 17:22:37

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.18 (Debian 12.18-1.pgdg120+2)
-- Dumped by pg_dump version 15.3

-- Started on 2024-05-19 17:22:37

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 202 (class 1259 OID 16430)
-- Name: costume_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.costume_tb (
    transaction_id uuid NOT NULL,
    id uuid NOT NULL,
    lease_date timestamp without time zone NOT NULL,
    recv text NOT NULL,
    event_addres text NOT NULL,
    costume_name text NOT NULL,
    condition boolean NOT NULL
);


ALTER TABLE public.costume_tb OWNER TO postgres;

--
-- TOC entry 2977 (class 0 OID 16430)
-- Dependencies: 202
-- Data for Name: costume_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.costume_tb (transaction_id, id, lease_date, recv, event_addres, costume_name, condition) FROM stdin;
34489da1-94f9-48f0-9275-a0e926a93630	c0a5e274-cc20-47cb-9733-f08b5a52f9ce	2024-04-01 12:05:06	Илья Петров	Зал 1	Зеленые сапоги	t
5eb26ec6-f9a6-4cf6-a21b-58a23a9d8027	bf86b7a9-707f-4494-9436-b6fdedd0c8e0	2024-04-02 12:05:06.001	Анна Левина	Зал 3	Платье Снегурочки	t
0b6674c0-1f91-414d-8f3f-5cbd00026cc9	9fa50acd-5f4e-4237-9db7-fc1a3b356a50	2024-04-03 12:05:06.002	Петр Авен	Зал 3	Корона императора	t
3af05527-947e-4abf-a36b-2988facc4155	c0a5e274-cc20-47cb-9733-f08b5a52f9ce	2024-04-04 12:05:06.003	Максим Иванов	Зал 3	Зеленые сапоги	t
1303f988-6780-42f5-8af8-4aa50a9afa5f	bf86b7a9-707f-4494-9436-b6fdedd0c8e0	2024-04-05 12:05:06.004	Карина Смирнова	Зал 1	Платье Снегурочки	t
f6c982c6-6302-4ce0-bbc7-16c07ff658c5	9fa50acd-5f4e-4237-9db7-fc1a3b356a50	2024-04-06 12:05:06.005	Олег Колосов	Зал 8	Корона императора	t
877d4158-0074-49f7-887b-7620abe076a1	c0a5e274-cc20-47cb-9733-f08b5a52f9ce	2024-04-07 12:05:06.006	Иван Гарин	Зал 4	Зеленые сапоги	t
4381961e-92da-4659-b5ed-b8eccfaa0865	bf86b7a9-707f-4494-9436-b6fdedd0c8e0	2024-04-08 12:05:06.007	Алевтина Табакова	Зал 12	Платье Снегурочки	f
1cc0e60e-df58-4b6b-b1d8-a5f81aff6a6f	9fa50acd-5f4e-4237-9db7-fc1a3b356a50	2024-04-09 12:05:06.008	Владислав Никулин	Зал 11	Корона императора	t
b9923e21-2f85-4511-8f0c-0bde2ce6e86d	c0a5e274-cc20-47cb-9733-f08b5a52f9ce	2024-04-10 12:05:06.009	Сергей Николаев	Зал 8	Зеленые сапоги	f
\.


--
-- TOC entry 2850 (class 2606 OID 16437)
-- Name: costume_tb costume_tb_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.costume_tb
    ADD CONSTRAINT costume_tb_pk PRIMARY KEY (transaction_id);


--
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-05-19 17:22:37

--
-- PostgreSQL database dump complete
--

-- Completed on 2024-05-19 17:22:37

--
-- PostgreSQL database cluster dump complete
--

