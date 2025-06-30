-- Query 1: Average Unit Price by Country
SELECT Country, AVG(UnitPrice) AS Avg_Unit_Price
FROM ecommercedata
GROUP BY Country
ORDER BY Avg_Unit_Price DESC;

-- Query 2: Number of Orders by Country
SELECT Country, COUNT(DISTINCT InvoiceNo) AS Number_of_Orders
FROM ecommercedata
GROUP BY Country
ORDER BY Number_of_Orders DESC;

-- Query 3: Orders from Countries with Total Sales > 1000
SELECT Country, SUM(UnitPrice * Quantity) AS Total_Sales
FROM ecommercedata
GROUP BY Country
HAVING Total_Sales > 1000
ORDER BY Total_Sales DESC;

-- Query 4: Top Selling Products by Total Quantity
SELECT Description AS Product, SUM(Quantity) AS Total_Quantity_Sold
FROM ecommercedata
GROUP BY Product
ORDER BY Total_Quantity_Sold DESC
LIMIT 10;

-- Query 5: Create View - Top Products Summary
CREATE VIEW Top_Products_View AS
SELECT Description AS Product, SUM(Quantity) AS Total_Quantity_Sold
FROM ecommercedata
GROUP BY Product
ORDER BY Total_Quantity_Sold DESC
LIMIT 10;

-- Query 6: Create Indexes for Optimization
CREATE INDEX idx_country ON ecommercedata(Country);
CREATE INDEX idx_customerid ON ecommercedata(CustomerID);
CREATE INDEX idx_invoiceno ON ecommercedata(InvoiceNo);
CREATE INDEX idx_description ON ecommercedata(Description);
CREATE INDEX idx_invoicedate ON ecommercedata(InvoiceDate);
