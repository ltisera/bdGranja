-- -----------------------------------------------------
-- procedure agregarCabaña
-- -----------------------------------------------------

DELIMITER $$
USE `bdGranja`$$
CREATE PROCEDURE `agregarCabaña`(cuit varchar(45), razonSocial varchar(45), calle varchar(45), numero int(11), localidad varchar(45), provincia varchar(45))
BEGIN
declare domicilio int;
if exists(select idDomicilio from domicilio d where d.calle = calle and d.numero = numero and d.localidad = localidad and d.provincia = provincia) then
	set domicilio  = (select idDomicilio from domicilio d where d.calle = calle and d.numero = numero and d.localidad = localidad and d.provincia = provincia);
else
	call agregarDomicilio(calle, numero, localidad, provincia);
	set domicilio = (select max(idDomicilio) from domicilio);
end if;
INSERT INTO `bdGranja`.`cabaña` (`cuit`, `razonSocial`, `domicilio`) 
VALUES ( cuit, razonSocial, domicilio);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure agregarCliente
-- -----------------------------------------------------

DELIMITER $$
USE `bdGranja`$$
CREATE PROCEDURE `agregarCliente`(cuit varchar(45), nombre varchar(60), calle varchar(45), numero int(11), localidad varchar(45), provincia varchar(45))
BEGIN
declare domicilio int;
if exists(select idDomicilio from domicilio d where d.calle = calle and d.numero = numero and d.localidad = localidad and d.provincia = provincia) then
	set domicilio  = (select idDomicilio from domicilio d where d.calle = calle and d.numero = numero and d.localidad = localidad and d.provincia = provincia);
else
	call agregarDomicilio(calle, numero, localidad, provincia);
	set domicilio = (select max(idDomicilio) from domicilio);
end if;
INSERT INTO `bdGranja`.`cliente` (`cuit`, `nombre`, `domicilio`) 
VALUES ( cuit, nombre, domicilio);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure agregarFactura
-- -----------------------------------------------------

DELIMITER $$
USE `bdGranja`$$
CREATE PROCEDURE `agregarFactura`(fecha date, cliente varchar(45))
BEGIN
insert into `bdGranja`.factura(`fecha`, `cliente`)
values (fecha, cliente);
END$$

DELIMITER ;
-- -----------------------------------------------------
-- procedure agregarProductoAFactura
-- -----------------------------------------------------

DELIMITER $$
USE `bdGranja`$$
CREATE PROCEDURE `agregarProductoAFactura`(factura int(11),producto int (11), cantidad int(11))
BEGIN
insert into `bdGranja`.factura_has_producto(`factura`, `producto`, `cantidad`)
values (factura, producto, cantidad);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure agregarGalpon
-- -----------------------------------------------------

DELIMITER $$
USE `bdGranja`$$
CREATE PROCEDURE `agregarGalpon`(num int, cantGallinas int, codPlantel int)
BEGIN
INSERT INTO `bdGranja`.galpon (`idGalpon`, `cantidadDeGallinas`, `plantel`) VALUES (num, cantGallinas, codPlantel);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure agregarGenetica
-- -----------------------------------------------------

DELIMITER $$
USE `bdGranja`$$
CREATE PROCEDURE `agregarGenetica`(codigo int(11), nombre varchar(45), cuitCabaña varchar(45))
BEGIN
INSERT INTO `bdGranja`.`genetica`(`idGenetica`, `nombre`, `cabaña`)
VALUES (codigo, nombre, cuitCabaña);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure agregarPlanilla
-- -----------------------------------------------------

DELIMITER $$
USE `bdGranja`$$
CREATE PROCEDURE `agregarPlanilla`(fecha date, cantHuevos int, cantMuertas int, cantAlimento float, tipoAlimento varchar(45), numGalpon int, novedades mediumtext)
BEGIN
insert into `bdGranja`.planilla(`fecha`, `cantidadHuevosObtenidos`, `cantidadGallinasMuertas`, `cantidadAlimento`, `tipoAlimento`, `galpon`, `novedades`)
values (fecha, cantHuevos, cantMuertas, cantAlimento, tipoAlimento, numGalpon, novedades);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure agregarPlantel
-- -----------------------------------------------------

