INSERT INTO work_types VALUES(1, 'Офисный Рабочий', 200, 'стол, компьютер');
INSERT INTO work_types VALUES(2, 'Пожарный', 800, 'машина, костюм');
INSERT INTO work_types VALUES(3, 'строитель', 400, 'молоток, гвозди');
INSERT INTO work_types VALUES(4, 'Медик', 200, 'Шприцы, перчатки');
INSERT INTO work_types VALUES(5, 'Укладчик', 200, 'бетон');
INSERT INTO work_types VALUES(6, 'Военный', 200, 'Пулемет, патроны');
INSERT INTO work_types VALUES(7, 'Программист', 200, 'Компьютер, стол');
INSERT INTO work_types VALUES(8, 'Спортсмен', 600, 'Снаряжение, зал');
INSERT INTO work_types VALUES(9, 'Археолог', 400, 'костюм, снаряжение');
INSERT INTO work_types VALUES(10, 'Лингвист', 200, 'Книга');

INSERT INTO customer VALUES(1, 'Чалый А.А.', '2000-01-02', 3, 892614124);
INSERT INTO customer VALUES(2, 'Дукл К.К.', '2000-02-14', 2, 124235);
INSERT INTO customer VALUES(3, 'Гриса Н.П.', '2000-03-12', 1, 4536341);
INSERT INTO customer VALUES(4, 'Тулеп Ч.Ч.', '2000-04-22', 5, 23667);
INSERT INTO customer VALUES(5, 'Леле А.А.', '2000-05-08', 6, 32423677);
INSERT INTO customer VALUES(6, 'Чалый А.А.', '2000-06-06', 12, 237458);
INSERT INTO customer VALUES(7, 'Крик Т.П.', '2000-07-03', 2, 12312365);
INSERT INTO customer VALUES(8, 'Витте А.Е.', '2000-08-02', 2, 1231256);
INSERT INTO customer VALUES(9, 'Клипер Ш.Ф.', '2000-09-01', 4, 8923424);
INSERT INTO customer VALUES(10, 'Кхук Т.Т.', '2000-11-02', 5, 5476548);

INSERT INTO executor VALUES(1, 'ЦЕУЦ А.А.', '2000-01-02', 3, 11);
INSERT INTO executor VALUES(2, 'ывар К.К.', '2000-02-14', 2, 777);
INSERT INTO executor VALUES(3, 'йцуп Н.П.', '2000-03-12', 1, 23421);
INSERT INTO executor VALUES(4, 'ркел Ч.Ч.', '2000-04-22', 5, 56888);
INSERT INTO executor VALUES(5, 'ываи А.А.', '2000-05-08', 6, 23523);

INSERT INTO work_executor VALUES(1, 1);
INSERT INTO work_executor VALUES(1, 2);
INSERT INTO work_executor VALUES(2, 3);
INSERT INTO work_executor VALUES(4, 2);
INSERT INTO work_executor VALUES(3, 3);

INSERT INTO customer_executor VALUES(1, 4);
INSERT INTO customer_executor VALUES(5, 2);
INSERT INTO customer_executor VALUES(5, 5);
INSERT INTO customer_executor VALUES(2, 2);
INSERT INTO customer_executor VALUES(3, 1);

INSERT INTO customer_work VALUES(3, 1);
INSERT INTO customer_work VALUES(3, 2);
INSERT INTO customer_work VALUES(3, 3);
INSERT INTO customer_work VALUES(4, 2);
INSERT INTO customer_work VALUES(3, 5);