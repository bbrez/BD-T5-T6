use `trabbd5`;


CREATE OR REPLACE VIEW testeCovid
AS
SELECT idPaciente, nome, dataExame, docIdentidade, nomeTipoExame
FROM Paciente
         INNER JOIN Consulta c on Paciente.idPaciente = c.Paciente_idPaciente
         INNER JOIN Exames e on c.idConsulta = e.Consulta_idConsulta
         INNER JOIN TipoExame t on e.TipoExame_idTipoExame = t.idTipoExame
WHERE nomeTipoExame LIKE 'teste rapido - covid19';

CREATE OR REPLACE VIEW medicoResponsavel
AS
SELECT idPaciente, nome, nomeMedico, crmMedico
FROM Paciente
         INNER JOIN Consulta c on Paciente.idPaciente = c.Paciente_idPaciente
         INNER JOIN Medico m on c.Medico_idMedico = m.idMedico
WHERE nomeMedico LIKE 'Gabriel Pereira';

CREATE OR REPLACE VIEW consultasFoz
AS
SELECT idPaciente, nome, docIdentidade, dataConsulta, nomeCidade
FROM Paciente
         INNER JOIN Consulta c on Paciente.idPaciente = c.Paciente_idPaciente
         INNER JOIN Endereco e on Paciente.Endereco_idEndereco = e.idEndereco
         INNER JOIN Cidade c2 on e.Cidade_idCidade = c2.idCidade
WHERE nomeCidade LIKE 'Foz do Iguaçu'
  AND EXTRACT(YEAR FROM dataConsulta) LIKE '2021';

CREATE OR REPLACE VIEW fichaMedica
AS
SELECT nroConsulta,
       dataConsulta,
       obsDiagnostico,
       Paciente_idPaciente                 AS idPaciente,
       Medico_idMedico                     AS idMedico,
       Diagnostico_idDiagnostico           AS idDiagnostico,
       group_concat(idExames)              AS idExame,
       group_concat(nroExame)              AS nroExame,
       group_concat(dataExame)             AS dataExame,
       group_concat(TipoExame_idTipoExame) AS tipoExame,
       group_concat(Consulta_idConsulta)   AS idConsulta
FROM Exames
         LEFT JOIN Consulta ON Consulta_idConsulta = idConsulta
GROUP BY idConsulta;


CREATE OR REPLACE VIEW gigaView2EletrictBoogaloo AS
SELECT Paciente.idpaciente                                                          AS "Número do paciente",
       Paciente.nome                                                                as "Nome do Paciente",
       Paciente.nascimento                                                          as "Data de Nascimento",
       Paciente.sexo                                                                as "Sexo",
       Paciente.estadocivil                                                         as "Estado Civil",
       Paciente.docidentidade                                                       as "Documento de Identidade",
       group_concat(DISTINCT L.TipoLogradouro_siglaTipoLogradouro, ' ', L.nomelogradouro, ', Numero ',
                    Paciente.numeroendereco, ', ', B.nomebairro, ', ', Ci.nomecidade, ', ',
                    Ci.unidadefederativa_siglauf, ' ', COALESCE(Paciente.complementoendereco, '')) as "Endereço",
       En.cep as "CEP",
       group_concat(DISTINCT '(', D.ddi_numddi, ') ', D.numDDD, ' ', T.numTelefone SEPARATOR ', ') as Telefone,
       group_concat(DISTINCT `E-M`.`e-mail` SEPARATOR ', ') as "Emails",
       group_concat(DISTINCT 'Consulta numero: ', C.nroconsulta, ', Dia: ', C.dataconsulta, ', Doutor: ', M.nomemedico, ' ', M.crmmedico, ', Diagnostico: ', D3.diagnostico, ' OBS: ', C.obsdiagnostico) as "Consultas",
       group_concat(DISTINCT 'Exame Numero: ', E.nroexame, ' Dia: ', E.dataexame, ' Tipo de exame: ', TE.nometipoexame SEPARATOR ', ') as "Exames Realizados"
FROM Paciente
         INNER JOIN Endereco En on En.idEndereco = Endereco_idEndereco
         INNER JOIN Cidade Ci on En.Cidade_idCidade = Ci.idCidade
         INNER JOIN Bairro B on En.Bairro_idBairro = B.idBairro
         INNER JOIN Logradouro L on En.Logradouro_idLogradouro = L.idLogradouro
         INNER JOIN UnidadeFederativa UF on Ci.UnidadeFederativa_siglaUF = UF.siglaUF
         INNER JOIN Consulta C on Paciente.idPaciente = C.Paciente_idPaciente
         INNER JOIN Medico M on C.Medico_idMedico = M.idMedico
         INNER JOIN Telefone T on Paciente.idPaciente = T.Paciente_idPaciente
         INNER JOIN DDD D on T.DDD_numDDD = D.numDDD
         INNER JOIN DDI D2 on D.DDI_numDDI = D2.numDDI
         INNER JOIN Diagnostico D3 on C.Diagnostico_idDiagnostico = D3.idDiagnostico
         INNER JOIN Exames E on C.idConsulta = E.Consulta_idConsulta
         INNER JOIN TipoExame TE on E.TipoExame_idTipoExame = TE.idTipoExame
         INNER JOIN TipoLogradouro TL on L.TipoLogradouro_siglaTipoLogradouro = TL.siglaTipoLogradouro
         INNER JOIN `E-Mail` `E-M` on Paciente.idPaciente = `E-M`.Paciente_idPaciente
GROUP BY idPaciente;


SELECT *
FROM testeCovid;

SELECT *
FROM medicoResponsavel
WHERE nomeMedico LIKE 'Gabriel Pereira';

SELECT *
FROM consultasFoz;

SELECT *
FROM fichaMedica;

SELECT *
FROM gigaView2EletrictBoogaloo;