DELIMITER $$
USE `bdGranja`$$
CREATE PROCEDURE `agregarPlantel`(codigo int(11), nombre varchar(45), edadEntrada int(11), genetica int(11), fechaEntrada date, precio float)
BEGIN
INSERT INTO `bdGranja`.`plantel`(`idPlantel`, `nombre`, `edadEntrada`, `genetica`, `fechaEntrada`, `precio`)
VALUES (codigo, nombre, edadEntrada, genetica, fechaEntrada, precio);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure agregarProducto
-- -----------------------------------------------------

DELIMITER $$
USE `bdGranja`$$
CREATE PROCEDURE `agregarProducto`(codigo int, precio float, cantidad int)
BEGIN
insert into `bdGranja`.producto(`idProducto`, `precio`, `cantidad`)
values(codigo, precio, cantidad);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure agregarDomicilio
-- -----------------------------------------------------

DELIMITER $$
USE `bdGranja`$$
CREATE PROCEDURE `agregarDomicilio`(calle varchar(45), numero int(11), localidad varchar(45), provincia varchar(45))
BEGIN
insert into `bdGranja`.domicilio(`calle`, `numero`, `localidad`, `provincia`)
values(calle, numero, localidad, provincia);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure agregarLog
-- -----------------------------------------------------

DELIMITER $$
USE `bdGranja`$$
CREATE PROCEDURE `agregarLog`(fecha date, cantHuevos int, cantMuertas int, cantAlimento float, tipoAlimento varchar(45), numGalpon int, novedades mediumtext, planilla int(11), fechaModificado date, usuario int(11))
BEGIN
insert into `bdGranja`.`log`(`fecha`, `cantidadHuevosObtenidos`, `cantidadGallinasMuertas`, `cantidadAlimento`, `tipoAlimento`, `galpon`, `novedades`, `planilla`, `fechaModificado`, `usuario`)
values (fecha, cantHuevos, cantMuertas, cantAlimento, tipoAlimento, numGalpon, novedades, planilla, fechaModificado, usuario);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure agregarUsuario
-- -----------------------------------------------------

DELIMITER $$
USE `bdGranja`$$
CREATE PROCEDURE `agregarUsuario`(cuil int(11), nombre varchar(45), apellido varchar(45), legajoInterno int(11), usuario varchar(45), pass varchar(45))
BEGIN
insert into `bdGranja`.usuario(`cuil`, `nombre`, `apellido`, `legajoInterno`, `usuario`, `password`)
values (cuil, nombre, apellido, legajoInterno, usuario, pass);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure modificarCabaña
-- -----------------------------------------------------
DELIMITER ;;
CREATE PROCEDURE `modificarCabaña`(cuit varchar(45), razonSocial varchar(45), calle varchar(45), numero int(11), localidad varchar(45), provincia varchar(45))
BEGIN
declare domicilio int;
if exists(select idDomicilio from domicilio d where d.calle = calle and d.numero = numero and d.localidad = localidad and d.provincia = provincia) then
	set domicilio  = (select idDomicilio from domicilio d where d.calle = calle and d.numero = numero and d.localidad = localidad and d.provincia = provincia);
else
	call agregarDomicilio(calle, numero, localidad, provincia);
	set domicilio = (select max(idDomicilio) from domicilio);
end if;
update cabaña c set c.razonSocial = razonSocial, c.idDomicilio = domicilio
where c.cuit = cuit;
END ;;
DELIMITER ;
-- -----------------------------------------------------
-- procedure modificarCliente
-- -----------------------------------------------------

DELIMITER ;;
CREATE PROCEDURE `modificarCliente`(cuit varchar(45), nombre varchar(60), calle varchar(45), numero int(11), localidad varchar(45), provincia varchar(45))
BEGIN
declare domicilio int;
if exists(select idDomicilio from domicilio d where d.calle = calle and d.numero = numero and d.localidad = localidad and d.provincia = provincia) then
	set domicilio  = (select idDomicilio from domicilio d where d.calle = calle and d.numero = numero and d.localidad = localidad and d.provincia = provincia);
else
	call agregarDomicilio(calle, numero, localidad, provincia);
	set domicilio = (select max(idDomicilio) from domicilio);
