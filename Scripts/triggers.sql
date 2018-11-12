drop trigger tLogAltaPlanilla;
delimiter $$

create trigger tLogAltaPlanilla after update on planilla for each row
begin
	call agregarLog(OLD.planilla.fecha, 
					OLD.planilla.cantidadHuevosObtenidos, 
					OLD.planilla.cantidadGallinasMuertas,
                    OLD.planilla.cantidadAlimento,
                    OLD.planilla.tipoAlimento,
                    OLD.planilla.galpon,
                    OLD.planilla.novedades,
                    OLD.planilla.idPlanilla,
                    now(),
                    user()
                    );
end$$
delimiter ;