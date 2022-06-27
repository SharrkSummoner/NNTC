
-- -----------------------------------------------------
-- Table `asasa`.`Пользователь`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `asasa`.`Пользователь` (
  `Логин` INT NOT NULL,
  `Пароль` INT NULL,
  `ФИО` VARCHAR(100) NULL,
  `Адрес` VARCHAR(100) NULL,
  `Номер телефона` VARCHAR(45) NULL,
  `Дата рождения` DATE NULL,
  `Дата регистрации` DATE NULL,
  `Пол` VARCHAR(7) NULL,
  PRIMARY KEY (`Логин`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `asasa`.`Распродажа`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `asasa`.`Распродажа` (
  `Скидка на распродаже` INT NOT NULL,
  `Нзвание распродажи` INT NULL,
  PRIMARY KEY (`Скидка на распродаже`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `asasa`.`Дополнительный параметр`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `asasa`.`Дополнительный параметр` (
  `Дополнительный параметр` VARCHAR(100) NOT NULL,
  `Новинка` TINYINT NULL,
  `Хит продаж` TINYINT NULL,
  PRIMARY KEY (`Дополнительный параметр`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `asasa`.`Акции`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `asasa`.`Акции` (
  `Номер акции` INT NOT NULL,
  `Название акции` VARCHAR(45) NULL,
  `Дата начала` VARCHAR(45) NULL,
  `Дата окончания` VARCHAR(45) NULL,
  `Скидка` VARCHAR(45) NULL,
  PRIMARY KEY (`Номер акции`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `asasa`.`Работник`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `asasa`.`Работник` (
  `Номер работника` INT NOT NULL,
  `ФИО` VARCHAR(45) NULL,
  `Телефон` VARCHAR(45) NULL,
  `Должность` VARCHAR(45) NULL,
  PRIMARY KEY (`Номер работника`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `asasa`.`Самовывоз` (
  `Номер пункта` INT NOT NULL,
  `Адрес` VARCHAR(45) NULL,
  `Дни работы` VARCHAR(45) NULL,
  `Время работы` VARCHAR(45) NULL,
  `Телефон` VARCHAR(45) NULL,
  PRIMARY KEY (`Номер пункта`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `asasa`.`Способ получения`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `asasa`.`Способ получения` (
  `Способ получения` INT NOT NULL,
  `Доставка` VARCHAR(45) NULL,
  `Пункт самовывоза` INT NOT NULL,
  PRIMARY KEY (`Способ получения`),
  INDEX `fk_Способ получения_Самовывоз1_idx` (`Пункт самовывоза` ASC) VISIBLE,
  CONSTRAINT `fk_Способ получения_Самовывоз1`
    FOREIGN KEY (`Пункт самовывоза`)
    REFERENCES `asasa`.`Самовывоз` (`Номер пункта`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `asasa`.`Кредитная карта`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `asasa`.`Кредитная карта` (
  `Номер карты` INT NOT NULL,
  `Имя владельца` VARCHAR(45) NULL,
  `ССV код` INT NULL,
  `Срок истечения` DATE NULL,
  `Логин` INT NOT NULL,
  PRIMARY KEY (`Номер карты`, `Логин`),
  INDEX `fk_Кредитная карта_Пользователь1_idx` (`Логин` ASC) VISIBLE,
  CONSTRAINT `fk_Кредитная карта_Пользователь1`
    FOREIGN KEY (`Логин`)
    REFERENCES `asasa`.`Пользователь` (`Логин`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `asasa`.`Электронные деньги`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `asasa`.`Электронные деньги` (
  `Номер кошелька` INT NOT NULL,
  `Пароль кошелька` INT NULL,
  `Имя владельца` VARCHAR(45) NULL,
  `Код подтверждения` INT NULL,
  `Логин` INT NOT NULL,
  PRIMARY KEY (`Номер кошелька`, `Логин`),
  INDEX `fk_Электронные деньги_Пользовате_idx` (`Логин` ASC) VISIBLE,
  CONSTRAINT `fk_Электронные деньги_Пользовател1`
    FOREIGN KEY (`Логин`)
    REFERENCES `asasa`.`Пользователь` (`Логин`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `asasa`.`Заказ`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `asasa`.`Заказ` (
  `Номер заказа` INT NOT NULL,
  `Дата заказа` DATE NULL,
  `Время заказа` TIME NULL,
  `Стоимость заказа` INT NULL,
  `Статус заказа` VARCHAR(45) NULL,
  `Логин` INT NOT NULL,
  `Способ оплаты` INT NOT NULL,
  PRIMARY KEY (`Номер заказа`, `Логин`, `Способ оплаты`),
  INDEX `fk_Заказ_Пользователь1_idx` (`Логин` ASC) VISIBLE,
  INDEX `fk_Заказ_Оплата1_idx` (`Способ оплаты` ASC) VISIBLE,
  CONSTRAINT `fk_Заказ_Пользователь1`
    FOREIGN KEY (`Логин`)
    REFERENCES `asasa`.`Пользователь` (`Логин`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Заказ_Оплата1`
    FOREIGN KEY (`Способ оплаты`)
    REFERENCES `asasa`.`Оплата` (`Способы оплаты`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `asasa`.`Доставка`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `asasa`.`Доставка` (
  `Номер заказа` INT NOT NULL,
  `Дата доставки` DATE NULL,
  `Время доставки` TIME NULL,
  `Стоимость доставки` INT NULL,
  `Вес заказа` VARCHAR(45) NULL,
  `Статус доставки` VARCHAR(45) NULL,
  `Номер работника` INT NOT NULL,
  `Вид доставки` INT NOT NULL,
  `Заказ_Логин` INT NOT NULL,
  `Заказ_Способ оплаты` INT NOT NULL,
  PRIMARY KEY (`Номер заказа`, `Номер работника`, `Вид доставки`, `Заказ_Логин`, `Заказ_Способ оплаты`),
  INDEX `fk_Доставка_Работник1_idx` (`Номер работника` ASC) VISIBLE,
  INDEX `fk_Доставка_Способ получения1_idx` (`Вид доставки` ASC) VISIBLE,
  INDEX `fk_Доставка_Заказ1_idx` (`Номер заказа` ASC, `Заказ_Логин` ASC, `Заказ_Способ оплаты` ASC) VISIBLE,
  CONSTRAINT `fk_Доставка_Работник1`
    FOREIGN KEY (`Номер работника`)
    REFERENCES `asasa`.`Работник` (`Номер работника`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Доставка_Способ получения1`
    FOREIGN KEY (`Вид доставки`)
    REFERENCES `asasa`.`Способ получения` (`Способ получения`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Доставка_Заказ1`
    FOREIGN KEY (`Номер заказа` , `Заказ_Логин` , `Заказ_Способ оплаты`)
    REFERENCES `asasa`.`Заказ` (`Номер заказа` , `Логин` , `Способ оплаты`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `asasa`.`Обратная связь`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `asasa`.`Обратная связь` (
  `Номер заказа` INT NOT NULL,
  `Логин` INT NOT NULL,
  `Артикул` INT NOT NULL,
  `Способ оплаты` INT NOT NULL,
  `Отзыв` VARCHAR(300) NULL,
  PRIMARY KEY (`Номер заказа`, `Логин`, `Артикул`, `Способ оплаты`),
  INDEX `fk_Обратная связь_Товар1_idx` (`Артикул` ASC) VISIBLE,
  INDEX `fk_Обратная связь_Заказ1_idx` (`Номер заказа` ASC, `Логин` ASC, `Способ оплаты` ASC) VISIBLE,
  CONSTRAINT `fk_Обратная связь_Товар1`
    FOREIGN KEY (`Артикул`)
    REFERENCES `asasa`.`Товар` (`Артикул`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Обратная связь_Заказ1`
    FOREIGN KEY (`Номер заказа` , `Логин` , `Способ оплаты`)
    REFERENCES `asasa`.`Заказ` (`Номер заказа` , `Логин` , `Способ оплаты`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `asasa`.`Корзина`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `asasa`.`Корзина` (
  `Артикул` INT NOT NULL,
  `Логин` INT NOT NULL,
  `Количество товаров` INT NULL,
  PRIMARY KEY (`Артикул`, `Логин`),
  INDEX `fk_Корзина_Пользователь1_idx` (`Логин` ASC) VISIBLE,
  INDEX `fk_Корзина_Товар1_idx` (`Артикул` ASC) VISIBLE,
  CONSTRAINT `fk_Корзина_Пользователь1`
    FOREIGN KEY (`Логин`)
    REFERENCES `asasa`.`Пользователь` (`Логин`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Корзина_Товар1`
    FOREIGN KEY (`Артикул`)
    REFERENCES `asasa`.`Товар` (`Артикул`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `asasa`.`Товар_has_Заказ`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `asasa`.`Товар_has_Заказ` (
  `Товар_Артикул` INT NOT NULL,
  `Заказ_Номер заказа` INT NOT NULL,
  `Заказ_Логин` INT NOT NULL,
  `Заказ_Способ оплаты` INT NOT NULL,
  PRIMARY KEY (`Товар_Артикул`, `Заказ_Номер заказа`, `Заказ_Логин`, `Заказ_Способ оплаты`),
  INDEX `fk_Товар_has_Заказ_Заказ1_idx` (`Заказ_Номер заказа` ASC, `Заказ_Логин` ASC, `Заказ_Способ оплаты` ASC) VISIBLE,
  INDEX `fk_Товар_has_Заказ_Товар1_idx` (`Товар_Артикул` ASC) VISIBLE,
  CONSTRAINT `fk_Товар_has_Заказ_Товар1`
    FOREIGN KEY (`Товар_Артикул`)
    REFERENCES `asasa`.`Товар` (`Артикул`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Товар_has_Заказ_Заказ1`
    FOREIGN KEY (`Заказ_Номер заказа` , `Заказ_Логин` , `Заказ_Способ оплаты`)
    REFERENCES `asasa`.`Заказ` (`Номер заказа` , `Логин` , `Способ оплаты`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `asasa`.`Подкаталог_2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `asasa`.`Подкаталог_2` (
  `Настольные игры` INT NOT NULL,
  `Товар_Артикул` INT NOT NULL,
  PRIMARY KEY (`Настольные игры`),
  INDEX `fk_Подкаталог_2_Товар5_idx` (`Товар_Артикул` ASC) VISIBLE,
  CONSTRAINT `fk_Подкаталог_2_Товар5`
    FOREIGN KEY (`Товар_Артикул`)
    REFERENCES `asasa`.`Товар` (`Артикул`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `asasa`.`Подкаталог_2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `asasa`.`Подкаталог_2` (
  `Настольные игры` INT NOT NULL,
  `Товар_Артикул` INT NOT NULL,
  PRIMARY KEY (`Настольные игры`),
  INDEX `fk_Подкаталог_2_Товар5_idx` (`Товар_Артикул` ASC) VISIBLE,
  CONSTRAINT `fk_Подкаталог_2_Товар5`
    FOREIGN KEY (`Товар_Артикул`)
    REFERENCES `asasa`.`Товар` (`Артикул`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `asasa`.`Подкаталог`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `asasa`.`Подкаталог` (
  `Игрушки` INT NOT NULL,
  `Мягкие игрушки` INT NOT NULL,
  `Настольные игры` INT NOT NULL,
  PRIMARY KEY (`Игрушки`),
  INDEX `fk_Подкаталог_Подкаталог_21_idx` (`Мягкие игрушки` ASC) VISIBLE,
  INDEX `fk_Подкаталог_Подкаталог_22_idx` (`Настольные игры` ASC) VISIBLE,
  CONSTRAINT `fk_Подкаталог_Подкаталог_21`
    FOREIGN KEY (`Мягкие игрушки`)
    REFERENCES `asasa`.`Подкаталог_2` (`Мягкие игрушки`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Подкаталог_Подкаталог_22`
    FOREIGN KEY (`Настольные игры`)
    REFERENCES `asasa`.`Подкаталог_2` (`Настольные игры`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `asasa`.`Подкаталог_2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `asasa`.`Подкаталог_2` (
  `Настольные игры` INT NOT NULL,
  `Товар_Артикул` INT NOT NULL,
  PRIMARY KEY (`Настольные игры`),
  INDEX `fk_Подкаталог_2_Товар5_idx` (`Товар_Артикул` ASC) VISIBLE,
  CONSTRAINT `fk_Подкаталог_2_Товар5`
    FOREIGN KEY (`Товар_Артикул`)
    REFERENCES `asasa`.`Товар` (`Артикул`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `asasa`.`Подкаталог_2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `asasa`.`Подкаталог_2` (
  `Настольные игры` INT NOT NULL,
  `Товар_Артикул` INT NOT NULL,
  PRIMARY KEY (`Настольные игры`),
  INDEX `fk_Подкаталог_2_Товар5_idx` (`Товар_Артикул` ASC) VISIBLE,
  CONSTRAINT `fk_Подкаталог_2_Товар5`
    FOREIGN KEY (`Товар_Артикул`)
    REFERENCES `asasa`.`Товар` (`Артикул`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `asasa`.`Подкаталог`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `asasa`.`Подкаталог` (
  `Игрушки` INT NOT NULL,
  `Мягкие игрушки` INT NOT NULL,
  `Настольные игры` INT NOT NULL,
  PRIMARY KEY (`Игрушки`),
  INDEX `fk_Подкаталог_Подкаталог_21_idx` (`Мягкие игрушки` ASC) VISIBLE,
  INDEX `fk_Подкаталог_Подкаталог_22_idx` (`Настольные игры` ASC) VISIBLE,
  CONSTRAINT `fk_Подкаталог_Подкаталог_21`
    FOREIGN KEY (`Мягкие игрушки`)
    REFERENCES `asasa`.`Подкаталог_2` (`Мягкие игрушки`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Подкаталог_Подкаталог_22`
    FOREIGN KEY (`Настольные игры`)
    REFERENCES `asasa`.`Подкаталог_2` (`Настольные игры`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `asasa`.`Подкаталог_2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `asasa`.`Подкаталог_2` (
  `Настольные игры` INT NOT NULL,
  `Товар_Артикул` INT NOT NULL,
  PRIMARY KEY (`Настольные игры`),
  INDEX `fk_Подкаталог_2_Товар5_idx` (`Товар_Артикул` ASC) VISIBLE,
  CONSTRAINT `fk_Подкаталог_2_Товар5`
    FOREIGN KEY (`Товар_Артикул`)
    REFERENCES `asasa`.`Товар` (`Артикул`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `asasa`.`Подкаталог_2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `asasa`.`Подкаталог_2` (
  `Настольные игры` INT NOT NULL,
  `Товар_Артикул` INT NOT NULL,
  PRIMARY KEY (`Настольные игры`),
  INDEX `fk_Подкаталог_2_Товар5_idx` (`Товар_Артикул` ASC) VISIBLE,
  CONSTRAINT `fk_Подкаталог_2_Товар5`
    FOREIGN KEY (`Товар_Артикул`)
    REFERENCES `asasa`.`Товар` (`Артикул`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `asasa`.`Подкаталог`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `asasa`.`Подкаталог` (
  `Игрушки` INT NOT NULL,
  `Мягкие игрушки` INT NOT NULL,
  `Настольные игры` INT NOT NULL,
  PRIMARY KEY (`Игрушки`),
  INDEX `fk_Подкаталог_Подкаталог_21_idx` (`Мягкие игрушки` ASC) VISIBLE,
  INDEX `fk_Подкаталог_Подкаталог_22_idx` (`Настольные игры` ASC) VISIBLE,
  CONSTRAINT `fk_Подкаталог_Подкаталог_21`
    FOREIGN KEY (`Мягкие игрушки`)
    REFERENCES `asasa`.`Подкаталог_2` (`Мягкие игрушки`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Подкаталог_Подкаталог_22`
    FOREIGN KEY (`Настольные игры`)
    REFERENCES `asasa`.`Подкаталог_2` (`Настольные игры`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `asasa`.`Каталог`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `asasa`.`Каталог` (
  `Каталог` INT NOT NULL,
  `Электронника` INT NOT NULL,
  `Одежда` INT NOT NULL,
  `Игрушки` INT NOT NULL,
  PRIMARY KEY (`Каталог`),
  INDEX `fk_Каталог_Подкаталог11_idx` (`Электронника` ASC) VISIBLE,
  INDEX `fk_Каталог_Подкаталог21_idx` (`Одежда` ASC) VISIBLE,
  INDEX `fk_Каталог_Подкаталог31_idx` (`Игрушки` ASC) VISIBLE,
  CONSTRAINT `fk_Каталог_Подкаталог11`
    FOREIGN KEY (`Электронника`)
    REFERENCES `asasa`.`Подкаталог` (`Электроника`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Каталог_Подкаталог21`
    FOREIGN KEY (`Одежда`)
    REFERENCES `asasa`.`Подкаталог` (`Одежда`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Каталог_Подкаталог31`
    FOREIGN KEY (`Игрушки`)
    REFERENCES `asasa`.`Подкаталог` (`Игрушки`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `asasa`.`Товар` (
  `Артикул` INT NOT NULL,
  `Название товара` VARCHAR(45) NULL,
  `Цена товара` INT NULL,
  `Скидка на рспродаже` INT NOT NULL,
  `Описание` VARCHAR(45) NULL,
  `Кол-во на складе` INT NULL,
  `Вес товара` VARCHAR(45) NULL,
  `Гарантия` VARCHAR(45) NULL,
  `Основное фото` BLOB NULL,
  `Дополнительные фото` BLOB NULL,
  `Дополнительный параметр` VARCHAR(100) NOT NULL,
  `Номер акции` INT NOT NULL,
  PRIMARY KEY (`Артикул`),
  INDEX `fk_Товар_Распродажа1_idx` (`Скидка на рспродаже` ASC) VISIBLE,
  INDEX `fk_Товар_Дополнительный параметр_idx` (`Дополнительный параметр` ASC) VISIBLE,
  INDEX `fk_Товар_Акции1_idx` (`Номер акции` ASC) VISIBLE,
  CONSTRAINT `fk_Товар_Распродажа1`
    FOREIGN KEY (`Скидка на рспродаже`)
    REFERENCES `asasa`.`Распродажа` (`Скидка на распродаже`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Товар_Дополнительный параметр1`
    FOREIGN KEY (`Дополнительный параметр`)
    REFERENCES `asasa`.`Дополнительный параметр` (`Дополнительный параметр`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Товар_Акции1`
    FOREIGN KEY (`Номер акции`)
    REFERENCES `asasa`.`Акции` (`Номер акции`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `asasa`.`Оплата` (
  `Способы оплаты` INT NOT NULL,
  `Кредитная карта` INT NOT NULL,
  `Электронные деньги` INT NOT NULL,
  `Наличными курьеру` INT NULL,
  `Наличными при получении (почта)` INT NULL,
  PRIMARY KEY (`Способы оплаты`),
  INDEX `fk_Оплата_Кредитная карта1_idx` (`Кредитная карта` ASC) VISIBLE,
  INDEX `fk_Оплата_Электронные деньги1_idx` (`Электронные деньги` ASC) VISIBLE,
  CONSTRAINT `fk_Оплата_Кредитная карта1`
    FOREIGN KEY (`Кредитная карта`)
    REFERENCES `asasa`.`Кредитная карта` (`Номер карты`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Оплата_Электронные деньги1`
    FOREIGN KEY (`Электронные деньги`)
    REFERENCES `asasa`.`Электронные деньги` (`Номер кошелька`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
