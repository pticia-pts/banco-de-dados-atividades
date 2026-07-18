
SELECT p.nome, p.email, m.crm
FROM Pessoa p
INNER JOIN Medico m ON p.cpf = m.cpf_pessoa;



SELECT p.nome, p.email, pac.senha
FROM Pessoa p
INNER JOIN Paciente pac ON p.cpf = pac.cpf_pessoa;



SELECT me.crm_medico AS crm, esp.descricao AS especialidade
FROM Medico_Especialidade me
INNER JOIN Especialidade esp ON me.id_especialidade = esp.identificador;


SELECT me.crm_medico AS crm
FROM Medico_Especialidade me
INNER JOIN Especialidade esp ON me.id_especialidade = esp.identificador
WHERE LOWER(esp.descricao) = 'cardiologista' 
   OR LOWER(esp.descricao) = 'cardiologia';


SELECT p.nome, p.cpf, m.crm, pac.senha
FROM Pessoa p
INNER JOIN Paciente pac ON p.cpf = pac.cpf_pessoa
INNER JOIN Medico m ON p.cpf = m.cpf_pessoa;


SELECT p.nome AS nome_medico, COUNT(a.id_agendamento) AS quantidade_consultas
FROM Medico m
INNER JOIN Pessoa p ON m.cpf_pessoa = p.cpf
LEFT JOIN Agendamento a ON m.crm = a.crm_medico
GROUP BY m.crm, p.nome;


SELECT esp.descricao AS especialidade, COUNT(me.crm_medico) AS quantidade_medicos
FROM Especialidade esp
LEFT JOIN Medico_Especialidade me ON esp.identificador = me.id_especialidade
GROUP BY esp.identificador, esp.descricao;



SELECT p_pac.nome AS nome_paciente, p_pac.email AS email_paciente,
       a.data_hora_consulta, a.valor_consulta,
       p_med.nome AS nome_medico, m.crm AS crm_medico
FROM Agendamento a
INNER JOIN Paciente pac ON a.cpf_paciente = pac.cpf_pessoa
INNER JOIN Pessoa p_pac ON pac.cpf_pessoa = p_pac.cpf
INNER JOIN Medico m ON a.crm_medico = m.crm
INNER JOIN Pessoa p_med ON m.cpf_pessoa = p_med.cpf;


SELECT a.data_hora_consulta
FROM Agendamento a
INNER JOIN Medico m ON a.crm_medico = m.crm
INNER JOIN Medico_Especialidade me ON m.crm = me.crm_medico
INNER JOIN Especialidade esp ON me.id_especialidade = esp.identificador
WHERE LOWER(esp.descricao) = 'cardiologista' 
   OR LOWER(esp.descricao) = 'cardiologia';


SELECT p.nome AS nome_medico, m.crm, AVG(a.valor_consulta) AS media_consultas
FROM Medico m
INNER JOIN Pessoa p ON m.cpf_pessoa = p.cpf
INNER JOIN Agendamento a ON m.crm = a.crm_medico
WHERE EXTRACT(MONTH FROM a.data_hora_consulta) = 12
  AND EXTRACT(YEAR FROM a.data_hora_consulta) = 2020
GROUP BY m.crm, p.nome;