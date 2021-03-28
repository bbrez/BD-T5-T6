-- -----------------------------------------------------
-- Schema trabbd5
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `trabbd5`;
CREATE SCHEMA IF NOT EXISTS `trabbd5` DEFAULT CHARACTER SET utf8 ;
USE `trabbd5` ;


-- -----------------------------------------------------
-- Table `UnidadeFederaçao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UnidadeFederativa` CASCADE;

CREATE TABLE IF NOT EXISTS `UnidadeFederativa` (
    `siglaUF` VARCHAR(5) NOT NULL,
    `nomeUF` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`siglaUF`)
);


-- -----------------------------------------------------
-- Table `Cidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Cidade` CASCADE;

CREATE TABLE IF NOT EXISTS  `Cidade` (
    `idCidade` INT NOT NULL AUTO_INCREMENT,
    `nomeCidade` VARCHAR(45) NOT NULL,
    `UnidadeFederativa_siglaUF` VARCHAR(5) NOT NULL,
    PRIMARY KEY (`idCidade`),
    FOREIGN KEY (`UnidadeFederativa_siglaUF`) REFERENCES `UnidadeFederativa`(`siglaUF`)
);


-- -----------------------------------------------------
-- Table `Bairro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bairro` CASCADE;


CREATE TABLE IF NOT EXISTS `Bairro` (
    `idBairro` INT NOT NULL AUTO_INCREMENT,
    `nomeBairro` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`idBairro`)
);

-- -----------------------------------------------------
-- Table `TipoLogradouro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TipoLogradouro` CASCADE;


CREATE TABLE IF NOT EXISTS `TipoLogradouro` (
    `siglaTipoLogradouro` VARCHAR(45) NOT NULL,
    `nomeLogradouro` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`siglaTipoLogradouro`)
);

-- -----------------------------------------------------
-- Table `Logradouro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Logradouro` CASCADE;


CREATE TABLE IF NOT EXISTS `Logradouro` (
    `idLogradouro` INT NOT NULL AUTO_INCREMENT,
    `nomeLogradouro` VARCHAR(45) NOT NULL,
    `TipoLogradouro_siglaTipoLogradouro` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`idLogradouro`),
    FOREIGN KEY (`TipoLogradouro_siglaTipoLogradouro`) REFERENCES `TipoLogradouro`(`siglaTipoLogradouro`)
);

-- -----------------------------------------------------
-- Table `Endereço`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Endereço` CASCADE;


CREATE TABLE IF NOT EXISTS `Endereco` (
    `idEndereco` INT NOT NULL AUTO_INCREMENT,
    `CEP` VARCHAR(45) NOT NULL,
    `Cidade_idCidade` INT NOT NULL,
    `Bairro_idBairro` INT NOT NULL,
    `Logradouro_idLogradouro` INT NOT NULL,
    PRIMARY KEY (`idEndereco`),
    FOREIGN KEY (`Cidade_idCidade`) REFERENCES `Cidade`(`idCidade`),
    FOREIGN KEY (`Bairro_idBairro`) REFERENCES `Bairro`(`idBairro`),
    FOREIGN KEY (`Logradouro_idLogradouro`) REFERENCES `Logradouro`(`idLogradouro`)
);

-- -----------------------------------------------------
-- Table `Paciente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Paciente` CASCADE;


CREATE TABLE IF NOT EXISTS `Paciente` (
    `idPaciente` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(45) NOT NULL,
    `nascimento` DATE NOT NULL,
    `sexo` VARCHAR(45) NOT NULL,
    `estadoCivil` VARCHAR(45) NOT NULL,
    `docIdentidade` VARCHAR(45) NOT NULL,
    `numeroEndereco` INT NOT NULL,
    `complementoEndereco` VARCHAR(45),
    `Endereco_idEndereco` INT NOT NULL,
    PRIMARY KEY (`idPaciente`),
    FOREIGN KEY (`Endereco_idEndereco`) REFERENCES `Endereco`(`idEndereco`)
);

-- -----------------------------------------------------
-- Table `Medico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Medico` CASCADE;


CREATE TABLE IF NOT EXISTS `Medico` (
    `idMedico` INT NOT NULL AUTO_INCREMENT,
    `nomeMedico` VARCHAR(45) NOT NULL,
    `crmMedico` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`idMedico`)
);

-- -----------------------------------------------------
-- Table `Diagnostico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Diagnostico` CASCADE;


CREATE TABLE IF NOT EXISTS `Diagnostico` (
    `idDiagnostico` INT NOT NULL AUTO_INCREMENT,
    `diagnostico` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`idDiagnostico`)
);

-- -----------------------------------------------------
-- Table `Consulta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Consulta` CASCADE;


CREATE TABLE IF NOT EXISTS `Consulta` (
    `idConsulta` INT NOT NULL AUTO_INCREMENT,
    `nroConsulta` INT NOT NULL,
    `dataConsulta` DATE NOT NULL,
    `obsDiagnostico` VARCHAR(45) NOT NULL,
    `Paciente_idPaciente` INT NOT NULL,
    `Medico_idMedico` INT NOT NULL,
    `Diagnostico_idDiagnostico` INT NOT NULL,
    PRIMARY KEY (`idConsulta`),
    FOREIGN KEY (`Paciente_idPaciente`) REFERENCES `Paciente`(`idPaciente`),
    FOREIGN KEY (`Medico_idMedico`) REFERENCES `Medico`(`idMedico`),
    FOREIGN KEY (`Diagnostico_idDiagnostico`) REFERENCES `Diagnostico`(`idDiagnostico`)
);

-- -----------------------------------------------------
-- Table `TipoExame`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TipoExame` CASCADE;


