CREATE DATABASE CodeTaskAccManipulation
use CodeTaskAccManipulation


create table Users(
[Id] int primary key identity (1,1),
[Name] nvarchar(50),
[Email] nvarchar(100)
)

INSERT INTO Users ([Name],[Email])
VALUES
('Hacker','hack@gmail.com'),
('Sirac','sirac@gmail.com'),
('Fexriyye','fexriyye@gmail.com'),
('Nesir','nesir@gmail.com'),
('Fatime','Fatime@gmail.com'),
('Test1','Test1@gmail.com'),
('Test2','Test2@gmail.com');

DROP TABLE Doctors
DROP TABLE Users


create table Doctors(
[Id] int primary key identity (1,1),
[Name] nvarchar(50),
[Email] nvarchar(100)
)

INSERT INTO Doctors ([Name],[Email])
VALUES
('Hacker','hack@gmail.com'),
('Sirac','sirac@gmail.com'),
('Fexriyye','fexriyye@gmail.com'),
('Nesir','nesir@gmail.com'),
('Fatime','Fatime@gamil.com'),
('Test3','Test3@gmail.com');

SELECT * FROM Doctors
SELECT [Name] FROM Doctors

SELECT [Name],[Email] FROM Doctors	
UNION ALL
SELECT [Name],[Email] FROM Users

SELECT [Name],[Email] FROM Doctors	
UNION ALL
SELECT [Name],[Email] FROM Users

SELECT * FROM Doctors	
EXCEPT
SELECT * FROM Users

SELECT COUNT(*)as 'Doctors count', [Age]
FROM Doctors 
GROUP BY [Age];

Create Index

declare @num1 int = 50;
declare @num2 int = 30;
if @num1 > @num2
print	'Yes'
else
print 'No'

SELECT * FROM Teachers
SELECT * FROM Students




create function dbo.getTeachersAvgAge()
return int 
as
begin 
return (select AVG(Age) from Teachers)
end

--CREATE PROCEDURE usp_checkStudentsAndTeachersAvgAges
--@sudentAvgAge int,
--@teacherAvgAge int,
--as 
--begin
--	if @studentAvgAge > @teacherAvgAge
--		print 'Student avarege age is bigger than teachers avarage ages'
--		else
--		print 'Student avarege age is not bigger than teachers avarage ages'
--end
----@stuAvgAge int = (select dbo.getSudentAvgAge())
----@teachAvgAge int = (select dbo.getTeacherAvgAg())
----exec usp_checkStudentsAndTeachersAvgAges @sudentAvgAge, @teacherAvgAge

--CREATE PROCEDURE usp_checkStudentsAndTeachersAvgAges2
--@sudentAvgAge int,
--@teacherAvgAge int,
--as 
--begin
--@stuAvgAge int = (select dbo.getSudentAvgAge())
--@teachAvgAge int = (select dbo.getTeacherAvgAg())
--	if @stuAvgAge > @teachAvgAge
--		print 'Student avarege age is bigger than teachers avarage ages'
--		else
--		print 'Student avarege age is not bigger than teachers avarage ages'
--end

--exec usp_checkStudentsAndTeachersAvgAges2



DECLARE @Counter INT 
SET @Counter=1
WHILE ( @Counter <= 10)
BEGIN
    PRINT 'The counter value is = ' + CONVERT(NVARCHAR,@Counter)
    SET @Counter  = @Counter  + 1
END

USE AdventureWorks2014
GO
-- Basic example of TRY...CATCH
 
BEGIN TRY
-- Generate a divide-by-zero error  
  SELECT
    1 / 0 AS Error;
END TRY
BEGIN CATCH
  SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_SEVERITY() AS ErrorSeverity,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO