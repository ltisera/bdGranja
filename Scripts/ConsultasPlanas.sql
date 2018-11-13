delimiter $$
create procedure consultaGallinasMuertas(in fechaA date, in fechaB date)
begin

	select plantel.idPlantel,galpon.idGalpon, sum(cantidadGallinasMuertas) as porPlantel from planilla inner join galpon on planilla.galpon = galpon.idGalpon inner join plantel on galpon.plantel = plantel.idPlantel group by galpon.idGalpon where planilla.fecha >= fechaA and planilla.fecha <= fechaB;

end$$
delimiter;