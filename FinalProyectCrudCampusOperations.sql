/*Store Procedure CRUD OPERATIONS Campus*/
use vaccination

/*Create PROCEDURE spAddCampus
(
	@idState varchar(50),
	@Date Date,
	@Addrs varchar(150)

)
AS
BEGIN
if EXISTS(select * from dbo.Campus where dbo.Campus.Address =  @Addrs)
BEGIN
	print 'this address it already exists '
END
ELSE
BEGIN
	print 'Dont Exist .. create campus'
	INSERT INTO dbo.Campus(idState,Date,Address)
	Values (@idState,@Date,@Addrs)
END
END
EXEC spAddCampus 13,'2021-11-05 09:00:00','Obregon test'
go*/


/* ALTER Campus*/
/*Create PROCEDURE spAlterCampusIfExist
(
	@Addrs varchar(50),
	@idCampus int
)
AS
BEGIN
if EXISTS(select * from dbo.Campus where dbo.Campus.idCampus =  @idCampus)
BEGIN
	print 'it already exists updating'
	UPDATE dbo.Campus set Address = @Addrs where dbo.Campus.idCampus =  @idCampus
END
ELSE
BEGIN
	print 'Dont Exist'

END
END
							--Name, Id
EXEC spAlterCampusIfExist 'Obregon 2',40
go*/

/*Delete State*/
/*Create PROCEDURE spDeleteCampusIfExist
(
	@idCampus int
)
AS
BEGIN
if EXISTS(select * from dbo.Campus where dbo.Campus.idCampus =  @idCampus)
BEGIN
	print 'it already exists delet..'
	DELETE from dbo.Campus where dbo.Campus.idCampus = @idCampus
END
ELSE
BEGIN
	print 'Dont Exist'

END
END
						--id
EXEC spDeleteCampusIfExist 14
go
*/

/*Show  Campus*/
/*Create PROCEDURE spShowCampusIfExist
(
	@idCampus int
)
AS
BEGIN
if EXISTS(select * from dbo.Campus where dbo.Campus.idCampus =  @idCampus)
BEGIN
	print 'it already exists'
	Select dbo.Campus.Address, dbo.Campus.Date from dbo.Campus where dbo.Campus.idCampus = @idCampus
END
ELSE
BEGIN
	print 'Dont Exist'
	Select * from dbo.Campus

END
END
						--id
EXEC spShowCampusIfExist 13
go*/




