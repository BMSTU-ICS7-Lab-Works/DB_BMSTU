--1. Получить количество фур выехавших с указанного склада которые довезут заказ за определенный период 
-- CREATE OR REPLACE FUNCTION countWagons(from_date date, to_date date, stock CHARACTER VARYING(100))
-- RETURNS bigint AS $$
-- begin
-- 	return(
--    		SELECT count(*) 
-- 		from wagon join stock on wagon.Departure_Place = stock.Stock_Name
-- 		WHERE Stock_Name = $3 and Arrival_date BETWEEN $1 AND $2
-- 	);
-- end;
-- $$ 
-- LANGUAGE 'plpgsql';

-- SELECT countWagons('1000-05-01', '1600-12-01', 'okok');

--2. Получить работников работающих на данной профессии

-- CREATE OR REPLACE FUNCTION getWorkersByPosition(CHARACTER VARYING(100))
-- RETURNS SETOF stock_personal AS $$
-- begin
-- 	return query(
--    		SELECT * 
-- 		from stock_personal
-- 		WHERE Position_Name = $1
-- 	);
-- end;
-- $$ 
-- LANGUAGE 'plpgsql';

-- select * from getWorkersByPosition('IT trainer');

--3. функция получения пустых складов

-- CREATE OR REPLACE function getEmptyStocks()
-- returns setof stock
-- as $$
--     declare
--         emptys INT;
--     begin
--     emptys := 0;
--     return query (
-- 		select *
-- 		from stock
-- 		where Fullness = emptys
-- 	);
--     end
--     $$ language 'plpgsql';

-- select * from getEmptyStocks();

-- 4. Рекурсивный вывод заказчиков

-- CREATE OR REPLACE function recOutputСustomer(int)
-- returns setof customer
-- as $$
-- 	begin
--     return query (
-- 		select *
--     	from customer
--         where Id = $1 
-- 	);
--     if ($1 > 0) then
--         return query
--         select *
--         from recOutputСustomer($1 - 1);
--     end if;
--     end;
--     $$ language 'plpgsql';

-- select * from recOutputСustomer(7);

--5. Хранимая процедура обновить ФИО заказчика с некоторым id 

--INSERT INTO customer VALUES (1001, 'Lody', 'str. Lubyanka', '92873510','89262346682','Royal s sirom pozhaluysta');

-- CREATE OR REPLACE function updateCustomerName(cid integer, cname CHARACTER VARYING(100)) returns void
-- as $$
--     begin
--     update customer
--     set Customer_Name = cname
--     where Id = cid;
--     end;
--     $$ language 'plpgsql';

-- SELECT * FROM updateCustomerName(887, 'Lody');

-- SELECT * from customer where Id=887;

--6. Рекурсивную хранимую процедура увеличить заработную плату работников на 10% по id в опред интервале
-- create or replace function recUpdateWage(fid integer, tid integer) returns void
-- as $$
--     begin
--     update stock_personal
--     set Wage = Wage * 1.1
--     where Id = fid;
--     if (fid < tid) then
--          perform * from recUpdateWage(fid + 1, tid);
--     end if;
--     end;
--     $$ language 'plpgsql';

--select * from recUpdateWage(88, 89);



