-- Вариант 2

CREATE TABLE work_types
(
	Id serial PRIMARY KEY,
	work_name VARCHAR(100),
	labor_costs INTEGER,
	equipment VARCHAR(100)
);

CREATE TABLE executor
(
	Id serial PRIMARY KEY,
	FIO VARCHAR(100),
	Birth_year DATE,
	experience INTEGER,
	telephone INTEGER
);

CREATE TABLE customer
(
	Id serial PRIMARY KEY,
	FIO VARCHAR(100),
	Birth_year DATE,
	experience INTEGER,
	telephone INTEGER
);

CREATE TABLE work_executor
(
	work_id INTEGER REFERENCES work_types(Id),
	executor_id INTEGER REFERENCES executor(Id)
);

CREATE TABLE customer_executor
(
	customer_id INTEGER REFERENCES customer(Id),
	executor_id INTEGER REFERENCES executor(Id)
);

CREATE TABLE customer_work
(
	customer_id INTEGER REFERENCES customer(Id),
	work_id INTEGER REFERENCES work_types(Id)
);