CREATE TABLE firm
(
    Id SERIAL,
    Firm_Name VARCHAR(100) NOT NULL UNIQUE,
	PRIMARY KEY(Id, Firm_Name)
);

CREATE TABLE stock
(
    Id SERIAL,
    Stock_Name VARCHAR(100) NOT NULL UNIQUE,
    Capacity INTEGER NOT NULL CHECK (Capacity > 0),
	Fullness SMALLINT NOT NULL CHECK (0 <= Fullness AND Fullness <= 100),
	PRIMARY KEY(Id, Stock_Name)
);

CREATE TABLE product
(
    Id SERIAL PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Current_Price INTEGER NOT NULL CHECK (Current_Price >= 0),
	Firm VARCHAR(100) REFERENCES firm(Firm_Name) NOT NULL,
	Storage_Name VARCHAR(100) REFERENCES stock(Stock_Name) NOT NULL
);

CREATE TABLE positions
(
    Id SERIAL,
    Position_Name VARCHAR(100) NOT NULL UNIQUE,
	PRIMARY KEY(Id, Position_Name)
);

CREATE TABLE stock_personal
(
    Id SERIAL PRIMARY KEY,
	Work_Place VARCHAR(100) REFERENCES stock(Stock_Name),
    Position_Name VARCHAR(100) REFERENCES positions(Position_Name) NOT NULL,
    Personal_Name VARCHAR(100) NOT NULL,
	Personal_Surname VARCHAR(100) NOT NULL,
	Wage INTEGER NOT NULL CHECK (Wage > 0),
	Hiring_date DATE NOT NULL
);

CREATE TABLE customer
(
    Id SERIAL PRIMARY KEY,
    Customer_Name VARCHAR(100) NOT NULL,
    Address VARCHAR(100) NOT NULL UNIQUE,
	Bank_Details VARCHAR(100) UNIQUE,
	Phone_Number VARCHAR(20) NOT NULL,
	Order_Comment TEXT
);

CREATE TABLE wagon
(
    Id SERIAL PRIMARY KEY,
    Arrival_date DATE NOT NULL,
    Departure_date DATE NOT NULL CHECK (Departure_date <= Arrival_date),
	Products_cost INTEGER NOT NULL CHECK (Products_cost > 0),
	Departure_Place VARCHAR(100) REFERENCES stock(Stock_Name) NOT NULL,
	Arrival_Place VARCHAR(100) REFERENCES customer(Address) NOT NULL
);