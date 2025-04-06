--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2025-04-07 02:18:35

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

--
-- TOC entry 2 (class 3079 OID 55609)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 5710 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 223 (class 1259 OID 56687)
-- Name: tehran_laptop_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tehran_laptop_tb (
    id character varying NOT NULL,
    geom public.geometry(Point,4326),
    "@id" character varying,
    "addr:city" character varying,
    "addr:country" character varying,
    "addr:housenumber" character varying,
    "addr:place" character varying,
    "addr:postcode" character varying,
    "addr:street" character varying,
    "addr:unit" character varying,
    air_conditioning character varying,
    brand character varying,
    "contact:email" character varying,
    "contact:instagram" character varying,
    "contact:mobile" character varying,
    "contact:phone" character varying,
    "contact:website" character varying,
    "currency:IRR" character varying,
    description character varying,
    ele character varying,
    email character varying,
    fax character varying,
    fixme character varying,
    image character varying,
    internet_access character varying,
    "internet_access:fee" character varying,
    level character varying,
    mobile character varying,
    name character varying,
    "name:ar" character varying,
    "name:en" character varying,
    "name:fa" character varying,
    note character varying,
    opening_hours character varying,
    operator character varying,
    "payment:app" character varying,
    "payment:cards" character varying,
    "payment:cash" character varying,
    "payment:cheque" character varying,
    "payment:coins" character varying,
    "payment:contactless" character varying,
    "payment:credit_cards" character varying,
    "payment:cryptocurrencies" character varying,
    "payment:debit_cards" character varying,
    "payment:visa" character varying,
    phone character varying,
    "phone:UA" character varying,
    public character varying,
    second_hand character varying,
    shop character varying,
    shop_1 character varying,
    source character varying,
    "source:name" character varying,
    start_date date,
    stroller character varying,
    website character varying,
    wheelchair character varying
);


ALTER TABLE public.tehran_laptop_tb OWNER TO postgres;

