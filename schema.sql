-- -----------------------------------------------------
-- Schema trabbd5
-- -----------------------------------------------------
DROP SCHEMA `trabbd5`;
CREATE SCHEMA IF NOT EXISTS `trabbd5` DEFAULT CHARACTER SET utf8 ;
USE `trabbd5` ;


-- -----------------------------------------------------
-- Table `UnidadeFederaçao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UnidadeFederacao` CASCADE;

CREATE TABLE IF NOT EXISTS `UnidadeFederativa` (
    `siglaUF` VARCHAR(5) NOT NULL,
    `nomeUF` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`siglaUF`)
);

# CREATE TABLE IF NOT EXISTS `UnidadeFederacao` (
#   `siglaUF` VARCHAR(5) NOT NULL,
#   `nomeUF` VARCHAR(45) NOT NULL,
#   PRIMARY KEY (`siglaUF`),
#   UNIQUE INDEX `idUnidadeFederacao_UNIQUE` (`siglaUF` ASC) VISIBLE);


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

# CREATE TABLE IF NOT EXISTS `Cidade` (
#   `idCidade` INT NOT NULL AUTO_INCREMENT,
#   `nomeCidade` VARCHAR(45) NOT NULL,
#   `UnidadeFederaçao_siglaUF` VARCHAR(5) NOT NULL,
#   PRIMARY KEY (`idCidade`),
#   UNIQUE INDEX `idCidade_UNIQUE` (`idCidade` ASC) VISIBLE,
#   INDEX `fk_Cidade_UnidadeFederaçao1_idx` (`UnidadeFederaçao_siglaUF` ASC) VISIBLE,
#   CONSTRAINT `fk_Cidade_UnidadeFederaçao1`
#     FOREIGN KEY (`UnidadeFederaçao_siglaUF`)
#     REFERENCES `UnidadeFederativa` (`siglaUF`)
#     ON DELETE NO ACTION
#     ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Bairro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Bairro` CASCADE;

# CREATE TABLE IF NOT EXISTS `Bairro` (
#   `idBairro` INT NOT NULL AUTO_INCREMENT,
#   `nomeBairro` VARCHAR(45) NOT NULL,
#   PRIMARY KEY (`idBairro`),
#   UNIQUE INDEX `idBairro_UNIQUE` (`idBairro` ASC) VISIBLE);

CREATE TABLE IF NOT EXISTS `Bairro` (
    `idBairro` INT NOT NULL AUTO_INCREMENT,
    `nomeBairro` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`idBairro`)
);

-- -----------------------------------------------------
-- Table `TipoLogradouro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TipoLogradouro` CASCADE;

# CREATE TABLE IF NOT EXISTS `TipoLogradouro` (
#   `siglaTipoLogradouro` INT NOT NULL,
#   `nomeLogradouro` VARCHAR(45) NOT NULL,
#   PRIMARY KEY (`siglaTipoLogradouro`),
#   UNIQUE INDEX `siglaTipoLogradouro_UNIQUE` (`siglaTipoLogradouro` ASC) VISIBLE);

CREATE TABLE IF NOT EXISTS `TipoLogradouro` (
    `siglaTipoLogradouro` INT NOT NULL,
    `nomeLogradouro` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`siglaTipoLogradouro`)
);

-- -----------------------------------------------------
-- Table `Logradouro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Logradouro` CASCADE;

# CREATE TABLE IF NOT EXISTS `Logradouro` (
#   `idLogradouro` INT NOT NULL AUTO_INCREMENT,
#   `nomeLogradouro` VARCHAR(45) NOT NULL,
#   `TipoLogradouro_siglaTipoLogradouro` INT NOT NULL,
#   PRIMARY KEY (`idLogradouro`),
#   UNIQUE INDEX `idLogradouro_UNIQUE` (`idLogradouro` ASC) VISIBLE,
#   INDEX `fk_Logradouro_TipoLogradouro1_idx` (`TipoLogradouro_siglaTipoLogradouro` ASC) VISIBLE,
#   CONSTRAINT `fk_Logradouro_TipoLogradouro1`
#     FOREIGN KEY (`TipoLogradouro_siglaTipoLogradouro`)
#     REFERENCES `TipoLogradouro` (`siglaTipoLogradouro`)
#     ON DELETE NO ACTION
#     ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `Logradouro` (
    `idLogradouro` INT NOT NULL AUTO_INCREMENT,
    `nomeLogradouro` VARCHAR(45) NOT NULL,
    `TipoLogradouro_siglaTipoLogradouro` INT NOT NULL,
    PRIMARY KEY (`idLogradouro`),
    FOREIGN KEY (`TipoLogradouro_siglaTipoLogradouro`) REFERENCES `TipoLogradouro`(`siglaTipoLogradouro`)
);

