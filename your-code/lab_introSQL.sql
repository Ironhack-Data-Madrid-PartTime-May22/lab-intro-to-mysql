-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`salesperson` (
  `staffid` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`staffid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customers` (
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
-- Table `mydb`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`invoices` (
  `idinvoices` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `car` INT NULL,
  `customer` INT NOT NULL,
  `sales_person` INT NOT NULL,
  `salesperson_staffid` INT NOT NULL,
  `customers_idcustomers` INT NOT NULL,
  PRIMARY KEY (`idinvoices`, `salesperson_staffid`, `customers_idcustomers`),
  INDEX `fk_invoices_salesperson_idx` (`salesperson_staffid` ASC) VISIBLE,
  INDEX `fk_invoices_customers1_idx` (`customers_idcustomers` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_salesperson`
    FOREIGN KEY (`salesperson_staffid`)
    REFERENCES `mydb`.`salesperson` (`staffid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`customers_idcustomers`)
    REFERENCES `mydb`.`customers` (`idcustomers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cars` (
  `VIN` INT NOT NULL AUTO_INCREMENT,
  `manufacturer` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `year` YEAR(4) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `invoices_idinvoices` INT NOT NULL,
  `invoices_salesperson_staffid` INT NOT NULL,
  PRIMARY KEY (`VIN`, `invoices_idinvoices`, `invoices_salesperson_staffid`),
  INDEX `fk_cars_invoices1_idx` (`invoices_idinvoices` ASC, `invoices_salesperson_staffid` ASC) VISIBLE,
  CONSTRAINT `fk_cars_invoices1`
    FOREIGN KEY (`invoices_idinvoices` , `invoices_salesperson_staffid`)
    REFERENCES `mydb`.`invoices` (`idinvoices` , `salesperson_staffid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
