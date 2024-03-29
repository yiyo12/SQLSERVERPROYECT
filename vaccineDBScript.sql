USE [vaccination]
GO
/****** Object:  Table [dbo].[Campus]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campus](
	[idCampus] [tinyint] IDENTITY(1,1) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[Date] [smalldatetime] NULL,
	[idState] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCampus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Citizen]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citizen](
	[idCitizen] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Maternal surname] [varchar](100) NOT NULL,
	[Paternal surname] [varchar](100) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[Telephone number] [varchar](10) NOT NULL,
	[Age] [tinyint] NOT NULL,
	[idCampus] [tinyint] NULL,
	[idVaccine] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCitizen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Citizen report]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citizen report](
	[idReport] [int] IDENTITY(1,1) NOT NULL,
	[idCitizen] [int] NULL,
	[idCampus] [tinyint] NULL,
	[idVaccine] [tinyint] NULL,
	[Dose number] [tinyint] NULL,
	[Vaccination date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idReport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[idState] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vaccine]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vaccine](
	[idVaccine] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Dose] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idVaccine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[report]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[report] as
select cr.idReport, cr.idCitizen,c.Name as [citizen name], c.[Paternal surname],c.[Maternal surname],
c.Age, ca.Address, S.Name as [State name], v.Name as [vaccine name], v.dose, cr.[Vaccination date] 
from [Citizen report] as cr
join Citizen as c on cr.idCitizen = c.idCitizen
join Campus as ca on cr.idCampus=ca.idCampus
join State as s on ca.idState= s.idState
join Vaccine as v on cr.idVaccine=v.idVaccine 
GO
/****** Object:  Table [dbo].[Personnel]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personnel](
	[idPersonnel] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Maternal surname] [varchar](100) NOT NULL,
	[Paternal surname] [varchar](100) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[Telephone number] [varchar](10) NOT NULL,
	[idPersonnel key] [tinyint] NULL,
	[idCampus] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPersonnel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personnel key]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personnel key](
	[idPersonnel key] [tinyint] NOT NULL,
	[Name] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idPersonnel key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[reportVacunasAdministradas]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[reportVacunasAdministradas] as
select cr.idCitizen,c.Name as [citizen name], c.[Paternal surname],c.[Maternal surname],
 v.Name as [vaccine name], v.dose, cr.[Vaccination date] , camp.idCampus as [campus id],p.Name as [Personel Name] ,p.[Telephone number] as [CellPhone Personel],
 per.Name as [Job]
from [Citizen report] as cr
join Citizen as c on cr.idCitizen = c.idCitizen
join Vaccine as v on cr.idVaccine=v.idVaccine 
join Campus as camp on camp.idCampus=cr.idCampus
join Personnel as p on p.idCampus=camp.idCampus
join [Personnel key] as per on per.[idPersonnel key]=p.[idPersonnel key]

GO
SET IDENTITY_INSERT [dbo].[Campus] ON 

INSERT [dbo].[Campus] ([idCampus], [Address], [Date], [idState]) VALUES (1, N'unidad deportiva, Miramontes #546,Coquimatlan', CAST(N'2021-11-05T09:00:00' AS SmallDateTime), 6)
INSERT [dbo].[Campus] ([idCampus], [Address], [Date], [idState]) VALUES (2, N'Tecnologico,Av. Adolfo López Mateos #1801 Ote. Fracc. Bona Gens', CAST(N'2021-06-01T09:30:00' AS SmallDateTime), 1)
INSERT [dbo].[Campus] ([idCampus], [Address], [Date], [idState]) VALUES (3, N'Tecnologico, Blvd. Insurgentes #18235 Col. Libramiento', CAST(N'2021-10-01T09:30:00' AS SmallDateTime), 2)
INSERT [dbo].[Campus] ([idCampus], [Address], [Date], [idState]) VALUES (4, N'Unidad deportiva Crea, Blvd. Dolores #16841 Col. Parotas', CAST(N'2021-01-07T09:30:00' AS SmallDateTime), 12)
INSERT [dbo].[Campus] ([idCampus], [Address], [Date], [idState]) VALUES (5, N'UAG,654 Muñoz Rivera Ave. Suite 1124 San Juan', CAST(N'2021-03-07T10:30:00' AS SmallDateTime), 14)
INSERT [dbo].[Campus] ([idCampus], [Address], [Date], [idState]) VALUES (6, N'UNAM, University City, Coyoacán, 04510', CAST(N'2020-06-15T09:30:00' AS SmallDateTime), 10)
INSERT [dbo].[Campus] ([idCampus], [Address], [Date], [idState]) VALUES (7, N'Unidad deporiva, Col. Ninos Heroes,3754', CAST(N'2022-01-15T09:30:00' AS SmallDateTime), 4)
INSERT [dbo].[Campus] ([idCampus], [Address], [Date], [idState]) VALUES (8, N'Oficinas del PRI, Av. Jacarandas,226', CAST(N'2020-07-26T09:00:00' AS SmallDateTime), 9)
INSERT [dbo].[Campus] ([idCampus], [Address], [Date], [idState]) VALUES (9, N'IMSS, Av. Centro, 644', CAST(N'2021-03-10T09:00:00' AS SmallDateTime), 7)
INSERT [dbo].[Campus] ([idCampus], [Address], [Date], [idState]) VALUES (10, N'Zocalo de la capital, Av. Centro, 132', CAST(N'2022-03-10T09:00:00' AS SmallDateTime), 3)
INSERT [dbo].[Campus] ([idCampus], [Address], [Date], [idState]) VALUES (11, N'Zocalo de la capital, Av. Centro, 1974, Tlaquepaque', CAST(N'2022-03-10T09:00:00' AS SmallDateTime), 14)
INSERT [dbo].[Campus] ([idCampus], [Address], [Date], [idState]) VALUES (13, N'Obregon', CAST(N'2021-11-05T09:00:00' AS SmallDateTime), 3)
SET IDENTITY_INSERT [dbo].[Campus] OFF
GO
SET IDENTITY_INSERT [dbo].[Citizen] ON 

INSERT [dbo].[Citizen] ([idCitizen], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [Age], [idCampus], [idVaccine]) VALUES (1, N'Rodrigo', N'Dorantes', N'Jimenez', N'col. Dinastia, 8264', N'6518353171', 30, 9, 3)
INSERT [dbo].[Citizen] ([idCitizen], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [Age], [idCampus], [idVaccine]) VALUES (2, N'Andrea', N'Librado', N'Villa', N'col. Montreal, 615', N'8465835317', 51, 1, 1)
INSERT [dbo].[Citizen] ([idCitizen], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [Age], [idCampus], [idVaccine]) VALUES (3, N'Jose', N'Cano', N'Garcia', N'col. Haciendita, 615', N'9215835317', 31, 5, 2)
INSERT [dbo].[Citizen] ([idCitizen], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [Age], [idCampus], [idVaccine]) VALUES (4, N'Mireya', N'Moztezuma', N'Lopez', N'col. Dimension, 135', N'1672835317', 60, 3, 4)
INSERT [dbo].[Citizen] ([idCitizen], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [Age], [idCampus], [idVaccine]) VALUES (5, N'Maria', N'Montufar', N'Nava', N'col.Villas laurel, 752', N'3272835317', 25, 2, 2)
INSERT [dbo].[Citizen] ([idCitizen], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [Age], [idCampus], [idVaccine]) VALUES (6, N'Roberto', N'Solano', N'Zayas', N'col.San Francisco, 332', N'8351835317', 36, 10, 1)
INSERT [dbo].[Citizen] ([idCitizen], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [Age], [idCampus], [idVaccine]) VALUES (7, N'Julio', N'Malagon', N'Castro', N'col.America, 698', N'5391835317', 21, 9, 4)
INSERT [dbo].[Citizen] ([idCitizen], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [Age], [idCampus], [idVaccine]) VALUES (8, N'Martha', N'Gomez', N'Valdivia', N'col.Lazaro Cardenas,539', N'3391835380', 80, 6, 2)
INSERT [dbo].[Citizen] ([idCitizen], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [Age], [idCampus], [idVaccine]) VALUES (9, N'Martin', N'Garcia', N'Solano', N'col.Chapultepec,864', N'4130835380', 45, 3, 1)
INSERT [dbo].[Citizen] ([idCitizen], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [Age], [idCampus], [idVaccine]) VALUES (10, N'Said', N'Martinez', N'Cazares', N'col.Bugambilias,818', N'8310835352', 22, 1, 3)
INSERT [dbo].[Citizen] ([idCitizen], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [Age], [idCampus], [idVaccine]) VALUES (11, N'Samuel', N'Soriano', N'Tejeda', N'col.Punhuato,962', N'351083531', 56, 4, 4)
INSERT [dbo].[Citizen] ([idCitizen], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [Age], [idCampus], [idVaccine]) VALUES (12, N'Casandra', N'Torivio', N'Salazar', N'col.Noche Buena,1989', N'3971083518', 27, 11, 2)
INSERT [dbo].[Citizen] ([idCitizen], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [Age], [idCampus], [idVaccine]) VALUES (13, N'Carlos', N'Munoz', N'Santorini', N'col.Golondrias,656', N'1371083514', 20, 2, 3)
INSERT [dbo].[Citizen] ([idCitizen], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [Age], [idCampus], [idVaccine]) VALUES (14, N'Maurem', N'Quintanilla', N'Adame', N'col.Venustiano Carranza,243', N'2571083576', 26, 7, 1)
INSERT [dbo].[Citizen] ([idCitizen], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [Age], [idCampus], [idVaccine]) VALUES (15, N'Humberto', N'Garzon', N'Pacheco', N'col.Vicente Guerrero,8246', N'1371083554', 45, 8, 3)
INSERT [dbo].[Citizen] ([idCitizen], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [Age], [idCampus], [idVaccine]) VALUES (16, N'Patricio', N'Gallardo', N'Pastor', N'col.Santo,268', N'7971083585', 50, 2, 2)
INSERT [dbo].[Citizen] ([idCitizen], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [Age], [idCampus], [idVaccine]) VALUES (17, N'Francisco', N'Sosa', N'Carballo', N'col.Sinfonia,6845', N'9241089517', 49, 4, 3)
INSERT [dbo].[Citizen] ([idCitizen], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [Age], [idCampus], [idVaccine]) VALUES (18, N'Jesse Misael', N'Jara', N'Noriega', N'Paseo de las lomas 205', N'6449977411', 11, 10, 5)
SET IDENTITY_INSERT [dbo].[Citizen] OFF
GO
SET IDENTITY_INSERT [dbo].[Citizen report] ON 

INSERT [dbo].[Citizen report] ([idReport], [idCitizen], [idCampus], [idVaccine], [Dose number], [Vaccination date]) VALUES (1, 8, 6, 2, 2, CAST(N'2020-06-15T09:30:00.000' AS DateTime))
INSERT [dbo].[Citizen report] ([idReport], [idCitizen], [idCampus], [idVaccine], [Dose number], [Vaccination date]) VALUES (2, 15, 8, 3, 2, CAST(N'2020-07-26T09:00:00.000' AS DateTime))
INSERT [dbo].[Citizen report] ([idReport], [idCitizen], [idCampus], [idVaccine], [Dose number], [Vaccination date]) VALUES (3, 18, 13, 5, 1, CAST(N'2021-11-05T09:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Citizen report] OFF
GO
SET IDENTITY_INSERT [dbo].[Personnel] ON 

INSERT [dbo].[Personnel] ([idPersonnel], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [idPersonnel key], [idCampus]) VALUES (1, N'Israel', N'Villanueva', N'Cisneros', N'Col. Gladiola, 453,Chilpancingo,Gro.,MX', N'7485645325', 10, 4)
INSERT [dbo].[Personnel] ([idPersonnel], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [idPersonnel key], [idCampus]) VALUES (2, N'Dalila', N'Garcia', N'Duarte', N'Col.Morelos, 846,Colima,MX', N'2719526780', 20, 1)
INSERT [dbo].[Personnel] ([idPersonnel], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [idPersonnel key], [idCampus]) VALUES (3, N'Cristina', N'Mocteuma', N'Villanueva', N'Col.Miguel Hidalgo,65,Tuxtla,Chiapas,MX', N'2719986780', 20, 9)
INSERT [dbo].[Personnel] ([idPersonnel], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [idPersonnel key], [idCampus]) VALUES (4, N'Hector', N'Saavedra', N'Montez', N'Col.Hermengildo,946,Coyoacan,CDMX', N'6419986780', 30, 6)
INSERT [dbo].[Personnel] ([idPersonnel], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [idPersonnel key], [idCampus]) VALUES (5, N'Aracely', N'Sanchez', N'Gutierrez', N'Col.Davalos,461,Zapopan,Guadalajara,Jal.,Mx', N'9751986780', 10, 10)
INSERT [dbo].[Personnel] ([idPersonnel], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [idPersonnel key], [idCampus]) VALUES (6, N'Ariana', N'Lorenzo', N'Sandoval', N'Col.Loma bonita,257,Aguascalientes,Aguas.,Mx', N'9751986780', 30, 2)
INSERT [dbo].[Personnel] ([idPersonnel], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [idPersonnel key], [idCampus]) VALUES (7, N'Luis', N'Ruiz', N'Morales', N'Col. Colon,645,Campeche.,Mx', N'9751986780', 10, 7)
INSERT [dbo].[Personnel] ([idPersonnel], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [idPersonnel key], [idCampus]) VALUES (8, N'Olga', N'Mendez', N'Cotino', N'Col. Amacuzac,Durango,Mx', N'6651986780', 20, 8)
INSERT [dbo].[Personnel] ([idPersonnel], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [idPersonnel key], [idCampus]) VALUES (9, N'Ramon', N'Salgado', N'Mondragon', N'Col. Tres ases,La Paz,Mx', N'1651992780', 30, 10)
INSERT [dbo].[Personnel] ([idPersonnel], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [idPersonnel key], [idCampus]) VALUES (10, N'Matilda', N'Sagredo', N'Galvez', N'Col.Matamoros,Mexicali,Mx', N'9965199278', 10, 3)
INSERT [dbo].[Personnel] ([idPersonnel], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [idPersonnel key], [idCampus]) VALUES (11, N'Pablo', N'Obrador', N'Salinas', N'Col.Tequila,831,Guadalajara,Jal.,Mx', N'9751986780', 20, 10)
INSERT [dbo].[Personnel] ([idPersonnel], [Name], [Maternal surname], [Paternal surname], [Address], [Telephone number], [idPersonnel key], [idCampus]) VALUES (12, N'Pedro', N'Escobar', N'Calderon', N'Col.Tomatal,829,Guadalajara,Jal.,Mx', N'9751986780', 30, 11)
SET IDENTITY_INSERT [dbo].[Personnel] OFF
GO
INSERT [dbo].[Personnel key] ([idPersonnel key], [Name]) VALUES (10, N'Doctor')
INSERT [dbo].[Personnel key] ([idPersonnel key], [Name]) VALUES (20, N'Nurse')
INSERT [dbo].[Personnel key] ([idPersonnel key], [Name]) VALUES (30, N'Administrative')
INSERT [dbo].[Personnel key] ([idPersonnel key], [Name]) VALUES (60, N'test')
GO
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([idState], [Name]) VALUES (1, N'Aguascalientes')
INSERT [dbo].[State] ([idState], [Name]) VALUES (2, N'Baja California')
INSERT [dbo].[State] ([idState], [Name]) VALUES (3, N'Baja California Sur')
INSERT [dbo].[State] ([idState], [Name]) VALUES (4, N'Campeche')
INSERT [dbo].[State] ([idState], [Name]) VALUES (5, N'Coahuila')
INSERT [dbo].[State] ([idState], [Name]) VALUES (6, N'Colima')
INSERT [dbo].[State] ([idState], [Name]) VALUES (7, N'Chiapas')
INSERT [dbo].[State] ([idState], [Name]) VALUES (8, N'Chihuahua')
INSERT [dbo].[State] ([idState], [Name]) VALUES (9, N'Durango')
INSERT [dbo].[State] ([idState], [Name]) VALUES (10, N'Ciudad de México')
INSERT [dbo].[State] ([idState], [Name]) VALUES (11, N'Guanajuato')
INSERT [dbo].[State] ([idState], [Name]) VALUES (12, N'Guerrero')
INSERT [dbo].[State] ([idState], [Name]) VALUES (13, N'Hidalgo')
INSERT [dbo].[State] ([idState], [Name]) VALUES (14, N'Jalisco')
INSERT [dbo].[State] ([idState], [Name]) VALUES (15, N'México')
SET IDENTITY_INSERT [dbo].[State] OFF
GO
SET IDENTITY_INSERT [dbo].[Vaccine] ON 

INSERT [dbo].[Vaccine] ([idVaccine], [Name], [Dose]) VALUES (1, N'CanSino', N'1')
INSERT [dbo].[Vaccine] ([idVaccine], [Name], [Dose]) VALUES (2, N'BioNTech', N'1')
INSERT [dbo].[Vaccine] ([idVaccine], [Name], [Dose]) VALUES (3, N'Pfizer', N'1')
INSERT [dbo].[Vaccine] ([idVaccine], [Name], [Dose]) VALUES (4, N'AstraZeneca ', N'1')
INSERT [dbo].[Vaccine] ([idVaccine], [Name], [Dose]) VALUES (5, N'Sputnik22Test', N'3')
INSERT [dbo].[Vaccine] ([idVaccine], [Name], [Dose]) VALUES (38, N'Sputnik22Test', N'3')
INSERT [dbo].[Vaccine] ([idVaccine], [Name], [Dose]) VALUES (39, N'CoronaVac', N'1')
SET IDENTITY_INSERT [dbo].[Vaccine] OFF
GO
ALTER TABLE [dbo].[Campus]  WITH CHECK ADD FOREIGN KEY([idState])
REFERENCES [dbo].[State] ([idState])
GO
ALTER TABLE [dbo].[Citizen]  WITH CHECK ADD FOREIGN KEY([idCampus])
REFERENCES [dbo].[Campus] ([idCampus])
GO
ALTER TABLE [dbo].[Citizen]  WITH CHECK ADD FOREIGN KEY([idVaccine])
REFERENCES [dbo].[Vaccine] ([idVaccine])
GO
ALTER TABLE [dbo].[Citizen report]  WITH CHECK ADD FOREIGN KEY([idCampus])
REFERENCES [dbo].[Campus] ([idCampus])
GO
ALTER TABLE [dbo].[Citizen report]  WITH CHECK ADD FOREIGN KEY([idCitizen])
REFERENCES [dbo].[Citizen] ([idCitizen])
GO
ALTER TABLE [dbo].[Citizen report]  WITH CHECK ADD FOREIGN KEY([idVaccine])
REFERENCES [dbo].[Vaccine] ([idVaccine])
GO
ALTER TABLE [dbo].[Personnel]  WITH CHECK ADD FOREIGN KEY([idCampus])
REFERENCES [dbo].[Campus] ([idCampus])
GO
ALTER TABLE [dbo].[Personnel]  WITH CHECK ADD FOREIGN KEY([idPersonnel key])
REFERENCES [dbo].[Personnel key] ([idPersonnel key])
GO
/****** Object:  StoredProcedure [dbo].[CountDangerousPopulation]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*store procedure para obtener la cantidad de vacunados con edad de riesgo*/

