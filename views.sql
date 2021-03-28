use `trabbd5`;


CREATE OR REPLACE VIEW testeCovid
AS
SELECT idPaciente, nome, dataExame, docIdentidade, nomeTipoExame
FROM paciente
         INNER JOIN consulta c on paciente.idPaciente = c.Paciente_idPaciente
         INNER JOIN exames e on c.idConsulta = e.Consulta_idConsulta
         INNER JOIN tipoexame t on e.TipoExame_idTipoExame = t.idTipoExame
WHERE nomeTipoExame LIKE 'teste rapido - covid19';

CREATE OR REPLACE VIEW pacienteMedico
AS
SELECT idPaciente, nome, nomeMedico, crmMedico
FROM paciente
         INNER JOIN consulta c on paciente.idPaciente = c.Paciente_idPaciente
         INNER JOIN medico m on c.Medico_idMedico = m.idMedico
WHERE nomeMedico LIKE 'Gabriel Pereira';

CREATE OR REPLACE VIEW pacienteAnoCidade
AS
SELECT idPaciente, nome, docIdentidade, dataConsulta, nomeCidade
FROM paciente
         INNER JOIN consulta c on paciente.idPaciente = c.Paciente_idPaciente
         INNER JOIN endereco e on paciente.Endereco_idEndereco = e.idEndereco
         INNER JOIN cidade c2 on e.Cidade_idCidade = c2.idCidade
WHERE nomeCidade LIKE 'Foz do Iguaçu'
  AND EXTRACT(YEAR FROM dataConsulta) LIKE '2021';

CREATE OR REPLACE VIEW gigaView
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

SELECT *
FROM testeCovid;
SELECT *
FROM pacienteMedico;
SELECT *
FROM pacienteAnoCidade;
SELECT *
FROM gigaView;