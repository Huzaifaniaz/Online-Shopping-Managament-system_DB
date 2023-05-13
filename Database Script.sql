



CREATE DATABASE `osms`;

USE `osms`;

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `customer` */

insert  into `customer`(`customer_id`,`customer_name`,`customer_address`) values (1,'John Doe','123 Main St'),(2,'Jane Smith','456 Oak Ave'),(3,'Bob Johnson','789 Elm St'),(4,'Mary Brown','321 Maple Ave'),(5,'Tom Wilson','654 Pine St'),(6,'Sue Lee','987 Cedar Ave'),(7,'Mike Davis','246 Birch St'),(8,'Karen White','135 Walnut Ave'),(9,'David Kim','864 Oak St'),(10,'Lisa Chen','369 Elm Ave');

/*Table structure for table `delivery` */

DROP TABLE IF EXISTS `delivery`;

CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `delivery_date` date NOT NULL,
  PRIMARY KEY (`delivery_id`),
  KEY `delivery_ibfk_1` (`order_id`),
  KEY `delivery_ibfk_2` (`customer_id`),
  KEY `delivery_ibfk_3` (`product_id`),
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `shoppingorder` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `delivery_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `delivery` */

insert  into `delivery`(`delivery_id`,`order_id`,`customer_id`,`product_id`,`delivery_date`) values (1,1,1,1,'2022-01-02'),(2,2,2,2,'2022-01-03'),(3,3,3,3,'2022-01-04'),(4,4,4,4,'2022-01-05'),(5,5,5,5,'2022-01-06'),(6,6,6,6,'2022-01-07'),(7,7,7,7,'2022-01-08'),(8,8,8,8,'2022-01-09'),(9,9,9,9,'2022-01-10'),(10,10,10,10,'2022-01-11');

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `payment_ibfk_1` (`customer_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `payment` */

insert  into `payment`(`payment_id`,`customer_id`,`payment_date`) values (1,1,'2022-01-01'),(2,2,'2022-01-02'),(3,3,'2022-01-03'),(4,4,'2022-01-04'),(5,5,'2022-01-05'),(6,6,'2022-01-06'),(7,7,'2022-01-07'),(8,8,'2022-01-08'),(9,9,'2022-01-09'),(10,10,'2022-01-10');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `product` */

insert  into `product`(`product_id`,`product_name`,`product_price`) values (1,'iPhone 13','1099.00'),(2,'Samsung Galaxy S21','999.00'),(3,'Google Pixel 6','799.00'),(4,'MacBook Pro','1799.00'),(5,'Dell XPS 13','1199.00'),(6,'HP Spectre x360','1399.00'),(7,'Nintendo Switch','299.00'),(8,'Sony PlayStation 5','499.00'),(9,'Xbox Series X','499.00'),(10,'Amazon Echo','99.00');

/*Table structure for table `seller` */

DROP TABLE IF EXISTS `seller`;

CREATE TABLE `seller` (
  `seller_id` int(11) NOT NULL,
  `seller_name` varchar(255) NOT NULL,
  `seller_contact_address` varchar(255) NOT NULL,
  PRIMARY KEY (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `seller` */

insert  into `seller`(`seller_id`,`seller_name`,`seller_contact_address`) values (1,'ABC Company','123 Main St'),(2,'XYZ Corporation','456 Oak Ave'),(3,'Acme Inc.','789 Elm St'),(4,'GHI Enterprises','321 Maple Ave'),(5,'LMN Industries','654 Pine St'),(6,'PQR Ltd.','987 Cedar Ave'),(7,'DEF Co.','246 Birch St'),(8,'NOP Group','135 Walnut Ave'),(9,'JKL Corp.','864 Oak St'),(10,'MNO Enterprises','648 Elm St');

/*Table structure for table `seller_product` */

DROP TABLE IF EXISTS `seller_product`;

CREATE TABLE `seller_product` (
  `seller_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`seller_id`,`product_id`),
  KEY `seller_product_ibfk_2` (`product_id`),
  CONSTRAINT `seller_product_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`seller_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `seller_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `seller_product` */

/*Table structure for table `shoppingorder` */

DROP TABLE IF EXISTS `shoppingorder`;

CREATE TABLE `shoppingorder` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `shoppingorder_ibfk_1` (`customer_id`),
  CONSTRAINT `shoppingorder_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `shoppingorder` */

insert  into `shoppingorder`(`order_id`,`customer_id`,`order_date`) values (1,1,'2022-01-01'),(2,2,'2022-01-02'),(3,3,'2022-01-03'),(4,4,'2022-01-04'),(5,5,'2022-01-05'),(6,6,'2022-01-06'),(7,7,'2022-01-07'),(8,8,'2022-01-08'),(9,9,'2022-01-09'),(10,10,'2022-01-10');

/*Table structure for table `transactions` */

DROP TABLE IF EXISTS `transactions`;

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `transaction_amount` decimal(10,2) NOT NULL,
  `transaction_date` date NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `transactions_ibfk_1` (`customer_id`),
  KEY `transactions_ibfk_2` (`order_id`),
  KEY `transactions_ibfk_3` (`product_id`),
  KEY `transactions_ibfk_4` (`payment_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `shoppingorder` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transactions_ibfk_4` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `transactions` */

insert  into `transactions`(`transaction_id`,`customer_id`,`order_id`,`product_id`,`payment_id`,`transaction_amount`,`transaction_date`) values (1,1,1,1,1,'1099.00','2022-01-01'),(2,2,2,2,2,'999.00','2022-01-02'),(3,3,3,3,3,'799.00','2022-01-03'),(4,4,4,4,4,'1799.00','2022-01-04'),(5,5,5,5,5,'1199.00','2022-01-05'),(6,6,6,6,6,'1399.00','2022-01-06'),(7,7,7,7,7,'299.00','2022-01-07'),(8,8,8,8,8,'499.00','2022-01-08'),(9,9,9,9,9,'499.00','2022-01-09'),(10,10,10,10,10,'99.00','2022-01-10');
