-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema enjoytripv2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema enjoytripv2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `enjoytripv2` DEFAULT CHARACTER SET utf8mb3 ;
USE `enjoytripv2` ;

-- -----------------------------------------------------
-- Table `enjoytripv2`.`content_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enjoytripv2`.`content_type` (
  `content_type_id` INT NOT NULL,
  `content_type_name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`content_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `enjoytripv2`.`sido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enjoytripv2`.`sido` (
  `sido_code` INT NOT NULL,
  `sido_name` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`sido_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `enjoytripv2`.`gugun`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enjoytripv2`.`gugun` (
  `gugun_code` INT NOT NULL,
  `gugun_name` VARCHAR(30) NULL DEFAULT NULL,
  `sido_code` INT NOT NULL,
  PRIMARY KEY (`gugun_code`, `sido_code`),
  INDEX `gugun_to_sido_sido_code_fk_idx` (`sido_code` ASC) VISIBLE,
  CONSTRAINT `gugun_to_sido_sido_code_fk`
    FOREIGN KEY (`sido_code`)
    REFERENCES `enjoytripv2`.`sido` (`sido_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `enjoytripv2`.`attraction_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enjoytripv2`.`attraction_info` (
  `content_id` INT NOT NULL,
  `content_type_id` INT NULL DEFAULT NULL,
  `title` VARCHAR(100) NULL DEFAULT NULL,
  `addr1` VARCHAR(100) NULL DEFAULT NULL,
  `addr2` VARCHAR(50) NULL DEFAULT NULL,
  `zipcode` VARCHAR(50) NULL DEFAULT NULL,
  `tel` VARCHAR(50) NULL DEFAULT NULL,
  `first_image` VARCHAR(200) NULL DEFAULT NULL,
  `first_image2` VARCHAR(200) NULL DEFAULT NULL,
  `readcount` INT NULL DEFAULT NULL,
  `sido_code` INT NULL DEFAULT NULL,
  `gugun_code` INT NULL DEFAULT NULL,
  `latitude` DECIMAL(20,17) NULL DEFAULT NULL,
  `longitude` DECIMAL(20,17) NULL DEFAULT NULL,
  `mlevel` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`content_id`),
  INDEX `attraction_to_content_type_id_fk_idx` (`content_type_id` ASC) VISIBLE,
  INDEX `attraction_to_sido_code_fk_idx` (`sido_code` ASC) VISIBLE,
  INDEX `attraction_to_gugun_code_fk_idx` (`gugun_code` ASC) VISIBLE,
  CONSTRAINT `attraction_to_content_type_id_fk`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `enjoytripv2`.`content_type` (`content_type_id`),
  CONSTRAINT `attraction_to_gugun_code_fk`
    FOREIGN KEY (`gugun_code`)
    REFERENCES `enjoytripv2`.`gugun` (`gugun_code`),
  CONSTRAINT `attraction_to_sido_code_fk`
    FOREIGN KEY (`sido_code`)
    REFERENCES `enjoytripv2`.`sido` (`sido_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `enjoytripv2`.`attraction_description`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enjoytripv2`.`attraction_description` (
  `content_id` INT NOT NULL,
  `homepage` VARCHAR(100) NULL DEFAULT NULL,
  `overview` VARCHAR(10000) NULL DEFAULT NULL,
  `telname` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`content_id`),
  CONSTRAINT `attraction_detail_to_attraciton_id_fk`
    FOREIGN KEY (`content_id`)
    REFERENCES `enjoytripv2`.`attraction_info` (`content_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `enjoytripv2`.`attraction_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enjoytripv2`.`attraction_detail` (
  `content_id` INT NOT NULL,
  `cat1` VARCHAR(3) NULL DEFAULT NULL,
  `cat2` VARCHAR(5) NULL DEFAULT NULL,
  `cat3` VARCHAR(9) NULL DEFAULT NULL,
  `created_time` VARCHAR(14) NULL DEFAULT NULL,
  `modified_time` VARCHAR(14) NULL DEFAULT NULL,
  `booktour` VARCHAR(5) NULL DEFAULT NULL,
  PRIMARY KEY (`content_id`),
  CONSTRAINT `attraction_detail_to_basic_content_id_fk`
    FOREIGN KEY (`content_id`)
    REFERENCES `enjoytripv2`.`attraction_info` (`content_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `enjoytripv2`.`btype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enjoytripv2`.`btype` (
  `btype_no` INT NOT NULL AUTO_INCREMENT,
  `btype_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`btype_no`),
  UNIQUE INDEX `btype_no_UNIQUE` (`btype_no` ASC) VISIBLE,
  UNIQUE INDEX `btype_name_UNIQUE` (`btype_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `enjoytripv2`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enjoytripv2`.`user` (
  `user_no` INT NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(20) NOT NULL,
  `user_pw` VARCHAR(300) NOT NULL,
  `user_email` VARCHAR(45) NOT NULL,
  `user_nickname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_no`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `user_nickname_UNIQUE` (`user_nickname` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `enjoytripv2`.`plan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enjoytripv2`.`plan` (
  `plan_no` INT NOT NULL AUTO_INCREMENT,
  `user_no` INT NOT NULL,
  PRIMARY KEY (`plan_no`),
  UNIQUE INDEX `plan_no_UNIQUE` (`plan_no` ASC) VISIBLE,
  INDEX `user_to_plan_user_no_idx` (`user_no` ASC) VISIBLE,
  CONSTRAINT `user_to_plan_user_no`
    FOREIGN KEY (`user_no`)
    REFERENCES `enjoytripv2`.`user` (`user_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `enjoytripv2`.`board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enjoytripv2`.`board` (
  `board_no` INT NOT NULL AUTO_INCREMENT,
  `user_no` INT NOT NULL,
  `btype_no` INT NOT NULL,
  `board_title` VARCHAR(45) NOT NULL,
  `board_content` TEXT NULL DEFAULT NULL,
  `board_hit` INT NULL DEFAULT '0',
  `board_like_cnt` INT NULL DEFAULT '0',
  `board_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `plan_no` INT NULL DEFAULT NULL,
  PRIMARY KEY (`board_no`),
  UNIQUE INDEX `board_no_UNIQUE` (`board_no` ASC) VISIBLE,
  INDEX `btype_to_board_btype_no_idx` (`btype_no` ASC) VISIBLE,
  INDEX `user_to_boar_user_no_idx` (`user_no` ASC) VISIBLE,
  INDEX `plan_to_board_plan_no_idx` (`plan_no` ASC) VISIBLE,
  CONSTRAINT `btype_to_board_btype_no`
    FOREIGN KEY (`btype_no`)
    REFERENCES `enjoytripv2`.`btype` (`btype_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_to_boar_user_no`
    FOREIGN KEY (`user_no`)
    REFERENCES `enjoytripv2`.`user` (`user_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `plan_to_board_plan_no`
    FOREIGN KEY (`plan_no`)
    REFERENCES `enjoytripv2`.`plan` (`plan_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `enjoytripv2`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enjoytripv2`.`comment` (
  `comment_no` INT NOT NULL AUTO_INCREMENT,
  `user_no` INT NOT NULL,
  `board_no` INT NOT NULL,
  `coment_content` TEXT NOT NULL,
  `coment_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_no`),
  UNIQUE INDEX `comment_no_UNIQUE` (`comment_no` ASC) VISIBLE,
  INDEX `board_to_comment_board_no_idx` (`board_no` ASC) VISIBLE,
  INDEX `user_to_comment_user_no_idx` (`user_no` ASC) VISIBLE,
  CONSTRAINT `board_to_comment_board_no`
    FOREIGN KEY (`board_no`)
    REFERENCES `enjoytripv2`.`board` (`board_no`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `user_to_comment_user_no`
    FOREIGN KEY (`user_no`)
    REFERENCES `enjoytripv2`.`user` (`user_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `enjoytripv2`.`like`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enjoytripv2`.`like` (
  `like_no` INT NOT NULL AUTO_INCREMENT,
  `board_no` INT NOT NULL,
  `user_no` INT NOT NULL,
  PRIMARY KEY (`like_no`),
  UNIQUE INDEX `like_no_UNIQUE` (`like_no` ASC) VISIBLE,
  INDEX `board_to_like_board_no_idx` (`board_no` ASC) VISIBLE,
  INDEX `user_to_like_user_no_idx` (`user_no` ASC) VISIBLE,
  CONSTRAINT `board_to_like_board_no`
    FOREIGN KEY (`board_no`)
    REFERENCES `enjoytripv2`.`board` (`board_no`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `user_to_like_user_no`
    FOREIGN KEY (`user_no`)
    REFERENCES `enjoytripv2`.`user` (`user_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `enjoytripv2`.`plansequence`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enjoytripv2`.`plansequence` (
  `planSequence_no` INT NOT NULL AUTO_INCREMENT,
  `plan_no` INT NOT NULL,
  `content_id` INT NOT NULL,
  `sequence` INT NOT NULL,
  PRIMARY KEY (`planSequence_no`),
  INDEX `plan_to_plansequence_plan_no_idx` (`plan_no` ASC) VISIBLE,
  INDEX `attraction_info_to_plansequence_content_id_idx` (`content_id` ASC) VISIBLE,
  CONSTRAINT `plan_to_plansequence_plan_no`
    FOREIGN KEY (`plan_no`)
    REFERENCES `enjoytripv2`.`plan` (`plan_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `attraction_info_to_plansequence_content_id`
    FOREIGN KEY (`content_id`)
    REFERENCES `enjoytripv2`.`attraction_info` (`content_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