-- -----------------------------------------------------
-- Table `Endereço`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Endereço` CASCADE;

# CREATE TABLE IF NOT EXISTS `Endereço` (
#   `idEndereço` INT NOT NULL AUTO_INCREMENT,
#   `CEP` VARCHAR(45) NOT NULL,
#   `Cidade_idCidade` INT NOT NULL,
#   `Bairro_idBairro` INT NOT NULL,
#   `Logradouro_idLogradouro` INT NOT NULL,
#   PRIMARY KEY (`idEndereço`),
#   UNIQUE INDEX `idEndereço_UNIQUE` (`idEndereço` ASC) VISIBLE,
#   INDEX `fk_Endereço_Cidade1_idx` (`Cidade_idCidade` ASC) VISIBLE,
#   INDEX `fk_Endereço_Bairro1_idx` (`Bairro_idBairro` ASC) VISIBLE,
#   INDEX `fk_Endereço_Logradouro1_idx` (`Logradouro_idLogradouro` ASC) VISIBLE,
#   CONSTRAINT `fk_Endereço_Cidade1`
#     FOREIGN KEY (`Cidade_idCidade`)
#     REFERENCES `Cidade` (`idCidade`)
#     ON DELETE NO ACTION
#     ON UPDATE NO ACTION,
#   CONSTRAINT `fk_Endereço_Bairro1`
#     FOREIGN KEY (`Bairro_idBairro`)
#     REFERENCES `Bairro` (`idBairro`)
#     ON DELETE NO ACTION
#     ON UPDATE NO ACTION,
#   CONSTRAINT `fk_Endereço_Logradouro1`
#     FOREIGN KEY (`Logradouro_idLogradouro`)
#     REFERENCES `Logradouro` (`idLogradouro`)
#     ON DELETE NO ACTION
#     ON UPDATE NO ACTION);

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

# CREATE TABLE IF NOT EXISTS `Paciente` (
#   `idPaciente` INT NOT NULL AUTO_INCREMENT,
#   `Nome` VARCHAR(45) NOT NULL,
#   `Nascimento` DATE NOT NULL,
#   `Sexo` VARCHAR(45) NOT NULL,
#   `estadoCivil` VARCHAR(45) NOT NULL,
#   `docIdentidade` VARCHAR(45) NOT NULL,
#   `numeroEndereço` INT NOT NULL,
#   `complementoEndereço` VARCHAR(45) NOT NULL,
#   `Endereço_idEndereço` INT NOT NULL,
#   PRIMARY KEY (`idPaciente`),
#   UNIQUE INDEX `idPaciente_UNIQUE` (`idPaciente` ASC) VISIBLE,
#   INDEX `fk_Paciente_Endereço1_idx` (`Endereço_idEndereço` ASC) VISIBLE,
#   CONSTRAINT `fk_Paciente_Endereço1`
#     FOREIGN KEY (`Endereço_idEndereço`)
#     REFERENCES `Endereço` (`idEndereço`)
#     ON DELETE NO ACTION
#     ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `Paciente` (
    `idPaciente` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(45) NOT NULL,
    `nascimento` DATE NOT NULL,
    `sexo` VARCHAR(45) NOT NULL,
    `estadoCivil` VARCHAR(45) NOT NULL,
    `docIdentidade` VARCHAR(45) NOT NULL,
    `numeroEndereco` INT NOT NULL,
    `complementoEndereco` VARCHAR(45) NOT NULL,
    `Endereco_idEndereco` INT NOT NULL,
    PRIMARY KEY (`idPaciente`),
    FOREIGN KEY (`Endereco_idEndereco`) REFERENCES `Endereco`(`idEndereco`)
);

-- -----------------------------------------------------
-- Table `Medico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Medico` CASCADE;

# CREATE TABLE IF NOT EXISTS `Medico` (
#   `idMedico` INT NOT NULL AUTO_INCREMENT,
#   `nomeMedico` VARCHAR(45) NOT NULL,
#   `crmMedico` VARCHAR(45) NOT NULL,
#   PRIMARY KEY (`idMedico`),
#   UNIQUE INDEX `idMedico_UNIQUE` (`idMedico` ASC) VISIBLE);

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

# CREATE TABLE IF NOT EXISTS `Diagnostico` (
#   `idDiagnostico` INT NOT NULL AUTO_INCREMENT,
#   `Diagnostico` VARCHAR(45) NOT NULL,
#   PRIMARY KEY (`idDiagnostico`),
#   UNIQUE INDEX `idDiagnostico_UNIQUE` (`idDiagnostico` ASC) VISIBLE);

CREATE TABLE IF NOT EXISTS `Diagnostico` (
    `idDiagnostico` INT NOT NULL AUTO_INCREMENT,
    `diagnostico` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`idDiagnostico`)
);

-- -----------------------------------------------------
-- Table `Consulta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Consulta` CASCADE;

# CREATE TABLE IF NOT EXISTS `Consulta` (
#   `idConsulta` INT NOT NULL AUTO_INCREMENT,
#   `dataConsulta` DATE NOT NULL,
#   `obsDiagnostico` VARCHAR(45) NOT NULL,
#   `Paciente_idPaciente` INT NOT NULL,
#   `Paciente_idPaciente1` INT NOT NULL,
#   `Medico_idMedico` INT NOT NULL,
#   `Diagnostico_idDiagnostico` INT NOT NULL,
#   PRIMARY KEY (`idConsulta`, `Paciente_idPaciente`),
#   UNIQUE INDEX `idConsulta_UNIQUE` (`idConsulta` ASC) VISIBLE,
#   INDEX `fk_Consulta_Paciente1_idx` (`Paciente_idPaciente1` ASC) VISIBLE,
#   INDEX `fk_Consulta_Medico1_idx` (`Medico_idMedico` ASC) VISIBLE,
#   INDEX `fk_Consulta_Diagnostico1_idx` (`Diagnostico_idDiagnostico` ASC) VISIBLE,
#   CONSTRAINT `fk_Consulta_Paciente1`
#     FOREIGN KEY (`Paciente_idPaciente1`)
#     REFERENCES `Paciente` (`idPaciente`)
#     ON DELETE NO ACTION
#     ON UPDATE NO ACTION,
#   CONSTRAINT `fk_Consulta_Medico1`
#     FOREIGN KEY (`Medico_idMedico`)
#     REFERENCES `Medico` (`idMedico`)
#     ON DELETE NO ACTION
#     ON UPDATE NO ACTION,
#   CONSTRAINT `fk_Consulta_Diagnostico1`
#     FOREIGN KEY (`Diagnostico_idDiagnostico`)
#     REFERENCES `Diagnostico` (`idDiagnostico`)
#     ON DELETE NO ACTION
#     ON UPDATE NO ACTION);

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

# CREATE TABLE IF NOT EXISTS `TipoExame` (
#   `idTipoExame` INT NOT NULL AUTO_INCREMENT,
#   `nomeTipoExame` VARCHAR(45) NOT NULL,
#   PRIMARY KEY (`idTipoExame`),
#   UNIQUE INDEX `idTipoExame_UNIQUE` (`idTipoExame` ASC) VISIBLE);

CREATE TABLE IF NOT EXISTS `TipoExame` (
    `idTipoExame` INT NOT NULL AUTO_INCREMENT,
    `nomeTipoExame` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`idTipoExame`)
);

-- -----------------------------------------------------
-- Table `Exames`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Exames` CASCADE;

