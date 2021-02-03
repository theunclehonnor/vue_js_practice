--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7
-- Dumped by pg_dump version 11.7

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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: candidate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.candidate (
    id_candidate integer NOT NULL,
    profession character varying(100) NOT NULL,
    city character varying(100) NOT NULL,
    photo character varying(255),
    tel numeric(10,0) NOT NULL,
    full_name character varying(150) NOT NULL,
    email character varying(150) NOT NULL,
    birthday date NOT NULL,
    wage numeric NOT NULL,
    skills text NOT NULL,
    about text NOT NULL,
    status character varying(150) NOT NULL
);


ALTER TABLE public.candidate OWNER TO postgres;

--
-- Name: candidate_id_candidate_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.candidate_id_candidate_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.candidate_id_candidate_seq OWNER TO postgres;

--
-- Name: candidate_id_candidate_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.candidate_id_candidate_seq OWNED BY public.candidate.id_candidate;


--
-- Name: education; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.education (
    id_educ integer NOT NULL,
    id_candidate integer,
    degree character varying(25) NOT NULL,
    education_university character varying(255),
    faculty character varying(255),
    specialization character varying(255),
    year_end integer
);


ALTER TABLE public.education OWNER TO postgres;

--
-- Name: education_id_educ_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.education_id_educ_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.education_id_educ_seq OWNER TO postgres;

--
-- Name: education_id_educ_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.education_id_educ_seq OWNED BY public.education.id_educ;


--
-- Name: candidate id_candidate; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate ALTER COLUMN id_candidate SET DEFAULT nextval('public.candidate_id_candidate_seq'::regclass);


--
-- Name: education id_educ; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.education ALTER COLUMN id_educ SET DEFAULT nextval('public.education_id_educ_seq'::regclass);


--
-- Data for Name: candidate; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.candidate VALUES (1, 'Охранник', 'Воронеж', 'https://vgudok.com/sites/default/files/field/image/borodach.jpg', 12859208, 'Гузинов Александр Радионович', 'radion13@mail.ru', '1979-07-31', 11000, 'Охранять, догонять, приследовать, улыбаться', 'Охранник ТЦ "Хлебушек" в городе Грязи', 'Отказ');
INSERT INTO public.candidate VALUES (2, 'Senior Engineer', 'Москва', 'https://i.stack.imgur.com/6ql7m.jpg', 9992839, 'Врайчайзи Азиз Дэлявив', 'aizik@gmail.com', '1992-03-25', 200000, 'Python, vue, node, npm, php, asyncho, flask, django', 'Хочу к вам на работу!', 'Назначено собеседование');
INSERT INTO public.candidate VALUES (57, 'Старший программист', 'Липецк', 'https://adukar.by/images/photo/stazhirovki-belarus-5.jpg', 1234125, 'Змеев Илья Валерьевич', 'zmeev@yandex.ru', '1988-10-26', 24000, 'Преподаю, кодю, играю', 'Квалифицированный специалист в it сфере, узнаю о самый последних событиях раньше всех', 'Назначено собеседование');
INSERT INTO public.candidate VALUES (60, 'Junior python developer', 'Москва', 'https://don24.ru/uploads/2018/%D1%81%D0%B5%D0%BD%D1%82%D1%8F%D0%B1%D1%80%D1%8C/%D1%8F%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%81%D1%82-5b9a3d2ca47e9.jpg', 192383, 'Гришин Антон Ильич', 'grishka_shishka@gmail.ru', '1998-05-20', 99000, 'Python, flask, django, vue, php, symfony, postgresql', 'Закончил школу', 'Новый');
INSERT INTO public.candidate VALUES (61, 'Fullstack Developer', 'Москва', 'https://topobrazovanie.ru/wp-content/uploads/2019/02/csm_iStock-473983321_6e84ef194b.jpg', 9912384, 'Ибрагимов Мурат Тхагирович', 'muratino999@gmail.com', '1989-12-14', 250000, 'vue, js, java, php, mysql, postgresql, python, symfony, flask, django, c++, c#, ruby, go, laravel', '-', 'Принят');


--
-- Data for Name: education; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.education VALUES (7, 2, 'Среднее', NULL, NULL, NULL, NULL);
INSERT INTO public.education VALUES (18, 1, 'Среднее', NULL, NULL, NULL, NULL);
INSERT INTO public.education VALUES (9, 57, 'Среднее', NULL, NULL, NULL, NULL);
INSERT INTO public.education VALUES (8, 57, 'Среднее специальное', 'ЛГПУ им. П. П. Семенова-Тян-Шанского', 'Педагогики и иностранного языка', 'Математик-педагог', 2008);
INSERT INTO public.education VALUES (19, 61, 'Высшее', 'МГТУ им. Н. Э. Баумана', 'Информатики', 'Информационная безопасность', 2000);


--
-- Name: candidate_id_candidate_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.candidate_id_candidate_seq', 61, true);


--
-- Name: education_id_educ_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.education_id_educ_seq', 19, true);


--
-- Name: candidate pk_candidate; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.candidate
    ADD CONSTRAINT pk_candidate PRIMARY KEY (id_candidate);


--
-- Name: education pk_education; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.education
    ADD CONSTRAINT pk_education PRIMARY KEY (id_educ);


--
-- Name: education_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX education_pk ON public.education USING btree (id_educ);


--
-- Name: have_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX have_fk ON public.education USING btree (id_candidate);


--
-- Name: education fk_educatio_have_candidate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.education
    ADD CONSTRAINT fk_educatio_have_candidate FOREIGN KEY (id_candidate) REFERENCES public.candidate(id_candidate) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

