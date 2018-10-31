-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema practica2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema practica2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `practica2` DEFAULT CHARACTER SET utf8 ;
USE `practica2` ;

-- -----------------------------------------------------
-- Table `practica2`.`domicilio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica2`.`domicilio` (
  `idDomicilio` INT NOT NULL AUTO_INCREMENT,
  `calle` VARCHAR(45) NOT NULL,
  `numero` VARCHAR(45) NOT NULL,
  `localidad` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDomicilio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `practica2`.`cabania`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica2`.`cabania` (
  `cuil` INT NOT NULL,
  `razonSocial` VARCHAR(45) NULL,
  `domicilio` INT NOT NULL,
  PRIMARY KEY (`cuil`),
  INDEX `fk_cabania_domicilio1_idx` (`domicilio` ASC),
  CONSTRAINT `fk_cabania_domicilio1`
    FOREIGN KEY (`domicilio`)
    REFERENCES `practica2`.`domicilio` (`idDomicilio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `practica2`.`genetica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica2`.`genetica` (
  `codigo` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `cabania` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_genetica_cabania1_idx` (`cabania` ASC),
  CONSTRAINT `fk_genetica_cabania1`
    FOREIGN KEY (`cabania`)
    REFERENCES `practica2`.`cabania` (`cuil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `practica2`.`plantel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica2`.`plantel` (
  `codigo` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `edad` VARCHAR(45) NULL,
  `precioCompra` VARCHAR(45) NULL,
  `fechaEntrada` DATE NULL,
  `genetica` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_plantel_genetica_idx` (`genetica` ASC),
  CONSTRAINT `fk_plantel_genetica`
    FOREIGN KEY (`genetica`)
    REFERENCES `practica2`.`genetica` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `practica2`.`galpon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica2`.`galpon` (
  `numero` INT NOT NULL,
  `cantidadGallinas` INT NULL,
  `plantel` INT NOT NULL,
  PRIMARY KEY (`numero`),
  INDEX `fk_galpon_plantel1_idx` (`plantel` ASC),
  CONSTRAINT `fk_galpon_plantel1`
    FOREIGN KEY (`plantel`)
    REFERENCES `practica2`.`plantel` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `practica2`.`planilla`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica2`.`planilla` (
  `idPlanilla` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NULL,
  `cantGallinasMuertas` INT NULL,
  `cantidadAlimento` INT NULL,
  `tipoAlimento` VARCHAR(45) NULL,
  `novedades` VARCHAR(45) NULL,
  `galpon` INT NOT NULL,
  PRIMARY KEY (`idPlanilla`),
  INDEX `fk_planilla_galpon1_idx` (`galpon` ASC),
  CONSTRAINT `fk_planilla_galpon1`
    FOREIGN KEY (`galpon`)
    REFERENCES `practica2`.`galpon` (`numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `practica2`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica2`.`cliente` (
  `cuit` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `domicilio` INT NOT NULL,
  PRIMARY KEY (`cuit`),
  INDEX `fk_cliente_domicilio1_idx` (`domicilio` ASC),
  CONSTRAINT `fk_cliente_domicilio1`
    FOREIGN KEY (`domicilio`)
    REFERENCES `practica2`.`domicilio` (`idDomicilio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `practica2`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica2`.`factura` (
  `idFactura` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NULL,
  `cliente` INT NOT NULL,
  PRIMARY KEY (`idFactura`, `cliente`),
  INDEX `fk_factura_cliente1_idx` (`cliente` ASC),
  CONSTRAINT `fk_factura_cliente1`
    FOREIGN KEY (`cliente`)
    REFERENCES `practica2`.`cliente` (`cuit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `practica2`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica2`.`producto` (
  `codigo` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `precio` FLOAT NULL,
  `cantHuevos` INT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `practica2`.`factura_has_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica2`.`factura_has_producto` (
  `factura` INT NOT NULL,
  `producto` INT NOT NULL,
  PRIMARY KEY (`factura`, `producto`),
  INDEX `fk_factura_has_producto_producto1_idx` (`producto` ASC),
  INDEX `fk_factura_has_producto_factura1_idx` (`factura` ASC),
  CONSTRAINT `fk_factura_has_producto_factura1`
    FOREIGN KEY (`factura`)
    REFERENCES `practica2`.`factura` (`idFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_has_producto_producto1`
    FOREIGN KEY (`producto`)
    REFERENCES `practica2`.`producto` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
