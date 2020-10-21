USE master
go

SET NOCOUNT ON
GO
SET LANGUAGE SPANISH
GO
SET  DATEFORMAT DMY
GO

IF EXISTS(SELECT * FROM sys.sysdatabases 
           WHERE name='BDCLINICA2020')
Begin
	Alter Database BDCLINICA2020
	SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	
	DROP DATABASE BDCLINICA2020
End
go

CREATE DATABASE BDCLINICA2020
COLLATE MODERN_SPANISH_CI_AI
go

USE BDCLINICA2020
GO

CREATE TABLE Distrito
(
	coddis	char(3)	not null constraint pk_coddis primary key,
	nomdis	varchar(35)
)
go

INSERT INTO Distrito values('D01','Lima-Cercado') 
INSERT INTO Distrito values('D02','Jesus Maria') 
INSERT INTO Distrito values('D03','Rimac') 
INSERT INTO Distrito values('D04','Magdalena') 
INSERT INTO Distrito values('D05','Pueblo Libre') 
INSERT INTO Distrito values('D06','Miraflores') 
INSERT INTO Distrito values('D07','San Isidro') 
INSERT INTO Distrito values('D08','Surquillo') 
INSERT INTO Distrito values('D09','San Martin de Porres') 
INSERT INTO Distrito values('D10','San Juan de Miraflores') 
INSERT INTO Distrito values('D11','Lince') 
INSERT INTO Distrito values('D12','La Victoria') 
INSERT INTO Distrito values('D13','La Molina') 
INSERT INTO Distrito values('D14','San Luis') 
INSERT INTO Distrito values('D15','San Borja') 
INSERT INTO Distrito values('D16','Los Olivos') 
INSERT INTO Distrito values('D17','San Juan de Lurigancho') 
INSERT INTO Distrito values('D18','Villa El Salvador') 
INSERT INTO Distrito values('D19','Villa Maria del Triunfo') 
INSERT INTO Distrito values('D20','Chorrillos') 
GO
INSERT INTO Distrito values('D21','Ate') 
INSERT INTO Distrito values('D22','San Miguel') 
INSERT INTO Distrito values('D23','Surco') 
INSERT INTO Distrito values('D24','Lince') 
INSERT INTO Distrito values('D25','Ancon') 
INSERT INTO Distrito values('D26','Barranco') 
INSERT INTO Distrito values('D27','Carabayllo') 
INSERT INTO Distrito values('D28','Breña') 
INSERT INTO Distrito values('D29','Chorrillos') 
INSERT INTO Distrito values('D30','Santa Anita') 
INSERT INTO Distrito values('D31','Chaclacayo') 
INSERT INTO Distrito values('D32','Lurin') 
GO

-------------------------------------------------------------------------

create table Pacientes
(
	codpac	char(6)	not null constraint pk_codpac primary key,
	nompac	varchar(50) not null,
	dnipac	char(8)	,
	tel_cel	varchar(10),
	dirpac	varchar(50),
	coddis	char(3),
		constraint fk_pacientes_coddis 
			  foreign key(coddis) 
			  references Distrito(coddis)
)
go

