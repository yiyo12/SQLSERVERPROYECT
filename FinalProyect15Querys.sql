/********************REPORTING: Create Select/Views staments with joint,aggregates,etc at least 15 t-sql********************/

/*1store procedure para obtener la cantidad de vacunados con edad de riesgo

CREATE PROCEDURE CountDangerousPopulation
AS
select COUNT(*) from dbo.Citizen where dbo.Citizen.Age >= 60;


Execute CountDangerousPopulation
go*/

/*2Store procedure para obtener la cantidad de vacunas aplicadas por tipo de vacuna

CREATE PROCEDURE CountTypeVaccine
@IdVaccine int
AS
select dbo.Citizen.idVaccine,dbo.Citizen.Name, dbo.Citizen.[Paternal surname]  from dbo.Citizen where dbo.Citizen.idVaccine = @IdVaccine ;


Execute CountTypeVaccine 1*/



/*3Join por id de campus
select p.Name, p.[Paternal surname], c.idCampus, p.idCampus from dbo.Personnel p inner join Campus c On p.idCampus = c.idCampus;*/


/*4con condicion 
select p.Name, p.[Paternal surname], c.idCampus, p.idCampus from dbo.Personnel p inner join Campus c On p.idCampus = c.idCampus where c.idCampus = 2;*/

/*5join de varias tablas
select dbo.Citizen.Name , dbo.Citizen.idCitizen, dbo.Citizen.idVaccine From Citizen 
join Vaccine va on va.idVaccine = dbo.Citizen.idVaccine  
join Campus ca on ca.idCampus = dbo.Citizen.idCampus 
ORDER BY dbo.Citizen.idVaccine, va.idVaccine  */

/* 7 seleccionar reporte entre dos fechas
select * from [Citizen report] where [Citizen report].[Vaccination date] between '2020-06-15 09:30:00.000' and '2020-06-15 09:30:00.000'*/
 
 /*8 si existe
 IF EXISTS(select * from [Citizen report] where [Citizen report].[Vaccination date] between '2020-06-15 09:30:00.000' and '2020-06-15 09:30:00.000')
BEGIN
	PRINT 'It gets Data'
END
ELSE
BEGIN
	PRINT 'No data'
END
GO */

/*9 store procedure mandar dos fechas para obtener los reportes entre dichas fechas
GO 
CREATE PROCEDURE getReportsBetweenDates
@Date1 nvarchar(80),
@Date2 nvarchar(80)
AS
Begin
select * from [Citizen report] where [Citizen report].[Vaccination date] between @Date1 and @Date2;
End

Execute getReportsBetweenDates  '2020-06-15 09:30:00.000' , '2020-06-15 09:30:00.000'*/


/*10 view, reporte sobre que vacunas administradas
go
create view reportVacunasAdministradas as
select cr.idCitizen,c.Name as [citizen name], c.[Paternal surname],c.[Maternal surname],
 v.Name as [vaccine name], v.dose, cr.[Vaccination date] , camp.idCampus as [campus id],p.Name as [Personel Name] ,p.[Telephone number] as [CellPhone Personel],
 per.Name as [Job]
from [Citizen report] as cr
join Citizen as c on cr.idCitizen = c.idCitizen
join Vaccine as v on cr.idVaccine=v.idVaccine 
join Campus as camp on camp.idCampus=cr.idCampus
join Personnel as p on p.idCampus=camp.idCampus
join [Personnel key] as per on per.[idPersonnel key]=p.[idPersonnel key]
go

execute reportVacunasAdministradas
*/


/*11 buscar por caracteres

select * from dbo.Personnel where dbo.Personnel.Name LIKE '[p]%'*/

/*12 buscar por caracteres usando variables
DECLARE 
@like varchar(12),
@totalPersonel int,
@resultFind int,
@value int
set @like = '[p]%'
set @totalPersonel = (select count(dbo.Personnel.idPersonnel) from dbo.Personnel)

print @totalPersonel
set @resultFind = (select count(dbo.Personnel.idPersonnel) as total from dbo.Personnel where dbo.Personnel.Name LIKE @like)
set @value = (@totalPersonel / @resultFind )
print 'Media de personas con la inicial '+@like
print @value*/

