from faker import Faker
import csv
import random


firm = []
def generateFirm():
    fake = Faker()

    for i in range(0, 300):
        field = [fake.text().split(" ")[0] + fake.text().split(" ")[-1][0:-1]]
        while firm.count(field) != 0:
            field = [fake.text().split(" ")[0] + fake.text().split(" ")[-1][0:-1]]
        firm.append(field)
    return firm


stock = []
def generateStock():
    fake = Faker()

    for i in range(0, 200):
        flag = 0
        while True:
            text = fake.text()
            rand1 = random.randint(0, len(text.split(" ")) - 1)
            rand2 = random.randint(0, len(text.split(" ")) - 1)
            stockname = text.split(" ")[rand1] + text.split(" ")[rand2]
            for j in range(0, len(stock)):
                if stock[j][0] == stockname:
                    flag = 1
                    break
            if flag == 0:
                break

        field = [stockname, random.randint(1,10000), random.randint(0, 100)]
        stock.append(field)
    return stock


product = []
def generateProduct():
    fake = Faker()

    for i in range(0, 1000):
        field = [fake.text().split(" ")[0] + fake.text().split(" ")[-1][0:-1],
                 random.randint(0, 10000),
                 firm[random.randint(0, len(firm) - 1)][0],
                 stock[random.randint(0, len(stock) - 1)][0]]
        product.append(field)
    return product

positions = []
def generatePositions():
    fake = Faker()

    for i in range(0, 1000):
        job = fake.job()
        if positions.count([job]) == 0:
            field = [job]
            positions.append(field)
    return positions

stock_personal = []
def generateStock_personal():
    fake = Faker()

    for i in range(0, 1000):
        date = [str(random.randint(1500, 2020)), str(random.randint(1, 12)), str(random.randint(1, 28))]
        date = '-'.join(date)
        field = [stock[random.randint(0, len(stock) - 1)][0],
                 positions[random.randint(0, len(positions) - 1)][0],
                 fake.name().split(" ")[0],
                 fake.name().split(" ")[1],
                 random.randint(0, 500000),
                 date]
        stock_personal.append(field)
    return stock_personal

customer = []
def generateCustomer():
    fakeru = Faker('ru_RU')
    fake = Faker()
    for i in range(0, 1000):
        flag = 0
        while True:
            text = fake.text()
            rand1 = random.randint(0, len(text.split(" ")) - 1)
            rand2 = random.randint(0, len(text.split(" ")) - 1)
            addr = "str. " + text.split(" ")[rand1] + text.split(" ")[rand2]
            bankdet = random.randint(1000000, 100000000)
            for j in range(0, len(customer)):
                if customer[j][1] == addr or customer[j][2] == bankdet:
                    flag = 1
                    break
            if flag == 0:
                break

        field = [fake.name().split(" ")[0],
                 addr,
                 bankdet,
                 fakeru.phone_number(),
                 fake.text()]
        customer.append(field)
    return customer

wagon = []
def generateWagon():
    for i in range(0, 1000):
        year = random.randint(1500,2020)
        month1 = random.randint(1, 12)
        month2 = random.randint(1, 12)
        day1 = random.randint(1, 28)
        day2 = random.randint(1, 28)
        if month1 > month2:
            datea = str(year) + "-" + str(month1) + "-" + str(day1)
            dated = str(year) + "-" + str(month2) + "-" + str(day2)
        elif month1 == month2:
            if day1 > day2:
                datea = str(year) + "-" + str(month1) + "-" + str(day1)
                dated = str(year) + "-" + str(month2) + "-" + str(day2)
            else:
                datea = str(year) + "-" + str(month2) + "-" + str(day2)
                dated = str(year) + "-" + str(month1) + "-" + str(day1)
        else:
            datea = str(year) + "-" + str(month2) + "-" + str(day2)
            dated = str(year) + "-" + str(month1) + "-" + str(day1)

        field = [datea,
                 dated,
                 random.randint(0, 100000000),
                 stock[random.randint(0, len(stock) - 1)][0],
                 customer[random.randint(0, len(customer) - 1)][1]]
        wagon.append(field)
    return wagon


firmhead = ["Firm_Name"]
stockhead = ["Stock_Name", "Capacity", "Fullness"]
producthead = ["Product_Name", "Current_Price", "Firm", "Storage_Name"]
positionshead = ["Position_Name"]
stock_personalhead = ["Work_Place", "Position_Name", "Personal_Name", "Personal_Surname", "Wage", "Hiring_date"]
customerhead = ["Customer_Name", "Address", "Bank_Details", "Phone_Number", "Order_Comment"]
wagonhead = ["Arrival_date", "Departure_Date", "Products_cost", "Departure_Place", "Arrival_Place"]


FILENAME = "stock.csv"
with open(FILENAME, 'w', newline="") as file:
    writer = csv.writer(file)
    writer.writerow(stockhead)
    writer.writerows(generateStock())

print("stock.csv created!")

FILENAME = "firm.csv"
with open(FILENAME, 'w', newline="") as file:
    writer = csv.writer(file)
    writer.writerow(firmhead)
    writer.writerows(generateFirm())

print("firm.csv created!")

FILENAME = "product.csv"
with open(FILENAME, 'w', newline="") as file:
    writer = csv.writer(file)
    writer.writerow(producthead)
    writer.writerows(generateProduct())

print("product.csv created!")

FILENAME = "positions.csv"
with open(FILENAME, 'w', newline="") as file:
    writer = csv.writer(file)
    writer.writerow(positionshead)
    writer.writerows(generatePositions())

print("positions.csv created!")

FILENAME = "stock_personal.csv"
with open(FILENAME, 'w', newline="") as file:
    writer = csv.writer(file)
    writer.writerow(stock_personalhead)
    writer.writerows(generateStock_personal())

print("stock_personal.csv created!")

FILENAME = "customer.csv"
with open(FILENAME, 'w', newline="") as file:
    writer = csv.writer(file)
    writer.writerow(customerhead)
    writer.writerows(generateCustomer())

print("customer.csv created!")

FILENAME = "wagon.csv"
with open(FILENAME, 'w', newline="") as file:
    writer = csv.writer(file)
    writer.writerow(wagonhead)
    writer.writerows(generateWagon())

print("wagon.csv created!")
