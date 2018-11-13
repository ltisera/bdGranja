
delimiter $$

create trigger tLogAltaPlanilla after update on planilla for each row
begin
	call agregarLog(fecha, 
					cantidadHuevosObtenidos, 
					cantidadGallinasMuertas,
                    cantidadAlimento,
                    tipoAlimento,
                    galpon,
                    novedades,
                    idPlanilla,
                    curdate(),
                    1
                    );
end$$
delimiter ;