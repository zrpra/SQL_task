CREATE DATABASE TaskSQL;

USE TaskSQL

CREATE TABLE [logins] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [customer_id] int,
  [username] nvarchar(255),
  [password] nvarchar(255)
)
GO

CREATE TABLE [customers] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [forename] nvarchar(255),
  [surname] nvarchar(255),
  [add1] nvarchar(255),
  [add2] nvarchar(255),
  [add3] nvarchar(255),
  [postcode] nvarchar(255),
  [phone] nvarchar(255),
  [email] nvarchar(255),
  [registered] bit
)
GO

CREATE TABLE [delivery_addresses] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [forename] nvarchar(255),
  [surname] nvarchar(255),
  [add1] nvarchar(255),
  [add2] nvarchar(255),
  [add3] nvarchar(255),
  [postcode] nvarchar(255),
  [phone] nvarchar(255),
  [email] nvarchar(255)
)
GO

CREATE TABLE [orders] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [customer_id] int,
  [registered] bit,
  [delivery_add_id] int,
  [payment_type] nvarchar(255),
  [date] date,
  [status] nvarchar(255),
  [session] nvarchar(255),
  [total] int
)
GO

CREATE TABLE [order_items] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [order_id] int,
  [product_id] int,
  [quantity] int
)
GO

CREATE TABLE [products] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [cat_id] int,
  [name] nvarchar(255),
  [description] nvarchar(255),
  [image] nvarchar(255),
  [price] int
)
GO

CREATE TABLE [categories] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255),
  [description] nvarchar(255),
  [image] nvarchar(255)
)
GO

CREATE TABLE [admins] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [username] nvarchar(255),
  [password] nvarchar(255)
)
GO;

ALTER TABLE [logins] ADD FOREIGN KEY ([customer_id]) REFERENCES [customers] ([id])
GO

ALTER TABLE [orders] ADD FOREIGN KEY ([customer_id]) REFERENCES [customers] ([id])
GO

ALTER TABLE [orders] ADD FOREIGN KEY ([delivery_add_id]) REFERENCES [delivery_addresses] ([id])
GO

ALTER TABLE [order_items] ADD FOREIGN KEY ([order_id]) REFERENCES [orders] ([id])
GO

ALTER TABLE [order_items] ADD FOREIGN KEY ([product_id]) REFERENCES [products] ([id])
GO

ALTER TABLE [products] ADD FOREIGN KEY ([cat_id]) REFERENCES [categories] ([id])
GO;



INSERT INTO TaskSQL.dbo.categories (name,description,[image]) VALUES
	 (N'vegetables',N'Lorem ipsum dolor sit amet, consectetur adipiscing elit',N'http://dummyimage.com/109x123.jpg'),
	 (N'vegetables',N'Donec eget malesuada lacus, ultricies consectetur elit',N'http://dummyimage.com/133x136.png'),
	 (N'fruits',N'Sed dictum porttitor ipsum at maximus',N'http://dummyimage.com/230x152.bmp'),
	 (N'fruits',N'Vivamus vitae scelerisque ante, finibus mattis eros',N'http://dummyimage.com/168x104.jpg'),
	 (N'vegetables',N'Aenean ut finibus ex. Proin quis dui et sem gravida mollis',N'http://dummyimage.com/242x201.jpg'),
	 (N'vegetables',N'Duis finibus, orci eu consequat ultrices, eros urna molestie felis, ut gravida lorem tortor nec ex',N'http://dummyimage.com/223x206.bmp'),
	 (N'vegetables',N'Aliquam eget consequat nunc. Vestibulum ut lacinia odio. Donec quis suscipit purus',N'http://dummyimage.com/118x121.png'),
	 (N'fruits',N'Donec pharetra tellus in dolor blandit, a maximus mauris lacinia',N'http://dummyimage.com/233x124.jpg');
INSERT INTO TaskSQL.dbo.customers (forename,surname,add1,add2,add3,postcode,phone,email,registered) VALUES
	 (N'Peggie',N'Pallent',NULL,NULL,NULL,NULL,N'521-107-9777',NULL,1),
	 (N'Mathias',N'Folster',NULL,NULL,NULL,N'56528',N'545-991-1112',NULL,0),
	 (N'Tamarra',N'Le Merchant',NULL,NULL,NULL,N'551 84',N'808-786-9467',NULL,1),
	 (N'Janetta',N'Helin',NULL,NULL,NULL,NULL,N'686-355-4931',NULL,1),
	 (N'Reinhold',N'Martijn',NULL,NULL,NULL,NULL,N'795-679-7136',NULL,0),
	 (N'Lauritz',N'Provest',NULL,NULL,NULL,NULL,N'296-351-8061',NULL,0),
	 (N'Con',N'Kupisz',NULL,NULL,NULL,NULL,N'184-411-1830',NULL,1),
	 (N'Beatrisa',N'Tomowicz',NULL,NULL,NULL,NULL,N'979-772-1232',NULL,1),
	 (N'Nathanial',N'Rupert',NULL,NULL,NULL,N'3025-419',N'636-290-1463',NULL,0),
	 (N'Etta',N'Edginton',NULL,NULL,NULL,N'48100',N'862-845-2560',NULL,1);
