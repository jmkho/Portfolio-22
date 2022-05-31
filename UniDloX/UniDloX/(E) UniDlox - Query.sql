--1. Display StaffID, StaffName, StaffAddress, SupplierName, Total Purchases (obtained from the total number of 
-- purchase) for every purchase which occurs in November and handled by Staff whose the last 
-- character of StaffID is an even number.

SELECT 
	pth.StaffId, 
	StaffName, 
	StaffAddress, 
	SupplierName, 
	[Total Purchases] = SUM(PurchaseQuantity) 
FROM purchaseTransactionHeader pth
JOIN MsStaff mst ON mst.StaffId = pth.StaffId
JOIN MsSupplier msu ON msu.SupplierId = pth.SupplierId
JOIN purchaseTransactionDetail ptd ON ptd.PurchaseId = pth.PurchaseId
WHERE 
	MONTH(TransactionDate) = 11 
GROUP BY 
	pth.StaffId, 
	StaffName, 
	StaffAddress, 
	SupplierName
HAVING 
	SUBSTRING(pth.StaffId, 3, 3) % 2 = 0 



--2.	Display SalesID, CustomerName, Total Sales Price (obtained from sum of the cloth price and quantity) for 
-- every sales transaction whose CustomerName contains “m” and the total sales price is greater than 2000000.

SELECT 
	[SalesID] = sth.SalesId, 
	CustomerName, 
	[Total Sales Price] = SUM(clothPrice * salesQuantity)
FROM salesTransactionHeader sth 
JOIN salesTransactionDetail std ON sth.SalesId = std.SalesId
JOIN MsCustomer msc ON msc.CustomerId = sth.CustomerId
JOIN MsCloth mcs ON mcs.ClothId = std.ClothId 
WHERE 
	CustomerName LIKE '%m%' 
GROUP BY 
	sth.SalesId, CustomerName
HAVING
	SUM(ClothPrice * SalesQuantity) > 2000000



--3. Display Month (obtained from month name), Transaction Count (obtained from the total number of purchases), 
-- and Material Sold Count (obtained from the sum of quantity) for every purchase that is managed by staff 
-- whose StaffAge between 25 and 30 and the material sold price is more than 150000.

SELECT 
	[Month] = DATENAME(MONTH, TransactionDate), 
	[Transaction Count] = COUNT(MONTH(TransactionDate)), 
	[Material Sold Count] = SUM(PurchaseQuantity)
FROM purchaseTransactionHeader pth
JOIN purchaseTransactionDetail ptd ON ptd.PurchaseId = pth.PurchaseId
JOIN MsStaff msf ON msf.StaffId = pth.StaffId
JOIN MsMaterial mmp ON mmp.MaterialId = ptd.MaterialId
WHERE 
	(StaffAge > 25 AND 
	StaffAge < 30) AND 
	MaterialPrice > 150000
GROUP BY 
	DATENAME(MONTH, TransactionDate)



--4.	Display CustomerName (obtained from customer name in lowercase format), CustomerEmail, CustomerAddress, 
-- Cloth Bought Count (Obtained from the total number of cloths bought), and Total Price (obtained by adding 
-- “IDR ” in front of the sum of quantity and cloth price) for every transaction which payment using 
-- “Cryptocurrency”, “Cash”, or “Shopee-Pay”.

SELECT 
	[CustomerName] = LOWER(CustomerName), 
	CustomerEmail, 
	CustomerAddress, 
	[Cloth Bought Count] = SUM(SalesQuantity), 
	[Total Price] = CONCAT('IDR ', SUM(SalesQuantity * ClothPrice))
FROM salesTransactionHeader sth 
JOIN salesTransactionDetail std ON std.SalesId = sth.SalesId
JOIN MsCustomer msc ON msc.customerId = sth.customerId 
JOIN MsPayment msp ON msp.PaymentTypeId = sth.PaymentTypeId 
JOIN MsCloth mcs ON mcs.ClothId = std.ClothId
WHERE 
	msp.PaymentTypeId in ('PA008', 'PA005', 'PA004') 
