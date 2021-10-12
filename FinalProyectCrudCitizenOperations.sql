/*Store Procedure CRUD OPERATIONS Citizen*/

use vaccination

/*Create PROCEDURE spAddCitizen
(
	
	@Name varchar(50),
	@MaternalName varchar(50),
	@PaternalName varchar(50),
	@Addrs varchar(50),
	@Phone varchar(50),
	@Age int,
	@idCampus int,
	@idVaccine int
	

)
AS
BEGIN
if EXISTS(select * from dbo.Citizen)
BEGIN
	print 'create citizen'
	INSERT INTO dbo.Citizen(Address,Age,idCampus,idVaccine,[Maternal surname],Name,[Paternal surname],[Telephone number])
	Values (@Addrs,@Age,@idCampus,@idVaccine,@MaternalName,@Name,@PaternalName,@Phone)
END
ELSE
BEGIN
	print 'false'
END
END	

EXEC spAddCitizen 'juan admin','Solis','Hernandez','Hidalgo 501','6441414141',23,1,1
go
*/


---Alter Personnel
/*
Create PROCEDURE spAlterCitizen
(	
	@idCitizen int,
	@Name varchar(50),
	@MaternalName varchar(50),
	@PaternalName varchar(50),
	@Addrs varchar(50),
	@Phone varchar(50),
	@Age int,
	@idCampus int,
	@idVaccine int
)
AS
BEGIN
if EXISTS(select * from dbo.Citizen where dbo.Citizen.idCitizen =  @idCitizen)
BEGIN
	print 'it already exists'
	UPDATE dbo.Citizen set Name = @Name where dbo.Citizen.idCitizen =  @idCitizen
	UPDATE dbo.Citizen set [Maternal surname] = @MaternalName where dbo.Citizen.idCitizen =  @idCitizen
	UPDATE dbo.Citizen set [Paternal surname] = @PaternalName where dbo.Citizen.idCitizen =  @idCitizen
	UPDATE dbo.Citizen set Address = @Addrs where dbo.Citizen.idCitizen =  @idCitizen
	UPDATE dbo.Citizen set [Telephone number] = @Phone where dbo.Citizen.idCitizen =  @idCitizen
	UPDATE dbo.Citizen set Age = @Age where dbo.Citizen.idCitizen =  @idCitizen
	UPDATE dbo.Citizen set idCampus = @idCampus where dbo.Citizen.idCitizen =  @idCitizen
	UPDATE dbo.Citizen set idVaccine = @idVaccine where dbo.Citizen.idCitizen =  @idCitizen

END
ELSE
BEGIN
	print 'Dont Exist'

END
END
						--id, name, mname, pname, addres, phone, age, idcampus, idvaccine
EXEC spAlterCitizen  19,'Yiyo test','velasquezzz','coronadooo','zacatecas 40333','6449977411',60,1,1
go*/

/*Delete Personnel*/
/*Create PROCEDURE spDeleteCitizenIfExist
(
	@idCitizen int
)
AS
BEGIN
if EXISTS(select * from dbo.Citizen where dbo.Citizen.idCitizen =  @idCitizen)
BEGIN
	print 'it already exists delet..'
	DELETE from dbo.Citizen where dbo.Citizen.idCitizen = @idCitizen
END
ELSE
BEGIN
	print 'Dont Exist'

END
END
						--id
EXEC spDeleteCitizenIfExist 19
go*/




/*Show  Personel*/
/*Create PROCEDURE spShowCitizenIfExist
(
	@idCitizen int
)
AS
BEGIN
if EXISTS(select * from dbo.Citizen where dbo.Citizen.idCitizen =  @idCitizen)
BEGIN
	print 'it already exists'
	Select dbo.Citizen.Name, dbo.Citizen.[Maternal surname], dbo.Citizen.[Paternal surname], dbo.Citizen.[Telephone number], dbo.Citizen.idCitizen
	from dbo.Citizen where dbo.Citizen.idCitizen = @idCitizen
END
ELSE
BEGIN
	print 'Dont Exist'
	Select * from dbo.Citizen

END
END
						--id
EXEC spShowCitizenIfExist 150
go
*/