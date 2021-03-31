COPY customer(Customer_Name, Address, Bank_Details, Phone_Number, Order_Comment)
	from 'D:/3 qrs 1 sem/DB/Lab1/customer.csv' DELIMITER ',' CSV HEADER;
	
COPY firm(Firm_Name)
	from 'D:/3 qrs 1 sem/DB/Lab1/firm.csv' DELIMITER ',' CSV HEADER;
	
COPY positions(Position_Name)
	from 'D:/3 qrs 1 sem/DB/Lab1/positions.csv' DELIMITER ',' CSV HEADER;
	
COPY stock(Stock_Name, Capacity, Fullness)
	from 'D:/3 qrs 1 sem/DB/Lab1/stock.csv' DELIMITER ',' CSV HEADER;
	
COPY product(Product_Name, Current_Price, Firm, Storage_Name)
	from 'D:/3 qrs 1 sem/DB/Lab1/product.csv' DELIMITER ',' CSV HEADER;
	
COPY stock_personal(Work_Place, Position_Name, Personal_Name, Personal_Surname, Wage, Hiring_date)
	from 'D:/3 qrs 1 sem/DB/Lab1/stock_personal.csv' DELIMITER ',' CSV HEADER;
	
COPY wagon(Arrival_date, Departure_date, Products_cost, Departure_Place, Arrival_Place)
	from 'D:/3 qrs 1 sem/DB/Lab1/wagon.csv' DELIMITER ',' CSV HEADER;