# CREATE TABLE IF NOT EXISTS `Exames` (
#   `idExames` INT NOT NULL AUTO_INCREMENT,
#   `dataExame` DATE NOT NULL,
#   `TipoExame_idTipoExame` INT NOT NULL,
#   `Consulta_idConsulta` INT NOT NULL,
#   `Consulta_Paciente_idPaciente` INT NOT NULL,
#   PRIMARY KEY (`idExames`),
#   UNIQUE INDEX `idExames_UNIQUE` (`idExames` ASC) VISIBLE,
#   INDEX `fk_Exames_TipoExame1_idx` (`TipoExame_idTipoExame` ASC) VISIBLE,
#   INDEX `fk_Exames_Consulta1_idx` (`Consulta_idConsulta` ASC, `Consulta_Paciente_idPaciente` ASC) VISIBLE,
#   CONSTRAINT `fk_Exames_TipoExame1`
#     FOREIGN KEY (`TipoExame_idTipoExame`)
#     REFERENCES `TipoExame` (`idTipoExame`)
#     ON DELETE NO ACTION
#     ON UPDATE NO ACTION,
#   CONSTRAINT `fk_Exames_Consulta1`
#     FOREIGN KEY (`Consulta_idConsulta` , `Consulta_Paciente_idPaciente`)
#     REFERENCES `Consulta` (`idConsulta` , `Paciente_idPaciente`)
#     ON DELETE NO ACTION
#     ON UPDATE NO ACTION);

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

