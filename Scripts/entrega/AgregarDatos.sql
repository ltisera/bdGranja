-- -
-- Insertar datos suficientes para realizar consultas al modelo, por medio de la API precedente.
--
call agregarCabaña(1, "Juan Ramirez", "Alsina", 850, "Lomas de Zamora", "Buenos Aires");
call agregarCabaña(2, "Lucas Tisera", "Hipolito Yrigoyen", 1320, "Quilmes", "Buenos Aires");
call agregarCabaña(3, "Nicolas Mateus", "Bartolome Mitre", 645, "Avellaneda", "Buenos Aires");
call agregarCabaña(4, "Marta Alvarez", "25 de mayo", 368, "Lanus", "Buenos Aires");

call agregarGenetica(1, "Hisex Brown", 1);
call agregarGenetica(2, "Babcock", 1);
call agregarGenetica(3, "Plymouth rock barred", 2);
call agregarGenetica(4, "Cobb", 3);
call agregarGenetica(5, "Ross", 4);

call agregarPlantel(1, "Hisex Brown 1", 12, 1, "2018-1-13", 1);
call agregarPlantel(2, "Hisex Brown 2", 6, 1, "2018-2-13", 1);
call agregarPlantel(3, "Babcock 1", 3, 2, "2018-3-13", 2);
call agregarPlantel(4, "Plymouth rock barred 1", 2, 3, "2018-4-13", 3);
call agregarPlantel(5, "Cobb 1", 6, 4, "2018-5-13", 4);
call agregarPlantel(6, "Ross 1", 19, 5, "2018-6-13", 5);

call agregarGalpon(1, 10, 1);
call agregarGalpon(2, 100, 1);
call agregarGalpon(3, 50, 2);
call agregarGalpon(4, 500, 2);
call agregarGalpon(5, 80, 3);
call agregarGalpon(6, 50000, 3);
call agregarGalpon(7, 5, 4);
call agregarGalpon(8, 3, 4);
call agregarGalpon(9, 300, 5);
call agregarGalpon(10, 13, 5);
call agregarGalpon(11, 200, 6);


--
-- (cuil int(11), nombre varchar(45), apellido varchar(45), legajoInterno int(11), usuario varchar(45), pass varchar(45))
call agregarUsuario(1, "Carlos", "Pacheco", 12312,"root", "default");
call agregarUsuario(2, "Juan", "Dominguez", 112,"JuanD", "default");
call agregarUsuario(3, "Marcelo", "Diaz", 132,"MarceD", "default");
call agregarUsuario(4, "Juana", "Navarro", 12,"JuanaN", "default");
--
-- Auditoria y datos de planillas
--
-- (`fecha`, `cantidadHuevosObtenidos`, `cantidadGallinasMuertas`, `cantidadAlimento`, `tipoAlimento`, `galpon`, `novedades`
call agregarPlanilla("2018-12-1", 10, 1, 10, "Balanceado", 1, "Se comieron todo");
call agregarPlanilla("2018-12-1", 10, 2, 3, "Balanceado", 2, "Se comieron todo");
call agregarPlanilla("2018-12-1", 234, 2, 3, "Balanceado", 3, "Se comieron todo");
call agregarPlanilla("2018-12-1", 13450, 2, 3, "Balanceado", 4, "Se comieron todo");
call agregarPlanilla("2018-12-1", 4, 2, 3, "Balanceado", 5, "Se comieron todo");
call agregarPlanilla("2018-12-1", 54, 2, 3, "Balanceado", 6, "Se comieron todo");
call agregarPlanilla("2016-12-1", 30, 2, 3, "Balanceado", 7, "Se comieron todo");
call agregarPlanilla("2016-12-1", 230, 2, 3, "Balanceado", 8, "Se comieron todo");
call agregarPlanilla("2016-12-1", 120, 2, 3, "Balanceado", 9, "Se comieron todo");
call agregarPlanilla("2016-12-1", 43, 2, 3, "Balanceado", 10, "Se comieron todo");
call agregarPlanilla("2016-12-1", 15, 2, 3, "Balanceado", 11, "Se comieron todo");

call agregarPlanilla("2017-12-1", 10, 1, 10, "Balanceado", 1, "Se comieron 1");
call agregarPlanilla("2017-12-2", 10, 1, 10, "Balanceado", 1, "Se comieron 2");
call agregarPlanilla("2017-12-3", 10, 1, 10, "Balanceado", 1, "Se comieron 3");
call agregarPlanilla("2017-12-4", 10, 1, 10, "Balanceado", 1, "Se comieron 4");


call agregarPlanilla("2017-5-1", 10, 5, 1, "Balanceado", 2, "Se comieron todo");
call agregarPlanilla("2017-6-3", 75, 7, 9, "Balanceado", 3, "Se comieron todo");
call agregarPlanilla("2017-6-15", 13450, 0, 5, "Balanceado", 4, "Se comieron todo");
call agregarPlanilla("2017-6-21", 14, 1, 12, "Balanceado", 5, "Se comieron todo");
call agregarPlanilla("2017-7-5", 54, 15, 4, "Balanceado", 6, "Se comieron todo");
call agregarPlanilla("2017-7-30", 30, 7, 7, "Balanceado", 7, "Se comieron todo");
call agregarPlanilla("2018-8-29", 230, 5, 6, "Balanceado", 8, "Se comieron todo");
call agregarPlanilla("2018-9-2", 120, 2, 9, "Balanceado", 9, "Se comieron todo");
call agregarPlanilla("2018-10-12", 43, 3, 8, "Balanceado", 10, "Se comieron todo");
call agregarPlanilla("2018-10-17", 15, 1, 12, "Balanceado", 11, "Se comieron todo");

/*codigo int, precio float, cantidad int*/
call agregarProducto(1, 25, 12);
call agregarProducto(2, 100, 6);
call agregarProducto(3, 30, 24);



/*cuit varchar(45), nombre varchar(60), calle varchar(45), numero int(11), localidad varchar(45), provincia varchar(45)*/
call agregarCliente("1", "Jorge", "Acevedo", 123, "Lomas de Zamora", "Buenos Aires");
call agregarCliente("2", "Maria", "Pavon", 564, "Monte Grande", "Buenos Aires");
call agregarCliente("3", "Julia", "Roma", 134, "Lanus", "Buenos Aires");

/*fecha date, cliente varchar(45)*/
call agregarFactura("2018-4-7", "1");
call agregarFactura("2018-6-3", "2");

/*factura int(11),producto int (11), cantidad int(11)*/
call agregarProductoAFactura(1, 1, 2);
call agregarProductoAFactura(1, 2, 1);
call agregarProductoAFactura(2, 2, 1);



-- Modificacion de planillas 
-- (idPlanilla int, _fecha date, cantHuevos int, cantMuertas int, cantAlimento float, tipoAlimento varchar(45), numGalpon int, novedades mediumtext)
call modificarPlanilla(1,"2018-12-2", 10, 1, 10, "Balanceado", 1, "Se comieron todo")