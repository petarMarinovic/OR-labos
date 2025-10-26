--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-10-26 18:24:57

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 19029)
-- Name: albums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.albums (
    album_id integer NOT NULL,
    naziv character varying(150) NOT NULL,
    izvodjac character varying(150) NOT NULL,
    godina integer NOT NULL,
    zanr character varying(100) NOT NULL,
    broj_pjesama integer NOT NULL,
    trajanje_min integer NOT NULL,
    izdavacka_kuca character varying(150) NOT NULL,
    zemlja character varying(100),
    is_platinum boolean NOT NULL,
    format character varying(50)
);


ALTER TABLE public.albums OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 19028)
-- Name: albums_album_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.albums_album_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.albums_album_id_seq OWNER TO postgres;

--
-- TOC entry 4906 (class 0 OID 0)
-- Dependencies: 217
-- Name: albums_album_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.albums_album_id_seq OWNED BY public.albums.album_id;


--
-- TOC entry 220 (class 1259 OID 19038)
-- Name: songs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.songs (
    song_id integer NOT NULL,
    album_id integer,
    naziv_pjesme character varying(200) NOT NULL,
    trajanje_minute numeric(5,2) NOT NULL,
    redni_broj integer NOT NULL
);


ALTER TABLE public.songs OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 19037)
-- Name: songs_song_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.songs_song_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.songs_song_id_seq OWNER TO postgres;

--
-- TOC entry 4907 (class 0 OID 0)
-- Dependencies: 219
-- Name: songs_song_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.songs_song_id_seq OWNED BY public.songs.song_id;


--
-- TOC entry 4745 (class 2604 OID 19032)
-- Name: albums album_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums ALTER COLUMN album_id SET DEFAULT nextval('public.albums_album_id_seq'::regclass);


--
-- TOC entry 4746 (class 2604 OID 19041)
-- Name: songs song_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs ALTER COLUMN song_id SET DEFAULT nextval('public.songs_song_id_seq'::regclass);


--
-- TOC entry 4898 (class 0 OID 19029)
-- Dependencies: 218
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.albums (album_id, naziv, izvodjac, godina, zanr, broj_pjesama, trajanje_min, izdavacka_kuca, zemlja, is_platinum, format) FROM stdin;
1	The Dark Side of the Moon	Pink Floyd	1973	Progressive Rock	10	43	Harvest Records	Ujedinjeno Kraljevstvo	t	Vinyl
2	Thriller	Michael Jackson	1982	Pop	9	42	Epic Records	Sjedinjene Američke Države	t	CD
3	Back in Black	AC/DC	1980	Hard Rock	10	42	Atlantic Records	Australija	t	Vinyl
4	Abbey Road	The Beatles	1969	Rock	17	47	Apple Records	Ujedinjeno Kraljevstvo	t	Vinyl
5	Rumours	Fleetwood Mac	1977	Rock	11	40	Warner Bros	Sjedinjene Američke Države	t	Vinyl
6	Nevermind	Nirvana	1991	Grunge	12	43	DGC Records	Sjedinjene Američke Države	t	CD
7	Led Zeppelin IV	Led Zeppelin	1971	Hard rock	8	42	Atlantic Records	Ujedinjeno Kraljevstvo	t	Vinyl
8	The Wall	Pink Floyd	1979	Progressive rock	26	81	Harvest Records	Ujedinjeno Kraljevstvo	t	Vinyl
9	A Great Chaos	Ken Carson	2024	Rage rap	25	65	Opium/Interscope Records	Sjedinjene Američke Države	t	Digital
10	OK Computer	Radiohead	1997	Alternative rock	12	53	Parlophone	Ujedinjeno Kraljevstvo	f	CD
\.


