insert into "Roles" (id, name)
            values (1, 'VIP'),
                   (2, 'Regular'),
                   (3, 'New');

insert into "UserInfo" (name, surname)
            values ('Петр', 'Петров'),
                   ('Иван', 'Иванов'),
                   ('Максим', 'Максимов');

insert into "Users" (id, email, password, info, role)
            values (1, 'ivanov@mail.ru', 'qwerty', 2, 1),
                   (2, 'maksimov@mail.ru', '123456', 3, 3),
                   (3, 'petrov@gmail.com', 'qweasd', 1, 3);

insert into "Supplier" (id, name, address, phone, representative)
            values (1, 'Петрохолод', 'Полюстровский пр., 87, Санкт-Петербург', 
                    '8 (812) 449-36-02', 'Павел'),
                   (2, 'Мираторг', 'Пречистенская наб., 17, Москва', 
                    '8 (495) 651-92-52', 'Григорий'),
                   (3, 'PepsiCo', 'Ленинградский пр., 72, к. 4, Москва', 
                    '8 (495) 937-05-50', 'Роман');

insert into "Product" (id, code, title, supplier, initial_price, retail_value)
            values (1, '14566', 'Пломбир', 1, 56.82, 103.99),
                   (2, '13078', 'Пепси', 3, 35.70, 78.55),
                   (3, '15423', 'Шоколадное мороженое', 1, 43.50, 98.66),
                   (4, '16134', 'Наггетсы', 2, 101.00, 153.40),
                   (5, '13435', 'Курица', 2, 220.44, 350.00),
                   (6, '12324', 'Лэйс', 3, 78.99, 120.27),
                   (7, '15232', 'Вишневый сок', 3, 63.47, 98.00),
                   (8, '17464', 'Сыр', 3, 157.45, 231.40);

insert into "Order2Product" ("order", product)
            values (1, 4),
                   (1, 3),
                   (1, 7),
                   (2, 1),
                   (3, 8),
                   (3, 3);

insert into "Order" (id, users)
            values (1, 1),
                   (2, 1),
                   (3, 3);