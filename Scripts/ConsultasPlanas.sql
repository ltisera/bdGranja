DROP PROCEDURE IF EXISTS consultaGallinasMuertas;

delimiter $$
create procedure consultaGallinasMuertas(in fechaA date, in fechaB date)
begin

	select plantel.idPlantel,galpon.idGalpon, sum(cantidadGallinasMuertas) as porPlantel from planilla 
    inner join galpon on planilla.galpon = galpon.idGalpon 
    inner join plantel on galpon.plantel = plantel.idPlantel
    where planilla.fecha between fechaA and fechaB
    group by galpon.idGalpon ;
end$$
delimiter ;


call consultaGallinasMuertas("2017-1-1", "2018-1-1");

/**Listado de productos vendidos a clientes, filtrado por cliente y producto**/

select * from producto p 
inner join producto_has_factura pf on p.idProducto = pf.producto 
inner join  factura f on f.idFactura = pf.factura
inner join cliente c on f.cliente = c.cuit

