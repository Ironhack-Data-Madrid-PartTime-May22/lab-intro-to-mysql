-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lab_intro
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab_intro
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_intro` DEFAULT CHARACTER SET utf8 ;
USE `lab_intro` ;

-- -----------------------------------------------------
-- Table `lab_intro`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_intro`.`customer` (
  `idcustomer` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `country` VARCHAR(45) NOT NULL,
  `postal` INT NOT NULL,
  PRIMARY KEY (`idcustomer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_intro`.`salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_intro`.`salesperson` (
  `idsalesperson` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `store` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idsalesperson`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_intro`.`car`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_intro`.`car` (
  `idcar_vin` VARCHAR(45) NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `year` YEAR NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcar_vin`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_intro`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_intro`.`invoice` (
  `idinvoice` INT NOT NULL,
  `date` DATE NOT NULL,
  `customer_idcustomer` INT NOT NULL,
  `salesperson_idsalesperson` INT NOT NULL,
  `car_idcar_vin` INT NOT NULL,
  PRIMARY KEY (`idinvoice`, `customer_idcustomer`, `salesperson_idsalesperson`, `car_idcar_vin`),
  INDEX `fk_invoice_customer_idx` (`customer_idcustomer` ASC) VISIBLE,
  INDEX `fk_invoice_salesperson1_idx` (`salesperson_idsalesperson` ASC) VISIBLE,
  INDEX `fk_invoice_car1_idx` (`car_idcar_vin` ASC) VISIBLE,
  CONSTRAINT `fk_invoice_customer`
    FOREIGN KEY (`customer_idcustomer`)
    REFERENCES `lab_intro`.`customer` (`idcustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoice_salesperson1`
    FOREIGN KEY (`salesperson_idsalesperson`)
    REFERENCES `lab_intro`.`salesperson` (`idsalesperson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoice_car1`
    FOREIGN KEY (`car_idcar_vin`)
    REFERENCES `lab_intro`.`car` (`idcar_vin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