CREATE PROCEDURE [dbo].[CountDangerousPopulation]
AS
select COUNT(*) from dbo.Citizen where dbo.Citizen.Age >= 60;
GO
/****** Object:  StoredProcedure [dbo].[CountTypeVaccine]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountTypeVaccine]
@IdVaccine int
AS
select dbo.Citizen.idVaccine,dbo.Citizen.Name, dbo.Citizen.[Paternal surname]  from dbo.Citizen where dbo.Citizen.idVaccine = @IdVaccine ;
GO
/****** Object:  StoredProcedure [dbo].[getReportsBetweenDates]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getReportsBetweenDates]
@Date1 nvarchar(80),
@Date2 nvarchar(80)
AS
Begin
select * from [Citizen report] where [Citizen report].[Vaccination date] between @Date1 and @Date2;
End
GO
/****** Object:  StoredProcedure [dbo].[spAddCampus]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spAddCampus]
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
GO
/****** Object:  StoredProcedure [dbo].[spAddCitizen]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spAddCitizen]
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
GO
/****** Object:  StoredProcedure [dbo].[spAddCitizenReport]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spAddCitizenReport]
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
GO
/****** Object:  StoredProcedure [dbo].[spAddPersonnel]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spAddPersonnel]
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
GO
/****** Object:  StoredProcedure [dbo].[spAddPersonnelKey]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Store Procedure CRUD OPERATIONS State*/
Create PROCEDURE [dbo].[spAddPersonnelKey]
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
GO
/****** Object:  StoredProcedure [dbo].[spAddState]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spAddState]
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
	print 'Dont Exist .. create vaccine'
	INSERT INTO dbo.State (Name)
	Values (@Name)
END
END
GO
/****** Object:  StoredProcedure [dbo].[spAddVacine]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Store Procedure CRUD OPERATIONS*/

