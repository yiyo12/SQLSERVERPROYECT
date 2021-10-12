/*Store Procedure CRUD OPERATIONS Personnel*/
use vaccination

/*Create PROCEDURE spAddPersonnelKey
(
	@Name varchar(50),
	@Id int
)
AS
BEGIN
if EXISTS(select * from dbo.[Personnel key] where dbo.[Personnel key].Name =  @Name)
BEGIN
	print 'tis name already exists  ' + @Name
END
ELSE
BEGIN
	if EXISTS(select * from dbo.[Personnel key] where dbo.[Personnel key].[idPersonnel key] =  @Id)
	BEGIN
	print 'this id already exists  ' + @Id
	END
	ELSE
	BEGIN
	INSERT INTO dbo.[Personnel key](Name,[idPersonnel key])
	Values (@Name, @Id)
	END
END
END
EXEC spAddPersonnelKey 'test', 90
go*/


/* ALTER Personnelkey*/
/*Create PROCEDURE spAlterPersonnelKeyIfExist
(
	@Name varchar(50),
	@Id int
)
AS
BEGIN
if EXISTS(select * from dbo.[Personnel key] where dbo.[Personnel key].[idPersonnel key] =  @Id )
BEGIN
	print 'it already exists updating'
	UPDATE dbo.[Personnel key] set Name = @Name where dbo.[Personnel key].[idPersonnel key] =  @Id
END
ELSE
BEGIN
	print 'Dont Exist'

END
END
							--Name
EXEC spAlterPersonnelKeyIfExist 'test2', 50
go*/

/*Delete State*/
/*Create PROCEDURE spDeletePersonnelKeyIfExist
(
	@idPersonnel int
)
AS
BEGIN
if EXISTS(select * from dbo.[Personnel key] where dbo.[Personnel key].[idPersonnel key] =  @idPersonnel)
BEGIN
	print 'it already exists delet..'
		DELETE from dbo.Personnel where dbo.Personnel.[idPersonnel key] = @idPersonnel
		DELETE from dbo.[Personnel key] where dbo.[Personnel key].[idPersonnel key] = @idPersonnel
 END
ELSE
BEGIN
	print 'Dont Exist'

END
END
						--id
EXEC spDeletePersonnelKeyIfExist 50
go*/


/*Show  Personnel*/
/*Create PROCEDURE spShowPersonnelKeyIfExist
(
	@idPersonnell int
)
AS
BEGIN
if EXISTS(select * from dbo.[Personnel key] where dbo.[Personnel key].[idPersonnel key] =  @idPersonnell)
BEGIN
	print 'it already exists'
	Select dbo.[Personnel key].Name, dbo.[Personnel key].[idPersonnel key] from dbo.[Personnel key] where dbo.[Personnel key].[idPersonnel key] = @idPersonnell
END
ELSE
BEGIN
	print 'Dont Exist'
	Select * from dbo.[Personnel key]

END
END
						--id
EXEC spShowPersonnelKeyIfExist 60
go

*/


