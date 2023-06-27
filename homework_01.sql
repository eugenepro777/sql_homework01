/*
1. Создайте таблицу с мобильными телефонами,
 используя графический интерфейс. Заполните БД данными
*/ 

CREATE DATABASE IF NOT EXISTS homework1_db;
USE homework1_db;

DROP TABLE IF EXISTS phone;
/* 
читал что лучше цены хранить в DECIMAL,
в нашем случае DECIMAL(7, 2), но в условиях этого нет
поэтому в поле Price использую INT UNSIGNED, так как цена
не может быть отрицательной
*/
CREATE TABLE phone
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(20) NOT NULL,
    Manufacturer VARCHAR(10) NOT NULL,
    ProductCount INT,
    Price INT UNSIGNED    
);
 
INSERT phone(ProductName, Manufacturer, ProductCount, Price)
VALUES
	("iPhone X", "Apple", 3, 76000),
	("iPhone 8", "Apple", 2, 51000),
	("Galaxy S9", "Samsung", 2, 56000),
	("Galaxy S8", "Samsung", 1, 41000),
	("P20 Pro", "Huawei", 5, 36000);
	
SELECT * FROM phone;

/*
2. Выведите название, производителя и цену для товаров, количество которых превышает 2
*/

SELECT ProductName, Manufacturer, Price
FROM phone
WHERE ProductCount > 2;

/*
3. Выведите весь ассортимент товаров марки “Samsung”
*/
-- если мы хотим оценить наши продажи, то можно и количество, и цену вывести
-- из условия не понятно будем ли просто смотреть на название модели
--  или нужна более подробная информация
# первый способ
SELECT ProductName, ProductCount, Price
FROM phone
WHERE Manufacturer = "Samsung";

# второй способ
SELECT ProductName, ProductCount, Price
FROM phone
WHERE Manufacturer LIKE "S%g";

/*
4. Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**
*/
SELECT ProductName, Manufacturer, ProductCount, Price
FROM phone
WHERE (ProductCount * Price) > 100000 AND (ProductCount * Price) < 145000;

/*
4.*** С помощью регулярных выражений найти (можно использовать операторы “LIKE”, “RLIKE” для 4.3 ):
*/
-- 4.1 Товары, в которых есть упоминание "Iphone"
SELECT ProductName, Manufacturer, ProductCount, Price
FROM phone
WHERE ProductName LIKE "%Iphone%";

-- 4.2 Товары, в которых есть упоминание "Galaxy"
SELECT ProductName, Manufacturer, ProductCount, Price
FROM phone
WHERE ProductName LIKE "%Galaxy%";

-- 4.3 Товары, в которых есть ЦИФРЫ
SELECT ProductName, Manufacturer, ProductCount, Price
FROM phone
WHERE ProductName REGEXP "[0-9]";

-- 4.4 Товары, в которых есть ЦИФРА "8"
SELECT ProductName, Manufacturer, ProductCount, Price
FROM phone
WHERE ProductName RLIKE "8";