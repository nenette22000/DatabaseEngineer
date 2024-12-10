-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `littlelemondb` ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `CustomerID` INT NOT NULL,
  `FirstName` VARCHAR(255) NOT NULL,
  `LastName` VARCHAR(255) NOT NULL,
  `PhoneNumber` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuItems` (
  `MenuItemID` INT NOT NULL,
  `ItemName` VARCHAR(55) NOT NULL,
  `ItemPrice` DECIMAL(5,2) NULL DEFAULT NULL,
  PRIMARY KEY (`MenuItemID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `MenuID` INT NOT NULL,
  `Cuisine` VARCHAR(255) NOT NULL,
  `Starter` VARCHAR(255) NOT NULL,
  `Course` VARCHAR(255) NOT NULL,
  `Drinks` VARCHAR(255) NOT NULL,
  `Desserts` VARCHAR(255) NOT NULL,
  `MenuItemID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `MenuItemID_idx` (`MenuItemID` ASC) VISIBLE,
  CONSTRAINT `MenuItemID`
    FOREIGN KEY (`MenuItemID`)
    REFERENCES `LittleLemonDB`.`MenuItems` (`MenuItemID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `OrderID` INT NOT NULL,
  `OderDate` DATE NOT NULL,
  `OrderQuantity` VARCHAR(255) NOT NULL,
  `OrderType` VARCHAR(55) NULL DEFAULT NULL,
  `TotalCost` DECIMAL(10,2) NULL DEFAULT NULL,
  `MenuID` INT NULL DEFAULT NULL,
  `MenuItemID` INT NULL DEFAULT NULL,
  `CustomerID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `MenuID_idx` (`MenuID` ASC) VISIBLE,
  INDEX `MenuItemID_idx` (`MenuItemID` ASC) VISIBLE,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`),
  CONSTRAINT `MenuID`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonDB`.`Menu` (`MenuID`),
  CONSTRAINT `MenuItemID`
    FOREIGN KEY (`MenuItemID`)
    REFERENCES `LittleLemonDB`.`MenuItems` (`MenuItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staff` (
  `StaffID` INT NOT NULL,
  `FirstName` VARCHAR(255) NOT NULL,
  `LastName` VARCHAR(255) NOT NULL,
  `StaffRole` VARCHAR(255) NOT NULL,
  `StaffSalary` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `BookingID` INT NOT NULL,
  `BookingDate` DATE NOT NULL,
  `TableNumber` INT NOT NULL,
  `CustomerID` INT NULL DEFAULT NULL,
  `OrderID` INT NULL DEFAULT NULL,
  `StaffID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `CustomerName_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `DeliveryStatus_idx` (`StaffID` ASC) VISIBLE,
  INDEX `OrderID_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `customerID `
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `OrderID`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonDB`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `StaffID`
    FOREIGN KEY (`StaffID`)
    REFERENCES `LittleLemonDB`.`Staff` (`StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`OrderDelivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`OrderDelivery` (
  `DeliveryID` INT NOT NULL,
  `DeliveryDate` DATE NOT NULL,
  `DeliveryStatus` VARCHAR(100) NOT NULL,
  `OrderID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `MenuID_idx` (`DeliveryStatus` ASC) VISIBLE,
  INDEX `OrderID_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `OrderID`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonDB`.`Orders` (`OrderID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`OrderView`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`OrderView` (
  `OrderID` INT NOT NULL,
  `OrderQuantity` VARCHAR(255) NOT NULL,
  `TotalCost` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `TotalCost_idx` (`TotalCost` ASC) VISIBLE,
  INDEX `OrderQuantity_idx` (`OrderQuantity` ASC) VISIBLE,
  CONSTRAINT `TotalCost`
    FOREIGN KEY ()
    REFERENCES `LittleLemonDB`.`Orders` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `littlelemondb` ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- procedure AddBooking
-- -----------------------------------------------------

DELIMITER $$
USE `LittleLemonDB`$$
CREATE DEFINER=`capsuser`@`localhost` PROCEDURE `AddBooking`(p_BookingID INT, p_CustomerID INT,p_TableNumber INT, p_BookingDate DATE )
BEGIN

INSERT INTO Bookings(BookingID,CustomerID,TableNumber,Date) VALUES (p_BookingID, p_CustomerID, p_TableNumber, DATE(p_BookingDate));
SELECT CONCAT('New booking added') AS 'Confirmation';
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure AddValidBooking
-- -----------------------------------------------------

DELIMITER $$
USE `LittleLemonDB`$$
CREATE DEFINER=`capsuser`@`localhost` PROCEDURE `AddValidBooking`(p_BookingDate DATE, p_TableNumber int)
BEGIN

DECLARE v_tablestatus INT;

    -- Start the transaction
    START TRANSACTION;

    -- Check if the table is already booked on the specified date
    SELECT COUNT(*)
    INTO v_tablestatus
    FROM Bookings
    WHERE BookingDate = DATE(p_BookingDate) AND TableNumber = p_TableNumber;

    -- Insert a new booking record if the table is available
    IF v_tablestatus = 0 THEN
        INSERT INTO Bookings (Date, TableNumber)
        VALUES (p_BookingDate, p_TableNumber);

        -- Commit the transaction if the insert is successful
        COMMIT;
        SELECT CONCAT('Table ',p_TableNumber,' - Booking added successfully for ',p_BookingDate) AS 'Booking Status';
    ELSE
        -- Rollback the transaction if the table is already booked
        ROLLBACK;
        SELECT CONCAT('Table ',p_TableNumber, ' is already booked - booking cancelled') AS 'Booking Status';
    END IF;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure CancelBooking
-- -----------------------------------------------------

DELIMITER $$
USE `LittleLemonDB`$$
CREATE DEFINER=`capsuser`@`localhost` PROCEDURE `CancelBooking`(p_BookingID INT)
BEGIN
DELETE FROM Bookings WHERE BookingID = p_BookingID;
SELECT CONCAT('Booking ', p_BookingID, ' cancelled') AS 'Confirmation';
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure CheckBooking
-- -----------------------------------------------------

DELIMITER $$
USE `LittleLemonDB`$$
CREATE DEFINER=`capsuser`@`localhost` PROCEDURE `CheckBooking`(p_BookingDate DATE, p_TableNumber INT)
BEGIN
DECLARE v_bookingstatus VARCHAR(100);

    -- Check if the table is booked on the specified date
SELECT 
    CASE
        WHEN
            EXISTS( SELECT 
                    1
                FROM
                    Bookings
                WHERE
                    Date = DATE(p_BookingDate)
                        AND TableNumber = p_TableNumber)
        THEN
            CONCAT('Table ',
                    p_TableNumber,
                    ' is already booked')
        ELSE CONCAT('Table', p_TableNumber, 'is available')
    END
INTO v_bookingstatus;

    -- Return the booking status
SELECT v_Bookingstatus AS BookingStatus;




END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure GetMaxQuantity
-- -----------------------------------------------------

DELIMITER $$
USE `LittleLemonDB`$$
CREATE DEFINER=`capsuser`@`localhost` PROCEDURE `GetMaxQuantity`()
select MAX(OrderQuantity) AS "MAx Quantity in Order" FROM Orders$$

DELIMITER ;
USE `littlelemondb` ;

-- -----------------------------------------------------
-- Placeholder table for view `littlelemondb`.`ordersview`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`ordersview` (`OrderID` INT, `OrderQuantity` INT, `TotalCost` INT);

-- -----------------------------------------------------
-- View `littlelemondb`.`ordersview`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`ordersview`;
USE `littlelemondb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`capsuser`@`localhost` SQL SECURITY DEFINER VIEW `littlelemondb`.`ordersview` AS select `littlelemondb`.`orders`.`OrderID` AS `OrderID`,`littlelemondb`.`orders`.`OrderQuantity` AS `OrderQuantity`,`littlelemondb`.`orders`.`TotalCost` AS `TotalCost` from `littlelemondb`.`orders`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
