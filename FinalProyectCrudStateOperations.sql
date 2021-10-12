/*Store Procedure CRUD OPERATIONS State*/
use vaccination

/*Create PROCEDURE spAddState
(
	@Name varchar(50)	
)
AS
BEGIN
if EXISTS(select * from dbo.State where dbo.State.Name =  @Name)
BEGIN
	print 'it already exists '
END
ELSE
BEGIN
	print 'Dont Exist .. create State'
	INSERT INTO dbo.State (Name)
	Values (@Name)
END
END
EXEC spAddState 'Morelos'
go*/

 /*Alter Vaccine*/
/*Create PROCEDURE spAlterStateByName
(
	@Name varchar(50)
)
AS
BEGIN
if EXISTS(select * from dbo.State where dbo.State.Name =  @Name)
BEGIN
	print 'it already exists '
END
ELSE
BEGIN
	print 'Dont Exist .. create State'
	INSERT INTO dbo.State(Name)
	Values (@Name)
END
END
EXEC spAlterStateByName 'Morelos'
go*/

/* ALTER State*/
/*Create PROCEDURE spAlterStateIfExist
(
	@Name varchar(50),
	@idState int
)
AS
BEGIN
if EXISTS(select * from dbo.State where dbo.State.idState =  @idState)
BEGIN
	print 'it already exists'
	UPDATE dbo.State set Name = @Name where dbo.State.idState =  @idState
END
ELSE
BEGIN
	print 'Dont Exist'

END
END
							--Name, Id
EXEC spAlterStateIfExist 'Nayarit',20
go
*/
/*Delete State*/
/*Create PROCEDURE spDeleteStateIfExist
(
	@idState int
)
AS
BEGIN
if EXISTS(select * from dbo.State where dbo.State.idState =  @idState)
BEGIN
	print 'it already exists delet..'
	DELETE from dbo.State where dbo.State.idState = @idState
END
ELSE
BEGIN
	print 'Dont Exist'

END
END
						--id
EXEC spDeleteStateIfExist 16
go*/


/*Show  State*/
/*Create PROCEDURE spShowStateIfExist
(
	@idState int
)
AS
BEGIN
if EXISTS(select * from dbo.State where dbo.State.idState =  @idState)
BEGIN
	print 'it already exists'
	Select dbo.State.Name, dbo.State.idState from dbo.State where dbo.State.idState = @idState
END
ELSE
BEGIN
	print 'Dont Exist'
	Select * from dbo.State

END
END
						--id
EXEC spShowStateIfExist 15
go*/




