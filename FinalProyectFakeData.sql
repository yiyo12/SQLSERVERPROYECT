/*script fake data*/
use vaccination


/*Insert values in vaccine*/
INSERT INTO dbo.Vaccine (Name,Dose)
Values ('CoronaVac',3),
	   ('CoronaVac',3)

/*Insert values in State*/
INSERT INTO dbo.State(Name)
Values ('Chiapas')

/*Insert values in Campus*/
INSERT INTO dbo.Campus(Address,Date,idState)
Values ('Obregon','2021-11-05 09:00:00',3)

/*Insert values in Personel key (job)*/
INSERT INTO dbo.[Personnel key](Name,[idPersonnel key])
Values ('Scientific',50)

/*Insert values in Personel*/
INSERT INTO dbo.Personnel(Address,idCampus,[idPersonnel key],[Maternal surname],Name,[Paternal surname],[Telephone number])
Values ('Zacatecas 403, col.Esperanza centro',10,50,'Velasquez','Juan Carlos', 'Coronado', '6449977411')

/*Insert values in Citizen*/
INSERT INTO dbo.Citizen(Name,[Maternal surname],[Paternal surname],Address,[Telephone number],Age,idCampus,idVaccine)
Values ('Jesse Misael','Jara','Noriega','Paseo de las lomas 205','6449977411', 11, 10,5)

/*Insert values in Citizen report*/
INSERT INTO dbo.[Citizen report](idCitizen,idCampus,idVaccine,[Dose number],[Vaccination date])
Values (18,13,5,1,'2021-11-05 09:00:00')

