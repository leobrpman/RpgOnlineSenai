--DDL

CREATE DATABASE RpgOnline
GO

USE RpgOnline
GO

CREATE TABLE Users(
	UserId INT PRIMARY KEY IDENTITY,
	Email VARCHAR(100) UNIQUE NOT NULL,
	Senha  VARCHAR(50) NOT NULL
)
GO

CREATE TABLE Class(
	ClassId INT PRIMARY KEY IDENTITY,
	ClassName VARCHAR(50) UNIQUE NOT NULL,
	ClassDescr VARCHAR(500) UNIQUE
)
GO

CREATE TABLE Characters(
	CharId INT PRIMARY KEY IDENTITY,
	CharName VARCHAR(50) UNIQUE NOT NULL,
	UserId INT UNIQUE FOREIGN KEY REFERENCES Users(UserId),
	ClassId INT FOREIGN KEY REFERENCES Class(ClassId)
)
GO

CREATE TABLE Habilities(
	HabilityId INT PRIMARY KEY IDENTITY,
	HabilityName VARCHAR(50) UNIQUE NOT NULL,
	HabilityDesc VARCHAR(500) UNIQUE
)
GO

CREATE TABLE ClassHability(
	ClassId INT FOREIGN KEY REFERENCES Class(ClassId),
	HabilityId INT FOREIGN KEY REFERENCES Habilities(HabilityId)
)
GO



--DML

INSERT INTO Users VALUES ('leonardo@email.com', 'discodefreio')
INSERT INTO Class VALUES ('B�rbaro', 'descri��o da classe "B�rbaro"')
INSERT INTO Habilities VALUES ('Lan�a Mortal', 'descri��o da habilidade "Lan�a Mortal"'), ('Escudo Supremo', 'descri��o da habilidade "Escudo Supremo"')
INSERT INTO Characters (CharName, UserId, ClassId) VALUES ('DeuBug', 1, 1)
INSERT INTO ClassHability (ClassId, HabilityId) VALUES (1, 1), (1, 2)

INSERT INTO Users VALUES ('leobrpman@email.com', 'batatagratinada')
INSERT INTO Class VALUES ('Monge', 'descri��o da classe "Monge"')
INSERT INTO Habilities VALUES ('Recuperar Vida', 'descri��o da habilidade "Recuperar Vida"')
INSERT INTO Characters (CharName, UserId, ClassId) VALUES ('BitBug', 2, 2)
INSERT INTO ClassHability (ClassId, HabilityId) VALUES (2, 2), (2, 3)

UPDATE Users
SET Senha = 'batatafrita'
WHERE UserId = 1

SELECT Senha FROM Users

SELECT Ch.CharName 'Nome', Cl.ClassName 'Classe', Cl.ClassDescr 'Descri��o' FROM Characters Ch JOIN Class Cl
ON Ch.ClassId = Cl.ClassId

SELECT U.Email 'e-mail', Ch.CharName 'Nome', Cl.ClassName 'Classe', Cl.ClassDescr 'Descri��o' FROM Characters Ch 
JOIN Class Cl ON Ch.ClassId = Cl.ClassId
JOIN Users U ON U.UserId = Ch.CharId

--PERMISS�ES

CREATE LOGIN adminrpg
WITH PASSWORD = 'adminrpg'

CREATE USER adminrpg FOR LOGIN adminrpg

GRANT SELECT TO adminrpg

SELECT * FROM Users

UPDATE Users
SET Email = 'leonardo@email.com.br'
WHERE UserId = 1
