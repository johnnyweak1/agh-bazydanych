--1. Wykorzystuj¹c wyra¿enie CTE zbuduj zapytanie, które znajdzie informacje na temat stawki pracownika oraz jego danych, a nastêpnie zapisze je do tabeli tymczasowej 
--TempEmployeeInfo. Rozwi¹¿ w oparciu o AdventureWorks.

WITH EmployeeRate(name, middleName, lastName, rate)
AS(
	SELECT
	FirstName, MiddleName, LastName, EmployeePayHistory.Rate
	FROM 
	Person.Person
	INNER JOIN HumanResources.EmployeePayHistory ON EmployeePayHistory.BusinessEntityID = Person.BusinessEntityID
)
SELECT 
name, middleName, lastName, rate
FROM
EmployeeRate

--2.  Uzyskaj informacje na temat przychodów ze sprzeda¿y wed³ug firmy i kontaktu (za pomoc¹ CTE i bazy AdventureWorksLT)
WITH CompanyRevenue(CompanyContact, Revenue)
AS(
	SELECT CompanyName + ' (' + FirstName +' ' + Lastname + ')', TotalDue
	FROM SalesLT.Customer
	INNER JOIN SalesLT.SalesOrderHeader 
	ON SalesOrderHeader.CustomerID = Customer.CustomerID

)
SELECT DISTINCT CompanyContact, Revenue --DISTINCT DO WYSZUKIWANIA UNIKALNYCH WARTOSCI
FROM CompanyRevenue
ORDER BY CompanyContact ASC

--3.  Napisz zapytanie, które zwróci wartoœæ sprzeda¿y dla poszczególnych kategorii produktów
With CategorySalesValue(Category, SalesValue)
AS(
	SELECT ProductCategory.Name,  SUM(SalesOrderDetail.LineTotal)
	FROM SalesLT.ProductCategory
	INNER JOIN SalesLT.Product ON Product.ProductCategoryID = ProductCategory.ProductCategoryID
	INNER JOIN SalesLT.SalesOrderDetail ON SalesOrderDetail.ProductID = Product.ProductID
	GROUP BY ProductCategory.Name
)
SELECT Category, SalesValue
FROM CategorySalesValue
ORDER BY Category ASC