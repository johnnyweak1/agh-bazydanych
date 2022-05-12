-- 1. stworzenie bazy danych 

CREATE DATABASE firma3;

-- 2. stworzenie schematu ksiegowosc 

CREATE SCHEMA ksiegowosc;

-- 3. dodanie tabel

--tabela pracownicy 

CREATE TABLE ksiegowosc.pracownicy(id_pracownika VARCHAR(6) PRIMARY KEY NOT NULL, imie VARCHAR(50) NOT NULL, nazwisko VARCHAR(50) NOT NULL, adres VARCHAR(50) NOT NULL, telefon VARCHAR(50) NOT NULL);

--tabela godziny

CREATE TABLE ksiegowosc.godziny(id_godziny VARCHAR(6) PRIMARY KEY NOT NULL, data DATE NOT NULL, liczba_godzin INTEGER NOT NULL, id_pracownika VARCHAR(6) NOT NULL);

--tabela pensja 

CREATE TABLE ksiegowosc.pensja(id_pensji VARCHAR(6) PRIMARY KEY NOT NULL, stanowisko VARCHAR(50) NOT NULL, kwota INTEGER NOT NULL);

--tabela premia 

CREATE TABLE ksiegowosc.premia(id_premii VARCHAR(6) PRIMARY KEY , rodzaj VARCHAR(50), kwota INTEGER);

--tabela wynagrodzenie 

CREATE TABLE ksiegowosc.wynagrodzenie(id_wynagrodzenia VARCHAR(6) PRIMARY KEY NOT NULL, data DATE NOT NULL, id_pracownika VARCHAR(6) NOT NULL, id_godziny VARCHAR(6) NOT NULL, id_pensji VARCHAR(6) NOT NULL, id_premii VARCHAR(6));

--dodanie kluczy obcych 

--KLUCZE OBCE DO TABELI WYNAGRODZENIE

--klucz obcy id pracownika

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika);

--klucz obcy id_godziny

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY(id_godziny) REFERENCES ksiegowosc.godziny(id_godziny);

--klucz obcy id_pensji

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_pensji) REFERENCES ksiegowosc.pensja(id_pensji)

--klucz obcy id_premii

ALTER TABLE ksiegowosc.wynagrodzenie
ADD FOREIGN KEY (id_premii) REFERENCES ksiegowosc.premia(id_premii)

--KLUCZE OBCE DO TABELI GODZINY

ALTER TABLE ksiegowosc.godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika)

-- 4. dodanie rekordow

--tabela pracownicy

INSERT INTO ksiegowosc.pracownicy
(
	[id_pracownika],
	[imie],
	[nazwisko],
	[adres],
	[telefon]
)
VALUES
(
	1,
	'Karol',
	'Górski',
	'Bielsko-Bia³a ul.Kasztanowa 31 12-405',
	'892479124'
)
,(
	2,
	'Allan',
	'Duda',
	'Kielce ul.S³owiañska 88 79-507',
	'512432132'
)
,(
	3,
	'Alojzy',
	'Kwiatkowski',
	'Zielona Góra ul.Kiliñskiego 26 50-087',
	'933823110'
)
,(
	4,
	'Alan',
	'Kalinowski',
	'Jaworzno ul.Bielska 64 53-194',
	'787883993'
)
,(
	5,
	'Kacper',
	'Rutkowski',
	'Piotrków Trybunalski ul.Akacjowa 97 77-645',
	'452897123'
)
,(
	6,
	'Olaf',
	'B³aszczyk',
	'Suwa³ki ul.Us³ugowa 47 19-582',
	'671381074'
)
,(
	7,
	'Karol',
	'Sawicki',
	'S³upsk ul.£¹kowa 20 61-974',
	'679676523'
)
,(
	8,
	'Leszek',
	'Nowak',
	'Che³m ul.Piesza 32 68-725',
	'648614114'
)
,(
	9,
	'£ukasz',
	'Maj',
	'Tarnobrzeg ul.Bielska 35 42-875',
	'269181454'
)
,(
	10,
	'Marcin',
	'Jankowski',
	'Wroc³am ul.Ko³¹taja 30 32-676',
	'967454540'
)

