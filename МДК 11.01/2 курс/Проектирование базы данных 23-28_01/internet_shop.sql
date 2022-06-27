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
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `id_user` INT NOT NULL,
  `Login` VARCHAR(45) NULL,
  `Password` INT NULL,
  `FIO` VARCHAR(100) NULL,
  `Address` VARCHAR(100) NULL,
  `Phone number` VARCHAR(45) NULL,
  `Birthday` DATE NULL,
  `Reg date` DATE NULL,
  `Gender` VARCHAR(7) NULL,
  PRIMARY KEY (`id_user`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Add photo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Add photo` (
  `id` INT NOT NULL,
  `Path to photo` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Product` (
  `Articul` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Cost` INT NULL,
  `Discount` INT NULL,
  `Вescription` VARCHAR(45) NULL,
  `Amount` INT NULL,
  `Weight` VARCHAR(45) NULL,
  `Warranty` VARCHAR(45) NULL,
  `id_suppliers` VARCHAR(45) NULL,
  `Photo` INT NOT NULL,
  PRIMARY KEY (`Articul`),
  INDEX `Product_Photo` (`Photo` ASC),
  CONSTRAINT `Product_Photo`
    FOREIGN KEY (`Photo`)
    REFERENCES `mydb`.`Add photo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Credit card`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Credit card` (
  `id_card` INT NOT NULL,
  `Card number` VARCHAR(45) NULL,
  `Name owner` VARCHAR(45) NULL,
  `CCV` INT NULL,
  `Date expiration` DATE NULL,
  `id_user` INT NOT NULL,
  PRIMARY KEY (`id_card`),
  INDEX `fk_Credit card_Пользователь1_idx` (`id_user` ASC),
  CONSTRAINT `fk_Credit card_Пользователь1`
    FOREIGN KEY (`id_user`)
    REFERENCES `mydb`.`User` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Web money`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Web money` (
  `id_wallet` INT NOT NULL,
  `Waller number` INT NULL,
  `Password wallet` INT NULL,
  `Name owner` VARCHAR(45) NULL,
  `id_user` INT NOT NULL,
  PRIMARY KEY (`id_wallet`),
  INDEX `fk_Электронные деньги_User1_idx` (`id_user` ASC),
  CONSTRAINT `fk_Электронные деньги_User1`
    FOREIGN KEY (`id_user`)
    REFERENCES `mydb`.`User` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Payment` (
  `Payment type` INT NOT NULL,
  `Credit card` INT NOT NULL,
  `Web money` INT NOT NULL,
  `Cach courier` INT NULL,
  `Cach receipt` INT NULL,
  PRIMARY KEY (`Payment type`),
  INDEX `fk_Оплата_Кредитная карта1_idx` (`Credit card` ASC),
  INDEX `fk_Оплата_Электронные деньги1_idx` (`Web money` ASC),
  CONSTRAINT `fk_Оплата_Кредитная карта1`
    FOREIGN KEY (`Credit card`)
    REFERENCES `mydb`.`Credit card` (`id_card`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Оплата_Электронные деньги1`
    FOREIGN KEY (`Web money`)
    REFERENCES `mydb`.`Web money` (`id_wallet`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Delivery` (
  `id_delivery` INT NOT NULL,
  `Date delivery` DATE NULL,
  `Time delivery` TIME NULL,
  `Cost delivery` INT NULL,
  `Weight` VARCHAR(45) NULL,
  `Delivery status` VARCHAR(45) NULL,
  `Delivery type` VARCHAR(45) NULL,
  PRIMARY KEY (`id_delivery`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Order` (
  `id_order` INT NOT NULL,
  `Date order` DATE NULL,
  `Time order` TIME NULL,
  `Cost` INT NULL,
  `Order status` VARCHAR(45) NULL,
  `Payment type` INT NOT NULL,
  `id_user` INT NOT NULL,
  `id_delivery` INT NOT NULL,
  PRIMARY KEY (`id_order`),
  INDEX `fk_Заказ_Оплата1_idx` (`Payment type` ASC),
  INDEX `fk_Order_Пользователь1_idx` (`id_user` ASC),
  INDEX `fk_Order_Delivery1_idx` (`id_delivery` ASC),
  CONSTRAINT `fk_Заказ_Оплата1`
    FOREIGN KEY (`Payment type`)
    REFERENCES `mydb`.`Payment` (`Payment type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Пользователь1`
    FOREIGN KEY (`id_user`)
    REFERENCES `mydb`.`User` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Delivery1`
    FOREIGN KEY (`id_delivery`)
    REFERENCES `mydb`.`Delivery` (`id_delivery`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Feedback`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Feedback` (
  `id_order` INT NOT NULL,
  `Articul` INT NOT NULL,
  `id_user` INT NOT NULL,
  `Feedback` VARCHAR(300) NULL,
  INDEX `fk_Обратная связь_Товар1_idx` (`Articul` ASC),
  INDEX `fk_Обратная связь_Заказ1_idx` (`id_order` ASC),
  INDEX `fk_Feedback_Пользователь1_idx` (`id_user` ASC),
  CONSTRAINT `fk_Обратная связь_Товар1`
    FOREIGN KEY (`Articul`)
    REFERENCES `mydb`.`Product` (`Articul`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Обратная связь_Заказ1`
    FOREIGN KEY (`id_order`)
    REFERENCES `mydb`.`Order` (`id_order`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Feedback_Пользователь1`
    FOREIGN KEY (`id_user`)
    REFERENCES `mydb`.`User` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Shopping cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Shopping cart` (
  `Articul` INT NOT NULL,
  `id_user` INT NOT NULL,
  `Amount` INT NULL,
  PRIMARY KEY (`Articul`, `id_user`),
  INDEX `fk_Корзина_Пользователь1_idx` (`id_user` ASC),
  INDEX `fk_Корзина_Товар1_idx` (`Articul` ASC),
  CONSTRAINT `fk_Корзина_Пользователь1`
    FOREIGN KEY (`id_user`)
    REFERENCES `mydb`.`User` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Корзина_Товар1`
    FOREIGN KEY (`Articul`)
    REFERENCES `mydb`.`Product` (`Articul`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Product order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Product order` (
  `Articul` INT NOT NULL,
  `id_order` INT NOT NULL,
  `Amount` INT NULL,
  PRIMARY KEY (`Articul`, `id_order`),
  INDEX `Product_orders1` (`id_order` ASC),
  INDEX `fk_Товар_has_Заказ_Товар1_idx` (`Articul` ASC),
  CONSTRAINT `fk_Товар_has_Заказ_Товар1`
    FOREIGN KEY (`Articul`)
    REFERENCES `mydb`.`Product` (`Articul`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Товар_has_Заказ_Заказ1`
    FOREIGN KEY (`id_order`)
    REFERENCES `mydb`.`Order` (`id_order`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Catalog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Catalog` (
  `id_catalog` INT NOT NULL,
  `Type` VARCHAR(45) NULL,
  `Date` DATE NULL,
  PRIMARY KEY (`id_catalog`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sale` (
  `id_sale` INT NOT NULL,
  `name sale` VARCHAR(45) NULL,
  `Sale start` DATE NULL,
  `Sale end` DATE NULL,
  PRIMARY KEY (`id_sale`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Subcatalog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Subcatalog` (
  `id_catalog` INT NOT NULL,
  `Name` INT NOT NULL,
  `Articul` INT NOT NULL,
  `Type` VARCHAR(45) NULL,
  `Date` DATE NULL,
  PRIMARY KEY (`id_catalog`, `Name`, `Articul`),
  INDEX `catalog_subcatalog` (`Name` ASC),
  INDEX `subcatalog_product` (`Articul` ASC),
  CONSTRAINT `catalog_subcatalog`
    FOREIGN KEY (`Name`)
    REFERENCES `mydb`.`Catalog` (`id_catalog`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `subcatalog_product`
    FOREIGN KEY (`Articul`)
    REFERENCES `mydb`.`Product` (`Articul`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Product sale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Product sale` (
  `Articul` INT NOT NULL,
  `id_sale` INT NOT NULL,
  INDEX `fk_Product_has_Акции_Акции1_idx` (`id_sale` ASC),
  INDEX `fk_Product_has_Акции_Product1_idx` (`Articul` ASC),
  CONSTRAINT `fk_Product_has_Акции_Product1`
    FOREIGN KEY (`Articul`)
    REFERENCES `mydb`.`Product` (`Articul`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_has_Акции_Акции1`
    FOREIGN KEY (`id_sale`)
    REFERENCES `mydb`.`Sale` (`id_sale`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;