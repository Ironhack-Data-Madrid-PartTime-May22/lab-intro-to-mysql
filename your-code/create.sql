-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cars
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cars
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cars` DEFAULT CHARACTER SET utf8mb3 ;
USE `cars` ;

-- -----------------------------------------------------
-- Table `cars`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`cars` (
  `idcars` INT NOT NULL AUTO_INCREMENT,
  `vin` CHAR(17) NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `year` YEAR NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcars`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `cars`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`customers` (
  `idcustomers` INT NOT NULL AUTO_INCREMENT,
  `customerid` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(100) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `postal` INT NOT NULL,
  PRIMARY KEY (`idcustomers`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `cars`.`salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`salespersons` (
  `idsalespersons` INT NOT NULL AUTO_INCREMENT,
  `staffid` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `store` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idsalespersons`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `cars`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`invoices` (
  `idinvoices` INT NOT NULL AUTO_INCREMENT,
  `number` INT NOT NULL,
  `date` DATE NOT NULL,
  `cars_idcars` INT NOT NULL,
  `salespersons_idsalespersons` INT NOT NULL,
  `customers_idcustomers` INT NOT NULL,
  PRIMARY KEY (`idinvoices`),
  INDEX `fk_invoices_cars_idx` (`cars_idcars` ASC) VISIBLE,
  INDEX `fk_invoices_salespersons1_idx` (`salespersons_idsalespersons` ASC) VISIBLE,
  INDEX `fk_invoices_customers1_idx` (`customers_idcustomers` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_cars`
    FOREIGN KEY (`cars_idcars`)
    REFERENCES `cars`.`cars` (`idcars`),
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`customers_idcustomers`)
    REFERENCES `cars`.`customers` (`idcustomers`),
  CONSTRAINT `fk_invoices_salespersons1`
    FOREIGN KEY (`salespersons_idsalespersons`)
    REFERENCES `cars`.`salespersons` (`idsalespersons`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
