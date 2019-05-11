/*
 * TODO(Студент): Опишите процесс создания базы данных
 * 1. Создайте все таблицы, согласно предложенной диаграмме.
 * 2. Опишите все необходимые отношения между таблицами.
 * 3. Добавьте в каждую таблицу минимум три записи.
 */

-- drop table "Order2Product";
-- drop table "Product";
-- drop table "Supplier";
-- drop table "Order";
-- drop table "Users";
-- drop table "Roles";
-- drop table "UserInfo";

CREATE TABLE "UserInfo"
(   --как установить ограничение у INT, генерация верно?
    id INT GENERATED ALWAYS AS IDENTITY 
                        (START WITH 1, INCREMENT BY 1), 
    name VARCHAR(255),
    surname VARCHAR(255),
    -- CONSTRAINT pk_UserInfo PRIMARY KEY (id),
    CONSTRAINT uk_id UNIQUE (id)
);

CREATE TABLE "Roles"
(
    id INT NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    CONSTRAINT pk_Roles PRIMARY KEY (name)
);

CREATE TABLE "Users"
(
    id INT NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    info INT NOT NULL UNIQUE,
    role INT NOT NULL,
    CONSTRAINT pk_Users PRIMARY KEY (email),
    CONSTRAINT fk_UserInfo FOREIGN KEY (info) REFERENCES "UserInfo"(id),
    CONSTRAINT fk_Roles FOREIGN KEY (role) REFERENCES "Roles"(id)
);

CREATE TABLE "Order"
(
    id INT NOT NULL,
    users INT NOT NULL,
    created TIMESTAMP, --формат отметки
    CONSTRAINT pk_Order PRIMARY KEY (id),
    CONSTRAINT fk_Users FOREIGN KEY (users) REFERENCES "Users"(id)
);

CREATE TABLE "Supplier"
(
    id INT NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(255) NOT NULL,
    representative VARCHAR(255),
    CONSTRAINT pk_Supplier PRIMARY KEY (name)
);

CREATE TABLE "Product"
(
    id INT NOT NULL UNIQUE,
    code VARCHAR(255) NOT NULL,
    title VARCHAR(255) NOT NULL,
    supplier INT NOT NULL,
    initial_price DOUBLE NOT NULL,
    retail_value DOUBLE NOT NULL,
    CONSTRAINT pk_Product PRIMARY KEY (code),
    CONSTRAINT fk_Supplier FOREIGN KEY (supplier) REFERENCES "Supplier"(id)
);

CREATE TABLE "Order2Product"
(
    "order" INT NOT NULL,
    product INT NOT NULL,
    CONSTRAINT pk_O2P PRIMARY KEY ("order", product),
    CONSTRAINT fk_Order FOREIGN KEY ("order") REFERENCES "Order"(id),
    CONSTRAINT fk_Product FOREIGN KEY (product) REFERENCES "Product"(id)
);
