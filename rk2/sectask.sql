--1. Получить исполнителей стаж которых равен 2

SELECT * from executor
WHERE experience = 2;

--2. Выводит у каждого человека средний стаж людей родившихся с ним в один год
SELECT Birth_year, FIO, avg(experience) OVER (PARTITION BY EXTRACT(YEAR from birth_year))
FROM customer;

--3. Выводит Исполнителей их стаж и то какие работы они выполняют

SELECT executor.FIO, executor.experience, Workers.work_name
FROM executor JOIN
(
	work_executor JOIN work_types
	ON work_executor.work_id = work_types.Id
) AS Workers on Workers.executor_id = executor.Id
ORDER BY FIO;
