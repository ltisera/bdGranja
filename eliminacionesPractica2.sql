DELIMITER $$
	create procedure eliminarCabania (_cuil int)
		begin
			delete from cabania where cuil=_cuil;
		end$$
        
DELIMITER $$
	create procedure eliminarCliente (_cuit int)
		begin
			delete from cliente where cuit=_cuit;
		end$$

DELIMITER $$
	create procedure eliminarDomicilio (_idDomicilio int)
		begin
			delete from domicilio where idDomicilio=_idDomicilio;
		end$$
        
DELIMITER $$
	create procedure eliminarFactura (_idFactura int)
		begin
			delete from factura where idFactura=_idFactura;
		end$$
        
DELIMITER $$
	create procedure eliminarFacturaProducto (_factura int, _producto int)
		begin
			delete from factura_has_producto where factura=_factura and producto=_producto;
		end$$
        
DELIMITER $$
	create procedure eliminarGalpon (_numero int)
		begin
			delete from galpon where numero=_numero;
		end$$
        
DELIMITER $$
	create procedure eliminarGenetica (_codigo int)
		begin
			delete from genetica where codigo=_codigo;
		end$$
        
DELIMITER $$
	create procedure eliminarPlanilla (_idPlanilla int)
		begin
			delete from planilla where idPlanilla=_idPlanilla;
		end$$
        
DELIMITER $$
	create procedure eliminarPlantel (_codigo int)
		begin
			delete from plantel where codigo=_codigo;
		end$$
        
DELIMITER $$
	create procedure eliminarProducto (_codigo int)
		begin
			delete from producto where codigo=_codigo;
		end$$