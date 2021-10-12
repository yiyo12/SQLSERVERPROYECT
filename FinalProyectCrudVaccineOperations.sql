/*Store Procedure CRUD OPERATIONS VACCINE*/
use vaccination

/*CREATE PROCEDURE spAddVacine
(
	@Name varchar(50),
	@Dose int
)
AS
BEGIN
	SELECT * FROM  dbo.Vaccine
/*Insert values in vaccine*/
INSERT INTO dbo.Vaccine (Name,Dose)
Values (@Name,@Dose)
END

EXEC spAddVacine 'Sputnik2',2
go*/
/*
--Find duplicate data
 WITH C AS
 (
  SELECT Name,
  ROW_NUMBER() OVER (PARTITION BY 
                    Name
                    ORDER BY Name) AS DUPLICADO
  FROM dbo.Vaccine 
 )
 SELECT * FROM C 
 WHERE DUPLICADO > 1


 -- delete duplicate data
 WITH C AS
 (
  SELECT Name,
  ROW_NUMBER() OVER (PARTITION BY 
                    Name
                    ORDER BY Name) AS DUPLICADO
  FROM dbo.Vaccine 
 )
 DELETE FROM C 
 WHERE DUPLICADO > 1*/

 /*Alter Vaccine*/
/* Create PROCEDURE spAlterVacineByName
(
	@Name varchar(50),
	@Dose int
)
AS
BEGIN
if EXISTS(select * from dbo.Vaccine where dbo.Vaccine.Name =  @Name)
BEGIN
	print 'it already exists '
END
ELSE
BEGIN
	print 'Dont Exist .. create vaccine'
	INSERT INTO dbo.Vaccine (Name,Dose)
	Values (@Name,@Dose)
END
END
EXEC spAlterVacineByName 'Sputnik22',2
go*/

/*
Create PROCEDURE spAlterVacineIfExist
(
	@Name varchar(50),
	@Dose int,
	@idVaccine int
)
AS
BEGIN
if EXISTS(select * from dbo.Vaccine where dbo.Vaccine.idVaccine =  @idVaccine)
BEGIN
	print 'it already exists'
	UPDATE dbo.Vaccine set Name = @Name where dbo.Vaccine.idVaccine =  @idVaccine
	UPDATE dbo.Vaccine set Dose = @Dose where dbo.Vaccine.idVaccine =  @idVaccine
END
ELSE
BEGIN
	print 'Dont Exist'

END
END
							--Name, Dose, Id
EXEC spAlterVacineIfExist 'AstraZeneca ',1,4
go*/

/*Delete Vaccine
Create PROCEDURE spDeleteVacineIfExist
(
	@idVaccine int
)
AS
BEGIN
if EXISTS(select * from dbo.Vaccine where dbo.Vaccine.idVaccine =  @idVaccine)
BEGIN
	print 'it already exists delet..'
	DELETE from dbo.Vaccine where dbo.Vaccine.idVaccine = @idVaccine
END
ELSE
BEGIN
	print 'Dont Exist'

END
END
						--id
EXEC spDeleteVacineIfExist 70
go*/




/*Show  Vaccines*/
/*Create PROCEDURE spShowVaccineIfExist
(
	@idVaccine int
)
AS
BEGIN
if EXISTS(select * from dbo.Vaccine where dbo.Vaccine.idVaccine =  @idVaccine)
BEGIN
	print 'it already exists'
	Select dbo.Vaccine.Name, dbo.Vaccine.idVaccine from dbo.Vaccine where dbo.Vaccine.idVaccine = @idVaccine
END
ELSE
BEGIN
	print 'Dont Exist'
	Select * from dbo.Vaccine

END
END
						--id
EXEC spShowVaccineIfExist 800
go*/