CREATE PROCEDURE [dbo].[spAddVacine]
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

EXEC spAddVacine 'Sputnik',2

GO
/****** Object:  StoredProcedure [dbo].[spAlterCampusIfExist]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spAlterCampusIfExist]
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
GO
/****** Object:  StoredProcedure [dbo].[spAlterCitizen]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[spAlterCitizen]
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
GO
/****** Object:  StoredProcedure [dbo].[spAlterCitizenReport]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spAlterCitizenReport]
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
GO
/****** Object:  StoredProcedure [dbo].[spAlterPersonnel]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[spAlterPersonnel]
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
	
GO
/****** Object:  StoredProcedure [dbo].[spAlterPersonnelKeyIfExist]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spAlterPersonnelKeyIfExist]
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
GO
/****** Object:  StoredProcedure [dbo].[spAlterStateIfExist]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spAlterStateIfExist]
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
GO
/****** Object:  StoredProcedure [dbo].[spAlterVacineByName]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create PROCEDURE [dbo].[spAlterVacineByName]
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
GO
/****** Object:  StoredProcedure [dbo].[spAlterVacineIfExist]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spAlterVacineIfExist]
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
GO
/****** Object:  StoredProcedure [dbo].[spDeleteCampusIfExist]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spDeleteCampusIfExist]
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
GO
/****** Object:  StoredProcedure [dbo].[spDeleteCitizenIfExist]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spDeleteCitizenIfExist]
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
GO
/****** Object:  StoredProcedure [dbo].[spDeleteCitizenReportIfExist]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spDeleteCitizenReportIfExist]
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
GO
/****** Object:  StoredProcedure [dbo].[spDeletePersonnelfExist]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spDeletePersonnelfExist]
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
GO
/****** Object:  StoredProcedure [dbo].[spDeletePersonnelKeyIfExist]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spDeletePersonnelKeyIfExist]
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
GO
/****** Object:  StoredProcedure [dbo].[spDeleteStateIfExist]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Delete Vaccine*/
Create PROCEDURE [dbo].[spDeleteStateIfExist]
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
GO
/****** Object:  StoredProcedure [dbo].[spDeleteVacineIfExist]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spDeleteVacineIfExist]
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
GO
/****** Object:  StoredProcedure [dbo].[spShowCampusIfExist]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Show  Campus*/
Create PROCEDURE [dbo].[spShowCampusIfExist]
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
GO
/****** Object:  StoredProcedure [dbo].[spShowCitizenIfExist]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spShowCitizenIfExist]
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
GO
/****** Object:  StoredProcedure [dbo].[spShowCitizenReportIfExist]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spShowCitizenReportIfExist]
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
GO
/****** Object:  StoredProcedure [dbo].[spShowPersonnelIfExist]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spShowPersonnelIfExist]
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
GO
/****** Object:  StoredProcedure [dbo].[spShowPersonnelKeyIfExist]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spShowPersonnelKeyIfExist]
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
	
GO
/****** Object:  StoredProcedure [dbo].[spShowStateIfExist]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spShowStateIfExist]
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
GO
/****** Object:  StoredProcedure [dbo].[spShowVaccineIfExist]    Script Date: 12/10/2021 01:56:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spShowVaccineIfExist]
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
GO
