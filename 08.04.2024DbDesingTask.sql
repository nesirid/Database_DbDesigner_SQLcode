CREATE DATABASE DbDesingDataBase
use DbDesingDataBase



CREATE TABLE Countries (
    [Id] INT PRIMARY KEY IDENTITY (1,1),
    [Name] VARCHAR(255)
);

INSERT INTO Countries ( Name) 
VALUES ('United States');
INSERT INTO Countries ( Name) 
VALUES ('Canada');
INSERT INTO Countries ( Name)
VALUES ('Japan');
INSERT INTO Countries ( Name)
VALUES ('Azerbaijan');


CREATE TABLE Cities (
    Id INT PRIMARY KEY IDENTITY (1,1),
    [Name] VARCHAR(255),
    CountryId INT FOREIGN KEY REFERENCES Countries(Id)
);

INSERT INTO Cities (Id, Name, CountryId) VALUES ('New York', 1);
INSERT INTO Cities (Id, Name, CountryId) VALUES ('Toronto', 2);
INSERT INTO Cities (Id, Name, CountryId) VALUES ( 'Tokio', 3);
INSERT INTO Cities (Id, Name, CountryId) VALUES ( 'Baku', 4);

CREATE TABLE Students (
    Id INT PRIMARY KEY IDENTITY (1,1),
    [Name] VARCHAR(255),
    Surname VARCHAR(255),
    Address VARCHAR(255),
    Age INT,
    Email VARCHAR(255),
    CityId INT FOREIGN KEY REFERENCES Cities(Id)
);

INSERT INTO Students ( Name, Surname, Address, Age, Email, CityId)
VALUES
( 'Adams', 'Mint', 'LasVegas 55', 20, 'adamsmint@gmail.com', 1),
( 'Jane', 'Smith', '456 LasVegas St', 22, 'jane.smith@gmail.com', 2),
( 'Dosurono', 'Atashi', '789 Vevol St', 19, 'Dosurono@gmail.com', 3),
( 'Vasif', 'Dadashov', 'M.Memmedov', 21, 'Vasif@gmail.com', 4),


CREATE TABLE Educations (
    Id INT PRIMARY KEY IDENTITY (1,1),
    [Name] VARCHAR(255)
);

INSERT INTO Educations (Id, Name) VALUES
(1, 'İnformatika'),
(2, 'Biznes İdarəetmə'),
(3, 'Mexanika Mühəndisliyi'),
(4, 'Tibb'),
(5, 'Hüquq'),
(6, 'Psixologiya'),
(7, 'Elektrik Mühəndisliyi'),
(8, 'Azad Sənətlər'),
(9, 'İqtisadiyyat'),
(10, 'Kimya Mühəndisliyi');

CREATE TABLE Departments (
    Id INT PRIMARY KEY,
    [Name] VARCHAR(255)
);

INSERT INTO Departments ( Name) VALUES
( 'Kompyuter Elmləri'),
( 'Biznes İdarəçiliyi'),
( 'Mexanika Mühəndisliyi'),
( 'Tibb Elmləri'),
( 'Hüquqşünaslıq'),
( 'Psixologiya'),
( 'Elektrik Mühəndisliyi'),
( 'Liberal Sənətlər'),
( 'İqtisadiyyat'),
( 'Kimya Mühəndisliyi');

CREATE TABLE Rooms (
    Id INT PRIMARY KEY,
    [Name] VARCHAR(255),
    Capacity INT
);

INSERT INTO Rooms (Id, Name, Capacity) VALUES
(1, 'Leksia Zalı', 120),
(2, 'Seminar Otağı', 40),
(3, 'Laboratoriya', 30),
(4, 'Kompüter Sinfi', 25),
(5, 'Kitabxana Otağı', 50),
(6, 'İdman Zalı', 100),
(7, 'BP101', 200),
(8, 'BP333', 30),
(9, 'Qunesli', 20),
(10, 'Tamaşa Zalı', 150);

CREATE TABLE Groups (
    Id INT PRIMARY KEY,
    [Name] VARCHAR(255),
    Capacity INT,
    RoomId INT FOREIGN KEY REFERENCES Rooms(Id),
    EducationId INT FOREIGN KEY REFERENCES Educations(Id)
);
INSERT INTO Groups (Id, Name, Capacity, RoomId, EducationId)
VALUES
(1, 'BP110', 30, 4, 1),
(2, 'BP112', 30, 4, 1),
(3, 'BP110', 30, 4, 1),
(4, 'BP114', 25, 4, 2),
(5, 'BP155', 25, 4, 2),
(6, 'BP116', 25, 4, 3),
(7, 'BP127', 25, 4, 3),
(8, 'BP138', 20, 4, 4),
(9, 'BP19', 20, 4, 4),
(10, 'BP120', 20, 4, 5);

CREATE TABLE Teachers (
    Id INT PRIMARY KEY IDENTITY (1,1),
    FullName VARCHAR(255),
    Salary FLOAT,
    Address VARCHAR(255),
    Email VARCHAR(255)
);
INSERT INTO Teachers (FullName, Salary, Address, Email) VALUES
( 'Əliyev Elşən', 1500.00, '1,1', 'elsen.aliyev@gmail.com'),
( 'Fətəliyeva Günel', 1600.00, '1,1', 'gunel.fateliyeva@gmail.com'),
( 'Məmmədov İlkin', 1550.00, '1,1', 'ilkin.mammadov@gmail.com'),
( 'Nəbiyeva Tünzalə', 1450.00, '1,1', 'tunzale.nabiyeva@gmail.com'),
( 'Hüseynov Tural', 1700.00, '1,1', 'tural.huseynov@gmail.com');

CREATE TABLE GroupTeachers (
    GroupId INT FOREIGN KEY REFERENCES Groups(Id),
    TeacherId INT FOREIGN KEY REFERENCES Teachers(Id),
    PRIMARY KEY (GroupId, TeacherId)
);

CREATE TABLE StaffMembers (
    Id INT PRIMARY KEY,
    FullName VARCHAR(255),
    Age INT,
    Salary FLOAT,
    CityId INT FOREIGN KEY REFERENCES Cities(Id)
);

CREATE TABLE Roles (
    Id INT PRIMARY KEY,
    Name VARCHAR(255),
    DepartmentId INT FOREIGN KEY REFERENCES Departments(Id)
);

CREATE TABLE RoleStaffMembers (
    Id INT PRIMARY KEY,
    RoleId INT FOREIGN KEY REFERENCES Roles(Id),
    StaffMemberId INT FOREIGN KEY REFERENCES StaffMembers(Id)
);

CREATE TABLE StudentGroups (
    Id INT PRIMARY KEY,
    StudentId INT FOREIGN KEY REFERENCES Students(Id),
    GroupId INT FOREIGN KEY REFERENCES Groups(Id)
);