CREATE TABLE IF NOT EXISTS `TipoExame` (
    `idTipoExame` INT NOT NULL AUTO_INCREMENT,
    `nomeTipoExame` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`idTipoExame`)
);

-- -----------------------------------------------------
-- Table `Exames`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Exames` CASCADE;


CREATE TABLE IF NOT EXISTS `Exames` (
    `idExames` INT NOT NULL  AUTO_INCREMENT,
    `nroExame` INT NOT NULL,
    `dataExame` DATE NOT NULL,
    `TipoExame_idTipoExame` INT NOT NULL,
    `Consulta_idConsulta` INT NOT NULL,
    PRIMARY KEY (`idExames`),
    FOREIGN KEY (`TipoExame_idTipoExame`) REFERENCES `TipoExame`(`idTipoExame`),
    FOREIGN KEY (`Consulta_idConsulta`) REFERENCES  `Consulta`(`idConsulta`)
);

-- -----------------------------------------------------
-- Table `DDI`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DDI` CASCADE;


CREATE TABLE IF NOT EXISTS `DDI` (
    `numDDI` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`numDDI`)
);

-- -----------------------------------------------------
-- Table `DDD`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DDD` CASCADE;


CREATE TABLE IF NOT EXISTS `DDD` (
    `numDDD` VARCHAR(45) NOT NULL,
    `DDI_numDDI` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`numDDD`),
    FOREIGN KEY (`DDI_numDDI`) REFERENCES `DDI`(`numDDI`)
);

-- -----------------------------------------------------
-- Table `Telefone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Telefone` CASCADE;


CREATE TABLE IF NOT EXISTS `Telefone` (
    `idTelefone` INT NOT NULL AUTO_INCREMENT,
    `numTelefone` VARCHAR(45) NOT NULL,
    `DDD_numDDD` VARCHAR(45) NOT NULL,
    `Paciente_idPaciente` INT NOT NULL,
    PRIMARY KEY (`idTelefone`),
    FOREIGN KEY (`DDD_numDDD`) REFERENCES `DDD`(`numDDD`),
    FOREIGN KEY (`Paciente_idPaciente`) REFERENCES `Paciente`(`idPaciente`)
);

-- -----------------------------------------------------
-- Table `E-Mail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `E-Mail` CASCADE;

CREATE TABLE IF NOT EXISTS `E-Mail` (
    `idEmail` INT NOT NULL AUTO_INCREMENT,
    `E-Mail` VARCHAR(45) NOT NULL,
    `Paciente_idPaciente` INT NOT NULL,
    PRIMARY KEY (`idEmail`),
    FOREIGN KEY (`Paciente_idPaciente`) REFERENCES `Paciente`(`idPaciente`)
)