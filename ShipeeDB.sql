CREATE TABLE tblShipper (
    ID INT AUTO_INCREMENT,
    shipperID INT UNIQUE NOT NULL,
    shipperName VARCHAR(64) NOT NULL,
    address VARCHAR(64) NOT NULL,
    contactNo VARCHAR(15) NOT NULL, -- Changed to VARCHAR for longer numbers
    CONSTRAINT pk_id PRIMARY KEY (ID),
    CONSTRAINT uk_shipper UNIQUE (shipperID)
);

CREATE TABLE tblCustomer (
    ID INT AUTO_INCREMENT,
    customerID INT UNIQUE NOT NULL,
    contactPerson VARCHAR(64) NOT NULL, 
    address VARCHAR(64) NOT NULL, 
    city VARCHAR(64) NOT NULL,
    postalCode VARCHAR(10) NOT NULL, -- Changed to VARCHAR for alphanumeric postal codes
    country VARCHAR(64) NOT NULL,
    CONSTRAINT pk_id PRIMARY KEY (ID),
    CONSTRAINT uk_customer UNIQUE (customerID)
);

CREATE TABLE tblProduct (
    ID INT AUTO_INCREMENT,
    productID INT UNIQUE NOT NULL,
    productName VARCHAR(64) NOT NULL,
    supplierID INT NOT NULL,
    categoryID INT NOT NULL,
    unit VARCHAR(64) NOT NULL, 
    price DECIMAL(10,2) NOT NULL, -- Changed to DECIMAL for precise monetary values
    CONSTRAINT pk_id PRIMARY KEY (ID),
    CONSTRAINT uk_product UNIQUE (productID)
);


CREATE TABLE tblOrder (
    ID INT AUTO_INCREMENT,
    orderID INT UNIQUE NOT NULL,
    customerID INT NOT NULL,  
    productID INT NOT NULL,
    employeeID INT NOT NULL, 
    deliveryDate DATE NOT NULL, 
    shipperID INT NOT NULL, 
    CONSTRAINT pk_id PRIMARY KEY (ID),
    CONSTRAINT uk_order UNIQUE (orderID),
    CONSTRAINT fk_customerID FOREIGN KEY (customerID) REFERENCES tblCustomer(customerID),
    CONSTRAINT fk_productID FOREIGN KEY (productID) REFERENCES tblProduct(productID),
    CONSTRAINT fk_shipperID FOREIGN KEY (shipperID) REFERENCES tblShipper(shipperID)
);

INSERT INTO tblShipper (ID, shipperID, shipperName, address, contactNo) VALUES
(1, 1, '2Go', 'Brgy 132 Mandaluyong City', '639103758490'),
(2, 2, 'Fedex', 'Bayanan Muntinlupa City', '639810223445'),
(3, 3, 'SPX', 'Munting Ilat Tagaytay City', '639772341116'),
(4, 4, 'LBC', 'Brgy Cubao Quezon City', '639871235556'),
(5, 5, 'Air21', '#14235 Antipolo Rizal', '634413239872');

INSERT INTO tblCustomer (ID, customerID, contactPerson, address, city, postalCode, country) VALUES
(1, 1001, 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany'),
(2, 1002, 'Ana Trujillo', 'Avda. de la Constitución 2222', 'México D.F.', '5021', 'Mexico'),
(3, 1003, 'Antonio Moreno', 'Mataderos 2312', 'México D.F.', '5023', 'Mexico'),
(4, 1004, 'Thomas Hardy', '120 Hanover Sq.', 'London', 'WA1 1DP', 'UK'),
(5, 1005, 'Christina Berglund', 'Berguvsvägen 8', 'Luleå', 'S-958 22', 'Sweden'),
(6, 1006, 'Hanna Moos', 'Forsterstr. 57', 'Mannheim', '68306', 'Germany'),
(7, 1007, 'Frédérique Citeaux', '24, place Kléber', 'Strasbourg', '67000', 'France'),
(8, 1008, 'Martin Sommer', 'C/ Araquil, 67', 'Madrid', '28023', 'Spain'),
(9, 1009, 'Laurence Lebihans', '12, rue des Bouchers', 'Marseille', '13008', 'France'),
(10, 1010, 'Elizabeth Lincoln', '23 Tsawassen Blvd.', 'Tsawassen', 'T2F 8M4', 'Canada');


INSERT INTO tblProduct (ID, productID, productName, supplierID, categoryID, unit, price) VALUES
(1, 2001, 'Chais', 1, 1, '10 boxes x 20 bags', 18.00),
(2, 2002, 'Chang', 1, 1, '24 - 12 oz bottles', 19.00),
(3, 2003, 'Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 10.00),
(4, 2004, 'Chef Anton''s Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22.00),
(5, 2005, 'Chef Anton''s Gumbo Mix', 2, 2, '36 boxes', 21.35),
(6, 2006, 'Grandma''s Boysenberry Spread', 3, 2, '12 - 8 oz jars', 25.00),
(7, 2007, 'Uncle Bob''s Organic Dried Pears', 3, 7, '12 - 1 lb pkgs.', 30.00),
(8, 2008, 'Northwoods Cranberry Sauce', 3, 2, '12 - 12 oz jars', 40.00),
(9, 2009, 'Mishi Kobe Niku', 4, 6, '18 - 500 g pkgs.', 97.00),
(10, 2010, 'Ikura', 4, 8, '12 - 200 ml jars', 31.00);



INSERT INTO tblOrder (ID, orderID, customerID, productID, employeeID, deliveryDate, shipperID) VALUES
(1, 10248, 1009, 2001, 5, '2023-07-02', 3),
(2, 10249, 1001, 2003, 6, '2023-07-24', 1),
(3, 10250, 1004, 2005, 4, '2023-07-13', 2),
(4, 10251, 1004, 2008, 3, '2023-07-05', 1),
(5, 10252, 1006, 2003, 4, '2023-07-21', 2),
(6, 10253, 1003, 2002, 3, '2023-07-11', 2),
(7, 10254, 1001, 2006, 5, '2023-07-07', 2),
(8, 10255, 1008, 2009, 9, '2023-07-30', 3),
(9, 10256, 1008, 2010, 3, '2023-07-02', 2),
(10, 10257, 1005, 2002, 4, '2023-07-21', 3);


	SELECT tblOrder.orderID, tblCustomer.contactPerson		
	FROM tblOrder		
	INNER JOIN tblCustomer 		
	ON tblOrder.customerID = tblCustomer.customerID;		

	CREATE VIEW vwOrder AS		
	SELECT tblCustomer.customerID		
	,tblCustomer.contactPerson		
	,tblOrder.orderID		
	,tblOrder.deliveryDate		
	,tblProduct.productID		
	,tblProduct.productName		
	FROM tblOrder		
	LEFT JOIN tblCustomer		
	ON tblOrder.customerID = tblCustomer.customerID		
	LEFT JOIN tblProduct		
	ON tblOrder.productID = tblProduct.productID		
	;		

SELECT * FROM vwOrder;
