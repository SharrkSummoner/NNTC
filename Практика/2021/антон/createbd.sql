CREATE TABLE IF NOT EXISTS motherboard (
  mother_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NULL,
  price DECIMAL(6,2) NULL,
  date_build DATE NULL,
  date_guarantee_end DATE NULL,
  PRIMARY KEY (mother_id))
;

CREATE TABLE IF NOT EXISTS viedocard (
  video_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NULL,
  price DECIMAL(6,2) NULL,
  date_build DATE NULL,
  date_guarantee_end DATE NULL,
  PRIMARY KEY (video_id))
;

CREATE TABLE IF NOT EXISTS RAM (
  ram_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NULL,
  price DECIMAL(6,2) NULL,
  date_build DATE NULL,
  date_guarantee_end DATE NULL,
  PRIMARY KEY (ram_id))
;

CREATE TABLE IF NOT EXISTS ROM (
  rom_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NULL,
  price DECIMAL(6,2) NULL,
  date_build DATE NULL,
  date_guarantee_end DATE NULL,
  PRIMARY KEY (rom_id))
;

CREATE TABLE IF NOT EXISTS CPU (
  cpu_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NULL,
  price DECIMAL(6,2) NULL,
  date_build DATE NULL,
  date_guarantee_end DATE NULL,
  PRIMARY KEY (cpu_id))
;

CREATE TABLE IF NOT EXISTS peripherials (
  perif_id INT NOT NULL AUTO_INCREMENT,
  audio_card VARCHAR(45) NULL,
  network_card DECIMAL(6,2) NULL,
  wifi DATE NULL,
  bluetooth DATE NULL,
  PRIMARY KEY (perif_id))
;

CREATE TABLE IF NOT EXISTS computers (
  comp_id INT NOT NULL AUTO_INCREMENT,
  date_build DATE NULL,
  date_guarantee_end DATE NULL,
  motherboard_mother_id INT NOT NULL,
  viedocard_video_id INT NOT NULL,
  RAM_ram_id INT NOT NULL,
  ROM_rom_id INT NOT NULL,
  CPU_cpu_id INT NOT NULL,
  peripherials_perif_id INT NOT NULL,
  PRIMARY KEY (comp_id),
    FOREIGN KEY (motherboard_mother_id)
    REFERENCES motherboard (mother_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (viedocard_video_id)
    REFERENCES viedocard (video_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (RAM_ram_id)
    REFERENCES RAM (ram_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (ROM_rom_id)
    REFERENCES ROM (rom_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (CPU_cpu_id)
    REFERENCES CPU (cpu_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (peripherials_perif_id)
    REFERENCES peripherials (perif_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE TABLE IF NOT EXISTS software_type (
  type_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NULL,
  PRIMARY KEY (type_id))
;

CREATE TABLE IF NOT EXISTS audiences (
  audience_id INT NOT NULL, AUTO_INCREMENT
  floor INT NULL,
  PRIMARY KEY (audience_id))
;

CREATE TABLE IF NOT EXISTS softwares (
  soft_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NULL,
  price DECIMAL(6,2) NULL,
  developer VARCHAR(45) NULL,
  language VARCHAR(45) NULL,
  type_id INT NOT NULL,
  audience_id INT NOT NULL,
  PRIMARY KEY (soft_id),
    FOREIGN KEY (type_id)
    REFERENCES software_type (type_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (audience_id)
    REFERENCES audiences (audience_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE TABLE IF NOT EXISTS computers_has_softwares (
  comp_id INT NOT NULL,
  soft_id INT NOT NULL,
  date_install DATE NULL,
  date_expiration DATE NULL,
  version VARCHAR(45) NULL,
  activation_key VARCHAR(120) NULL,
    FOREIGN KEY (comp_id)
    REFERENCES computers (comp_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (soft_id)
    REFERENCES softwares (soft_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE TABLE IF NOT EXISTS lecturers (
  lecturer_id INT NOT NULL AUTO_INCREMENT,
  FIO VARCHAR(45) NULL,
  PRIMARY KEY (lecturer_id))
;

CREATE TABLE IF NOT EXISTS lecturers_has_audiences (
  lecturer_id INT NOT NULL,
  audience_id INT NOT NULL,
    FOREIGN KEY (lecturer_id)
    REFERENCES lecturers (lecturer_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (audience_id)
    REFERENCES audiences (audience_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;