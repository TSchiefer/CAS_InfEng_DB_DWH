DROP SCHEMA IF EXISTS `northwind_staging_area` ;
CREATE SCHEMA IF NOT EXISTS `northwind_staging_area` DEFAULT CHARACTER SET latin1 ;
USE `northwind_staging_area` ;

-- -----------------------------------------------------
-- Table `northwind_staging_area`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind_staging_area`.`customers` (
  `id` INT(11) NOT NULL,
  `company` VARCHAR(50) NULL DEFAULT NULL,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  `first_name` VARCHAR(50) NULL DEFAULT NULL,
#  `address` LONGTEXT NULL DEFAULT NULL,
  `city` VARCHAR(50) NULL DEFAULT NULL,
  `state_province` VARCHAR(50) NULL DEFAULT NULL,
  `country_region` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
#  INDEX `first_name` (`first_name` ASC),
#  INDEX `last_name` (`last_name` ASC),
#  INDEX `zip_postal_code` (`zip_postal_code` ASC),
#  INDEX `state_province` (`state_province` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = UTF8MB4;

-- -----------------------------------------------------
-- Table `northwind_staging_area`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind_staging_area`.`orders` (
  `id` INT(11) NOT NULL,
  `customer_id` INT(11) NULL DEFAULT NULL,
  `order_date` DATETIME NULL DEFAULT NULL,
  `payment_type` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_orders_customers`
    FOREIGN KEY (`customer_id`)
    REFERENCES `northwind_staging_area`.`customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = UTF8MB4;

-- -----------------------------------------------------
-- Table `northwind_staging_area`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind_staging_area`.`products` (
  `id` INT(11) NOT NULL,
  `product_code` VARCHAR(25) NULL DEFAULT NULL,
  `product_name` VARCHAR(50) NULL DEFAULT NULL,
  `standard_cost` DECIMAL(19,4) NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = UTF8MB4;

-- -----------------------------------------------------
-- Table `northwind_staging_area`.`order_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind_staging_area`.`order_details` (
  `id` INT(11) NOT NULL,
  `order_id` INT(11) NULL DEFAULT NULL,
  `product_id` INT(11) NULL DEFAULT NULL,
  `quantity` DECIMAL(18,4) NOT NULL DEFAULT '0.0000',
  `unit_price` DECIMAL(19,4) NULL DEFAULT '0.0000',
  `discount` DOUBLE NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_order_details_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `northwind_staging_area`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_details_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `northwind_staging_area`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = UTF8MB4;