--
-- TOC entry 4900 (class 0 OID 19038)
-- Dependencies: 220
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.songs (song_id, album_id, naziv_pjesme, trajanje_minute, redni_broj) FROM stdin;
1	1	Speak to Me	1.50	1
2	1	Breathe	2.72	2
3	1	On the Run	3.60	3
4	1	Time	6.88	4
5	1	The Great Gig in the Sky	4.72	5
6	1	Money	6.50	6
7	1	Us and Them	7.82	7
8	1	Any Colour You Like	3.45	8
9	1	Brain Damage	3.78	9
10	1	Eclipse	2.05	10
11	2	Wanna Be Startin Somethin	6.05	1
12	2	Baby Be Mine	4.33	2
13	2	The Girl Is Mine	3.70	3
14	2	Thriller	5.95	4
15	2	Beat It	4.30	5
16	2	Billie Jean	4.92	6
17	2	Human Nature	4.10	7
18	2	P.Y.T.	3.97	8
19	2	The Lady in My Life	5.00	9
20	3	Hells Bells	5.20	1
21	3	Shoot to Thrill	5.28	2
22	3	What Do You Do for Money Honey	3.55	3
23	3	Given the Dog a Bone	3.48	4
24	3	Let Me Put My Love into You	4.23	5
25	3	Back in Black	4.25	6
26	3	You Shook Me All Night Long	3.50	7
27	3	Have a Drink on Me	3.98	8
28	3	Shake a Leg	4.05	9
29	3	Rock and Roll Ain't Noise Pollution	4.25	10
30	4	Come Together	4.33	1
31	4	Something	3.03	2
32	4	Maxwell s Silver Hammer	3.45	3
33	4	Oh! Darling	3.47	4
34	4	Octopus's Garden	2.85	5
35	4	I Want You	7.80	6
36	4	Here Comes the Sun	3.08	7
37	4	Because	2.70	8
38	4	You Never Give Me Your Money	4.03	9
39	4	Sun King	2.45	10
40	4	Mean Mr. Mustard	1.10	11
41	4	Polythene Pam	1.22	12
42	4	She Came in Through the Bathroom Window	1.97	13
43	4	Golden Slumbers	1.60	14
44	4	Carry That Weight	1.63	15
45	4	The End	2.33	16
46	4	Her Majesty	0.38	17
47	5	Second Hand News	2.72	1
48	5	Dreams	4.25	2
49	5	Never Going Back Again	2.10	3
50	5	Don't Stop	3.20	4
51	5	Go Your Own Way	3.65	5
52	5	Songbird	3.35	6
53	5	The Chain	4.50	7
54	5	You Make Loving Fun	3.58	8
55	5	I Don't Want to Know	3.20	9
56	5	Oh Daddy	3.93	10
57	5	Gold Dust Woman	4.83	11
58	6	Smells Like Teen Spirit	5.02	1
59	6	In Bloom	4.23	2
60	6	Come as You Are	3.72	3
61	6	Breed	3.05	4
62	6	Lithium	4.28	5
63	6	Polly	2.95	6
64	6	Territorial Pissings	2.38	7
65	6	Drain You	3.72	8
66	6	Lounge Act	2.62	9
67	6	Stay Away	3.55	10
68	6	On a Plain	3.27	11
69	6	Something in the Way	3.93	12
70	7	Black Dog	4.97	1
71	7	Rock and Roll	3.67	2
72	7	The Battle of Evermore	5.85	3
73	7	Stairway to Heaven	8.03	4
74	7	Misty Mountain Hop	4.63	5
75	7	Four Sticks	4.73	6
76	7	Going to California	3.52	7
77	7	When the Levee Breaks	7.08	8
78	8	In the Flesh?	3.33	1
79	8	The Thin Ice	2.50	2
80	8	Another Brick in the Wall (Part 1)	3.17	3
81	8	The Happiest Days of Our Lives	1.80	4
82	8	Another Brick in the Wall (Part 2)	3.97	5
83	8	Mother	5.57	6
84	8	Goodbye Blue Sky	2.75	7
85	8	Empty Spaces	2.17	8
86	8	Young Lust	3.42	9
87	8	One of My Turns	3.70	10
88	8	Don't Leave Me Now	4.25	11
89	8	Another Brick in the Wall (Part 3)	1.28	12
90	8	Goodbye Cruel World	1.22	13
91	8	Hey You	4.67	14
92	8	Is There Anybody Out There?	2.60	15
93	8	Nobody Home	3.42	16
94	8	Vera	1.58	17
95	8	Bring the Boys Back Home	1.35	18
96	8	Comfortably Numb	6.37	19
97	8	The Show Must Go On	1.58	20
98	8	In the Flesh	4.30	21
99	8	Run Like Hell	4.33	22
100	8	Waiting for the Worms	4.00	23
101	8	Stop	0.50	24
102	8	The Trial	5.22	25
103	8	Outside the Wall	1.68	26
104	9	Nightcore Princess	1.83	1
105	9	It's Over	2.12	2
106	9	Lose It	2.50	3
107	9	Fighting My Demons	2.77	4
108	9	Hardcore	2.35	5
109	9	Green Room	3.08	6
110	9	Aimless	2.47	7
111	9	Like This	2.18	8
112	9	Styles	2.57	9
113	9	Jennifer's Body	3.22	10
114	9	Succubus	2.88	11
115	9	Rockstar Lifestyle	2.50	12
116	9	Jewelry	2.65	13
117	9	Break 'Em Down	2.93	14
118	9	Paranoid	2.70	15
119	9	Overseas	2.42	16
120	9	Vampire Hour	2.80	17
121	9	Nightcore 2	1.95	18
122	9	Me N My Kup	3.15	19
123	9	GoPro	2.33	20
124	9	Bad Day	2.58	21
125	9	Hardcore 2	2.47	22
126	9	Paranoid 2	2.68	23
127	9	Green Room Pt. 2	2.92	24
128	9	Lose It 2	2.38	25
129	10	Airbag	4.73	1
130	10	Paranoid Android	6.38	2
131	10	Subterranean Homesick Alien	4.45	3
132	10	Exit Music (For a Film)	4.42	4
133	10	Let Down	4.98	5
134	10	Karma Police	4.35	6
135	10	Fitter Happier	1.97	7
136	10	Electioneering	3.83	8
137	10	Climbing Up the Walls	4.75	9
138	10	No Surprises	3.85	10
139	10	Lucky	4.32	11
140	10	The Tourist	5.25	12
\.


--
-- TOC entry 4908 (class 0 OID 0)
-- Dependencies: 217
-- Name: albums_album_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.albums_album_id_seq', 10, true);


--
-- TOC entry 4909 (class 0 OID 0)
-- Dependencies: 219
-- Name: songs_song_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.songs_song_id_seq', 140, true);


--
-- TOC entry 4748 (class 2606 OID 19036)
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (album_id);


--
-- TOC entry 4750 (class 2606 OID 19043)
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (song_id);


--
-- TOC entry 4751 (class 2606 OID 19044)
-- Name: songs songs_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums(album_id);


-- Completed on 2025-10-26 18:24:58

--
-- PostgreSQL database dump complete
--

