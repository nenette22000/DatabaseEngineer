-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Global Super Store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Global Super Store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Global Super Store` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `Global Super Store` ;

-- -----------------------------------------------------
-- Table `Global Super Store`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Global Super Store`.`Customers` (
  `CustomerID` INT NOT NULL,
  `FullName` VARCHAR(255) NOT NULL,
  `ContactNumber` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Global Super Store`.`DeliveryAddress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Global Super Store`.`DeliveryAddress` (
  `AddressID` INT NOT NULL,
  `Street` VARCHAR(255) NULL DEFAULT NULL,
  `PostCode` VARCHAR(45) NULL DEFAULT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `State` VARCHAR(45) NULL DEFAULT NULL,
  `Country` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Global Super Store`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Global Super Store`.`Products` (
  `ProductID` INT NOT NULL,
  `ProductName` VARCHAR(255) NULL DEFAULT NULL,
  `AmountlnStock` INT NULL DEFAULT NULL,
  `Price` VARCHAR(255) NULL DEFAULT NULL,
  `Category` VARCHAR(45) NULL DEFAULT NULL,
  `Subcategory` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ProductID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Global Super Store`.`Shipping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Global Super Store`.`Shipping` (
  `ShipID` INT NOT NULL,
  `ShipDate` DATE NULL DEFAULT NULL,
  `ShipMode` VARCHAR(45) NULL DEFAULT NULL,
  `AddressID` INT NULL DEFAULT NULL,
  `ShipCost` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`ShipID`),
  INDEX `AddressID_idx` (`AddressID` ASC) VISIBLE,
  CONSTRAINT `AddressID`
    FOREIGN KEY (`AddressID`)
    REFERENCES `Global Super Store`.`DeliveryAddress` (`AddressID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Global Super Store`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Global Super Store`.`Orders` (
  `OrderID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `ProductID` INT NOT NULL,
  `DeliveryID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` VARCHAR(45) NOT NULL,
  `OderPriority` VARCHAR(255) NULL DEFAULT NULL,
  `Discount` VARCHAR(255) NULL DEFAULT NULL,
  `ShipID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `ProductID_idx` (`ProductID` ASC) VISIBLE,
  INDEX `ShipID_idx` (`ShipID` ASC) VISIBLE,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `Global Super Store`.`Customers` (`CustomerID`),
  CONSTRAINT `ProductID`
    FOREIGN KEY (`ProductID`)
    REFERENCES `Global Super Store`.`Products` (`ProductID`),
  CONSTRAINT `ShipID`
    FOREIGN KEY (`ShipID`)
    REFERENCES `Global Super Store`.`Shipping` (`ShipID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
