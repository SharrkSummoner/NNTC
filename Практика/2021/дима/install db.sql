CREATE TABLE IF NOT EXISTS groups (
  group_id INT NOT NULL,
  name VARCHAR(45) NULL,
  PRIMARY KEY (group_id));

CREATE TABLE IF NOT EXISTS students (
  student_id INT NOT NULL,
  name VARCHAR(45) NULL,
  surname VARCHAR(45) NULL,
  patronymic VARCHAR(45) NULL,
  birthday DATE NULL,
  sex VARCHAR(45) NULL,
  group_id INT NOT NULL,
  PRIMARY KEY (student_id),
    FOREIGN KEY (group_id)
    REFERENCES groups (group_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS practice_curators (
  curator_id INT NOT NULL,
  name VARCHAR(45) NULL,
  surname VARCHAR(45) NULL,
  patronimyc VARCHAR(45) NULL,
  PRIMARY KEY (curator_id));

CREATE TABLE IF NOT EXISTS practice_type (
  type_id INT NOT NULL,
  name VARCHAR(45) NULL,
  PRIMARY KEY (type_id));

CREATE TABLE IF NOT EXISTS students_has_enterprice_practice (
  st_pe_id INT NOT NULL,
  student_id INT NOT NULL,
  enterprice VARCHAR(55) NULL,
  date_start DATE NULL,
  date_end DATE NULL,
  mark INT NULL,
  comment VARCHAR(300) NULL,
  curator_id INT NOT NULL,
  type_id INT NOT NULL,
  PRIMARY KEY (st_pe_id),
    FOREIGN KEY (student_id)
    REFERENCES students (student_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (curator_id)
    REFERENCES practice_curators (curator_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (type_id)
    REFERENCES practice_type (type_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
