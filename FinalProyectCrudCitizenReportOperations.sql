/*Store Procedure CRUD OPERATIONS Citizen Reports*/
use vaccination

/*Create PROCEDURE spAddCitizenReport
(	
 
	@idCitizen int,
	@idCampus int,
	@idVaccine int,
	@doseNumber int,
	@vacinnationDate date
	

)
AS
BEGIN
if EXISTS(select * from dbo.[Citizen report])
BEGIN
	print 'create citizen report'
	INSERT INTO dbo.[Citizen report]([Dose number],idCampus,idCitizen,idVaccine,[Vaccination date])
	Values (@doseNumber,@idCampus,@idCitizen,@idVaccine,@vacinnationDate)
END
ELSE
BEGIN
	print 'false'
END
END	

EXEC spAddCitizenReport 15,8,39,1,'2020-06-15 09:30:00.000' 
go
*/


---Alter Personnel
/*
Create PROCEDURE spAlterCitizenReport
(	
	@idReport int,
	@idCampus int,
	@idVaccine int,
	@doseNumber int,
	@vaccinationDate date
)
AS
BEGIN
if EXISTS(select * from dbo.[Citizen report] where dbo.[Citizen report].idReport =  @idReport)
BEGIN
	print 'it already exists'
	UPDATE dbo.[Citizen report] set idCampus = @idCampus where dbo.[Citizen report].idReport =  @idReport
	UPDATE dbo.[Citizen report] set idVaccine = @idVaccine where dbo.[Citizen report].idReport =  @idReport
	UPDATE dbo.[Citizen report] set [Dose number] = @doseNumber where dbo.[Citizen report].idReport =  @idReport
	UPDATE dbo.[Citizen report] set [Vaccination date] = @vaccinationDate where dbo.[Citizen report].idReport =  @idReport


END
ELSE
BEGIN
	print 'Dont Exist'

END
END
						--id, name, mname, pname, addres, phone, age, idcampus, idvaccine
EXEC spAlterCitizenReport  4,2,2,2,'2020-07-15 00:00:00.000'
go*/

/*Delete Personnel*/
/*Create PROCEDURE spDeleteCitizenReportIfExist
(
	@idReport int
)
AS
BEGIN
if EXISTS(select * from dbo.[Citizen report] where dbo.[Citizen report].idReport =  @idReport)
BEGIN
	print 'it already exists delet..'
	DELETE from dbo.[Citizen report] where dbo.[Citizen report].idReport = @idReport
END
ELSE
BEGIN
	print 'Dont Exist'

END
END
						--id
EXEC spDeleteCitizenReportIfExist 4
go*/




/*Show  Personel*/
/*Create PROCEDURE spShowCitizenReportIfExist
(
	@idReport int
)
AS
BEGIN
if EXISTS(select * from dbo.[Citizen report] where dbo.[Citizen report].idReport =  @idReport)
BEGIN
	print 'it already exists'
	Select dbo.[Citizen report].[Vaccination date], dbo.[Citizen report].idVaccine,  dbo.[Citizen report].[Dose number],
	 dbo.[Citizen report].idCitizen,  dbo.[Citizen report].idCampus
	from dbo.[Citizen report] where dbo.[Citizen report].idReport = @idReport
END
ELSE
BEGIN
	print 'Dont Exist'
	Select * from dbo.[Citizen report]

END
END
						--id
EXEC spShowCitizenReportIfExist 1
go
*/