GROUP BY 
	CustomerName, 
	CustomerEmail, 
	CustomerAddress



--5. Display PurchaseID (obtained from the last 3 characters of the PurchaseID), PurchaseDate, 
-- StaffName, and PaymentTypeName for every transaction which served by staff whose gender is female and salary 
-- is greater than the average salary of every staff who was born before 1996.
-- (alias subquery)
--CURRENT YEAR: 2022

SELECT 
	[PurchaseId] = SUBSTRING(PurchaseId, 3, 5),
	[PurchaseDate] = TransactionDate,
	StaffName,
	[PaymentTypeName] = PaymentType
FROM 
	purchaseTransactionHeader pth
JOIN MsStaff mss ON mss.StaffId = pth.StaffId
JOIN MsPayment msp ON msp.PaymentTypeId = pth.PaymentTypeId,
	(SELECT AVG(StaffSalary) AS AvgSlr 
	FROM MsStaff 
	WHERE StaffAge > 26) avg_slr
WHERE 
	StaffGender = 'Female' AND
	StaffSalary > avg_slr.AvgSlr



--6.	Display SalesID, SalesDate (obtained from SalesDate with “Mon dd, yyyy” format), CustomerName, 
-- CustomerGender for every transaction which occurred in 2021 and quantity is lower than the minimum quantity 
-- of all transaction that occurred on the 15th day of the month.
-- (alias subquery)

SELECT 
	sth.SalesId,
	[SalesDate] = CONVERT(DATE, TransactionDate, 0),
	CustomerName,
	CustomerGender
FROM salesTransactionHeader sth
JOIN salesTransactionDetail std ON std.SalesId = sth.SalesId
JOIN MsCustomer msc ON msc.CustomerId = sth.CustomerId,
	(SELECT MIN(SalesQuantity) AS SalesQty 
	FROM salesTransactionDetail std
	JOIN salesTransactionHeader sth ON sth.SalesId = std.SalesId
	WHERE DAY(TransactionDate) = 15) sales_qty
WHERE 
	YEAR(TransactionDate) = 2021 AND
	SalesQuantity < sales_qty.SalesQty



-- 7.	Display PurchaseID, SupplierName, SupplierPhone (obtained by replacing SupplierPhone first character 
-- into ‘+62’), PurchaseDate (obtained from the weekday of the PurchaseDate), Quantity for every transaction 
-- which occurred on Friday until Sunday and quantity is greater than average of total quantity (obtained from 
-- sum of the quantity) for every purchase.
-- (alias subquery)

SELECT 
	pth.PurchaseId, 
	SupplierName, 
	[SupplierPhone] = STUFF(SupplierPhoneNumber, 1, 1, '+62'),
	[PurchaseDate] = DATEPART(WEEKDAY, TransactionDate),
	[Quantity] = SUM(PurchaseQuantity)
FROM purchaseTransactionHeader pth 
JOIN MsSupplier mss ON mss.SupplierId = pth.SupplierId
JOIN purchaseTransactionDetail ptd ON ptd.PurchaseId = pth.PurchaseId,
	(SELECT AVG(PurchaseQuantity) AS AvgQty FROM purchaseTransactionDetail) avg_qty
WHERE 
	(DATEPART(WEEKDAY, TransactionDate) = 6  OR 
	DATEPART(WEEKDAY, TransactionDate) = 7 OR
	DATEPART(WEEKDAY, TransactionDate) = 1) 
	AND PurchaseQuantity > avg_qty.AvgQty 
GROUP BY 
	pth.PurchaseId, 
	SupplierName, 
	SupplierPhoneNumber,
	TransactionDate



