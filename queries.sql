-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the databASe. Shows 77 records.

SELECT c.CategoryName AS Category, p.ProductName AS ProductName
FROM [Product] AS p
JOIN Category AS c ON p.CategoryId = c.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT o.id, s.CompanyName
FROM [Order] AS o
JOIN Shipper AS s ON o.ShipVia = s.Id
where o.OrderDate < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT p.ProductName, od.quantity
FROM Product AS p
JOIN OrderDetail AS od ON p.Id = od.ProductId
WHERE od.OrderId = 10251;


-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT o.Id, c.CompanyName, e.LastName
FROM [Order] AS o
JOIN Customer AS c ON o.customerId = c.Id
JOIN Employee AS e ON e.Id = o.employeeId;