--sprawdzenie

SELECT * FROM ksiegowosc.pracownicy

--tabela godziny  

INSERT INTO ksiegowosc.godziny
(
	[id_godziny],
	[data], --DATE - format YYYY-MM-DD
	[liczba_godzin],
	[id_pracownika]
)
VALUES
(
	1,
	'2021-05-04',
	293,
	1
)
,(
	2,
	'2021-05-05',
	271,
	2
)
,(
	3,
	'2021-05-06',
	172,
	3
)
,(
	4,
	'2021-05-07',
	206,
	4
)
,(
	5,
	'2021-05-07',
	70,
	5
)
,(
	6,
	'2021-05-08',
	65,
	6
)
,(
	7,
	'2021-05-08',
	170,
	7
)
,(
	8,
	'2021-05-08',
	206,
	8
)
,(
	9,
	'2021-05-09',
	80,
	9
)
,(
	10,
	'2021-05-09',
	150,
	10

)
 
 --sprawdzenie

 SELECT * FROM ksiegowosc.godziny

 --tabela pensja
 
 INSERT INTO ksiegowosc.pensja
(
	[id_pensji],
	[stanowisko],
	[kwota]
)
VALUES
(
	1,
	'Programista',
	4018
)
,(
	2,
	'Analityk',
	13707
)
,(
	3,
	'Analityk',
	10309
)
,(
	4,
	'Programista',
	10082
)
,(
	5,
	'Sta¿ysta',
	2850
)
,(
	6,
	'Sta¿ysta',
	2700
)
,(
	7,
	'Analityk',
	6737
)
,(
	8,
	'Administrator',
	7295
)
,(
	9,
	'Sta¿ysta',
	3000
)
,(
	10,
	'Administrator',
	6585
)

--sprawdzenie

SELECT * FROM ksiegowosc.pensja

--tabela premia 

INSERT INTO ksiegowosc.premia
(
	[id_premii],
	[rodzaj],
	[kwota]
)
VALUES
(
	1,
	'Uznaniowa',
	488
)
,(
	2,
	'Uznaniowa',
	1164
)
,(
	3,
	'Uznaniowa',
	661
)
,(
	4,
	'Regulaminowa',
	1171
)
,(
	5,
	'Regulaminowa',
	107
)
,(
	6,
	'Regulaminowa',
	631
)
,(
	7,
	NULL,
	NULL
)
,(
	8,
	'Uznaniowa',
	1300
)
,(
	9,
	NULL,
	NULL
)
,(
	10,
	'Regulaminowa',
	101
)

--sprawdzenie 

SELECT * FROM ksiegowosc.premia

--tabela wynagrodzenie

INSERT INTO ksiegowosc.wynagrodzenie
(
	[id_wynagrodzenia],
	[data],
	[id_pracownika],
	[id_godziny],
	[id_pensji],
	[id_premii]
	)
VALUES
(
	1,
	'2021-05-30',
	1,
	1,
	1,
	1
),
(
	2,
	'2021-05-29',
	2,
	2,
	2,
	2
),
(
	3,
	'2021-05-30',
	3,
	3,
	3,
	3
),
(
	4,
	'2021-05-31',
	4,
	4,
	4,
	4
),
(
	5,
	'2021-05-30',
	5,
	5,
	5,
	5
),
(
	6,
	'2021-05-28',
	6,
	6,
	6,
	6
),
(
	7,
	'2021-05-30',
	7,
	7,
	7,
	7
),
(
	8,
	'2021-05-29',
	8,
	8,
	8,
	8
),
(
	9,
	'2021-05-30',
	9,
	9,
	9,
	9
),
(
	10,
	'2021-05-27',
	10,
	10,
	10,
	10
)

--6a. Zmodyfikuj numer telefonu w tabeli pracownicy, dodajac do niego kierunkowy dla Polski w nawiasie (+48)

