-- -----------------------------------------------------
-- Data for table `UnidadeFederaçao`
-- -----------------------------------------------------
START TRANSACTION;
USE `trabbd5`;
INSERT INTO `UnidadeFederativa` (`siglaUF`, `nomeUF`) VALUES ('PR', 'Paraná');
INSERT INTO `UnidadeFederativa` (`siglaUF`, `nomeUF`) VALUES ('RS', 'Rio Grande do Sul');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Cidade`
-- -----------------------------------------------------
START TRANSACTION;
USE `trabbd5`;
INSERT INTO `Cidade` (`idCidade`, `nomeCidade`, `UnidadeFederativa_siglaUF`) VALUES (1, 'Foz do Iguaçu', 'PR');
INSERT INTO `Cidade` (`idCidade`, `nomeCidade`, `UnidadeFederativa_siglaUF`) VALUES (2, 'Cascavel', 'PR');
INSERT INTO `Cidade` (`idCidade`, `nomeCidade`, `UnidadeFederativa_siglaUF`) VALUES (3, 'Curitiba', 'PR');
INSERT INTO `Cidade` (`idCidade`, `nomeCidade`, `UnidadeFederativa_siglaUF`) VALUES (4, 'Porto Alegre', 'RS');
INSERT INTO `Cidade` (`idCidade`, `nomeCidade`, `UnidadeFederativa_siglaUF`) VALUES (5, 'Santa Maria', 'RS');

COMMIT;

-- -----------------------------------------------------
-- Data for table `Bairro`
-- -----------------------------------------------------
START TRANSACTION;
USE `trabbd5`;
INSERT INTO `Bairro` (`idBairro`, `nomeBairro`) VALUES (1, 'Vila Itajubá');
INSERT INTO `Bairro` (`idBairro`, `nomeBairro`) VALUES (2, 'Centro');
INSERT INTO `Bairro` (`idBairro`, `nomeBairro`) VALUES (3, 'Vila A');
INSERT INTO `Bairro` (`idBairro`, `nomeBairro`) VALUES (4, 'Jardim São Paulo');
INSERT INTO `Bairro` (`idBairro`, `nomeBairro`) VALUES (5, 'Vila B');

COMMIT;


-- -----------------------------------------------------
-- Data for table `TipoLogradouro`
-- -----------------------------------------------------
START TRANSACTION;
USE `trabbd5`;
INSERT INTO `TipoLogradouro` (`siglaTipoLogradouro`, `nomeLogradouro`) VALUES ('Av', 'Avenida');
INSERT INTO `TipoLogradouro` (`siglaTipoLogradouro`, `nomeLogradouro`) VALUES ('R', 'Rua');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Logradouro`
-- -----------------------------------------------------
START TRANSACTION;
USE `trabbd5`;
INSERT INTO `Logradouro` (`idLogradouro`, `nomeLogradouro`, `TipoLogradouro_siglaTipoLogradouro`) VALUES (1, 'Brasil', 'Av');
INSERT INTO `Logradouro` (`idLogradouro`, `nomeLogradouro`, `TipoLogradouro_siglaTipoLogradouro`) VALUES (2, 'Presidente Vargas', 'Av');
INSERT INTO `Logradouro` (`idLogradouro`, `nomeLogradouro`, `TipoLogradouro_siglaTipoLogradouro`) VALUES (3, 'Gilberto Rolon', 'R');
INSERT INTO `Logradouro` (`idLogradouro`, `nomeLogradouro`, `TipoLogradouro_siglaTipoLogradouro`) VALUES (4, 'JK', 'Av');
INSERT INTO `Logradouro` (`idLogradouro`, `nomeLogradouro`, `TipoLogradouro_siglaTipoLogradouro`) VALUES (5, 'Cacique', 'R');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Endereço`
-- -----------------------------------------------------
START TRANSACTION;
USE `trabbd5`;
INSERT INTO `Endereco` (`idEndereco`, `CEP`, `Cidade_idCidade`, `Bairro_idBairro`, `Logradouro_idLogradouro`) VALUES (1, '85852-180', 1, 1, 3);
INSERT INTO `Endereco` (`idEndereco`, `CEP`, `Cidade_idCidade`, `Bairro_idBairro`, `Logradouro_idLogradouro`) VALUES (2, '52035-204', 1, 3, 5);
INSERT INTO `Endereco` (`idEndereco`, `CEP`, `Cidade_idCidade`, `Bairro_idBairro`, `Logradouro_idLogradouro`) VALUES (3, '65785-312', 5, 2, 2);
INSERT INTO `Endereco` (`idEndereco`, `CEP`, `Cidade_idCidade`, `Bairro_idBairro`, `Logradouro_idLogradouro`) VALUES (4, '25432-415', 2, 2, 4);
INSERT INTO `Endereco` (`idEndereco`, `CEP`, `Cidade_idCidade`, `Bairro_idBairro`, `Logradouro_idLogradouro`) VALUES (5, '74125-658', 4, 4, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Paciente`
-- -----------------------------------------------------
START TRANSACTION;
USE `trabbd5`;
INSERT INTO `Paciente` (`idPaciente`, `Nome`, `Nascimento`, `Sexo`, `estadoCivil`, `docIdentidade`, `numeroEndereco`, `complementoEndereco`, `Endereco_idEndereco`) VALUES (1, 'Leonardo Benitez de Freitas', '1999-10-27', 'M', 'Solteiro', '102.440.309-28', 137, NULL, 1);
INSERT INTO `Paciente` (`idPaciente`, `Nome`, `Nascimento`, `Sexo`, `estadoCivil`, `docIdentidade`, `numeroEndereco`, `complementoEndereco`, `Endereco_idEndereco`) VALUES (2, 'Bruno de Castro Brezolin', '1998-06-27', 'M', 'Casado', '325.781.964-56', 1532, 'Apartamento 304', 2);
INSERT INTO `Paciente` (`idPaciente`, `Nome`, `Nascimento`, `Sexo`, `estadoCivil`, `docIdentidade`, `numeroEndereco`, `complementoEndereco`, `Endereco_idEndereco`) VALUES (3, 'Eduardo Pereira', '1993-03-12', 'M', 'Solteiro', '201.354.846-14', 215, NULL, 3);
INSERT INTO `Paciente` (`idPaciente`, `Nome`, `Nascimento`, `Sexo`, `estadoCivil`, `docIdentidade`, `numeroEndereco`, `complementoEndereco`, `Endereco_idEndereco`) VALUES (4, 'Melissa Santos', '1995-08-13', 'F', 'Casado(a)', '745.369.147-72', 378, 'Apartamento 102', 3);
INSERT INTO `Paciente` (`idPaciente`, `Nome`, `Nascimento`, `Sexo`, `estadoCivil`, `docIdentidade`, `numeroEndereco`, `complementoEndereco`, `Endereco_idEndereco`) VALUES (5, 'Maria Zunilda Benitez', '1970-05-09', 'F', 'Casado(a)', '804.584.409-49', 137, NULL, 1);

