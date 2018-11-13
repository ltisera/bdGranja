-- -
-- Insertar datos suficientes para realizar consultas al modelo, por medio de la API precedente.
--
call agregarCabaña(1, "Las Camilas", "Tiseras", 1, "Claypole", "Salta");
call agregarCabaña(2, "Las Lilas", "Alma Fuerte", 1, "Claypole", "Salta Cruz");
call agregarCabaña(3, "Las Camelias", "Obligado", 1, "Claypole", "Salta Montes");

call agregarGenetica(1, "La Gallina Mutonta", 1);
call agregarGenetica(2, "La Gallina Terricola", 1);
call agregarGenetica(3, "La Gallina Alien", 2);
call agregarGenetica(4, "La Gallina Mareada", 2);
call agregarGenetica(5, "La Gallina Desubicada", 3);

call agregarPlantel(1, "Riber plate", 12, 1, "2018-1-13", 2);
call agregarPlantel(2, "San Silencio", 6, 1, "2018-2-13", 2);
call agregarPlantel(3, "RacinGente", 3, 2, "2018-3-13", 2);
call agregarPlantel(4, "Boca Campeon", 2, 3, "2018-4-13", 2);
call agregarPlantel(5, "Rammstein", 6, 3, "2018-5-13", 2);
call agregarPlantel(6, "Bocasolaliens", 19, 5, "2018-6-13", 2);

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
call agregarUsuario(1, "Don carlo", "Pacheco", 12312,"root", "default");
call agregarUsuario(2, "Don Juan", "Pacheco", 112,"DJuant", "default");
call agregarUsuario(3, "Marcelito", "Diaz", 132,"elMarce", "default");
call agregarUsuario(4, "La juanita", "Diaz", 12,"juanchita", "default");
--
-- Auditoria y datos de planillas
--
-- (`fecha`, `cantidadHuevosObtenidos`, `cantidadGallinasMuertas`, `cantidadAlimento`, `tipoAlimento`, `galpon`, `novedades`
call agregarPlanilla("2018-12-1", 10, 1, 10, "Balanceado", 1, "Se comieron TODO TOITO");
call agregarPlanilla("2018-12-1", 10, 2, 3, "Balanceado", 2, "Se comieron TODO TOITO");
call agregarPlanilla("2018-12-1", 234, 2, 3, "Balanceado", 3, "Se comieron TODO TOITO");
call agregarPlanilla("2018-12-1", 13450, 2, 3, "Balanceado", 4, "Se comieron TODO TOITO");
call agregarPlanilla("2018-12-1", 4, 2, 3, "Balanceado", 5, "Se comieron TODO TOITO");
call agregarPlanilla("2018-12-1", 54, 2, 3, "Balanceado", 6, "Se comieron TODO TOITO");
call agregarPlanilla("2018-12-1", 30, 2, 3, "Balanceado", 7, "Se comieron TODO TOITO");
call agregarPlanilla("2018-12-1", 230, 2, 3, "Balanceado", 8, "Se comieron TODO TOITO");
call agregarPlanilla("2018-12-1", 120, 2, 3, "Balanceado", 9, "Se comieron TODO TOITO");
call agregarPlanilla("2018-12-1", 43, 2, 3, "Balanceado", 10, "Se comieron TODO TOITO");
call agregarPlanilla("2018-12-1", 15, 2, 3, "Balanceado", 11, "Se comieron TODO TOITO");

call agregarPlanilla("2018-12-1", 10, 1, 10, "Balanceado", 1, "Se comieron 1");
call agregarPlanilla("2018-12-2", 10, 1, 10, "Balanceado", 1, "Se comieron 2");
call agregarPlanilla("2018-12-3", 10, 1, 10, "Balanceado", 1, "Se comieron 3");
call agregarPlanilla("2018-12-4", 10, 1, 10, "Balanceado", 1, "Se comieron 4");


-- Modificacion de planillas 
-- (idPlanilla int, _fecha date, cantHuevos int, cantMuertas int, cantAlimento float, tipoAlimento varchar(45), numGalpon int, novedades mediumtext)
call modificarPlanilla(1,"2018-12-2", 10, 1, 10, "Balanceado", 1, "Se comieron TODO TOITO")