end if;
update cliente c set c.nombre = nombre, c.idDomicilio = domicilio
where c.cuit = cuit;
END ;;
DELIMITER ;
-- -----------------------------------------------------
-- procedure modificarFactura
-- -----------------------------------------------------
DELIMITER ;;
CREATE PROCEDURE `modificarFactura`(idFactura int, fecha date, cliente varchar(45))
BEGIN
update Factura f set f.fecha = fecha, f.cantidad = cantidad, f.cliente = cliente
where f.idFactura = idFactura;
END ;;
DELIMITER ;
-- -----------------------------------------------------
-- procedure modificarProductoAFactura
-- -----------------------------------------------------
DELIMITER ;;
CREATE PROCEDURE `modificarProductoAFactura`(factura int(11), producto int(11), cantidad int(11))
BEGIN
update factura_has_producto f set f.cantidad = cantidad
where f.factura = factura and f.producto = producto;
END ;;
DELIMITER ;
-- -----------------------------------------------------
-- procedure modificarGalpon
-- -----------------------------------------------------

DELIMITER ;;
CREATE PROCEDURE `modificarGalpon`(idGalpon int, cantGallinas int, plantel int)
BEGIN
update Galpon g set g.cantidadDeGallinas = cantGallinas, g.plantel = plantel
where g.idGalpon= idGalpon;
END ;;
DELIMITER ;
-- -----------------------------------------------------
-- procedure modificarGenetica
-- -----------------------------------------------------

DELIMITER ;;
CREATE PROCEDURE `modificarGenetica`(idGenetica int(11), nombre varchar(45), cabaña varchar(45))
BEGIN
update genetica g set g.nombre = nombre, g.cabaña = cabaña
where g.idGenetica= idGenetica;
END ;;
DELIMITER ;
-- -----------------------------------------------------
-- procedure modificarPlanilla
-- -----------------------------------------------------
DELIMITER ;;
CREATE PROCEDURE `modificarPlanilla`(idPlanilla int, _fecha date, cantHuevos int, cantMuertas int, cantAlimento float, tipoAlimento varchar(45), numGalpon int, novedades mediumtext)
BEGIN
update planilla p set p.fecha = _fecha, p.cantidadHuevosObtenidos = cantHuevos, p.cantidadGallinasMuertas = cantMuertas, p.cantidadAlimento = cantAlimento, p.tipoAlimento = tipoAlimento, p.galpon = numGalpon, p.novedades = novedades
where p.idPlanilla = idPlanilla;
END ;;
DELIMITER ;
-- -----------------------------------------------------
-- procedure modificarPlantel
-- -----------------------------------------------------
DELIMITER ;;
CREATE PROCEDURE `modificarPlantel`(codigo int(11), nombre varchar(45), edadEntrada int(11), genetica int(11), fechaEntrada date, precio float)
BEGIN
update plantel p set p.nombre = nombre, p.edadEntrada = edadEntrada, p.genetica = genetica, p.fechaEntrada = fechaEntrada, p.precio = precio
where p.idPlantel = codigo;
END ;;
DELIMITER ;
-- -----------------------------------------------------
-- procedure modificarProducto
-- -----------------------------------------------------
DELIMITER ;;
CREATE PROCEDURE `modificarProducto`(codigo int, precio float, cantidad int)
BEGIN
update producto p set p.precio = precio, p.cantidad = cantidad
where p.idProducto = codigo;
END ;;
DELIMITER ;

-- -----------------------------------------------------
-- procedure modificarLog
-- -----------------------------------------------------
DELIMITER ;;
CREATE PROCEDURE `modificarLog`(idLog int, fecha date, cantHuevos int, cantMuertas int, cantAlimento float, tipoAlimento varchar(45), numGalpon int, novedades mediumtext, planilla int(11), fechaModificado date, usuario int(11))
BEGIN
update log p set p.fecha = fecha, p.cantidadHuevosObtenidos = cantHuevos, p.cantidadGallinasMuertas = cantMuertas, p.cantidadAlimento = cantAlimento, p.tipoAlimento = tipoAlimento, p.galpon = numGalpon, p.novedades = novedades, p.planilla = planilla, p.fechaModificado = fechaModificado, p.usuario = usuario
where p.idLog = idLog;
END ;;
DELIMITER ;

-- -----------------------------------------------------
-- procedure modificarUsuario
-- -----------------------------------------------------
DELIMITER ;;
CREATE PROCEDURE `modificarUsuario`(cuil int, nombre varchar(45), apellido varchar(45), legajoInterno int(11), usuario varchar(45), pass varchar(45))
BEGIN
update usuario p set p.nombre = nombre, p.apellido = apellido, p.legajoInterno = legajoInterno, p.usuario = usuario, p.`password` = pass
where p.cuil = cuil;
END ;;
DELIMITER ;

