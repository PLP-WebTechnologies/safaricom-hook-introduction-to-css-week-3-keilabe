-- Customer Analysis

-- Question 1
SELECT b.BillID, b.CustomerID,  b.TotalAmount, c.customerName FROM bills b 
join customer c on b.CustomerID = c.customerID order by b.TotalAmount desc limit 5

-- Question 2
SELECT CustomerID, AVG(datediff(Duedate,BillDate)) AS AverageBillDate FROM bills GROUP BY CustomerID ;

-- Question 3
SELECT c.customerID, c.customerName FROM customer c WHERE NOT EXISTS ( SELECT 1 FROM bills b JOIN payments p ON b.BillID = p.BillID WHERE b.CustomerID = c.customerID AND p.PaymentDate > b.DueDate) AND EXISTS ( SELECT 1 FROM bills b WHERE b.CustomerID = c.customerID) ORDER BY c.customerName;

-- Question 4
SELECT SUM(LineTotal) AS TotalAmount FROM bill_items;

-- Question 5
select * from bill_items order by LineTotal desc limit 1;

-- Question 6
select * from bill_items order by LineTotal asc limit 1;

-- Question 7
SELECT 
    PaymentMethod,
    COUNT(*) as PaymentCount
FROM payments
GROUP BY PaymentMethod
ORDER BY PaymentCount DESC LIMIT 1;

-- Question 8
SELECT 
    PaymentMethod,
    SUM(PaymentAmount) as TotalRevenue
FROM payments
GROUP BY PaymentMethod
ORDER BY TotalRevenue DESC;

-- Question 9
select avg(PaymentAmount) as AveragePaymentAmount from payments;

-- Question 10
SELECT CustomerID, COUNT(*) AS unpaid_bills_count
FROM bills
WHERE status = 'unpaid'
GROUP BY CustomerID
ORDER BY unpaid_bills_count DESC
LIMIT 1;