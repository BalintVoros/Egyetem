Select  *
FROM
(SELECT CategoryName as kategoria,
    YEAR(OrderDate) as ev,
    sum(quantity ) as mennyiseg
FROM [Order Details] od
    JOIN Orders o on o.OrderID = od.OrderID
    Join Products p on od.ProductId = p.ProductID
    JOIN Categories c on p.CategoryID = c.CategoryID
    WHERE p.Unitprice  > 90
GROUP BY  c.CategoryID, YEAR(OrderDate),CategoryName ) as forras

--PIVOT (SUM(mennyiseg) for kategoria
--in ([Beverages],[Meat/poultry])) as PT
PIVOT (SUM(mennyiseg) for kategoria
in ([1996],[1997],[1998],[1999])) as PT

--2--
SELECT EmployeeID , COUNT(*) FROM EmployeeTerritories
GROUP by EmployeeID

Select top(1) * FROM Territories
WHERE TerritoryID not in (select  TerritoryID FROM EmployeeTerritories)
ORDER BY TerritoryDescription

--script

BEGIN TRY
--select 1/0
DECLARE @teruletazonosito VARCHAR(20)
DECLARE @teruletleiras CHAR(50)
DECLARE @empid INT
declare @teruletszam INT
set @empid = 2
Select @teruletszam = COUNT(*) from EmployeeTerritories
WHERE @empid = EmployeeID
---
IF @teruletszam > 5 PRINT '5-nél több területe van: '+cast(@teruletszam as varchar(3))
ELSE BEGIN
Select top(1) @teruletazonosito = TerritoryID, @teruletleiras = TerritoryDescription FROM Territories
WHERE TerritoryID not in (select  TerritoryID FROM EmployeeTerritories)
ORDER BY TerritoryDescription
if @teruletazonosito is NULL
PRINT 'Nincs szabad területe'
ELSE BEGIN
INSERT INTO EmployeeTerritories
VALUES(@empid, @teruletazonosito)
--alkalmazás fizetésemelésre
update Employees
set Salary = salary*1.25
WHERE EmployeeID = @empid
--adatok visszaírása
PRINT concat('A(z)' ,@empid, 'alkamazotthoz hozzárendeltük a következő területeket',@teruletazonosito ,' - ', @teruletleiras)
END
END
END TRY
BEGIN catch
PRINT CONCAT('Hiba: ',ERROR_Number(),' - ',Error_message())
END catch

DELETE from EmployeeTerritories
WHERE EmployeeID = 1 and TerritoryID = '78759'
UPDATE Employees SET Salary = 100 WHERE EmployeeID = 1


