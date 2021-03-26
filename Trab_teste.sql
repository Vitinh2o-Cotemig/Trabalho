
CREATE SCHEMA IF NOT EXISTS `escola` DEFAULT CHARACTER SET utf8 ;
USE `escola` ;


CREATE TABLE IF NOT EXISTS `escola`.`aluno` (
`matricula` INT NOT NULL,
`nome` VARCHAR(45) NOT NULL,
PRIMARY KEY (`matricula`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `escola`.`professor` (
`ct` INT NOT NULL,
`nome` VARCHAR(45) NOT NULL,
PRIMARY KEY (`ct`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `escola`.`ensina` (
`professor_ct` INT NOT NULL,
`aluno_matricula` INT NOT NULL,
PRIMARY KEY (`professor_ct`, `aluno_matricula`),
INDEX `fk_professor_has_aluno_aluno1_idx` (`aluno_matricula` ASC),
INDEX `fk_professor_has_aluno_professor_idx` (`professor_ct` ASC),
CONSTRAINT `fk_professor_has_aluno_professor`
FOREIGN KEY (`professor_ct`)
REFERENCES `escola`.`professor` (`ct`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_professor_has_aluno_aluno1`
FOREIGN KEY (`aluno_matricula`)
REFERENCES `escola`.`aluno` (`matricula`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
