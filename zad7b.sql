 --1.  Napisz procedurê wypisuj¹c¹ do konsoli ci¹g Fibonacciego. Procedura musi przyjmowaæ jako argument wejœciowy liczbê n. Generowanie ci¹gu Fibonacciego musi zostaæ 
--zaimplementowane jako osobna funkcja, wywo³ywana przez procedurê.GOCREATE FUNCTION fib(@n int)RETURNS @wynik TABLE(wartosc INT)ASBEGINDECLARE @a INTDECLARE @b INTDECLARE @c INTDECLARE @licznik INTSET @a = 0SET @b = 1SET @c = 0SET @licznik = 3INSERT INTO @wynik(wartosc) values(@a),(@b)	WHILE(1=1)	BEGIN 		SET @c = @a + @b		INSERT INTO @wynik(wartosc) values(@c)		SET @a = @b		SET @b = @c		IF @licznik = @n		BEGIN		BREAK;		END		SET @licznik = @licznik + 1	ENDRETURNEND
GO

DROP FUNCTION fib

GO
CREATE PROCEDURE DisplayFib(@n INT)
AS
BEGIN
	SELECT *
	FROM fib(@n)
END
GO

EXEC DisplayFib @n = 13;
GO

-- 2. Napisz trigger DML, który po wprowadzeniu danych do tabeli Persons zmodyfikuje nazwisko tak, aby by³o napisane du¿ymi literami.

CREATE TRIGGER LastnameToUpper
ON Person.Person
AFTER INSERT, UPDATE
AS
BEGIN 
	UPDATE Person.Person
	SET LastName = UPPER(LastName) 
	WHERE LastName IN (SELECT LastName FROM INSERTED)
	PRINT('TRIGGER EXECUTED')
END

INSERT INTO Person.BusinessEntity(rowguid)
VALUES(newid())

INSERT INTO Person.Person (BusinessEntityID,FirstName,MiddleName,LastName,PersonType) 
VALUES (20779,'Jan','Jakub','Slaby','EM')
GO

SELECT * FROM Person.Person WHERE BusinessEntityID = 20779

DELETE FROM Person.Person WHERE BusinessEntityID = 20779

-- 3.Przygotuj trigger ‘taxRateMonitoring’, który wyœwietli komunikat o b³êdzie, je¿eli nast¹pi zmiana wartoœci w polu ‘TaxRate’ o wiêcej ni¿ 30%.

CREATE TRIGGER taxRateMonitoring
ON Sales.SalesTaxRate
AFTER UPDATE
AS
BEGIN
	DECLARE @NewTaxRate int, @TaxRate int
	SELECT @NewTaxRate = TaxRate FROM INSERTED SalesTaxRate
	SELECT @TaxRate = TaxRate FROM DELETED
	IF @NewTaxRate > 1.3*@TaxRate
	BEGIN
		PRINT 'Warning! The change in the value in the TaxRate field is greater than 30%'
	END
END
GO

 UPDATE Sales.SalesTaxRate
 SET TaxRate = 14.000 
 WHERE SalesTaxRateID = 1

