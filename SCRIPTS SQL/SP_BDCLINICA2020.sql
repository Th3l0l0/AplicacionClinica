use BDCLINICA2020
go

create procedure InsertarPaciente
@codpac char(6),@nompac varchar(50),
@dnipac char(8),@tel_cel varchar(10),
@dirpac varchar(50),@coddis char(3)
as
    insert into Pacientes
	   values(@codpac,@nompac,@dnipac,@tel_cel,
              @dirpac,@coddis)
go

create procedure ActualizarPaciente
@codpac char(6),@nompac varchar(50),
@dnipac char(8),@tel_cel varchar(10),
@dirpac varchar(50),@coddis char(3)
as
    update Pacientes
	   set nompac=@nompac,
	       dnipac=@dnipac,
	       tel_cel=@tel_cel,
		   dirpac=@dirpac,
		   coddis=@coddis
    where codpac=@codpac
go

create procedure EliminarPaciente
@codpac char(6)
as
	delete from Pacientes
		where codpac=@codpac
go

create procedure ListarPacientes
as
	select p.codpac, p.nompac, p.dnipac, p.tel_cel, p.dirpac, d.nomdis as distrito, d.coddis
	from Pacientes p inner join Distrito d 
	on p.coddis = d.coddis
go


create procedure ListarDistritos
as
	select * from Distrito
go

/*PARA COMPROBAR LOS REGISTROS*/
select * from Pacientes
go