UPDATE ksiegowosc.Pracownicy
SET telefon = CONCAT('(+48)', telefon)
SELECT * FROM ksiegowosc.pracownicy

--6b. Zmodyfikuj atrybut telefon w tabeli pracownicy tak, aby numer oddzielony by³ myœlnikami wg wzoru: ‘555-222-333’ 

UPDATE ksiegowosc.Pracownicy
SET telefon = SUBSTRING(telefon, 1,5) + ' ' + SUBSTRING(telefon, 6,3) + '-' + SUBSTRING(telefon, 9,3) + '-' + SUBSTRING(telefon, 12,3)

SELECT * FROM ksiegowosc.pracownicy

--SUBSTRING zwraca np zaczynajac od 6 litery 3 litery
-- + to jest to samo co concat i laczy stringi w jeden

SELECT TOP 1 PERCENT UPPER(imie), UPPER(nazwisko)
FROM ksiegowosc.pracownicy
ORDER BY DATALENGTH(nazwisko) DESC

--SELECT TOP 1 PERCENT columns, zwraca pierwszy wiersz z podanych kolumn

--6d. Wyœwietl dane pracowników i ich pensje zakodowane przy pomocy algorytmu md5 

SELECT 
	p1.id_pracownika,
	HASHBYTES('MD5' ,p1.imie) AS IMIE,
	HASHBYTES('MD5' ,p1.nazwisko) AS NAZWISKO,
	HASHBYTES('MD5' , CONVERT(VARCHAR,p2.kwota)) AS PENSJA,
	HASHBYTES('MD5' , CONVERT(VARCHAR,p3.kwota)) AS PREMIA
FROM ksiegowosc.Pracownicy as p1
INNER JOIN ksiegowosc.wynagrodzenie AS w
ON p1.id_pracownika = w.id_pracownika
INNER JOIN ksiegowosc.pensja AS p2
ON w.id_pensji = p2.id_pensji
INNER JOIN ksiegowosc.premia AS p3
ON w.id_premii = p3.id_premii

--6f. Wyswietl pracownikow, ich pensje oraz premie. Wykorzystaj zlaczenie lewostronne
SELECT imie, nazwisko, pensja.kwota AS pensja, premia.kwota AS premia
FROM ksiegowosc.pracownicy
LEFT OUTER JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
LEFT OUTER JOIN ksiegowosc.premia ON wynagrodzenie.id_premii = premia.id_premii
LEFT OUTER JOIN ksiegowosc.pensja ON wynagrodzenie.id_pensji = pensja.id_pensji

--6g. Wygeneruj raport (zapytanie), ktore zwroci wyniki wedlug szablonu
UPDATE ksiegowosc.premia 
SET kwota = 0
WHERE kwota IS NULL

SELECT 'Pracownik ' + imie + ' ' + nazwisko + ' w dniu ' + CONVERT(VARCHAR, godziny.data) + ' otrzymal pensje calkowita na kwote ' + CONVERT(VARCHAR, pensja.kwota + premia.kwota + (godziny.nadgodziny*20)) +
', gdzie wynagrodzenie zasadnicze wynosilo: ' + CONVERT(VARCHAR, pensja.kwota) + ',premia: ' + CONVERT(VARCHAR, premia.kwota) + ' nadgodziny: ' + CONVERT(VARCHAR, (godziny.nadgodziny * 20))
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
JOIN ksiegowosc.godziny ON godziny.id_godziny = wynagrodzenie.id_godziny
JOIN ksiegowosc.pensja ON pensja.id_pensji = wynagrodzenie.id_pensji
JOIN ksiegowosc.premia ON premia.id_premii = wynagrodzenie.id_wynagrodzenia

ALTER TABLE ksiegowosc.godziny 
ADD nadgodziny INTEGER  

UPDATE ksiegowosc.godziny
SET nadgodziny = liczba_godzin - 160
WHERE liczba_godzin > 160

UPDATE ksiegowosc.godziny
SET nadgodziny = 0
WHERE nadgodziny IS NULL

SELECT * FROM ksiegowosc.godziny