# CREATE TABLE IF NOT EXISTS `DDI` (
#   `numDDI` VARCHAR(45) NOT NULL,
#   PRIMARY KEY (`numDDI`),
#   UNIQUE INDEX `numDDI_UNIQUE` (`numDDI` ASC) VISIBLE);

CREATE TABLE IF NOT EXISTS `DDI` (
    `numDDI` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`numDDI`)
);

-- -----------------------------------------------------
-- Table `DDD`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DDD` CASCADE;

# CREATE TABLE IF NOT EXISTS `DDD` (
#   `numDDD` VARCHAR(45) NOT NULL,
#   `DDI_numDDI` VARCHAR(45) NOT NULL,
#   PRIMARY KEY (`numDDD`),
#   UNIQUE INDEX `numDDD_UNIQUE` (`numDDD` ASC) VISIBLE,
#   INDEX `fk_DDD_DDI1_idx` (`DDI_numDDI` ASC) VISIBLE,
#   CONSTRAINT `fk_DDD_DDI1`
#     FOREIGN KEY (`DDI_numDDI`)
#     REFERENCES `DDI` (`numDDI`)
#     ON DELETE NO ACTION
#     ON UPDATE NO ACTION);

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

# CREATE TABLE IF NOT EXISTS `Telefone` (
#   `idTelefone` INT NOT NULL AUTO_INCREMENT,
#   `numTelefone` VARCHAR(45) NOT NULL,
#   `DDD_numDDD` VARCHAR(45) NOT NULL,
#   `Paciente_idPaciente` INT NOT NULL,
#   PRIMARY KEY (`idTelefone`),
#   UNIQUE INDEX `idTelefone_UNIQUE` (`idTelefone` ASC) VISIBLE,
#   INDEX `fk_Telefone_DDD1_idx` (`DDD_numDDD` ASC) VISIBLE,
#   INDEX `fk_Telefone_Paciente1_idx` (`Paciente_idPaciente` ASC) VISIBLE,
#   CONSTRAINT `fk_Telefone_DDD1`
#     FOREIGN KEY (`DDD_numDDD`)
#     REFERENCES `DDD` (`numDDD`)
#     ON DELETE NO ACTION
#     ON UPDATE NO ACTION,
#   CONSTRAINT `fk_Telefone_Paciente1`
#     FOREIGN KEY (`Paciente_idPaciente`)
#     REFERENCES `Paciente` (`idPaciente`)
#     ON DELETE NO ACTION
#     ON UPDATE NO ACTION);

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

# CREATE TABLE IF NOT EXISTS `E-Mail` (
#   `idEmail` INT NOT NULL AUTO_INCREMENT,
#   `E-Mail` VARCHAR(45) NOT NULL,
#   `Paciente_idPaciente` INT NOT NULL,
#   PRIMARY KEY (`idEmail`),
#   UNIQUE INDEX `idEmail_UNIQUE` (`idEmail` ASC) VISIBLE,
#   INDEX `fk_E-Mail_Paciente1_idx` (`Paciente_idPaciente` ASC) VISIBLE,
#   CONSTRAINT `fk_E-Mail_Paciente1`
#     FOREIGN KEY (`Paciente_idPaciente`)
#     REFERENCES `Paciente` (`idPaciente`)
#     ON DELETE NO ACTION
#     ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `E-Mail` (
    `idEmail` INT NOT NULL AUTO_INCREMENT,
    `E-Mail` VARCHAR(45) NOT NULL,
    `Paciente_idPaciente` INT NOT NULL,
    PRIMARY KEY (`idEmail`),
    FOREIGN KEY (`Paciente_idPaciente`) REFERENCES `Paciente`(`idPaciente`)
)