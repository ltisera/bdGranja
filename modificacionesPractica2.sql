DELIMITER $$
create procedure modificarCabania(_cuil int, _razonSocial varchar(45), domicilio int)
	begin
		update practica2.cabania as c set c.razonSocial = _razonSocial, c.domicilio = _domicilio where c.cuil = _cuil;
	end$$
    
DELIMITER $$
create procedure modificarCliente(_cuit int, _nombre varchar(45), _domicilio int)
	begin
		update practica2.cliente as c set c.nombre = _nombre, c.domicilio = _domicilio where c.cuit = _cuit;
	end$$
    
DELIMITER $$
create procedure modificarDomicilio(_idDomicilio int, _calle varchar(45), _numero varchar(45), _localidad varchar(45), _provincia varchar(45))
	begin
		update practica2.domicilio as d set d.calle = _calle, d.numero = _numero, d.localidad = _localidad, d.provincia = _provincia where d.idDomicilio = _idDomicilio;
	end$$
    
DELIMITER $$
create procedure modificarFactura(_idFactura int, _fecha date, _cliente int)
	begin
		update practica2.factura as f set f.fecha = _fecha, f.cliente = _cliente where f.idFactura = _idFactura;
	end$$
    
DELIMITER $$
create procedure modificarFacturaProducto(_factura int, _producto int)
	begin
		update practica2.factura_has_producto as fp set fp.producto = _producto where fp.factura = _factura;
	end$$
    
DELIMITER $$
create procedure modificarGalpon(_numero int, cantidadGallinas int, plantel  int)
	begin
		update practica2.galpon as g set g.camtidadGallinas = _cantidadGallinas, g.plantel = _plantel where g.numero = _numero;
	end
    
DELIMITER $$
create procedure modificarGenetica(_codigo int, _nombre varchar(45), _cabania int)
	begin
		update practica2.genetica as g set g.nombre = _nombre, g.cabania = _cabania where g.codigo = _codigo;
	end$$
    
DELIMITER $$
create procedure modificarPlanilla(_idPlanilla int, _fecha date, _cantGallinasMuertas int, _cantidadAlimento int, _tipoAlimento varchar(45), _novedades varchar(45), _galpon int)
	begin
		update practica2.planilla as p set p.fecha = _fecha, p.cantGallinasMuertas = _cantGallinasMuertas, p.cantidadAlimento = _cantidadAlimento, p.tipoAlimento = _tipoAlimento, p.novedades = _novedades, p.galpon = _galpon where p.idPlanilla = _idPlanilla;
	end$$
    
DELIMITER $$
create procedure modificarPlantel(_codigo int, _nombre varchar(45), _edad varchar(45), _precioCompra varchar(45), _fechaEntrada date, _genetica int)
	begin
		update practica2.plantel as p set p.nombre = _nombre, p.edad = _edad, p.precioCompra = _precioCompra, p.fechaEntrada = _fechaEntrada, p.genetica = _genetica where p.codigo = _codigo;
	end$$

DELIMITER $$
create procedure modificarProducto (_codigo int, _nombre varchar(45), _precio float, _cantHuevos int)
	begin 
		update practica2.producto as p set p.nombre = _nombre, p.precio =_precio, p.cantHuevos = _cantHuevos where p.codigo = _codigo;
	end$$