--
-- TOC entry 5547 (class 0 OID 55931)
-- Dependencies: 219
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- TOC entry 5704 (class 0 OID 56687)
-- Dependencies: 223
-- Data for Name: tehran_laptop_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tehran_laptop_tb (id, geom, "@id", "addr:city", "addr:country", "addr:housenumber", "addr:place", "addr:postcode", "addr:street", "addr:unit", air_conditioning, brand, "contact:email", "contact:instagram", "contact:mobile", "contact:phone", "contact:website", "currency:IRR", description, ele, email, fax, fixme, image, internet_access, "internet_access:fee", level, mobile, name, "name:ar", "name:en", "name:fa", note, opening_hours, operator, "payment:app", "payment:cards", "payment:cash", "payment:cheque", "payment:coins", "payment:contactless", "payment:credit_cards", "payment:cryptocurrencies", "payment:debit_cards", "payment:visa", phone, "phone:UA", public, second_hand, shop, shop_1, source, "source:name", start_date, stroller, website, wheelchair) FROM stdin;
node/1707151489	0101000020E61000007B432B4190BB4940B51666A19DE44140	node/1707151489	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	خدمات کامپیوتر کنسول و موبایل	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Rafigh store	\N	\N	24/7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/2874053786	0101000020E6100000A91CEE7E70BF4940A7DFCF3AF4E54140	node/2874053786	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	کامپیوتر و موبایل امیران	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/3373127060	0101000020E61000005AD3612AA2BF4940963FDF162CDC4140	node/3373127060	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	بازار موبایل شرق تهران	\N	\N	\N	\N	Mo-Su 10:00-22:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+9821 7790 1316	\N	\N	\N	computer	mobile_phone	\N	\N	\N	\N	\N	\N
node/4285650389	0101000020E610000093E1783E03B64940139040CDDADC4140	node/4285650389	\N	\N	12	\N	\N	سوم	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	info@pars-e.com	\N	\N	\N	wlan	\N	\N	\N	پارس ارتباط افزار	\N	\N	\N	\N	sa-th 08-17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+982189395	\N	\N	\N	computer	\N	\N	\N	\N	\N	https://www.pars-e.com/	\N
node/4306015103	0101000020E61000003A5AD5928EB44940DFFE5C3464D94140	node/4306015103	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	پاساژ امجد	\N	Amjad Mall	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/4346273292	0101000020E6100000656EBE11DDB84940FBD97EE838E64140	node/4346273292	\N	\N	41	\N	\N	سلیمانی غربی	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	info@barg-co.com	\N	\N	\N	wlan	\N	\N	\N	شرکت برگ	\N	Barg Company	\N	\N	Sa-Th 09:00-17:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+982122196758	\N	\N	\N	computer	\N	\N	\N	\N	\N	https://barg-co.com/	\N
node/4362166989	0101000020E61000003F2201FE84B54940600894A872DA4140	node/4362166989	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	شرکت سروشان	\N	Sorooshan co.	\N	\N	Sa-Th 08:30-17:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	https://sorooshan.com/	\N
node/4366833993	0101000020E610000098BD6C3B6DB04940C84F9951E2D84140	node/4366833993	\N	\N	\N	\N	\N	بزرگراه نواب صفوی	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	فروشگاه کامپیوتر	\N	TehranHost	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+982166381002	\N	\N	\N	computer	\N	\N	\N	\N	\N	https://www.tehranhost.com/	\N
node/4377138991	0101000020E61000003E6079EB57B449406EA7AD11C1DC4140	node/4377138991	\N	\N	\N	\N	\N	فتحی شقاقی	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	info@knwifi.ir	\N	\N	\N	wlan	\N	\N	\N	\N	کالا نماد	knwifi	\N	\N	Mo-Su 09:00-18:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+98 21 4405 2052	\N	\N	\N	computer	\N	\N	\N	\N	\N	https://www.knwifi.ir/	\N
node/4386307493	0101000020E6100000BE558D1480B64940CF38C3C36ADC4140	node/4386307493	\N	\N	+982188831299	\N	15889	زهره	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	ahmadikhesal@Gmail.com	\N	\N	\N	wlan	\N	\N	\N	\N	\N	mana afraz khavar co	\N	\N	Sa-We 09:00-17:00; Th 09:00-13:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+98 21 8883 1299	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/4403557792	0101000020E61000007164D46B69C049407ADE324C12DE4140	node/4403557792	\N	\N	513	\N	\N	حیدرخانی	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	wlan	\N	\N	\N	رایانه کمک	\N	Rayaneh Komak	\N	\N	24/7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+982177192337	\N	\N	\N	computer	\N	\N	\N	\N	\N	http://www.7129.ir	\N
node/4557043800	0101000020E610000036FD7ED6A1AE49402918DF6124D44140	node/4557043800	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/4571875990	0101000020E6100000A36DA1D057B84940675F79909EDD4140	node/4571875990	\N	\N	\N	\N	\N	شهید آیت‌الله بهشتی	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	ویستا گارانتی	\N	waranty vista	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/4615969990	0101000020E61000002CE400B0F0AE4940D2A755F487D84140	node/4615969990	\N	\N	448	\N	\N	کارون	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	مرکز کامپیوتر پایتخت	\N	Paytakht Computer Center	\N	\N	Sa-Th 08:00-22:00; Fr 09:30-21:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+98 21 6688 1164	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/4674410194	0101000020E6100000C83B2C79E1CB494056E2F038FBDD4140	node/4674410194	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	خدمات کامپیوتری ات ساین	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/4674416194	0101000020E6100000AD495C6CFFCB494048C89B57D0DD4140	node/4674416194	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	رایکا	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/4712041090	0101000020E6100000C707872870C14940FD0C141D6ED64140	node/4712041090	\N	\N	\N	\N	\N	هجرت	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Kosarstore8701@gmail.com	\N	\N	\N	wlan	\N	\N	\N	فروشگاه کوثر (موبایل -کامپیوتر - بیمه ایران - صدور انواع بلیط)	\N	Kosar Store	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+98 21 3320 7801	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/4714164691	0101000020E610000065DAA3DC22B44940DC99AECC00DB4140	node/4714164691	\N	\N	\N	\N	\N	میدان ولی عصر عج	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	فروشگاه بِرادِرز	\N	Brothers shop	\N	\N	Mo-Su 10:15-21:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+982188929069	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/4715979493	0101000020E6100000C2FA3F87F9B34940AC860ECBB0DA4140	node/4715979493	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	لیون کامپیوتر	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/4733450621	0101000020E610000095D7A5A1A1B44940C5419D4DA2E14140	node/4733450621	\N	\N	903	\N	\N	میرداماد	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	a.jabbari@deltous.com	\N	\N	\N	wlan	\N	\N	\N	گارانتی کندل ایران	\N	Deltous	\N	\N	Sa-We 09:30-18:30; Th 09:30-14:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+982188665064	\N	\N	\N	computer	\N	\N	\N	\N	\N	https://www.candelliran.com	\N
node/4738822549	0101000020E61000006B93D453F5B349408A16EAFA4FDC4140	node/4738822549	\N	\N	35	\N	\N	بوعلی سینا	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	info@hpe.ir	\N	\N	\N	\N	\N	\N	\N	هوشمند پردازش الکا	\N	HPE	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+982188999005	\N	\N	\N	computer	\N	\N	\N	\N	\N	http://hpe.ir	\N
node/4769354834	0101000020E6100000D7B738CF7D9F4940142C6920F1DC4140	node/4769354834	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	خدمات کامپیوتر	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/4789238421	0101000020E61000001F0D4C135BAD4940C360A35126DA4140	node/4789238421	\N	\N	9	\N	\N	داوود حبیب‌ زادگان	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	PooyaCom.ir@gmail.com	\N	\N	\N	\N	\N	\N	\N	پویاکام	\N	PooyaCom	\N	\N	Mo-Su 09:00-18:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	http://PooyaCom.ir	\N
node/4803036021	0101000020E610000023C385973BB9494008E2E1E24DE04140	node/4803036021	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	گلد تگ	\N	Gold Tag	\N	\N	Sa-Th 08:30-16:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+98 21 2641 4047	\N	\N	\N	computer	\N	\N	\N	\N	\N	http://www.goldtag.com	\N
node/4808212421	0101000020E6100000268A35012BAD4940113C1977DEDD4140	node/4808212421	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	فناپ	\N	Fanap Platform	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	map.ir	\N	\N	\N	\N
node/4819936529	0101000020E610000003A1AB634BB449408AD5D5D3FDDB4140	node/4819936529	تهران	\N	24	\N	\N	بالاتر از زرتشت، کوچه جاوید، پلاک 24	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	اینجا، فروشگاه سخت‌افزار رایانه است نه ابزار. بررسی شود که برچسب مناسب چیست.	\N	wlan	\N	\N	\N	لیون کامپیوتر	\N	Lioncomputer	\N	\N	Sa-Th 09:30-19:00	\N	\N	\N	yes	\N	\N	\N	yes	yes	yes	\N	+982191005666	\N	\N	\N	computer	\N	\N	\N	\N	\N	https://www.lioncomputer.com	\N
node/4854493421	0101000020E61000009075278EF2AC49403F0A8D1656DC4140	node/4854493421	\N	\N	\N	\N	\N	ستارخان	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	بازار سنتی ستارخان	\N	Sattarkhan bazar	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/4965167522	0101000020E6100000E1568B998EB64940243C461E2DDD4140	node/4965167522	\N	\N	10	\N	\N	دکتر مفتح	\N	\N	\N	sale@hpsupport.ir	\N	\N	+982188521040	\N	\N	\N	\N	\N	\N	\N	\N	wlan	\N	\N	\N	مرکز فروش و خدمات اچ پی	\N	hp support	\N	\N	Sa-We 08:30-18:00; Th 09:30-15:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	https://www.hpsupport.ir/	\N
node/5021592924	0101000020E61000002A80739021B44940EAF7B30EFDDA4140	node/5021592924	\N	\N	\N	\N	\N	میدان ولی‌عصر ع	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	doctorcomputershojaei@gmail.com	\N	\N	\N	\N	\N	\N	\N	دکتر کامپیوتر	\N	Doctor computer	\N	\N	Mo-Su 10:00-20:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+98 21 8892 9012	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/5040657523	0101000020E6100000A613645F0DA94940688FBC186FD64140	node/5040657523	\N	\N	115	\N	\N	بزرگراه فتح	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	ihdelevator@gmail.com	\N	\N	\N	\N	\N	\N	\N	فروشگاه آسانسور دینا	\N	Dina Asansor shoping	\N	\N	Sa-We 09:00-19:00; Th 09:00-14:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+982166286217	\N	\N	\N	computer	\N	\N	\N	\N	\N	http://www.ihdelevator.com	\N
node/5050046521	0101000020E6100000FC47F0D0C1C549407FABD09BE5DE4140	node/5050046521	\N	\N	\N	\N	169	شادالویی	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	کامپیوتر کارآمد	\N	karamad pc	\N	\N	Mo-Su 08:00-23:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+982177324854	\N	\N	\N	computer	\N	\N	\N	\N	\N	https://telegram.me/karamad_pc	yes
node/5075584053	0101000020E6100000075A266838BE494093F30F6CA6DD4140	node/5075584053	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	مرکز کامپیوتر وحید	\N	Vahid Computer Center	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/5183997795	0101000020E61000004650EBEC1AB449404211418B5BDD4140	node/5183997795	tehran	\N	181	\N	\N	سید جمال‌الدین اسدآبادی	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	smallappstore@gmail.com	+982188728345	\N	\N	\N	\N	\N	\N	اپل استور کوچک	\N	Small Apple Store	\N	\N	10:00-22:00	علی کوچکی	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+982188704355	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/5389786121	0101000020E61000008A0C61EB08B94940C89CC2A5BECB4140	node/5389786121	\N	\N	181	\N	\N	زکریای رازی	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	wlan	\N	\N	\N	فروشگاه ماهان	\N	Mahan store	\N	\N	Mo-Su 09:00-21:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	map.ir	\N	\N	\N	\N
node/5516623922	0101000020E6100000BF3E840200B3494009C21550A8D14140	node/5516623922	\N	\N	18	\N	\N	مرتضی کارگر سامانی	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Mojsystem55310750@gmail.com	\N	\N	\N	\N	\N	\N	\N	موج سیستم	\N	Moj System	\N	\N	Mo-Su 10:00-22:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+98 21 5518 6407	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/5678421236	0101000020E6100000480A760D44B8494002E8418BB6E54140	node/5678421236	\N	\N	143	\N	\N	بلوار صبا	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	تیم پلاس	\N	Tim Plus	\N	\N	Su-Th 10:00-22:00, Fr 17:00-22:00	Hedayati	\N	\N	yes	\N	\N	\N	\N	\N	yes	\N	+98 21 22201283	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	yes
node/5965592685	0101000020E61000004109D8B38CBB4940E85729F345D74140	node/5965592685	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	جزیره	\N	jazireh	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	33182998	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/6359913543	0101000020E610000080608E1EBFBE49404B3558DD8FDD4140	node/6359913543	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	فروشگاه موبایل و مرکز تخصصی تعمیرات سخت افزاری و نرم افزاری موبایل\nفروش انواع لوازم جانبی موبایل و کامپیوتر	\N	\N	\N	\N	\N	\N	\N	0	\N	پارس مموری نارمک	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/6687995014	0101000020E61000000E89D6E5EFBE4940F1C7A30A35DE4140	node/6687995014	تهران	IR	710	\N	1648697175	بزرگراه شهید سلیمانی	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	فروشگاه کامپیوتر و لپ تاپ آتیه پرداز	\N	mobile and computer store Atieh Pardaz	\N	\N	10:00-21:00	فروشگاه کامپیوتر و موبایل آتیه پرداز	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+98 21 7727 1616	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/6877752086	0101000020E6100000D51E9B898EBC4940F08975AA7CDA4140	node/6877752086	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/7284111183	0101000020E6100000ACEC7195DDA74940230AD2318CD34140	node/7284111183	تهران	\N	478	\N	1377636769	بلوار معلم	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	لیان وب	\N	\N	\N	\N	24/7	ارائه خدمات طراحی سایت	\N	\N	yes	\N	\N	\N	\N	\N	\N	yes	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	https://lianweb.ir/	\N
node/7692025804	0101000020E6100000B6C590F705AD4940CD71135A7BE34140	node/7692025804	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	خرید و فروش و تعمیرات تخصصی لپ تاپ ، موبایل و  لوازم جانبی\nکنسول بازی و خدمات مرتبط	\N	\N	\N	\N	\N	\N	\N	\N	\N	فروشگاه بایونیک	\N	Bionic Store	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/7831334199	0101000020E6100000B7103F5AF7AE4940C12A285657D54140	node/7831334199	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	گسترش رایانه	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/7954598322	0101000020E6100000104E55EB0EB5494038B41204D9D64140	node/7954598322	تهران	\N	تهران 15خرداد غربی جنب بانک آینده ساختمان جهان پلاک 1052 طبقه اول	\N	\N	پانزده خرداد	\N	yes	Asus Lenovo Samsung	\N	\N	\N	\N	\N	\N	هدهد آی تی فروشگاه لوازم دیجیتال تبلت لپتاپ لوازم جانبی می باشد و در این محل می توانید علاوه بر خرید از خدمات کافی نت مجموعه مانند فوتوکپی پرینت سیاه و سفید و رنگی استفاده نمایید	\N	hodhodnet2020@gmaill.com	+9855802793	\N	\N	wlan	\N	\N	\N	فروشگاه هدهد آی‌تی	\N	\N	\N	\N	Sa-Th 09:00-17:00	سیدمهدی باستان	\N	yes	yes	\N	yes	\N	\N	\N	\N	\N	+9855632149	\N	\N	\N	computer	\N	\N	\N	\N	\N	https://hodhodit.com	\N
node/8095922917	0101000020E6100000FA69920EC5A64940F312AD2699D54140	node/8095922917	\N	\N	\N	\N	\N	برادران پاکند	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	عرضه کامپیوتر نو و دسته دوم (سروری و خانگی و لپ تاپ) سخت افزار و مشاوره	\N	Ocean system	\N	\N	Mo-Su 09:00-23:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+989124640788	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/8150612382	0101000020E61000006A95AAFE52C04940BA371A1B15D34140	node/8150612382	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	الکتریکی	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/8195719533	0101000020E61000004D309C6B98C249408ED59C723BDD4140	node/8195719533	تهران	\N	80	\N	1651743486	سعید باغدارنیا	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	خدمات کامپیوترو موبایل پدرخوانده	\N	\N	\N	\N	08:00-21:00	Bahram & Shahram	\N	\N	yes	\N	\N	\N	yes	\N	\N	\N	+98 21 7786 7553	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/8330729816	0101000020E6100000FD344987E2B94940190FA5AC95CA4140	node/8330729816	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+98 930 294 0267	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	خدمات کامپیوتر و کافینت نوین	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/8490822197	0101000020E6100000554FE61F7DBC4940E7B5C82C31D44140	node/8490822197	تهران	\N	\N	\N	\N	نصر یکم	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	طراحی سایت رسارایان	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+989120942434	\N	\N	\N	computer	\N	\N	\N	\N	\N	https://rasarayan.com/	\N
node/8815178033	0101000020E61000002A519BDDFFAF494070AE06CD53D54140	node/8815178033	تهران	\N	\N	\N	\N	خیابان قزوین خیابان شهید نعیمی کوچه رهنما خانقاه پنجم پلاک ۴۷	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	استوک لپ (علی اکبری)	\N	\N	\N	\N	Mo-Su 10:00-21:30	استوک لپ علی اکبری	\N	\N	yes	\N	\N	\N	\N	\N	\N	\N	+98 912 599 2697	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/8879936873	0101000020E6100000EC3F21F1E1B649407764AC36FFD94140	node/8879936873	تهران	\N	\N	\N	\N	خیابان انقلاب، خیابان بهار جنوبی، مجتمع اداری و تجاری بهار	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	کریپتالین	\N	\N	\N	\N	\N	\N	\N	\N	yes	\N	\N	\N	yes	\N	\N	\N	+98 21 2842 8934	\N	\N	\N	computer	\N	\N	\N	\N	\N	https://www.cryptalin.com/	\N
node/8892267117	0101000020E61000008621CDB3EDC549407C952133BCE04140	node/8892267117	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	پردازشگران	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+98 905 706 0248	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/8939384581	0101000020E610000036D373C1CFB14940ECA0B71DBFD94140	node/8939384581	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	مجتمع فنی تهران پایتخت	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/8950523975	0101000020E61000000A230736F8B2494025F5543D4FDF4140	node/8950523975	تهران	\N	433	\N	1437773679	صادق آئینه وند	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Jita Apple Store	\N	\N	\N	\N	24/7	Engineer Maleki	\N	\N	yes	\N	\N	\N	\N	\N	\N	\N	+989012332711	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/9017517215	0101000020E610000096C6D40220B44940F49084D8F4DA4140	node/9017517215	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+982188939519	http://iliasystem.net	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	ایلیاسیستم	\N	\N	\N	\N	09:00-18:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	note	\N	\N	\N	\N	\N
node/9570456460	0101000020E6100000C687D9CBB6A049404F3860FCD9D94140	node/9570456460	شهر تهران	\N	\N	\N	\N	بلوار تهرانسر	\N	\N	Penobit	\N	\N	\N	\N	\N	\N	\N	\N	info@penobit.com	\N	\N	\N	\N	\N	\N	\N	Penobit	\N	\N	پنوبیت	\N	Mo-Su 10:00-22:00	R8	\N	\N	yes	\N	yes	\N	yes	yes	\N	\N	+989024005345	\N	\N	\N	computer	\N	\N	\N	2022-10-01	\N	https://penobit.com	\N
node/9642470848	0101000020E6100000B15EFBB8ECB349403E4CB159E4D94140	node/9642470848	Tehran	\N	پاساژ ابریشم	\N	\N	خیابان ولی عصر	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	فروشگاه لپ تایم	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+989360704396	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/9920471269	0101000020E610000047E7FC14C7B34940FB534F8B66DA4140	node/9920471269	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	پاساژ خوارزمی	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/10003975567	0101000020E6100000A047D62B76B849408DFF4CCE9AD24140	node/10003975567	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	موبوآذر	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/10012311117	0101000020E6100000B9725188DBB44940466CC19CEAD74140	node/10012311117	\N	\N	69	\N	\N	عبدالله میرزایی	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Farahmandtools@gmail.com	\N	\N	\N	\N	\N	\N	\N	ابزار فرهمند	\N	Farahmand Tools	\N	\N	Sa-We 08:30-13:30; Th 00:00-24:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+98 21 6670 3012	\N	\N	\N	computer	\N	\N	\N	\N	\N	http://Farahmandtools.ir	\N
node/10223885095	0101000020E610000061A35126DABC4940F3C418FD0DE74140	node/10223885095	تهران	\N	\N	\N	\N	موحد دانش	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	BBO TECH	\N	bbo tech	بی بی او تک	\N	Su-Fr 10:00-21:00	\N	\N	\N	yes	\N	\N	\N	yes	\N	\N	\N	+9981402800	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/10921334022	0101000020E610000057DA988D84B54940C35B8C26BCDA4140	node/10921334022	Tehran	\N	134	\N	1598977616	سپهبد قرنی	\N	yes	فروشگاه ماشین های اداری پرسپولیس	\N	\N	\N	\N	\N	\N	“گروه ماشین های اداری پرسپولیس” دارنده برند دبل ایکس ( Double X ) بعد از گذشت ۴۰ سال سابقه فروشگاهی در زمینه ماشین آلات اداری در سال ۱۳۹۱ اقدام به فروش و عرضه محصولات خود در دنیای مجازی نمود.ماشین های اداری دبل ایکس در صنف ماشین آلات اداری حضور موفقی دا	0	info@double-x.co	\N	\N	https://double-x.co/wp-content/uploads/2022/08/arm.jpg	yes	customers	0	\N	فروشگاه ماشین های اداری دبل ایکس	\N	\N	\N	دبل ایکس یکی از برند های فروشگاه ماشین های اداری پرسپولیس می باشد.	Mo-Fr 09:00-18:00	دادستان	yes	\N	yes	yes	\N	\N	\N	\N	yes	\N	+982188803377	\N	\N	no	computer	\N	\N	\N	\N	yes	https://double-x.co	yes
node/10936696539	0101000020E6100000CD57C9C7EEB3494011D8E61082DA4140	node/10936696539	تهران	IR	8103	\N	\N	ولی عصر، تقاطع خیابان طالقانی، مجتمع تجاری و اداری نور	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	info@behansystem.com	\N	\N	\N	\N	\N	\N	\N	بهان سیستم	\N	Behansystem	\N	\N	Sa-We 11:00-17:00; Th 11:00-15:00	\N	\N	yes	yes	\N	\N	\N	\N	\N	\N	\N	+982188226041	\N	\N	\N	computer	\N	\N	\N	\N	\N	https://behansystem.com/	\N
node/10942117458	0101000020E61000001D6CFB6882B84940C4149B45DED94140	node/10942117458	تهران	\N	125	\N	\N	نامجو	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Shahr Computer	\N	\N	\N	\N	\N	عباس عابدی	\N	\N	yes	\N	\N	\N	yes	\N	\N	\N	02177689810	\N	\N	yes	computer	\N	\N	\N	\N	\N	https://shahrcomputer.com	\N
node/10947499049	0101000020E6100000BF20336145C549407F04B463D9DE4140	node/10947499049	تهران	\N	20	\N	\N	خیابان صدو نودو دوم	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	aldigitall.com@gmail.com	\N	\N	\N	\N	\N	\N	\N	فروشگاه آل دیجیتال دات کام	\N	\N	\N	فروشگاه آل دیجیتال کالای دیجیتال و لوازم جانبی موبایل	Mo-Su 08:30-17:30	آل دیجیتال	\N	\N	yes	\N	\N	\N	\N	\N	\N	\N	02191014644	\N	\N	\N	computer	\N	\N	\N	\N	\N	https://aldigitall.com	\N
node/10973296463	0101000020E6100000794EC46C13B64940ECCCF39661E44140	node/10973296463	شهر تهران	\N	19	\N	1966684714	گیتی	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	ابر ویراک	\N	\N	\N	\N	Sa-We 09:00-15:00	VirakCloud	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+982191555530	\N	\N	\N	computer	\N	\N	\N	\N	\N	https://virakcloud.com	\N
node/10985202391	0101000020E610000046DDBD929AB6494070C09DFAF6CB4140	node/10985202391	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	کسب و کار اینترنتی سافت ری	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/10994125821	0101000020E61000004E918D51E8B3494000BF901F3BDA4140	node/10994125821	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	کلان کامپیوتر	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	yes	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/11030158605	0101000020E61000005B67D718CFB149406AE4A9FD8CD94140	node/11030158605	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	فروشگاه تهران رایان	\N	\N	\N	\N	Sa-We 11:00-19:00; Th 11:00-16:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/11049773359	0101000020E610000077CA598E46B84940675595C7E4E14140	node/11049773359	تهران	\N	پلاک 50 - واحد 6	\N	\N	وحید دستگردی	\N	\N	\N	\N	\N	\N	\N	\N	\N	تعمیرات موبایل\nفلش\nریجستر\nآنلاک\nFrp lock\nقفل جیمیل\nقفل frp\nفارسی سازی موبایل\nکاستوم رام\nخرید و فروش موبایل و تبلت\nتعمیرات نوت بوک و کامپیوتر\nنصب ویندوز و نرم افزار\nخرید و فروش کامپیوتر و لپ تاپ\nتعمیرات پرینتر لیزری\nتعمیرات مانیتور LCD و LED\nلوازم جانبی	\N	\N	\N	\N	\N	\N	\N	\N	\N	کامپیوتر امید	\N	\N	\N	\N	9:00 - 21:00	\N	\N	\N	yes	\N	\N	\N	yes	\N	\N	\N	+982122900026	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/11072539443	0101000020E6100000BC35559C0FB44940ABB4C5353EDC4140	node/11072539443	تهران	\N	\N	میدان فاطمی, جنب بیمارستان شهرام, مجتمع کامپیوتر هدیه, طبقه همکف	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	فروش پروژکتور	\N	\N	\N	\N	http://www.ejra.net	\N	\N	\N	\N	دنیای پروژکتور	\N	\N	\N	\N	\N	\N	\N	\N	yes	\N	\N	\N	\N	\N	\N	\N	+982188967600	\N	\N	\N	computer	\N	\N	\N	\N	\N	http://www.ejra.net	\N
node/11099482667	0101000020E6100000FF29B05B5FC049401217DBFF5BDD4140	node/11099482667	\N	\N	390	\N	\N	Dardasht	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+989207895998	کامپیوتر پارسیان	\N	Parsian Computer	\N	\N	Mo-Su 09:00-21:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+982177895998	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/11104801131	0101000020E610000012A5187B8ABE49406700B90E1FDA4140	node/11104801131	تهران	\N	\N	\N	\N	سی متری نیروی هوایی نبش 7/38میرزایی گرگانی	\N	\N	\N	\N	\N	\N	\N	\N	\N	اورژانس کامپیوتر-ارائه دهنده کلیه خدمات کامپیوتر و موبایل و کنسول بازی سخت افزار و نرم افزار فروش انواع موبایل تبلت لپ تاپ و لوازم جانبی	\N	\N	\N	\N	\N	\N	\N	\N	09123184028	اورژانس کامپیوتر	\N	\N	\N	\N	Mo-Su 09:00-21:00	اقای باطنی	\N	\N	yes	\N	\N	\N	yes	\N	\N	\N	021-77409775	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/11113591291	0101000020E61000005EF1796A9AB3494081F7448DF8D94140	node/11113591291	تهران	\N	34	\N	\N	ولی عصر	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	فروشگاه وایرشاپ	\N	\N	\N	\N	شنبه تا پنجشنبه از ساعت 10 الی 19	WireshopTeam	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+982166485010-11	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/11146674706	0101000020E610000005E5113702B6494062670A9DD7DC4140	node/11146674706	Tehran	\N	14	\N	1587668311	سوم	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	سام رایان پرداد	\N	\N	\N	\N	sa-th 08-17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+982152754000	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/11181773344	0101000020E610000098FC4FFEEEB349403AA28C028EDA4140	node/11181773344	شهر تهران	\N	\N	\N	1416799494	ولی عصر	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	فروشگاه مگاهرتز	\N	\N	\N	\N	Sa-Th 10:00-19:00	محمد حسین ذاکری	\N	\N	yes	\N	\N	\N	\N	\N	\N	\N	+982186097041	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/11197661196	0101000020E6100000445F8B27CCB3494011830A58BCDA4140	node/11197661196	تهران	\N	22	\N	\N	دمشق	\N	yes	\N	\N	\N	\N	\N	\N	\N	\N	\N	info@bazarsoo.ir	\N	\N	\N	\N	\N	\N	+989125198348	رایان نگار (بازار سو)	\N	\N	\N	لطفا قبل از مراجعه به فروشگاه  سفارش خود را ثبت کنید.\nساعات کاری:\n\nشنبه تا چهارشنبه از ساعت ۱۰:۰۰ تا ساعت ۱۹:۰۰\n\nپنجشنبه ازساعت ۱۰:۰۰ تا ساعت ۱۸:۰۰\n\nآدرس: شهرتهران - خیابان ولیعصر نرسیده به میدان ولیعصر خیابان دمشق پلاک۲۲ طبقه دوم واحد۴	\N	وحید مظاهری	\N	\N	yes	\N	\N	\N	yes	\N	\N	\N	۰۲۱۸۸۹۳۶۱۸۰	\N	\N	\N	computer	\N	\N	\N	\N	\N	https://bazarsoo.ir	\N
node/11205308965	0101000020E61000006254ADE012B44940718B9E002FDB4140	node/11205308965	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	AvvalStock	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	https://avvalstock.com/	\N
node/11218192818	0101000020E6100000D3AAF12D07B24940943FCEEAD3D94140	node/11218192818	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	رویال پلاس	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/11412679486	0101000020E610000094F36A2519BB4940A0E469543BE54140	node/11412679486	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	نت لند	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/11503456169	0101000020E61000009E865E3585C44940D729FB534FDE4140	node/11503456169	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	موبایل و کامپیوتر مهدی	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/11513751882	0101000020E61000009BD31BA496BC4940262BD0381EDE4140	node/11513751882	تهران	\N	124	\N	\N	جمشید رویان	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	خدمات کامپیوتری رویان رایانه	\N	\N	\N	\N	\N	بختیاری	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+982126145429	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/11540078291	0101000020E61000008FC6A17E17B44940338408DDCADA4140	node/11540078291	تهران	\N	86	\N	1593739788	فیروزه	\N	\N	\N	\N	\N	\N	\N	\N	yes	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	کهکشان رایانه	\N	\N	\N	\N	Sa-We 10:00-18:00; Th 10:00-13:00	\N	\N	\N	\N	\N	\N	\N	yes	\N	\N	\N	+982154785000;+982191094812	+982191098618	\N	\N	computer	\N	\N	\N	\N	\N	https://pkr-co.ir	\N
node/11588943786	0101000020E6100000585EA8B2DEB34940AC6411D43ADA4140	node/11588943786	تهران	\N	\N	\N	\N	ولی عصر	305	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	-3	\N	گروه مهندسی مهدیا ویژن	\N	\N	\N	\N	Sa-We 11:00-17:00	\N	yes	\N	yes	\N	\N	yes	\N	\N	\N	\N	+98 21 91325205	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/11618352144	0101000020E61000008D38AE9003B2494041892A57D3D94140	node/11618352144	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	فروشگاه یونی تک	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	02166913048	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/11682985918	0101000020E6100000A55BC0159AB449402E701EF3A6E14140	node/11682985918	تهران	\N	705A	\N	19169763715	بلوار میرداماد - مجتمع تجاری پایتخت	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	مرکز خدمات تخصصی اپل i-Phone.ir	\N	\N	\N	\N	10:00-20:00	i-phone.ir	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+9888872936	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/11827022366	0101000020E6100000CD237F30F0B34940927C804985DA4140	node/11827022366	تهران	\N	6008	\N	1416798334	تهران، دانشگاه تهران، خیابان دمشق، خیابان ولیعصر، مجتمع نور تهران، پلاک 1574	\N	\N	\N	\N	\N	\N	\N	\N	\N	فروشگاه هایکامپ، از سال 1384 به عنوان یک مرجع معتبر در زمینه تعمیرات کامپیوتر به صورت تخصصی فعالیت می‌کند. این فروشگاه امکان حضوری در محل را برای رفع مشکلات کامپیوتری فراهم می‌کند، تا کاربران بتوانند با آرامش از خدمات حرفه‌ای بهره‌مند شوند.	\N	highcompshop@gmail.com	\N	\N	\N	\N	\N	\N	+989128471537	هایکامپ	\N	\N	\N	\N	Sa-Th 10:00-19:00	Owner	\N	\N	yes	\N	\N	\N	yes	\N	\N	\N	+9821860975994	\N	\N	\N	computer	\N	\N	\N	\N	\N	https://highcomp.net/	\N
node/11903337424	0101000020E610000086E3F90CA8AA4940C2B7FAFBD6E34140	node/11903337424	Tehran	\N	\N	\N	\N	کوهسار چهارم مرکزی	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	خدمات کامپیوتر ایروانی	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	09123588944	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/11947052874	0101000020E6100000B726DD96C89F494085D9BA8A7BDD4140	node/11947052874	تهران	\N	طبقه سوم، واحد ۴۷۳	\N	\N	شهرک گلستان، بلوار علیمرادی (کوهک)	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	استوک شاپ لند	\N	\N	\N	\N	Mo-Su 10:00-21:00	\N	\N	yes	yes	\N	\N	\N	\N	\N	\N	\N	+982146085835	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/11962290350	0101000020E61000008FD48C56FFA349403311DB824ADB4140	node/11962290350	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	کامپیوتری نسیم	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/11990227271	0101000020E61000008BD1297E42C54940A922CB38FCDE4140	node/11990227271	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	خدمات کامپیوتر مثلث	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/11999632716	0101000020E6100000961EF23BF2AC494002D8800871E34140	node/11999632716	تهران	\N	\N	\N	\N	بلوار شهید منفرد نیاکی	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	اپل استور مرکزی اپال	\N	\N	\N	\N	\N	امیر مجدم	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	09128190689	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/12108247247	0101000020E61000009E45EF54C0B349405D2E8782BEDA4140	node/12108247247	تهران	\N	\N	\N	\N	دمشق	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Info@hegzimal.com	\N	\N	\N	\N	\N	\N	+98 21 66 45 51 28	فروشگاه اینترنتی هگزیمال	\N	\N	\N	\N	\N	\N	\N	\N	yes	\N	\N	\N	yes	\N	\N	\N	+98 21 88 92 78 25	\N	\N	\N	computer	\N	\N	\N	\N	\N	https://hegzimal.com/	\N
node/12108247248	0101000020E610000032BD0EE6C0B349408166C691BDDA4140	node/12108247248	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	info@bazarsoo.ir	\N	\N	\N	\N	\N	\N	+98 21 88 93 61 80	فروشگاه اینترنتی بازارسو	\N	\N	\N	\N	\N	\N	\N	\N	yes	\N	\N	\N	yes	\N	\N	\N	+98 21 88 92 78 25	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/12135440615	0101000020E6100000B0202812A7C549401B37EB4262DD4140	node/12135440615	شهر تهران	\N	115	\N	1654969371	ابراهیم زارع	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	رایان کامپیوتر	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+98 21 777 86136	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/12148383411	0101000020E6100000E0A69AB404B24940AC9B4132D3D94140	node/12148383411	\N	\N	\N	\N	1418946717	\N	\N	\N	\N	\N	https://www.instagram.com/unitech_laptop?igsh=dWRhZWd2enRxcjNy	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	فروشگاه یونی تک	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	09379450718	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/12180201705	0101000020E6100000EFBFDF79F3AF4940DA756F4562D84140	node/12180201705	تهران	\N	\N	\N	\N	هاشمی	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	گیم نت ونوس	\N	\N	\N	\N	24/7	مهدی ونوس	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	09916713703	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/12298819583	0101000020E6100000EF3C4C56A0BC4940005BB97251DE4140	node/12298819583	تهران	\N	77	\N	\N	خیابان کرمان خیابان محمدرحیم صافی	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+98 939 816 9991	کافی نت مجیدیه	\N	\N	\N	\N	\N	\N	\N	\N	yes	\N	\N	\N	\N	\N	yes	\N	+98 21 2253 4854	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/12318247006	0101000020E610000028C3A7EFEBB34940ECC4403278DA4140	node/12318247006	تهران	\N	\N	\N	\N	آیت الله طالقانی	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	فروشگاه فرنام تک	\N	\N	\N	\N	Mo-Su 10:00-19:00	مهرداد عباسی	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	09122162733	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/12329336010	0101000020E6100000E479BA04F1AB4940DF8ECB1363DC4140	node/12329336010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	کامیتل شاپ	\N	\N	\N	\N	08:00-21:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	02144291135	\N	\N	\N	computer	\N	\N	\N	\N	\N	https://kamitelshop.com	\N
node/12357835202	0101000020E6100000372273C009B4494003098A1F63DB4140	node/12357835202	تهران	\N	\N	\N	\N	نجف غزایی عتیق	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	DETEX	\N	\N	\N	\N	Mo-Fr 09:30-17:30	محمدرضا توکلی	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	02187700089	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/12406956898	0101000020E610000098CBFC59E2B34940B78CE5A782DA4140	node/12406956898	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	آسو (آریا سیستم ورسا رایان)	\N	\N	\N	\N	09:00-18:00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	02188227780	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/12450453344	0101000020E61000001F1D0D96A0B449404F458545A0E14140	node/12450453344	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	سپهر سیستم  تعمیر و فروش قطعات لپتاپ	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/12500440615	0101000020E6100000AEE7B523E6B349403C3E6BC889DA4140	node/12500440615	تهران	\N	\N	\N	\N	برادران مظفر شمالی	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	کامپیوتر اخوی شاپ	\N	\N	\N	\N	Mo-Sa 10:00-19:00	احسان اخوی	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	02188227940	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/12532347703	0101000020E6100000752D10F39BA84940B26900CA3ADE4140	node/12532347703	تهران	\N	\N	\N	\N	حسن زاده	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	https://tecnobenis.shop/wp-content/uploads/512.png	\N	\N	0	09904120604	تکنو بنیس	\N	\N	\N	\N	Sa-Th 08:00-23:00	ایده پردازان جوان بنیس	yes	\N	yes	\N	\N	\N	\N	\N	\N	\N	02191003013	\N	\N	\N	computer	\N	\N	\N	\N	\N	https://tecnobenis.shop/	\N
node/12615404813	0101000020E610000017B3CAF1AFB3494017DF066B52DA4140	node/12615404813	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	فروشگاه سرور سوییچ	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
node/12723758779	0101000020E6100000478D093197B549409539A7A32DDB4140	node/12723758779	Tehran	\N	5	\N	1584633933	خیابان ایرانشهر شمالی کوچه دهقانی‌نیا (خسرو سابق) ساختمان خسرو طبقه دو واحد شش	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	مانیتور بزرگمهر | Bozorgmehr Monitor	\N	\N	\N	تعمیرات انواع مانیتور، لپتاپ، پرینتر و تلویزیون	شنبه تا چهارشنبه 10 صبح تا 7 شب، پنج‌شنبه از 10 صبح تا 2 ظهر | Sat-Wed 10am to 7pm, Thurs 10am to 2pm	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	+98 2188831542, +98 2188842860, +98 9127180471	\N	\N	\N	computer	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 5553 (class 2606 OID 56693)
-- Name: tehran_laptop_tb tehran_laptop_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tehran_laptop_tb
    ADD CONSTRAINT tehran_laptop_tb_pkey PRIMARY KEY (id);


--
-- TOC entry 5551 (class 1259 OID 56694)
-- Name: sidx_tehran_laptop_tb_geom; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sidx_tehran_laptop_tb_geom ON public.tehran_laptop_tb USING gist (geom);


-- Completed on 2025-04-07 02:18:35

--
-- PostgreSQL database dump complete
--