insert into Pacientes values('P00001','SEDANO MANTILLA, RANDY DANILO','10233234','985745280','Jr. Trujillo 290', 'D03')
insert into Pacientes values('P00002','SILVERA SIANCAS, ISAAC','45203678','998530045','Jr. Lopez Pasos 852', 'D01')
insert into Pacientes values('P00003','VASQUEZ FERRE, FRANK JUNIOR','41526389','987421895','Av. Uruguay 587', 'D01')
insert into Pacientes values('P00004','VEGA FLORES, MARIA LUISA','40477308','896526344','Av. Las Manzanas 333', 'D05')
insert into Pacientes values('P00005','VENTURA PEREZ, JOSE ANTONIO','45698712','998563241','Av. Las Piñas 545', 'D15')
insert into Pacientes values('P00006','ROJAS MENDOZA RUTH','25634198','951263741','Av. Los naranjos 333', 'D18')
insert into Pacientes values('P00007','CAMPOS BALLESTEROS MARITZA','25456389','988526304','Av. Los duraznos 777', 'D10')
insert into Pacientes values('P00008','VERA CHIHUAN, CARLOS ALBERTO','21369874','898552417','Av. Cto rey 123', 'D02')
insert into Pacientes values('P00009','ALMONTE RIVERA, DENNIS OBED','20356380','981063857','Av. Rio santa fe 321', 'D01')
insert into Pacientes values('P00010','BRICEÑO PORTILLA, WALTER ALFONSO','41526302','984123505','Av. Tupac Amaru 444', 'D03')
insert into Pacientes values('P00011','CARDENAS ZEGARRA, EMILIO YANG','48752360','997500246','Av. Las Flores 987', 'D03')
insert into Pacientes values('P00012','VIDAL ORBEGOZO, JESUS JOEL','40525063','975863408','Av. Los Ciruelos 741', 'D02')
insert into Pacientes values('P00013','CAMPOS CASTILLO, CARLA HELIN','28967314','977741288','Av. Los Parlantes 963', 'D09')
insert into Pacientes values('P00014','VILCHEZ GALAN, PEDRO CARLOS','23410808','999526441','Av. Salaverry 444', 'D08')
insert into Pacientes values('P00015','ANDRADE ZUASNABAR, DANIELA','40015285','980042347','Av. Del Ejercito 753', 'D12')
insert into Pacientes values('P00016','CHUCHON VASQUEZ, JOHEL','40500873','884150047','Av. Alejandro Tirado 564', 'D15')
insert into Pacientes values('P00017','HUARANCCA TAIPE, CINTHYA MILAGROS','42332565','895423706','Av. Alfonso Ugarte 963', 'D11')
insert into Pacientes values('P00018','FLORES VILLAR, MERY YAKELY','44142096','986742310','Av. La molina 951', 'D12')
insert into Pacientes values('P00019','OSORIO MALDONADO, DANIELA LUZ','43625241','984705349','Av. Alfredo Benavides 321', 'D14')
insert into Pacientes values('P00020','GUITTON ARTEAGA, CHARLY ELADIO','27282923','985736510','Av. Alipio Ponce 741', 'D07')
insert into Pacientes values('P00021','LIZARBE GUEVARA, VICTOR RICARDO FRANCO','20246370','989486283','Av. Andrés Aramburú 555', 'D06')
insert into Pacientes values('P00022','HEREDIA HINOSTROZA, JUAN CARLOS','25630121','989486285','Av. Alfonso Ugarte 963', 'D02')
insert into Pacientes values('P00023','TORRES VARA, ANA SOFIA, JUAN CARLOS','23218604','980042347','Av. Del Ejercito 753', 'D05')
insert into Pacientes values('P00024','ROJAS SALDAÑA, ROCIO','45862079','980042347','Av. La molina 951', 'D01')
insert into Pacientes values('P00025','MEDINA JUAREZ, PEDRO','32156498','932654987','Av. La molina 951', 'D07')
insert into Pacientes values('P00026','PEREZ VENTURA, KARINA','78945612','945612378','Av. Alfonso Ugarte 963', 'D09')
insert into Pacientes values('P00027','SAAVEDRA POVES, PAOLA','96385221','951423852','Av. Del Ejercito 753', 'D12')
insert into Pacientes values('P00028','ALVAREZ CASTAÑEDA, FIDEL','40365018','987741258','Av. Salaverry 444', 'D12')
insert into Pacientes values('P00029','NAKAYAMA OSHIRO, KAORI','48279147','951753268','Av. Los Parlantes 963', 'D14')
insert into Pacientes values('P00030','FLORES TORRES, DIEGO','46779173','912374132','Av. Uruguay 587', 'D16')

SET LANGUAGE SPANISH
GO

PRINT 'BASE DE DATOS: CLINICA_2020_OK, CREADA CORRECTAMENTE'
PRINT 'FECHA:'+CONVERT(VARCHAR(20),GETDATE())
GO
SELECT MENSAJE='BASE DE DATOS: CLINICA_2020_OK, CREADA CORRECTAMENTE '
UNION ALL
SELECT 'FECHA:'+CONVERT(VARCHAR(20),GETDATE())
GO
