
drop trigger tLogAltaPlanilla;
delimiter $$

create trigger tLogAltaPlanilla after update on planilla for each row
begin
	call agregarLog(OLD.fecha, old.cantidadHuevosObtenidos, OLD.cantidadGallinasMuertas, OLD.cantidadAlimento, OLD.tipoAlimento, OLD.galpon, OLD.novedades, OLD.idPlanilla, curdate(), 1);
end$$
delimiter ;

