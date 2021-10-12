/*Store Procedure CRUD OPERATIONS PERSONNEL*/
use vaccination

/*Create PROCEDURE spAddPersonnel
(
	
	@Name varchar(50),
	@MaternalName varchar(50),
	@PaternalName varchar(50),
	@Addrs varchar(50),
	@Phone varchar(50),
	@idPersonnelKey int,
	@idCampus int
	

)
AS
BEGIN
if EXISTS(select * from dbo.Personnel)
BEGIN
	print 'create Personnel'
	INSERT INTO dbo.Personnel(Address,idCampus,[idPersonnel key],[Telephone number],[Maternal surname], [Paternal surname],Name)
	Values (@Addrs,@idCampus,@idPersonnelKey,@Phone,@MaternalName,@PaternalName,@Name)
END
ELSE
BEGIN
	print 'false'
END
END	

EXEC spAddPersonnel 'Yiyo carlos','velasquez','coronado','zacatecas 40333','6449977411',10,1
go*/



---Alter Personnel

/*Create PROCEDURE spAlterPersonnel
(	
	@idPersonnel int,
	@Name varchar(50),
	@MaternalName varchar(50),
	@PaternalName varchar(50),
	@Addrs varchar(50),
	@Phone varchar(50),
	@idPersonnelKey int,
	@idCampus int
)
AS
BEGIN
if EXISTS(select * from dbo.Personnel where dbo.Personnel.idPersonnel =  @idPersonnel)
BEGIN
	print 'it already exists'
	UPDATE dbo.Personnel set Name = @Name where dbo.Personnel.idPersonnel =  @idPersonnel
	UPDATE dbo.Personnel set [Maternal surname] = @MaternalName where dbo.Personnel.idPersonnel =  @idPersonnel
	UPDATE dbo.Personnel set [Paternal surname] = @PaternalName where dbo.Personnel.idPersonnel =  @idPersonnel
	UPDATE dbo.Personnel set Address = @Addrs where dbo.Personnel.idPersonnel =  @idPersonnel
	UPDATE dbo.Personnel set [Telephone number] = @Phone where dbo.Personnel.idPersonnel =  @idPersonnel
	UPDATE dbo.Personnel set [idPersonnel key] = @idPersonnelKey where dbo.Personnel.idPersonnel =  @idPersonnel
	UPDATE dbo.Personnel set idCampus = @idCampus where dbo.Personnel.idPersonnel =  @idPersonnel

END
ELSE
BEGIN
	print 'Dont Exist'

END
END
						id, name, mname, pname, addres, phone, pronnKey, idcampus
EXEC spAlterPersonnel  14,'Yiyo','velasquezzz','coronadooo','zacatecas 40333','6449977411',10,1
go*/

/*Delete Personnel*/
/*Create PROCEDURE spDeletePersonnelfExist
(
	@idPersonnel int
)
AS
BEGIN
if EXISTS(select * from dbo.Personnel where dbo.Personnel.idPersonnel =  @idPersonnel)
BEGIN
	print 'it already exists delet..'
	DELETE from dbo.Personnel where dbo.Personnel.idPersonnel = @idPersonnel
END
ELSE
BEGIN
	print 'Dont Exist'

END
END
						--id
EXEC spDeletePersonnelfExist 150
go*/




/*Show  Personel*/
/*Create PROCEDURE spShowPersonnelIfExist
(
	@idPersonnel int
)
AS
BEGIN
if EXISTS(select * from dbo.Personnel where dbo.Personnel.idPersonnel =  @idPersonnel)
BEGIN
	print 'it already exists'
	Select dbo.Personnel.Name, dbo.Personnel.[Maternal surname], dbo.Personnel.[Paternal surname], dbo.Personnel.[Telephone number], dbo.Personnel.idPersonnel
	from dbo.Personnel where dbo.Personnel.idPersonnel = @idPersonnel
END
ELSE
BEGIN
	print 'Dont Exist'
	Select * from dbo.Personnel

END
END
						--id
EXEC spShowPersonnelIfExist 12
go*/
