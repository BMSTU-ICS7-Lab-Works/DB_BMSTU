-- 1. Вывести все продукты, кроме продуктов фирмы 'Winsection' на складе 'makeon' 
-- SELECT DISTINCT PR.product_name, PR.Storage_Name, PR.Firm
-- FROM product PR JOIN Stock AS ST ON ST.Stock_Name = PR.Storage_Name
-- WHERE PR.Storage_Name = 'makeon'  AND PR.Firm<>'Winsection'
-- ORDER BY PR.product_name;

-- 2. Фуры которые доедут в промежуток указанного времени
-- SELECT DISTINCT Arrival_Place, Arrival_date
-- FROM wagon
-- WHERE Arrival_date BETWEEN '1997-01-01' AND '1998-03-31';

-- 3. Вывести людей работающих инженерами в опред. дисциплине
-- SELECT DISTINCT Personal_Name, Position_Name, Work_place
-- FROM stock_personal
-- WHERE Position_Name LIKE '%Engineer%';

-- 4. Вывести фуры с адресом прибытия содержащим 'net' и ценой заказа больше 40000000
-- SELECT Departure_Place, Arrival_date, Arrival_Place, products_cost
-- FROM wagon
-- WHERE Arrival_Place IN
-- (
--  SELECT Address
--  FROM customer
--  WHERE Address LIKE '%net%'
-- ) AND products_cost > 40000000;	ц


-- 5. Вывести продукты с ценой > 8000 если существуют продукты фирмы 'followlive'
-- SELECT Product_Name, Firm, Storage_Name
-- FROM product
-- WHERE product.Current_Price > 8000 AND EXISTS
-- (
-- SELECT product.ID
--  FROM product
--  WHERE product.Storage_Name='followlive'
-- );

-- 6. Вывести продукты цена которых больше чем у любого продукта фирмы 'Payoutside'
-- SELECT Id, Product_Name, Current_Price
-- FROM product
-- WHERE Current_Price > ALL
-- (
-- SELECT Current_Price
--  FROM product
--  WHERE Firm = 'Payoutside'
-- );

-- 7. Получить среднюю цену товаров фирмы 'Nationalbank'
-- SELECT SUM(price) / COUNT(*) AS avg_price
-- FROM(
-- 	SELECT Current_Price as price
-- 	from product
-- 	where product.firm = 'Nationalbank'
-- ) as PR

-- 8. Получить среднюю, максимальную, минимальную цену товаров фирмы 'Nationalbank'
-- SELECT AVG(price) AS avg_price, MAX(price) AS max_price, MIN(price) AS min_price
-- FROM(
-- 	SELECT Current_Price as price
-- 	from product
-- 	where product.firm = 'Nationalbank'
-- ) as PR

-- 9. Вывести год в которых приедет фура (тек. год пред. год, или другой год)
-- SELECT Arrival_Place, products_cost, 
-- 	CASE EXTRACT(YEAR FROM Arrival_date)
-- 		WHEN EXTRACT(YEAR FROM current_date) THEN 'This Year'
-- 		WHEN EXTRACT(YEAR FROM current_date)  THEN 'Last year'
-- 		ELSE 'Another Year'
-- 	END AS Arrival_Year
-- FROM wagon;

-- 10. Вывести продукты и оценку их цены
-- SELECT Product_name, 
-- 	CASE 
-- 		WHEN Current_Price < 1000 THEN 'Inexpensive'
-- 		WHEN Current_Price < 5000 THEN 'Fair'
-- 		WHEN Current_Price < 10000 THEN 'Expensive'
-- 		ELSE 'Very expensive'
-- 	END AS Arrival_Year
-- FROM product;

-- 11. Вывести среднюю зарплату по профессиям и кол-во людей работающих больше 400 лет
-- DROP TABLE OLDIES;
-- SELECT Position_Name, 
-- 	AVG(Wage) AS AVGWAGE,
-- 	COUNT(*)
-- INTO OLDIES
-- FROM stock_personal
-- WHERE (EXTRACT(YEAR FROM current_date) - EXTRACT(YEAR FROM Hiring_date)) > 400
-- GROUP BY Position_Name;

-- SELECT * 
-- FROM OLDIES;

-- 12. Инструкция SELECT, использующая вложенные коррелированные
-- тут конечно мдемс
-- SELECT stock.Id, stock.Stock_Name, stock_workers.Position_Name, stock_workers.Personal_Name
-- FROM stock JOIN 
-- (
-- 	stock_personal JOIN positions 
-- 	ON stock_personal.Id = positions.Id
-- ) AS stock_workers ON stock_workers.Id = stock.Id
-- WHERE Stock_Name = 'saySouthern'
-- ORDER BY stock.Id;

-- 13.Инструкция SELECT, использующая вложенные подзапросы с уровнем 3

-- 14. Вывести даты в которых со склада выезжали фуры
-- SELECT Departure_date
-- FROM wagon
-- GROUP BY Departure_date
-- ORDER BY Departure_date;

-- 15. Вывести даты в которых со склада выехало больше 1 фуры
-- SELECT Departure_date, COUNT(*)
-- FROM wagon
-- GROUP BY Departure_date
-- HAVING COUNT(*) > 1
-- ORDER BY Departure_date;

-- 16. Добавить новую должность
-- INSERT INTO positions(Position_Name)
-- VALUES ('warehouse worker');

-- 17. Добавить в positions еще балбесов если они есть
-- INSERT INTO positions(Position_Name)
-- SELECT Position_Name
-- FROM positions
-- WHERE Position_Name = 'balbes';

-- 18. Уменьшить цену на 10% на продукты фирмы 'Topbenefit'
-- UPDATE product
-- SET Current_Price = Current_Price * 0.9
-- WHERE Firm = 'Topbenefit';

-- 19. Выставить на все продукты фирмы 'Wordstandard' цену равную средней цены продуктов их фирмы
-- UPDATE product
-- SET Current_Price = 
-- 		(
-- 			SELECT AVG(Current_Price)
-- 			FROM product
-- 			WHERE Firm = 'Wordstandard'
-- 		)
-- WHERE Firm = 'Wordstandard';

-- 20. Удалить продукт с Id = 77
-- DELETE FROM product
-- WHERE product.Id = 77;

-- 21. Удалить продукты с Id > 1000
-- DELETE FROM product
-- WHERE product.Id IN
-- (
-- 	SELECT Id
-- 	FROM product
-- 	WHERE Id > 1000
-- );

-- 22.Инструкция SELECT, использующая простое обобщенное табличное
-- WITH CTE (Id, Products_cost)
-- AS
-- (
--  SELECT wagon.Id, count(*) as total
--  FROM wagon join affecteddrivers on people.id_person = affecteddrivers.id_person
--  WHERE affecteddrivers.guilt = 'виновен'
--  GROUP BY people.id_person
-- )
-- SELECT AVG(NumberOfAccident)
-- FROM CTE

-- 23. Инструкция SELECT, использующая рекурсивное обобщенное табличное

-- 24. Оконные функции. Использование конструкций MIN/MAX/AVG OVER()
-- with cte(Firm, Current_Price)
-- as
-- (
-- 	select Firm, Current_Price
-- 	from product
-- 	where product.Firm = 'Nationalbank'
-- )
-- select Firm, Current_Price,  
-- 	min(Current_Price) over (partition by Firm), max(Current_Price) over (partition by Firm),
-- 	avg(Current_Price) over (partition by Firm)
-- from cte

-- 25. Оконные фнкции для устранения дублей
