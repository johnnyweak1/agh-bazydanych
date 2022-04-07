USE firma;
GO

CREATE DATABASE firma;

CREATE SCHEMA rozliczenia;

CREATE TABLE rozliczenia.pracownicy(id_pracownika CHAR(6) PRIMARY KEY NOT NULL, imie VARCHAR(50) NOT NULL, nazwisko VARCHAR(50) NOT NULL, adres VARCHAR(50) NOT NULL, telefon INTEGER NOT NULL);

CREATE TABLE rozliczenia.godziny(id_godziny CHAR(6) PRIMARY KEY NOT NULL, data DATE NOT NULL, liczba_godzin INTEGER NOT NULL, id_pracownika CHAR(6) NOT NULL);

CREATE TABLE rozliczenia.pensje(id_pensji CHAR(6) PRIMARY KEY NOT NULL, stanowisko VARCHAR(80) NOT NULL ,kwota INTEGER NOT NULL, id_premii CHAR(6) NULL);

CREATE TABLE rozliczenia.premie(id_premii CHAR(6) PRIMARY KEY NOT NULL, rodzaj VARCHAR(50) NULL, kwota INTEGER NULL);

ALTER TABLE rozliczenia.godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika);

ALTER TABLE rozliczenia.pensje
ADD FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii);

--pracownicy

INSERT INTO rozliczenia.pracownicy
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
	'176949960'
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


SELECT * FROM rozliczenia.pracownicy --wypisuje tabele

-- Premie

INSERT INTO rozliczenia.premie
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


SELECT * FROM rozliczenia.premie


--Pensje


INSERT INTO rozliczenia.pensje
(
	[id_pensji],
	[stanowisko],
	[kwota],
	[id_premii]
)
VALUES
(
	1,
	'Programista',
	4018,
	1
)
,(
	2,
	'Analityk',
	13707,
	2
)
,(
	3,
	'Analityk',
	10309,
	3
)
,(
	4,
	'Programista',
	10082,
	4
)
,(
	5,
	'Sta¿ysta',
	2850,
	5
)
,(
	6,
	'Sta¿ysta',
	2700,
	6
)
,(
	7,
	'Analityk',
	6737,
	7
)
,(
	8,
	'Administrator',
	7295,
	8
)
,(
	9,
	'Sta¿ysta',
	3000,
	9
)
,(
	10,
	'Administrator',
	6585,
	10

)


SELECT * FROM rozliczenia.pensje

-- Godziny



INSERT INTO rozliczenia.godziny
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
	158,
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


SELECT * FROM rozliczenia.godziny


--5

SELECT pracownicy.nazwisko, pracownicy.adres FROM rozliczenia.pracownicy

--6

SELECT DATEPART(day, godziny.data) [day], DATEPART(month, godziny.data) [month] FROM rozliczenia.godziny

--7

EXEC sp_rename 'rozliczenia.pensje.kwota', 'kwota_brutto';

SELECT * from rozliczenia.pensje;

ALTER TABLE rozliczenia.pensje ADD kwota_netto AS (pensje.kwota_brutto *0.79)

SELECT * from rozliczenia.pensje;


