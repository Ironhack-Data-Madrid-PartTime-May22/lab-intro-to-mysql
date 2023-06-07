-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lab_seeding
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab_seeding
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_seeding` DEFAULT CHARACTER SET utf8 ;
USE `lab_seeding` ;

-- -----------------------------------------------------
-- Table `lab_seeding`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_seeding`.`cars` (
  `VIN` VARCHAR(50) NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `year` YEAR(4) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`VIN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_seeding`.`salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_seeding`.`salesperson` (
  `staffid` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`staffid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_seeding`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_seeding`.`customers` (
  `idcustomers` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `phone` INT(9) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `address` VARCHAR(150) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `province` VARCHAR(45) NULL,
  `country` VARCHAR(45) NOT NULL,
  `postal` VARCHAR(45) NULL,
  PRIMARY KEY (`idcustomers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_seeding`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_seeding`.`invoices` (
  `idinvoices` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `car` INT NULL,
  `customer` INT NOT NULL,
  `sales_person` INT NOT NULL,
  `salesperson_staffid` INT NOT NULL,
  `customers_idcustomers` INT NOT NULL,
  `cars_VIN` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idinvoices`, `salesperson_staffid`, `customers_idcustomers`, `cars_VIN`),
  INDEX `fk_invoices_salesperson_idx` (`salesperson_staffid` ASC) VISIBLE,
  INDEX `fk_invoices_customers1_idx` (`customers_idcustomers` ASC) VISIBLE,
  INDEX `fk_invoices_cars1_idx` (`cars_VIN` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_salesperson`
    FOREIGN KEY (`salesperson_staffid`)
    REFERENCES `lab_seeding`.`salesperson` (`staffid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`customers_idcustomers`)
    REFERENCES `lab_seeding`.`customers` (`idcustomers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_cars1`
    FOREIGN KEY (`cars_VIN`)
    REFERENCES `lab_seeding`.`cars` (`VIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_seeding`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_seeding`.`table1` (
)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
