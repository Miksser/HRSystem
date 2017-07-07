--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: candidates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE candidates (
    id integer NOT NULL,
    surname text,
    first_name text,
    middle_name text,
    email text,
    phone text,
    contact_date date,
    status text
);


ALTER TABLE candidates OWNER TO postgres;

--
-- Name: TABLE candidates; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE candidates IS '
Information about the candidates';


--
-- Name: candidates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE candidates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE candidates_id_seq OWNER TO postgres;

--
-- Name: candidates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE candidates_id_seq OWNED BY candidates.id;


--
-- Name: comb_vac_cand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE comb_vac_cand (
    id integer NOT NULL,
    can_id integer,
    vac_id integer
);


ALTER TABLE comb_vac_cand OWNER TO postgres;

--
-- Name: TABLE comb_vac_cand; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE comb_vac_cand IS 'Combining vacancies with candidates';


--
-- Name: comb_vac_cand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comb_vac_cand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comb_vac_cand_id_seq OWNER TO postgres;

--
-- Name: comb_vac_cand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comb_vac_cand_id_seq OWNED BY comb_vac_cand.id;


--
-- Name: vacancy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE vacancy (
    id integer NOT NULL,
    v_name text,
    v_conditions text,
    v_respons text,
    demands text,
    salary real,
    status text,
    open_date date,
    close_date date
);


ALTER TABLE vacancy OWNER TO postgres;

--
-- Name: TABLE vacancy; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE vacancy IS 'information about the vacancy';


--
-- Name: vacancy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE vacancy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vacancy_id_seq OWNER TO postgres;

