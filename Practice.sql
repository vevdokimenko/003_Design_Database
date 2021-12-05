# Создайте базу данных Publishing.
# Добавте таблицу с такими полями:
#
# NameBook - название книги
# NameTheme - тема книги
# PriceOfBook - цена книги для продажи
# DrawingOfBook - количество выпущенных книг
# Pages - количество страниц книги
# Price - цена продажи книги
# Quantity - количество проданных книг
# NameShop - название магазина, который продал книги
# NameCountry - будет относиться как к магазину, который продавал книгу,
# так и к автору, который ее написал (они могут быть разные)
# FirstName - имя автора, написавшего книгу
# LastName - фамилия автора, написавшего книгу
#
# Нормализируйте данную таблицу.

CREATE DATABASE Publishing;
USE Publishing;

CREATE TABLE Themes
(
    ID_THEME  INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NameTheme VARCHAR(30) NOT NULL
);

CREATE TABLE Country
(
    ID_COUNTRY  INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NameCountry VARCHAR(30) NOT NULL
);

CREATE TABLE Authors
(
    ID_AUTHOR  INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FirstName  VARCHAR(30) NOT NULL,
    LastName   VARCHAR(30) NOT NULL,
    ID_COUNTRY INT         NOT NULL,
    FOREIGN KEY (ID_COUNTRY) REFERENCES Country (ID_COUNTRY)
);

CREATE TABLE Books
(
    ID_BOOK       INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    NameBook      VARCHAR(30)                    NOT NULL,
    ID_THEME      INT                            NOT NULL,
    ID_AUTHOR     INT                            NOT NULL,
    Price         DOUBLE                         NOT NULL,
    DrawingOfBook INT                            NOT NULL,
    Pages         INT                            NOT NULL,
    FOREIGN KEY (ID_THEME) REFERENCES Themes (ID_THEME),
    FOREIGN KEY (ID_AUTHOR) REFERENCES Authors (ID_AUTHOR)
);

CREATE TABLE Shops
(
    ID_SHOP    INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NameShop   VARCHAR(30) NOT NULL,
    ID_COUNTRY INT         NOT NULL,
    FOREIGN KEY (ID_COUNTRY) REFERENCES Country (ID_COUNTRY)
);

CREATE TABLE Sales
(
    ID_SALE  INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    ID_BOOK  INT,
    Price    DOUBLE                         NOT NULL,
    Quantity INT                            NOT NULL,
    ID_SHOP  INT                            NOT NULL,
    FOREIGN KEY (ID_BOOK) REFERENCES Books (ID_BOOK),
    FOREIGN KEY (ID_SHOP) REFERENCES Shops (ID_SHOP)
);