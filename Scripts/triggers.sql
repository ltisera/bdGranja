

drop trigger tLogAltaPlanilla;
drop trigger tLogModPlanilla;
drop trigger tLogBajaPlanilla;


delimiter $$
create function fDevolverUsuario() returns int(11)
begin
	return (select cuil from usuario where usuario.usuario = SUBSTRING_INDEX(USER(),"@",1));
end$$
delimiter ;



-- -----------------------------------------------------
-- Trigger para la modificacion
-- -----------------------------------------------------
delimiter $$

create trigger tLogModPlanilla after update on planilla for each row
begin
	call agregarLog(OLD.fecha, old.cantidadHuevosObtenidos, OLD.cantidadGallinasMuertas, OLD.cantidadAlimento, OLD.tipoAlimento, OLD.galpon, OLD.novedades, OLD.idPlanilla, curdate(), fDevolverUsuario());
end$$
delimiter ;
-- -----------------------------------------------------
-- Trigger para la Alta
-- -----------------------------------------------------

delimiter $$

create trigger tLogAltaPlanilla after insert on planilla for each row
begin
	call agregarLog(NEW.fecha, new.cantidadHuevosObtenidos, NEW.cantidadGallinasMuertas, NEW.cantidadAlimento, NEW.tipoAlimento, NEW.galpon, NEW.novedades, NEW.idPlanilla, curdate(), fDevolverUsuario());
end$$
delimiter ;

-- -----------------------------------------------------
-- Trigger para la Delete
-- Log tiene dependencia
-- -----------------------------------------------------

delimiter $$

create trigger tLogBajaPlanilla after delete on planilla for each row
begin
	call agregarLog(OLD.fecha, old.cantidadHuevosObtenidos, OLD.cantidadGallinasMuertas, OLD.cantidadAlimento, OLD.tipoAlimento, OLD.galpon, OLD.novedades, OLD.idPlanilla, curdate(), fDevolverUsuario());
end$$
delimiter ;