--8.	Display CustomerName (obtained by adding “Mr. ” in front of the CustomerName if CustomerGender is Male 
-- or “Mrs. ” if CustomerGender is female), CustomerPhone, CustomerAddress, CustomerDOB (obtained from SalesDate 
-- with “dd/mm/yyy” format), and Cloth Count (obtained from the total number of cloths bought) for every customer 
--which has the highest total number of cloth bought and CustomerName contains “o”.
--(alias subquery)

select
[CustomerName] = CASE WHEN CustomerGender = 'Male' THEN CONCAT('Mr. ', CustomerName) 
      WHEN CustomerGender = 'Female' THEN CONCAT('Mrs. ', CustomerName) END,
CustomerPhoneNumber,
[CustomerAddress],
[CustomerDOB] = CONVERT(varchar(20), CustomerDOB, 103),
[Cloth Count]
from salesTransactionHeader sth 
JOIN salesTransactionDetail std ON std.SalesId = sth.SalesId
JOIN MsCustomer msc ON msc.customerId = sth.customerId
JOIN MsCloth mcs ON mcs.ClothId = std.ClothId,
(
	select sth.SalesId, count(distinct std.SalesQuantity) as [Cloth Count]
	from salesTransactionDetail std
	join salesTransactionHeader sth on sth.SalesId = std.SalesId
	group by sth.SalesId
) a , (
	select max([Cloth Count]) as [max Cloth Count]
	from (
		select sth.SalesId, count(distinct std.SalesQuantity) as [Cloth Count]
		from salesTransactionDetail std
		join salesTransactionHeader sth on sth.SalesId = std.SalesId
		group by sth.SalesId
		) a1
) b
where a.SalesId = sth.SalesId and CustomerName like '%o%'



--9.	Create a view named “ViewCustomerTransaction” to display CustomerID, CustomerName, CustomerEmail, CustomerDOB, 
-- Minimum Quantity (obtained from the minimum quantity purchased), Maximum Quantity (obtained from the maximum 
-- quantity purchased) for every customer whose born in 2000 and later and has an email domain “@yahoo.com”

CREATE VIEW [ViewCustomerTransaction] AS
SELECT sth.CustomerId, CustomerName, CustomerEmail, CustomerDOB, 
	[Minimum Quantity] = MIN(SalesQuantity), 
	[Maximum Quantity] = MAX(SalesQuantity)
FROM salesTransactionHeader sth 
JOIN salesTransactionDetail std ON std.SalesId = sth.SalesId
JOIN MsCustomer msc ON msc.customerId = sth.customerId  
JOIN MsCloth mcs ON mcs.ClothId = std.ClothId
WHERE (YEAR(CustomerDOB) > 1999) and (CustomerEmail LIKE '%@yahoo.com')
GROUP BY sth.CustomerId, CustomerName, CustomerEmail, CustomerDOB



--10. Create a view named “ViewFemaleStaffTransaction” to view StaffID, StaffName (obtained by uppercasing StaffName), 
-- StaffSalary (obtained by adding “Rp. ” in front of the StaffSalary and ends with “,00”), Material Bought Count 
-- (obtained from count of the material bought and ends with “ Pc(s)”) for every staff whose gender is 
-- female and salary is greater than average of all staff salaries.

CREATE VIEW [ViewFemaleStaffTransaction] AS
SELECT pth.StaffId, 
	[StaffName] = upper(StaffName), 
	[StaffSalary] = concat('Rp. ', StaffSalary, ',00'),
	[Material Bought Count] = concat(PurchaseQuantity, ' Pc(s)')
from purchaseTransactionHeader pth
join purchaseTransactionDetail ptd on ptd.PurchaseId = pth.PurchaseId
join MsStaff mst on mst.StaffId = pth.StaffId
join MsMaterial msm on msm.MaterialId = ptd.MaterialId,
(SELECT AVG(StaffSalary) AS StfSlr FROM MsStaff) stf_slr
WHERE 
	(StaffGender = 'Female') AND 
	StaffSalary > stf_slr.StfSlr
group by pth.StaffId, StaffName, StaffSalary, ptd.PurchaseQuantity