INSERT INTO TaskSQL.dbo.delivery_addresses (forename,surname,add1,add2,add3,postcode,phone,email) VALUES
	 (N'Harry',N'Blamires',N'5 Northwestern Point',NULL,NULL,N'K67',N'709-178-2038',N'hblamires0@lulu.com'),
	 (N'Adi',N'Carlon',N'37136 Macpherson Street',NULL,NULL,NULL,N'522-462-4973',N'acarlon1@discuz.net'),
	 (N'Barty',N'Monkley',N'55 Hauk Trail',NULL,NULL,NULL,N'879-792-1014',N'bmonkley2@ihg.com'),
	 (N'Salem',N'Ewert',N'81078 Oakridge Circle',NULL,NULL,NULL,N'223-256-8714',N'sewert3@host4gator.com'),
	 (N'Vilhelmina',N'Bairnsfather',N'72949 Eastwood Street',NULL,NULL,N'2402',N'632-170-9234',N'vbairnsfather4@psu.edu'),
	 (N'Hayyim',N'Lisamore',N'388 Birchwood Place',NULL,NULL,N'71122',N'901-562-9922',N'hlisamore5@prweb.com'),
	 (N'Mareah',N'Gutans',N'6 Tony Terrace',NULL,NULL,NULL,N'142-802-2019',N'mgutans6@ucoz.com'),
	 (N'Garret',N'Grayston',N'64394 Clove Place',NULL,NULL,NULL,N'580-799-7576',N'ggrayston7@prweb.com'),
	 (N'Roxine',N'Booler',N'69 Lakewood Gardens Place',NULL,NULL,N'241551',N'857-659-8653',N'rbooler8@springer.com'),
	 (N'Filbert',N'Brougham',N'8756 Village Green Place',NULL,NULL,N'5049',N'476-610-5525',N'fbrougham9@si.edu');
INSERT INTO TaskSQL.dbo.order_items (order_id,product_id,quantity) VALUES
	 (4,8,4),
	 (8,10,11),
	 (8,4,11),
	 (1,2,3),
	 (7,9,15),
	 (1,4,13),
	 (10,7,6),
	 (9,10,12),
	 (7,6,11),
	 (6,2,16);
INSERT INTO TaskSQL.dbo.orders (customer_id,registered,delivery_add_id,payment_type,[date],status,[session],total) VALUES
	 (6,0,7,N'diners-club-us-ca','2019-05-31',N'Paid',NULL,182389),
	 (6,1,1,N'jcb','2019-12-24',N'Canceled',NULL,385376),
	 (2,0,4,N'mastercard','2019-07-04',N'Canceled',NULL,404804),
	 (10,1,3,N'jcb','2019-07-16',N'Canceled',NULL,428182),
	 (5,1,10,N'visa-electron','2020-01-13',N'Canceled',NULL,370261),
	 (6,1,3,N'americanexpress','2019-10-22',N'Canceled',NULL,440665),
	 (3,0,4,N'jcb','2020-01-30',N'Canceled',NULL,427954),
	 (6,0,1,N'mastercard','2019-08-30',N'Canceled',NULL,250107),
	 (2,0,4,N'jcb','2019-06-03',N'Paid',NULL,144049),
	 (5,0,6,N'jcb','2019-08-31',N'Pending',NULL,114408);
INSERT INTO TaskSQL.dbo.products (cat_id,name,description,[image],price) VALUES
	 (1,N'Truffle Paste',N'Future-proofed interactive forecast',N'http://dummyimage.com/109x123.jpg',8791),
	 (6,N'Carrots - Mini Reg Organic',N'Object-based methodical functionalities',N'http://dummyimage.com/109x123.jpg',9675),
	 (4,N'Sprouts Dikon',N'Adaptive zero administration challenge',N'http://dummyimage.com/109x123.jpg',9147),
	 (4,N'Mushrooms - Black, Dried',N'Synergistic background secured line',N'http://dummyimage.com/109x123.jpg',2019),
	 (6,N'Coffee - Flavoured',N'Future-proofed even-keeled firmware',N'http://dummyimage.com/109x123.jpg',5270),
	 (2,N'Juice - Orange',N'Progressive uniform solution',N'http://dummyimage.com/109x123.jpg',9780),
	 (1,N'Energy Drink - Franks Original',N'Secured actuating service-desk',N'http://dummyimage.com/109x123.jpg',9676),
	 (3,N'Energy - Boo - Koo',N'Enterprise-wide mobile artificial intelligence',N'http://dummyimage.com/109x123.jpg',2916),
	 (4,N'Tart - Lemon',N'Quality-focused object-oriented process improvement',N'http://dummyimage.com/109x123.jpg',2099),
	 (5,N'Beef Tenderloin Aaa',N'Stand-alone systematic secured line',N'http://dummyimage.com/109x123.jpg',6888);



-- No. 1
SELECT CONCAT(customers.forename, ' ', customers.surname) AS CustomerName, orders.id AS OrderId, products.name AS ProductName, order_items.quantity AS Qty
FROM customers
LEFT JOIN orders ON customers.id=orders.customer_id
LEFT JOIN order_items ON orders.id=order_items.order_id
LEFT JOIN products ON order_items.product_id=products.id
ORDER BY CustomerName, OrderId;

-- No. 2
SELECT status AS Status, COUNT(id) AS NoOfOrders
FROM orders
GROUP BY Status
ORDER BY Status DESC;

-- No. 3
SELECT categories.name AS CategoryName, STRING_AGG(products.name, ', ') AS Products
FROM products
INNER JOIN categories ON products.cat_id=categories.id
GROUP BY categories.name
ORDER BY CategoryName;

-- No. 4
SELECT orders.id AS OrderId, CONCAT(customers.forename, ' ', customers.surname) AS CustomerName, delivery_addresses.add1 AS DeliveryAddress
FROM orders
INNER JOIN customers ON orders.customer_id=customers.id
INNER JOIN delivery_addresses ON orders.delivery_add_id=delivery_addresses.id
ORDER BY OrderId;

-- No. 5
SELECT orders.id AS OrderId, products.name AS ProductName, order_items.quantity AS Qty
FROM orders
LEFT JOIN order_items ON orders.id=order_items.order_id
LEFT JOIN products ON order_items.product_id=products.id
ORDER BY OrderId, ProductName;