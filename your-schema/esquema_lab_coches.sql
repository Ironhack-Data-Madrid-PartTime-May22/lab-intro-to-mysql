-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lab_coches
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab_coches
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_coches` DEFAULT CHARACTER SET utf8 ;
USE `lab_coches` ;

-- -----------------------------------------------------
-- Table `lab_coches`.`vendedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_coches`.`vendedores` (
  `idvendedores` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `almacenar` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idvendedores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_coches`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_coches`.`clientes` (
  `idclientes` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  `correo electronico` VARCHAR(100) NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `ciudad` VARCHAR(50) NOT NULL,
  `provincia_del_estado` VARCHAR(50) NOT NULL,
  `pais` VARCHAR(50) NOT NULL,
  `postal` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idclientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_coches`.`automovil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_coches`.`automovil` (
  `idautomovil` INT NOT NULL AUTO_INCREMENT,
  `VIN` VARCHAR(17) NOT NULL,
  `fabricante` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(100) NOT NULL,
  `año` INT NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idautomovil`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_coches`.`facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_coches`.`facturas` (
  `idfacturas` INT NOT NULL AUTO_INCREMENT,
  `n_factura` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `vendedores_idvendedores` INT NOT NULL,
  `clientes_idclientes` INT NOT NULL,
  `automovil_idautomovil` INT NOT NULL,
  PRIMARY KEY (`idfacturas`, `vendedores_idvendedores`, `clientes_idclientes`, `automovil_idautomovil`),
  INDEX `fk_facturas_vendedores1_idx` (`vendedores_idvendedores` ASC) VISIBLE,
  INDEX `fk_facturas_clientes1_idx` (`clientes_idclientes` ASC) VISIBLE,
  INDEX `fk_facturas_automovil1_idx` (`automovil_idautomovil` ASC) VISIBLE,
  CONSTRAINT `fk_facturas_vendedores1`
    FOREIGN KEY (`vendedores_idvendedores`)
    REFERENCES `lab_coches`.`vendedores` (`idvendedores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_facturas_clientes1`
    FOREIGN KEY (`clientes_idclientes`)
    REFERENCES `lab_coches`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_facturas_automovil1`
    FOREIGN KEY (`automovil_idautomovil`)
    REFERENCES `lab_coches`.`automovil` (`idautomovil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
