CREATE DATABASE Army;
USE Army;

CREATE TABLE Weapons
(
    WEAPON_ID  INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    WeaponName VARCHAR(20)        NOT NULL
);

INSERT INTO Weapons (WeaponName)
VALUES ('АК-27'),
       ('Глок20');

CREATE TABLE Platoons
(
    PlatoonNumber INT NOT NULL PRIMARY KEY
);

INSERT INTO Platoons(PlatoonNumber)
VALUES (222),
       (232),
       (212),
       (200);

CREATE TABLE Soldiers
(
    SOLDIER_ID    INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    PlatoonNumber INT                NOT NULL,
    SoldierName   VARCHAR(30)        NOT NULL,
    Division      VARCHAR(30),
    FOREIGN KEY (PlatoonNumber) REFERENCES Platoons (PlatoonNumber)
);

INSERT INTO soldiers (PlatoonNumber, SoldierName, Division)
VALUES (222, 'Петров В.А.', 'оф. 205'),
       (232, 'Лодарев П.С.', 'оф. 221'),
       (212, 'Леонтьев К.В.', 'оф. 201'),
       (200, 'Духов Р.М.', '');

CREATE TABLE Ranks
(
    RANK_ID  INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    RankName VARCHAR(20)        NOT NULL
);

INSERT INTO Ranks(RankName)
VALUES ('Майор'),
       ('Подполковник');

CREATE TABLE WeaponIssued
(
    ID          INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    OfficerName VARCHAR(30)        NOT NULL,
    RANK_ID     INT                NOT NULL,
    FOREIGN KEY (RANK_ID) REFERENCES Ranks (RANK_ID)
);

INSERT INTO WeaponIssued (OfficerName, RANK_ID)
VALUES ('Буров О.С.', 1),
       ('Рыбаков Н.Г.', 1),
       ('Деребанов В.Я.', 2);

CREATE TABLE WeaponIssuanceJournal
(
    ID             INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    SOLDIER_ID     INT                NOT NULL,
    WEAPON_ID      INT                NOT NULL,
    WeaponIssuedID INT                NOT NULL,

    FOREIGN KEY (SOLDIER_ID) REFERENCES Soldiers (SOLDIER_ID),
    FOREIGN KEY (WEAPON_ID) REFERENCES Weapons (WEAPON_ID),
    FOREIGN KEY (WeaponIssuedID) REFERENCES WeaponIssued (ID)
);

INSERT INTO WeaponIssuanceJournal(SOLDIER_ID, WEAPON_ID, WeaponIssuedID)
VALUES (1, 1, 1),
       (1, 2, 2),
       (2, 1, 3),
       (2, 2, 2),
       (3, 1, 1),
       (3, 2, 2),
       (4, 1, 1);
