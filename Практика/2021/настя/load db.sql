CREATE TABLE IF NOT EXISTS semya (
  semya_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  children VARCHAR(45) NULL,
  PRIMARY KEY (semya_id));


CREATE TABLE IF NOT EXISTS work (
  work_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NULL,
  dolznost VARCHAR(45) NULL,
  PRIMARY KEY (work_id));


CREATE TABLE IF NOT EXISTS health (
  h_id INT NOT NULL AUTO_INCREMENT,
  bolezn VARCHAR(45) NULL,
  gruppa VARCHAR(45) NULL,
  PRIMARY KEY (h_id));


CREATE TABLE IF NOT EXISTS data_person (
  data_id INT NOT NULL AUTO_INCREMENT,
  passport INT NULL,
  snils INT NULL,
  polis INT NULL,
  data_personcol VARCHAR(45) NULL,
  PRIMARY KEY (data_id));


CREATE TABLE IF NOT EXISTS prizivniki (
  prizivnik_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NULL,
  surname VARCHAR(45) NULL,
  patronymic VARCHAR(45) NULL,
  birthday DATE NULL,
  growth INT NULL,
  weight INT NULL,
  phone VARCHAR(45) NULL,
  address VARCHAR(45) NULL,
  semya_id INT NOT NULL,
  work_work_id INT NOT NULL,
  health_h_id INT NOT NULL,
  data_person_data_id INT NOT NULL,
  PRIMARY KEY (prizivnik_id),
  CONSTRAINT fk_prizivniki_semya1
    FOREIGN KEY (semya_id)
    REFERENCES semya (semya_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (work_work_id)
    REFERENCES work (work_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (health_h_id)
    REFERENCES health (h_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (data_person_data_id)
    REFERENCES data_person (data_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS voenkom (
  voenkom_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NULL,
  address VARCHAR(45) NULL,
  phone VARCHAR(45) NULL,
  PRIMARY KEY (voenkom_id));


CREATE TABLE IF NOT EXISTS prizivniki_has_voenkom (
  priziv_id INT NOT NULL AUTO_INCREMENT,
  prizivnik_id INT NOT NULL,
  voenkom_id INT NOT NULL,
  date_conscription DATE NULL,
  yavka TINYINT NULL,
  time_conscription VARCHAR(45) NULL,
  PRIMARY KEY (priziv_id),
    FOREIGN KEY (prizivnik_id)
    REFERENCES prizivniki (prizivnik_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (voenkom_id)
    REFERENCES voenkom (voenkom_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
