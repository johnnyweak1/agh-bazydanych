-- 1. stworzenie bazy danych 

CREATE DATABASE FIRMA2;

-- 2. stworzenie schematu ksiegowosc 

CREATE SCHEMA ksiegowosc;

-- 3. dodanie tabel

--tabela pracownicy 

CREATE TABLE ksiegowosc.pracownicy(id_pracownika VARCHAR(6) PRIMARY KEY NOT NULL, imie VARCHAR(50) NOT NULL, nazwisko VARCHAR(50) NOT NULL, adres VARCHAR(50) NOT NULL, telefon INTEGER NOT NULL);

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
	'Bielsko-Biała ul.Kasztanowa 31 12-405',
	'176949960'
)
,(
	2,
	'Allan',
	'Duda',
	'Kielce ul.Słowiańska 88 79-507',
	'512432132'
)
,(
	3,
	'Alojzy',
	'Kwiatkowski',
	'Zielona Góra ul.Kilińskiego 26 50-087',
	'933823110'
)
,(
	4,
	'Alan',
	'Kalinowski',
	'Jaworzno ul.Bielska 64 53-194',
	'78788399'
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
	'Błaszczyk',
	'Suwałki ul.Usługowa 47 19-582',
	'671381074'
)
,(
	7,
	'Karol',
	'Sawicki',
	'Słupsk ul.Łąkowa 20 61-974',
	'679676523'
)
,(
	8,
	'Leszek',
	'Nowak',
	'Chełm ul.Piesza 32 68-725',
	'648614114'
)
,(
	9,
	'Łukasz',
	'Maj',
	'Tarnobrzeg ul.Bielska 35 42-875',
	'269181454'
)
,(
	10,
	'Marcin',
	'Jankowski',
	'Wrocłam ul.Kołątaja 30 32-676',
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
	'Stażysta',
	2850
)
,(
	6,
	'Stażysta',
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
	'Stażysta',
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

--sprawdzenie

SELECT * FROM ksiegowosc.wynagrodzenie

-- 6a. wyswietl tylko id pracownika i nazwisko

SELECT pracownicy.id_pracownika, pracownicy.nazwisko 
FROM ksiegowosc.pracownicy;

-- 6b. wyswietl id pracownikow, ktorych placa jest wieksza niz 1000

SELECT pracownicy.id_pracownika, pensja.kwota 
FROM ksiegowosc.pracownicy 
JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
JOIN ksiegowosc.pensja ON pensja.id_pensji = wynagrodzenie.id_wynagrodzenia
WHERE pensja.kwota > 1000;

-- 6c. wyswietl id pracownikow nieposiadajacych premii, ktorych placa jest wieksza niz 2000

SELECT pracownicy.id_pracownika 
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
JOIN ksiegowosc.pensja ON pensja.id_pensji = wynagrodzenie.id_wynagrodzenia
JOIN ksiegowosc.premia ON premia.id_premii = wynagrodzenie.id_premii
WHERE premia.kwota IS NULL AND pensja.kwota > 2000;

-- 6d. wyswietl pracownikow, ktorych pierwsza litera imienia zaczyna się na litere J

SELECT pracownicy.imie, pracownicy.nazwisko 
FROM ksiegowosc.pracownicy 
WHERE pracownicy.imie LIKE 'J%';

-- 6e. wyswietl pracownikow, ktorych naziwko zawiera litere 'n' oraz imie konczy się na litere 'a'

SELECT pracownicy.imie, pracownicy.nazwisko 
FROM ksiegowosc.pracownicy 
WHERE pracownicy.nazwisko LIKE '%n%' AND pracownicy.imie LIKE '%a';

-- 6f. wyswietl imie i nazwisko pracownikow oraz liczbe ich nadgodzin przyjmując iż standardowy czas pracy to 160h miesiecznie

SELECT pracownicy.imie, pracownicy.nazwisko, godziny.liczba_godzin, liczba_godzin - 160 AS Nadgodziny
FROM ksiegowosc.pracownicy 
JOIN ksiegowosc.godziny ON pracownicy.id_pracownika = godziny.id_godziny 
WHERE liczba_godzin >160;

-- 6g. wyswietl imie i nazwisko pracownikow, ktorych pensja zawiera sie w przedziale 1500 - 3000 PLN

SELECT pracownicy.imie, pracownicy.nazwisko 
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
JOIN ksiegowosc.pensja ON pensja.id_pensji = wynagrodzenie.id_pensji
WHERE pensja.kwota > 1500 AND pensja.kwota < 3000;

-- 6h. wyświetl imię i nazwisko pracowników, którzy pracowali w nadgodzinach i nie otrzymali premii

SELECT pracownicy.imie, pracownicy.nazwisko
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika 
JOIN ksiegowosc.premia ON premia.id_premii = wynagrodzenie.id_premii 
JOIN ksiegowosc.godziny ON godziny.id_godziny = wynagrodzenie.id_godziny WHERE godziny.liczba_godzin > 160 AND premia.kwota IS NULL;

-- 6i. uszereguj pracownikow wedlug pensji

SELECT pracownicy.imie, pracownicy.nazwisko, pensja.kwota
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
JOIN ksiegowosc.pensja ON wynagrodzenie.id_pensji = pensja.id_pensji
ORDER BY pensja.kwota DESC;

-- 6j. uszereguj pracownikow wedlug pensji i premii malejaco

SELECT pracownicy.imie, pracownicy.nazwisko, pensja.kwota + premia.kwota AS wyplata
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
JOIN ksiegowosc.pensja ON wynagrodzenie.id_pensji = pensja.id_pensji
JOIN ksiegowosc.premia ON wynagrodzenie.id_premii = premia.id_premii
ORDER BY wyplata DESC;

-- 6k. zlicz i pogrupuj pracownikow wedlug pola stanowisko

SELECT pensja.stanowisko, COUNT(pensja.stanowisko) AS LiczbaStanowisk
FROM ksiegowosc.pensja
JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pensji = pensja.id_pensji
GROUP BY pensja.stanowisko ;

--6l. policz srednia, minimalna i maksymalna place dla stanowiska Analityk

SELECT AVG(pensja.kwota) AS Srednia, MIN(pensja.kwota) AS Minimalna, MAX(pensja.kwota) AS Maksymalna
FROM ksiegowosc.pensja
WHERE pensja.stanowisko = 'Analityk';

-- 6m. policz sume wszystkich wynagrodzen 

SELECT SUM(pensja.kwota) AS SumaPensji, SUM(premia.kwota) AS SumaPremii, SUM(premia.kwota) + SUM(pensja.kwota) AS Wszystko
FROM ksiegowosc.pensja
JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pensji = pensja.id_pensji
JOIN ksiegowosc.premia ON premia.id_premii = wynagrodzenie.id_wynagrodzenia;

-- 6f. Policz sume wynagrodzen w ramach danego stanowiska

SELECT pensja.stanowisko, SUM(premia.kwota) AS SumaPremii, SUM(pensja.kwota) AS SumaPensji
FROM ksiegowosc.pensja
JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pensji = pensja.id_pensji
JOIN ksiegowosc.premia ON premia.id_premii = wynagrodzenie.id_wynagrodzenia
GROUP BY pensja.stanowisko;

-- 6g. Wyznacz liczbe premiii przyznanych dla pracownikow danego stanowiska

SELECT pensja.stanowisko, COUNT(premia.kwota) AS LiczbaPremii
FROM ksiegowosc.pensja
JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pensji = pensja.id_pensji
JOIN ksiegowosc.premia ON premia.id_premii = wynagrodzenie.id_wynagrodzenia
GROUP BY pensja.stanowisko

--6h. Usun wszystkich pracownikow majacych pensje meniejsza niz 1200zl

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
	11,
	'Marek',
	'Wojtowicz',
	'Warszawa ul.Sienkiewicza 31 44-000',
	'421521351'
)
INSERT INTO ksiegowosc.godziny
(
	[id_godziny],
	[data], --DATE - format YYYY-MM-DD
	[liczba_godzin],
	[id_pracownika]
)
VALUES
(
	11,
	'2021-05-01',
	156,
	11)
INSERT INTO ksiegowosc.pensja
(
	[id_pensji],
	[stanowisko],
	[kwota]
)
VALUES
(
	11,
	'Woźny',
	2500)
INSERT INTO ksiegowosc.premia
(
	[id_premii],
	[rodzaj],
	[kwota]
)
VALUES
(
	11,
	'Regulaminowa',
	1000)
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
	11,
	'2021-08-22',
	11,
	11,
	11,
	11)

DELETE ksiegowosc.pracownicy 
FROM ksiegowosc.pracownicy 
JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
JOIN ksiegowosc.pensja ON pensja.id_pensji = wynagrodzenie.id_pensji
WHERE pensja.kwota < 1200;

SELECT *
FROM ksiegowosc.pracownicy 
JOIN ksiegowosc.wynagrodzenie ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
JOIN ksiegowosc.pensja ON pensja.id_pensji = wynagrodzenie.id_pensji

