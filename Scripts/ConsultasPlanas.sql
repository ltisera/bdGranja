/*1. Cantidad de gallinas muertas, por plantel y galpón entre fechas*/
DROP PROCEDURE IF EXISTS consultaGallinasMuertas;

delimiter $$
create procedure consultaGallinasMuertas(in fechaA date, in fechaB date)
begin

	explain select plantel.idPlantel,galpon.idGalpon, sum(cantidadGallinasMuertas) as porPlantel from planilla 
    inner join galpon on planilla.galpon = galpon.idGalpon 
    inner join plantel on galpon.plantel = plantel.idPlantel
    where planilla.fecha between fechaA and fechaB
    group by galpon.idGalpon ;
end$$
delimiter ;


call consultaGallinasMuertas("2017-12-31", "2018-12-1");

/**Listado de productos vendidos a clientes, filtrado por cliente y producto**/


select cliente.cuit , producto.idProducto from producto 
inner join factura_has_producto on producto.idProducto = factura_has_producto.producto 
inner join  factura on factura.idFactura = factura_has_producto.factura
inner join cliente on factura.cliente = cliente.cuit
group by cliente.cuit, producto.idProducto;

/*Listado de productos vendidos a clientes, filtrado por cliente y tipo de empaque.
Empaque = producto.cantidad (la cantidad de huevos por empaque)*/

select cliente.cuit , producto.cantidad from producto 
inner join factura_has_producto on producto.idProducto = factura_has_producto.producto 
inner join  factura on factura.idFactura = factura_has_producto.factura
inner join cliente on factura.cliente = cliente.cuit
group by cliente.cuit, producto.cantidad;


/*Listado de ventas filtrado por localidad.*/

select factura.idFactura, cliente.cuit, domicilio.localidad from factura
inner join cliente on factura.cliente = cliente.cuit
inner join domicilio on cliente.domicilio = domicilio.idDomicilio
group by domicilio.localidad;


/*Listado de entregas de alimento entre fechas, filtrado por galpón*/


DROP PROCEDURE IF EXISTS consultaAlimentoFiltradoPorGalpon;

delimiter $$
create procedure consultaAlimentoFiltradoPorGalpon(in fechaA date, in fechaB date)
begin
	select galpon.idGalpon, sum(planilla.cantidadAlimento) as CantidadAlimentoConsumido from planilla
    inner join galpon on planilla.galpon = galpon.idGalpon
    where planilla.fecha between fechaA and fechaB
    group by planilla.galpon;
end$$
delimiter ;

call consultaAlimentoFiltradoPorGalpon("2016-12-31", "2018-1-1");


/*Listado de entregas de alimento entre fechas, filtrado por plantel*/

DROP PROCEDURE IF EXISTS consultaAlimentoFiltradoPorPlantel;

delimiter $$
create procedure consultaAlimentoFiltradoPorPlantel(in fechaA date, in fechaB date)
begin
	select plantel.idPlantel, sum(planilla.cantidadAlimento) as CantidadAlimentoConsumido from planilla
    inner join galpon on planilla.galpon = galpon.idGalpon
    inner join plantel on galpon.plantel = plantel.idPlantel
    where planilla.fecha between fechaA and fechaB
    group by plantel.idPlantel;
end$$
delimiter ;

call consultaAlimentoFiltradoPorPlantel("2016-12-31", "2018-1-1");


/*Listado de planteles que alguna vez se hayan alojado en la granja, filtrado por
cabaña y genética*/

select plantel.idPlantel, plantel.nombre, plantel.genetica, genetica.cabaña from plantel
inner join genetica on plantel.genetica = genetica.idGenetica
inner join cabaña on genetica.cabaña = cabaña.cuit;
/*group by plantel.genetica, genetica.cabaña;
*/



select plantel.idPlantel, plantel.nombre, plantel.fechaEntrada, genetica.idGenetica, cabaña.cuit from plantel
inner join genetica on plantel.genetica = genetica.idGenetica
inner join cabaña on genetica.cabaña = cabaña.cuit
where plantel.genetica = 1 and genetica.cabaña = 1;