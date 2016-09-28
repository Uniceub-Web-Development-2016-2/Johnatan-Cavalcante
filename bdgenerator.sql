SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`user` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`user` (
  `idt_user` INT NOT NULL AUTO_INCREMENT ,
  `nme_user` VARCHAR(80) NOT NULL ,
  `cpf_user` VARCHAR(11) NOT NULL ,
  `eml_user` VARCHAR(80) NOT NULL ,
  `pwd_user` VARCHAR(128) NOT NULL ,
  `prf_user` INT NOT NULL ,
  PRIMARY KEY (`idt_user`) ,
  UNIQUE INDEX `idtb_user_UNIQUE` (`idt_user` ASC) ,
  UNIQUE INDEX `cpf_user_UNIQUE` (`cpf_user` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`aeronave`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`aeronave` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`aeronave` (
  `idt_aeronave` INT NOT NULL AUTO_INCREMENT ,
  `nme_aeronave` VARCHAR(80) NOT NULL ,
  `num_assentos` INT NOT NULL ,
  PRIMARY KEY (`idt_aeronave`) ,
  UNIQUE INDEX `idt_aeronave_UNIQUE` (`idt_aeronave` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`empresa_aerea`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`empresa_aerea` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`empresa_aerea` (
  `idt_empresa_aerea` INT NOT NULL AUTO_INCREMENT ,
  `nme_empresa` VARCHAR(80) NOT NULL ,
  `sgl_empresa` VARCHAR(30) NOT NULL ,
  PRIMARY KEY (`idt_empresa_aerea`) ,
  UNIQUE INDEX `idt_empresas_aereas_UNIQUE` (`idt_empresa_aerea` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`pais` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`pais` (
  `idt_pais` INT NOT NULL AUTO_INCREMENT ,
  `nme_pais` VARCHAR(80) NOT NULL ,
  PRIMARY KEY (`idt_pais`) ,
  UNIQUE INDEX `idt_pais_UNIQUE` (`idt_pais` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`cidade` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`cidade` (
  `idt_cidade` INT NOT NULL AUTO_INCREMENT ,
  `nme_cidade` VARCHAR(80) NOT NULL ,
  `sgl_cidade` VARCHAR(30) NOT NULL ,
  PRIMARY KEY (`idt_cidade`) ,
  UNIQUE INDEX `idt_cidade_UNIQUE` (`idt_cidade` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`estado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`estado` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`estado` (
  `idt_estado` INT NOT NULL AUTO_INCREMENT ,
  `sgl_estado` VARCHAR(30) NOT NULL ,
  PRIMARY KEY (`idt_estado`) ,
  UNIQUE INDEX `idt_estado_UNIQUE` (`idt_estado` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`aeroporto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`aeroporto` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`aeroporto` (
  `idtb_aeroporto` INT NOT NULL AUTO_INCREMENT ,
  `nme_aeroporto` VARCHAR(80) NOT NULL ,
  `sgl_aeroporto` VARCHAR(30) NOT NULL ,
  `pais_idt_pais` INT NOT NULL ,
  `cidade_idt_cidade` INT NOT NULL ,
  `estado_idt_estado` INT NOT NULL ,
  PRIMARY KEY (`idtb_aeroporto`) ,
  UNIQUE INDEX `idtb_aeroporto_UNIQUE` (`idtb_aeroporto` ASC) ,
  INDEX `fk_aeroporto_pais1` (`pais_idt_pais` ASC) ,
  INDEX `fk_aeroporto_cidade1` (`cidade_idt_cidade` ASC) ,
  INDEX `fk_aeroporto_estado1` (`estado_idt_estado` ASC) ,
  CONSTRAINT `fk_aeroporto_pais1`
    FOREIGN KEY (`pais_idt_pais` )
    REFERENCES `mydb`.`pais` (`idt_pais` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aeroporto_cidade1`
    FOREIGN KEY (`cidade_idt_cidade` )
    REFERENCES `mydb`.`cidade` (`idt_cidade` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aeroporto_estado1`
    FOREIGN KEY (`estado_idt_estado` )
    REFERENCES `mydb`.`estado` (`idt_estado` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`voo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`voo` ;

CREATE  TABLE IF NOT EXISTS `mydb`.`voo` (
  `idt_voo` INT NOT NULL AUTO_INCREMENT ,
  `aeroporto_idtb_aeroporto_origem` INT NOT NULL ,
  `aeroporto_idtb_aeroporto_destino` INT NOT NULL ,
  `hra_partida` TIME NOT NULL ,
  `empresa_aerea_idt_empresa_aerea` INT NOT NULL ,
  `num_numero_voo` INT NOT NULL ,
  `aeronave_idt_aeronave` INT NOT NULL ,
  `num_assentos_por_semana` INT NOT NULL ,
  PRIMARY KEY (`idt_voo`) ,
  UNIQUE INDEX `idt_voo_UNIQUE` (`idt_voo` ASC) ,
  INDEX `fk_voo_empresa_aerea1` (`empresa_aerea_idt_empresa_aerea` ASC) ,
  INDEX `fk_voo_aeronave1` (`aeronave_idt_aeronave` ASC) ,
  INDEX `fk_voo_aeroporto1` (`aeroporto_idtb_aeroporto_origem` ASC) ,
  INDEX `fk_voo_aeroporto2` (`aeroporto_idtb_aeroporto_destino` ASC) ,
  CONSTRAINT `fk_voo_empresa_aerea1`
    FOREIGN KEY (`empresa_aerea_idt_empresa_aerea` )
    REFERENCES `mydb`.`empresa_aerea` (`idt_empresa_aerea` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_voo_aeronave1`
    FOREIGN KEY (`aeronave_idt_aeronave` )
    REFERENCES `mydb`.`aeronave` (`idt_aeronave` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_voo_aeroporto1`
    FOREIGN KEY (`aeroporto_idtb_aeroporto_origem` )
    REFERENCES `mydb`.`aeroporto` (`idtb_aeroporto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_voo_aeroporto2`
    FOREIGN KEY (`aeroporto_idtb_aeroporto_destino` )
    REFERENCES `mydb`.`aeroporto` (`idtb_aeroporto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
