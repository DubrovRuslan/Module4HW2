--------------------------�������----------------------------

----------------------������� �1-----------------------------
--������� ��� ���������� �� ������� Sales.Customer 
-------------------------------------------------------------
USE AdventureWorks2019
SELECT *
FROM Sales.Customer
GO

----------------------������� �2-----------------------------
--������� ��� ���������� �� ������� Sales.Store ��������������� 
--�� Name � ���������� �������
-------------------------------------------------------------
USE AdventureWorks2019
SELECT *
FROM Sales.Store
ORDER BY Name
GO

----------------------������� �3-----------------------------
--������� �� ������� HumanResources.Employee ��� ����������
--� ������ �����������, ������� �������� ����� 1989-09-28
-------------------------------------------------------------
USE AdventureWorks2019
SELECT TOP(10) *
FROM HumanResources.Employee
WHERE BirthDate > '1989-09-28'
GO

----------------------������� �4-----------------------------
--������� �� ������� HumanResources.Employee �����������
--� ������� ��������� ������ LoginID �������� 0.
--������� ������ NationalIDNumber, LoginID, JobTitle.
--������ ������ ���� ������������� �� JobTitle �� ��������
-------------------------------------------------------------
USE AdventureWorks2019
SELECT NationalIDNumber, LoginID, JobTitle
FROM HumanResources.Employee
WHERE RIGHT(LoginID, 1) = 0
ORDER BY JobTitle DESC
GO

----------------------������� �5-----------------------------
--������� �� ������� Person.Person ��� ���������� � �������, ������� ���� 
--��������� � 2008 ���� (ModifiedDate) � MiddleName ��������
--�������� � Title �� �������� �������� 
-------------------------------------------------------------
USE AdventureWorks2019
SELECT *
FROM Person.Person
WHERE YEAR(ModifiedDate) = '2008' AND MiddleName IS NOT NULL AND Title IS NULL
GO

----------------------������� �6-----------------------------
--������� �������� ������ (HumanResources.Department.Name) ��� ����������
--� ������� ���� ����������
--������������ ������� HumanResources.EmployeeDepartmentHistory � HumanResources.Department
-------------------------------------------------------------
USE AdventureWorks2019
SELECT DISTINCT d.Name
FROM HumanResources.EmployeeDepartmentHistory e
INNER JOIN HumanResources.Department d
ON e.EndDate IS NOT NULL
GO

----------------------������� �7-----------------------------
--������������ ������ �� ������� Sales.SalesPerson �� TerritoryID
--� ������� ����� CommissionPct, ���� ��� ������ 0
-------------------------------------------------------------
USE AdventureWorks2019
SELECT TerritoryID, SUM(CommissionPct) as 'CommissionPct'
FROM Sales.SalesPerson
GROUP BY TerritoryID
HAVING SUM(CommissionPct) > 0
GO

----------------------������� �8-----------------------------
--������� ��� ���������� � ����������� (HumanResources.Employee) 
--������� ����� ����� ������� ���-�� 
--������� (HumanResources.Employee.VacationHours)
-------------------------------------------------------------
USE AdventureWorks2019
SELECT *
FROM HumanResources.Employee
WHERE VacationHours = 
(
	SELECT MAX(HumanResources.Employee.VacationHours)
	FROM HumanResources.Employee
)
GO

----------------------������� �9-----------------------------
--������� ��� ���������� � ����������� (HumanResources.Employee) 
--������� ����� ������� (HumanResources.Employee.JobTitle)
--'Sales Representative' ��� 'Network Administrator' ��� 'Network Manager'
-------------------------------------------------------------
USE AdventureWorks2019
SELECT *
FROM HumanResources.Employee
WHERE JobTitle IN ('Sales Representative', 'Network Administrator', 'Network Manager')
GO

----------------------������� �10-----------------------------
--������� ��� ���������� � ����������� (HumanResources.Employee) � 
--�� ������� (Purchasing.PurchaseOrderHeader). ���� � ���������� ���
--������� �� ������ ���� ������� ����!!!
-------------------------------------------------------------
USE AdventureWorks2019
SELECT *
FROM HumanResources.Employee emp
LEFT JOIN
Purchasing.PurchaseOrderHeader ord
ON emp.BusinessEntityID = ord.EmployeeID
GO
