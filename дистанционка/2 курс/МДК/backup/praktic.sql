-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema sdsdd
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`books` (
  `ISBN` INT NOT NULL,
  `book_name` VARCHAR(50) NOT NULL,
  `year_pub` INT NOT NULL,
  `num_pages` INT NOT NULL,
  PRIMARY KEY (`ISBN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`author` (
  `author_id` INT NOT NULL,
  `a_surname` VARCHAR(50) NOT NULL,
  `a_name` VARCHAR(50) NOT NULL,
  `a_patronymic` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`author_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`reader`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`reader` (
  `libcard_id` INT NOT NULL,
  `FIO` VARCHAR(100) NOT NULL,
  `address` VARCHAR(100) NULL,
  `phone_home` VARCHAR(12) NULL,
  `phone_work` VARCHAR(12) NULL,
  `birthday` DATE NULL,
  PRIMARY KEY (`libcard_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`sys_directory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`sys_directory` (
  `know_code` INT NOT NULL,
  `know_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`know_code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`instance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`instance` (
  `inventory_id` INT NOT NULL,
  `presence` VARCHAR(3) NOT NULL,
  `capture_date` DATE NOT NULL,
  `return_date` DATE NOT NULL,
  `reader_libcard_id` INT NOT NULL,
  `books_ISBN` INT NOT NULL,
  PRIMARY KEY (`inventory_id`),
  CONSTRAINT `fk_instance_reader1`
    FOREIGN KEY (`reader_libcard_id`)
    REFERENCES `mydb`.`reader` (`libcard_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_instance_books1`
    FOREIGN KEY (`books_ISBN`)
    REFERENCES `mydb`.`books` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`books_has_author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`books_has_author` (
  `books_ISBN` INT NOT NULL,
  `author_author_id` INT NOT NULL,
  PRIMARY KEY (`books_ISBN`, `author_author_id`),
  CONSTRAINT `fk_books_has_author_books1`
    FOREIGN KEY (`books_ISBN`)
    REFERENCES `mydb`.`books` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_books_has_author_author1`
    FOREIGN KEY (`author_author_id`)
    REFERENCES `mydb`.`author` (`author_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`books_has_sys_directory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`books_has_sys_directory` (
  `books_ISBN` INT NOT NULL,
  `sys_directory_know_code` INT NOT NULL,
  PRIMARY KEY (`books_ISBN`, `sys_directory_know_code`),
  CONSTRAINT `fk_books_has_sys_directory_books1`
    FOREIGN KEY (`books_ISBN`)
    REFERENCES `mydb`.`books` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_books_has_sys_directory_sys_directory1`
    FOREIGN KEY (`sys_directory_know_code`)
    REFERENCES `mydb`.`sys_directory` (`know_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