COMMIT;



-- -----------------------------------------------------
-- Data for table `Medico`
-- -----------------------------------------------------
START TRANSACTION;
USE trabbd5;

INSERT INTO `Medico` (`idMedico`, `nomeMedico`, `crmMedico`) VALUES (1, 'Gabriel Pereira', '12345678-9/BR');
INSERT INTO `Medico` (`idMedico`, `nomeMedico`, `crmMedico`) VALUES (2, 'Jose Ricardo', '03486296-3/BR');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Diagnostico`
-- -----------------------------------------------------
START TRANSACTION;
USE `trabbd5`;
INSERT INTO `Diagnostico` (`idDiagnostico`, `Diagnostico`) VALUES (1, 'h1n1');
INSERT INTO `Diagnostico` (`idDiagnostico`, `Diagnostico`) VALUES (2, 'covid-19');
INSERT INTO `Diagnostico` (`idDiagnostico`, `Diagnostico`) VALUES (3, 'dengue');
INSERT INTO `Diagnostico` (`idDiagnostico`, `Diagnostico`) VALUES (4, 'anemia');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Consulta`
-- -----------------------------------------------------
START TRANSACTION;
USE `trabbd5`;
INSERT INTO `Consulta` (`idConsulta`, `dataConsulta`, `obsDiagnostico`, `Paciente_idPaciente`, `Medico_idMedico`, `Diagnostico_idDiagnostico`, `nroConsulta`) VALUES (1, '2021-03-27', 'suspeita de covid em zona de dengue', 1, 1, 3, 1);
INSERT INTO `Consulta` (`idConsulta`, `dataConsulta`, `obsDiagnostico`, `Paciente_idPaciente`, `Medico_idMedico`, `Diagnostico_idDiagnostico`, `nroConsulta`) VALUES (2, '2021-02-27', '', 2, 2, 2, 1);
INSERT INTO `Consulta` (`idConsulta`, `dataConsulta`, `obsDiagnostico`, `Paciente_idPaciente`, `Medico_idMedico`, `Diagnostico_idDiagnostico`, `nroConsulta`) VALUES (3, '2021-01-30', '', 3, 1, 2, 1);
INSERT INTO `Consulta` (`idConsulta`, `dataConsulta`, `obsDiagnostico`, `Paciente_idPaciente`, `Medico_idMedico`, `Diagnostico_idDiagnostico`, `nroConsulta`) VALUES (4, '2021-02-14', '', 4, 1, 1, 1);
INSERT INTO `Consulta` (`idConsulta`, `dataConsulta`, `obsDiagnostico`, `Paciente_idPaciente`, `Medico_idMedico`, `Diagnostico_idDiagnostico`, `nroConsulta`) VALUES (5, '2021-02-03', '', 5, 2, 2, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`TipoExame`
-- -----------------------------------------------------
START TRANSACTION;
USE `trabbd5`;
INSERT INTO `TipoExame` (`idTipoExame`, `nomeTipoExame`) VALUES (1, 'teste rapido - covid19');
INSERT INTO `TipoExame` (`idTipoExame`, `nomeTipoExame`) VALUES (2, 'teste de sangue - dengue');
INSERT INTO `TipoExame` (`idTipoExame`, `nomeTipoExame`) VALUES (3, 'teste de saliva - h1n1');
INSERT INTO `TipoExame` (`idTipoExame`, `nomeTipoExame`) VALUES (4, 'teste de medula - anemia');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Exames`
-- -----------------------------------------------------
START TRANSACTION;
USE `trabbd5`;
INSERT INTO `Exames` (`idExames`, `dataExame`, `TipoExame_idTipoExame`, `Consulta_idConsulta`, `nroExame`) VALUES (1, '2021-03-27', 1, 1, 1);
INSERT INTO `Exames` (`idExames`, `dataExame`, `TipoExame_idTipoExame`, `Consulta_idConsulta`, `nroExame`) VALUES (2, '2021-03-27', 2, 1, 2);
INSERT INTO `Exames` (`idExames`, `dataExame`, `TipoExame_idTipoExame`, `Consulta_idConsulta`, `nroExame`) VALUES (3, '2021-02-27', 1, 2, 1);
INSERT INTO `Exames` (`idExames`, `dataExame`, `TipoExame_idTipoExame`, `Consulta_idConsulta`, `nroExame`) VALUES (4, '2021-01-30', 1, 3, 1);
INSERT INTO `Exames` (`idExames`, `dataExame`, `TipoExame_idTipoExame`, `Consulta_idConsulta`, `nroExame`) VALUES (5, '2021-02-14', 3, 4, 1);
INSERT INTO `Exames` (`idExames`, `dataExame`, `TipoExame_idTipoExame`, `Consulta_idConsulta`, `nroExame`) VALUES (6, '2021-02-14', 4, 4, 2);
INSERT INTO `Exames` (`idExames`, `dataExame`, `TipoExame_idTipoExame`, `Consulta_idConsulta`, `nroExame`) VALUES (7, '2021-02-03', 1, 5, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`DDI`
-- -----------------------------------------------------
START TRANSACTION;
USE `trabbd5`;
INSERT INTO `DDI` (`numDDI`) VALUES ('55');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`DDD`
-- -----------------------------------------------------
START TRANSACTION;
USE `trabbd5`;
INSERT INTO `DDD` (`numDDD`, `DDI_numDDI`) VALUES ('45', '55');
INSERT INTO `DDD` (`numDDD`, `DDI_numDDI`) VALUES ('37', '55');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Telefone`
-- -----------------------------------------------------
START TRANSACTION;
USE `trabbd5`;
INSERT INTO `Telefone` (`idTelefone`, `numTelefone`, `DDD_numDDD`, `Paciente_idPaciente`) VALUES (1, '99998888', '45', 1);
INSERT INTO `Telefone` (`idTelefone`, `numTelefone`, `DDD_numDDD`, `Paciente_idPaciente`) VALUES (2, '98765432', '37', 1);
INSERT INTO `Telefone` (`idTelefone`, `numTelefone`, `DDD_numDDD`, `Paciente_idPaciente`) VALUES (3, '95678485', '45', 2);
INSERT INTO `Telefone` (`idTelefone`, `numTelefone`, `DDD_numDDD`, `Paciente_idPaciente`) VALUES (4, '92347568', '45', 3);
INSERT INTO `Telefone` (`idTelefone`, `numTelefone`, `DDD_numDDD`, `Paciente_idPaciente`) VALUES (5, '90734758', '45', 4);
INSERT INTO `Telefone` (`idTelefone`, `numTelefone`, `DDD_numDDD`, `Paciente_idPaciente`) VALUES (6, '99999999', '37', 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`E-Mail`
-- -----------------------------------------------------
START TRANSACTION;
USE `trabbd5`;
INSERT INTO `E-Mail` (`idEmail`, `E-Mail`, `Paciente_idPaciente`) VALUES (1, 'leobfritas@gmail.com', 1);
INSERT INTO `E-Mail` (`idEmail`, `E-Mail`, `Paciente_idPaciente`) VALUES (2, 'leonardo@hotmail.com', 1);
INSERT INTO `E-Mail` (`idEmail`, `E-Mail`, `Paciente_idPaciente`) VALUES (3, 'brunobrezolin@gmail.com', 2);
INSERT INTO `E-Mail` (`idEmail`, `E-Mail`, `Paciente_idPaciente`) VALUES (4, 'edupereira@yahoo.com', 3);
INSERT INTO `E-Mail` (`idEmail`, `E-Mail`, `Paciente_idPaciente`) VALUES (5, 'melsantos@hotmail.com', 3);
INSERT INTO `E-Mail` (`idEmail`, `E-Mail`, `Paciente_idPaciente`) VALUES (6, 'mariazbenitez@gmail.com', 4);
INSERT INTO `E-Mail` (`idEmail`, `E-Mail`, `Paciente_idPaciente`) VALUES (7, 'mariabenz@hotmail.com', 5);

COMMIT;

