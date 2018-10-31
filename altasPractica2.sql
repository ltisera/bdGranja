DELIMITER $$
create procedure altaCabania(_cuil int, _razonSocial varchar(45), _domicilio int)
	begin
		insert into cabania (cuil, razonSocial, domicilio)
			values(_cuil, _razonSocial, _provincia);
	end $$
    
DELIMITER $$
create procedure altaCliente(_cuil int, _nombre varchar(45), _domicilio int)
	begin
		insert into cliente(cuil, nombre, domicilio)
			values (_cuil, _nombre, _domicilio);
	end$$
  
DELIMITER $$
create procedure altaDomicilio(_calle varchar(45), _numero varchar(45), _localidad varchar(45), _provincia varchar(45))
	begin
		insert into domicilio (calle, numero, localidad, provincia)
			values(_calle, _numero, _localidad, _provincia);
	end $$

DELIMITER $$
create procedure altaFactura(_fecha date, _cliente int)
	begin 
		insert into factura (fecha, cliente)
			values (_fecha, _cliente);
	end$$
    
DELIMITER $$
create procedure altaFacturaProducto(_factura int, _producto int)
	begin
		insert into factura_has_producto (factura, producto)
			values (_factura, _producto);
	end$$
    
DELIMITER $$
create procedure altaGalpon(_numero int, _cantidadGallinas int, _plantel int)
	begin
		insert into galpon (numero, cantidadGallinas, plantel)
			values (_numero, _cantidadGallinas, _plantel);
	end$$
    
DELIMITER $$
create procedure altaGenetica (_codigo int, _nombre varchar(45), _cabania int)
	begin
		insert into genetica (codigo, nombre, cabania)
			values(_codigo, _nombre, _cabania);
	end$$
    
DELIMITER $$
create procedure altaPlanilla(_fecha date, _cantGallinasMuertas int, _cantidadAlimento int, _tipoAlimento varchar(45), _novedades varchar(45), _galpon int)
	begin
		insert into planilla (fecha, cantGallinasMuertas, cantidadAlimento, tipoAlimento, novedades, galpon)
			values (_fecha, _cantGallinasMuertas, _cantidadAlimento, _tipoAlimento, _novedades, _galpon);
	end$$
    
DELIMITER $$
create procedure altaPlantel (_codigo int, _nombre varchar(45), _edad varchar(45), _precioCompra varchar(45), _fechaEntrada date, _genetica int)
	begin
		insert into plantel (codigo, nombre, edad, precioCompra, fechaEntrada, genetica)
			values (_codigo, _nombre, _edad, _precioCompra, _fechaEntrada, _genetica);
	end$$
    
DELIMITER $$
create procedure altaProducto (_codigo int, _nombre varchar(45), _precio float, _cantHuevos int)
	begin
		insert into producto (codigo, nombre, precio, cantHuevos)
			values(_codigo, _nombre, _precio, _cantHuevos);
	end$$