# Задание
# Спроектировать базу данных для вымышленной системы отдела кадров, провести нормализацию всех таблиц.

CREATE DATABASE Hr;

USE Hr;

CREATE TABLE Regions
(
    REGION_ID  INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    RegionName VARCHAR(20)        NOT NULL
);

CREATE TABLE Countries
(
    COUNTRY_ID  INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    CountryName VARCHAR(20)        NOT NULL,
    REGION_ID   INT                NOT NULL,
    FOREIGN KEY (REGION_ID) REFERENCES Regions (REGION_ID)
);

CREATE TABLE Locations
(
    LOCATION_ID   INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    StreetAddress VARCHAR(50)        NOT NULL,
    PostalCode    INT                NOT NULL,
    City          VARCHAR(20)        NOT NULL,
    COUNTRY_ID    INT                NOT NULL,
    FOREIGN KEY (COUNTRY_ID) REFERENCES Countries (COUNTRY_ID)
);

CREATE TABLE Jobs
(
    JOB_ID    INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    JobTitle  VARCHAR(30)        NOT NULL,
    MinSalary DOUBLE             NOT NULL,
    MaxSalary DOUBLE             NOT NULL
);

CREATE TABLE Employees
(
    EMPLOYEE_ID   INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    FirstName     VARCHAR(30)        NOT NULL,
    LastName      VARCHAR(30)        NOT NULL,
    Email         VARCHAR(30)        NOT NULL,
    PhoneNumber   VARCHAR(13)        NOT NULL,
    HireDate      DATE               NOT NULL,
    JOB_ID        INT                NOT NULL,
    Salary        DOUBLE             NOT NULL,
    MANAGER_ID    INT                NOT NULL,
    DEPARTMENT_ID INT                NOT NULL,
    FOREIGN KEY (JOB_ID) REFERENCES Jobs (JOB_ID),
    FOREIGN KEY (MANAGER_ID) REFERENCES Employees (EMPLOYEE_ID)
);

CREATE TABLE Departments
(
    DEPARTMENT_ID  INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    DepartmentName VARCHAR(30)        NOT NULL,
    MANAGER_ID     INT                NOT NULL,
    LOCATION_ID    INT                NOT NULL,
    FOREIGN KEY (LOCATION_ID) REFERENCES Locations (LOCATION_ID),
    FOREIGN KEY (MANAGER_ID) REFERENCES Employees (MANAGER_ID)
);

ALTER TABLE Employees
    ADD FOREIGN KEY (DEPARTMENT_ID) REFERENCES Departments (DEPARTMENT_ID);

CREATE TABLE JobHistory
(
    EMPLOYEE_ID   INT  NOT NULL,
    StartDate     DATE NOT NULL,
    EndDate       DATE,
    JOB_ID        INT  NOT NULL,
    DEPARTMENT_ID INT  NOT NULL,
    PRIMARY KEY (EMPLOYEE_ID, StartDate),
    FOREIGN KEY (EMPLOYEE_ID) REFERENCES Employees (EMPLOYEE_ID),
    FOREIGN KEY (JOB_ID) REFERENCES Jobs (JOB_ID),
    FOREIGN KEY (DEPARTMENT_ID) REFERENCES Departments (DEPARTMENT_ID)
);