--
-- Name: vacancy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE vacancy_id_seq OWNED BY vacancy.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY candidates ALTER COLUMN id SET DEFAULT nextval('candidates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comb_vac_cand ALTER COLUMN id SET DEFAULT nextval('comb_vac_cand_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vacancy ALTER COLUMN id SET DEFAULT nextval('vacancy_id_seq'::regclass);


--
-- Data for Name: candidates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY candidates (id, surname, first_name, middle_name, email, phone, contact_date, status) FROM stdin;
7	Сиянских	Серафим	Федорович	lyejyo@langoo.com	7(72)645-19-15	2014-02-22	Новый
14	Дунин-Барковский 	Модест	Игнатиевич	vyequashios@lycos.com	7(563)203-22-52	2014-02-22	Приглашен
20	Койтасбаев	Койтасбаев	Натанович	cjuxuc@google.com\n	52(51)058-26-33	2014-02-22	Принят
2	Иванов	Иван	Иванович	ivanov@rambler.ru	+375292222222	2014-02-22	Отложен
8	Рудавин	Иосиф	Артемович	xicjuc@rol.ru	7(31)079-31-01	2014-02-22	Отклонен
1	Петровf	Петр	Петровичес	petrov@mail.ru	+375291111111	2014-02-22	Приглашен
10	Кокорев	Адам	Игнатиевич	fyem@yahoo.com	7(2744)597-91-39	2014-02-22	Новый
16	Ярыгина	Фаина	Игнатиевна	vjuquyu@nihuja.net	7(85)097-11-02	2014-02-22	Отклонен
11	Чайка	Изольда	Романовна	touvuzi@hotbox.com	7(3303)529-37-85	2014-02-22	Отложен
5	Кузьминыха	Марфа	Вячеславовна	liuzh@sexnarod.ru	7(1389)697-31-13	2014-02-22	Приглашен
18	Арсеньева	Нона	Владиленовна	ziokjulja@hob.ru	7(69)927-60-03	2014-02-22	Приглашен
3	Дмитриева	Марианна	Фомевна	mjeshuthou@exn.ru	7(741)570-00-03	2014-02-22	Принят
6	Поличева	Милена	Ивановна	qujash@email.ru	7(17)948-58-64	2014-02-22	Приглашен
19	Типалова	Владлена	Фомевна	hieliev@email.ru	7(62)478-89-96	2014-02-22	Приглашен
13	Курепина	Анфиса	Феликсовна	vif@nextmail.ru	7(3797)801-84-53	2014-02-22	Приглашен
43	Васильев	Вася	Васильич	uasa@mail.ru	123433	\N	Приглашен
25	Пупков	Пупка	Пупкович	pupinthearth@pup.com	2222327	2017-06-28	Приглашен
12	Позона	Марианна	Яновна	jyfjeka@mnogo.ru	7(801)949-38-68	2014-02-22	Приглашен
9	Белова	Фаина	Борисовна	chiupjox@umr.ru	7(847)928-04-52	2014-02-22	Приглашен
15	Кудяшова	Мария	Василиевна	hupiujy@chat.ru	7(4550)442-31-02	2014-02-22	Приглашен
95	Ивано	Петр	Валера	ooo@uri.oi	23423	2017-07-12	Приглашен
45	Пупков	Пупка	Пупкович	Oo@ppp.ri	12323	2017-06-27	Новый
4	Краевич	Яков	Архипович	jionia@langoo.com	7(0518)046-14-77	2014-02-22	Новый
114	ASDF	SDF	ASDF	ASD	SADF@AAA	2017-07-06	Новый
\.


--
-- Name: candidates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('candidates_id_seq', 114, true);


--
-- Data for Name: comb_vac_cand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comb_vac_cand (id, can_id, vac_id) FROM stdin;
4	37	2
5	37	1
207	112	7
208	112	2
220	1	9
221	1	2
222	1	7
92	109	8
93	109	2
94	109	1
97	16	7
98	110	8
99	110	9
100	110	1
101	111	8
102	111	9
226	1	10
229	1	1
233	14	11
234	20	11
235	2	11
236	8	11
237	114	9
238	114	7
239	114	2
240	114	1
245	7	12
246	14	12
247	20	12
248	7	17
249	14	17
250	20	17
251	2	17
252	8	17
\.


--
-- Name: comb_vac_cand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comb_vac_cand_id_seq', 252, true);


--
-- Data for Name: vacancy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vacancy (id, v_name, v_conditions, v_respons, demands, salary, status, open_date, close_date) FROM stdin;
9	Physician	\N	\N	\N	\N	Открыта	\N	\N
7	Dentist	\N	\N	\N	\N	Закрыта	\N	\N
2	Pharmacist	- график работы: 5/2, пн.-пт. (9-часовой рабочий день);\n- стабильность и официальное трудоустройство;\n- соц. пакет + бесплатное изучение иностранных языков (английский, испанский);\n- бесплатные занятия йогой;\n- дружный коллектив и насыщенную корпоративную жизнь;\n- возможность стать экспертом в индустрии красоты.	- прием и обработка входящих / исходящих вызовов;\n- предоставление информации консультантам по ценам / наличию средств / вопросам сервиса / коммерческим предложениям / маркетинговым акциям компании;\n- оформление заказов;\n- обработка электронных сообщений и web-чатов;\n- работа с базой данных.	- уверенно пользуешься компьютером;\n- обладаешь четкой и грамотной речью;\n- получил(а) среднее профессиональное или высшее образование;\n- любишь людей и стремишься им помогать;	20000	Открыта	\N	\N
1	Registered Nurse				30000	Закрыта	\N	\N
11	Специалист по клинигу	Рабство	Разработка ядерных ракет	В/О, опыт работы 15 лет	1	Открыта	2017-07-22	\N
12	ASDF	ASDF	ASDF	ASDF	\N	Закрыта	2017-07-04	2017-07-14
8	Computer Systems Analyst				11111	Закрыта	\N	\N
17	Торговый представитель	Возможность работы в самой быстроразвивающейся компании по производству моющих средств, находящейся на территории Беларуси.\r\nПредварительное обучение навыкам продаж\r\nВозможное обучение за счёт компании\r\nРабота в небольшой коллективе целеустремлённых людей\r\nОплата - оклад + премия:\r\nоклад - 600р\r\nпремия - начисляется по результату работы(у успешных продавцов = 1 400р)\r\nСуществует возможность возглавить отдел клининговых продаж.	Привлечение новых клиентов\r\nПроведение контрольных моек\r\nВвод на рынок РБ новых моющих средств\r\nСовместная разработка концепции продвижения моющих на рынок РБ	Опыт работы в продаже моющих средств для профессионального клининга\r\nПриродная настойчивость\r\nУмение применять всевозможные навыки для достижения поставленной цели\r\nНаличие автомобиля	11	Закрыта	2017-07-12	2017-07-08
\.


--
-- Name: vacancy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vacancy_id_seq', 17, true);


--
-- Name: candidates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY candidates
    ADD CONSTRAINT candidates_pkey PRIMARY KEY (id);


--
-- Name: comb_vac_cand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comb_vac_cand
    ADD CONSTRAINT comb_vac_cand_pkey PRIMARY KEY (id);


--
-- Name: candidates_email_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX candidates_email_uindex ON candidates USING btree (email);


--
-- Name: comb_vac_cand_can_id_vac_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX comb_vac_cand_can_id_vac_id_uindex ON comb_vac_cand USING btree (can_id, vac_id);


--
-- Name: vacancy_v_name_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX vacancy_v_name_uindex ON vacancy USING btree (v_name);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

