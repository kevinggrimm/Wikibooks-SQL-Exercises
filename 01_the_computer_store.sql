# SQL Exercises/The computer store

https://en.wikibooks.org/wiki/SQL_Exercises/The_computer_store

-- Relational Schema:

     Manufacturers
Column        Data type
- Code (PK)   - integer
- Name        - text

          Products
Column                Data type
– Code (PK)           – integer
– Name                – text
– Price               – real
– Manufacturer (FK)   – integer

-- I. Select the names of all the products in the store.

SELECT Name FROM Products;

-- II. Select the names and the prices of all the products in the store.

SELECT Name, Price FROM Products;

-- III. Select the name of the products with a price less than or equal to $200.

SELECT Name, Price FROM Products
  WHERE Price <= 200;

-- IV. Select all the products with a price between $60 and $120.

SELECT * FROM Products
  WHERE Price BETWEEN 60 AND 120;

-- V. Select the name and price in cents (i.e., the price must be multiplied by 100).

SELECT Name, (Price * 100) FROM Products;

-- VI. Compute the average price of all the products.

SELECT AVG(Price) FROM Products;

-- VII. Compute the average price of all products with manufacturer code equal to 2.

SELECT AVG(Price) FROM Products
  WHERE Manufacturer = 2;

-- VIII. Compute the number of products with a price larger than or equal to $180.

SELECT COUNT(Price) FROM Products
  WHERE Price >= 180;

-- IX. Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).

SELECT Name, Price FROM Products
  WHERE Price >= 180
  ORDER BY Price DESC, Name; 

-- X. Select all the data from the products, including all the data for each product's manufacturer.

SELECT * FROM Products, Manufacturers
  WHERE Products.Manufacturer = Manufacturers.Code;

-- XI. Select the product name, price, and manufacturer name of all the products.

SELECT Products.Name, Price, Manufacturers.Name FROM Products
  JOIN Manufacturers ON Products.Manufacturer = Manufacturers.Code;

-- XII. Select the average price of each manufacturer's products, showing only the manufacturer's code.

SELECT AVG(Price), Manufacturer FROM Products
  GROUP BY Manufacturer; 

-- XIII. Select the average price of each manufacturer's products, showing the manufacturer's name.

SELECT AVG(Price) Manufacturers.Name FROM Products
  JOIN Manufacturers ON Products.Manufacturer = Manufacturers.Code
  GROUP BY Manufacturers.Name; 

-- XIV. Select the names of manufacturer whose products have an average price larger than or equal to $150.

SELECT AVG(Price), Manufacturers.Name FROM Products
  JOIN Manufacturers ON Products.Manufacturer = Manufacturers.Code
  GROUP BY Manufacturers.Name
  HAVING AVG(Price) >= 150; 

-- XV. Select the name and price of the cheapest product.

SELECT Name, Price FROM Products
  WHERE Price = (SELECT MIN(Price) FROM Products);
  
SELECT Name, Price FROM Products
  ORDER BY Price
  LIMIT 1; 

-- XVI. Select the name of each manufacturer along with the name and price of its most expensive product.

SELECT P.Name, P.Price, M.Name FROM Products P
     JOIN Manufacturers M ON P.Manufacturer = M.Code AND P.Price = 
      (SELECT MAX(P.Price) FROM Products P WHERE P.Manufacturer = M.Code);     
     
-- XVII. Add a new product: Loudspeakers, $70, manufacturer 2.

INSERT INTO Products(Code, Name, Price, Manufacturer)
VALUES(11, 'Loudspeakers', 70, 2);

-- XVIII. Update the name of product 8 to "Laser Printer".

UPDATE Products
     SET Name = "Laser Printer"
     WHERE Code = 8;

-- XIX. Apply a 10% discount to all products.

UPDATE Products
     SET Price = Price – (Price * 0.1);

-- XX. Apply a 10% discount to all products with a price larger than or equal to $120.

UPDATE Products
     SET Price = Price – (Price * 0.1);
     WHERE Price >= 120;
     
