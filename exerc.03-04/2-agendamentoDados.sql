

INSERT INTO Pessoa (cpf, nome, email, telefone, endereco, data_nascimento)
VALUES
('11111111111', 'Ana Silva', 'ana@email.com', '84999990001', 'Natal - RN', '1995-05-15'),
('22222222222', 'Bruno Costa', 'bruno@email.com', NULL, 'Parnamirim - RN', '1990-08-20'),
('33333333333', 'Carla Souza', 'carla@email.com', '84999990003', 'Natal - RN', '1988-12-10'),
('44444444444', 'Daniel Lima', 'daniel@email.com', '84999990004', 'Mossoró - RN', '1985-03-22'),
('55555555555', 'Eduarda Alves', 'eduarda@email.com', NULL, 'Natal - RN', '2000-07-08'),
('66666666666', 'Fernando Melo', 'fernando@email.com', '84999990006', 'Caicó - RN', '1979-11-18'),
('77777777777', 'Gabriela Rocha', 'gabriela@email.com', '84999990007', 'Natal - RN', '1998-12-25'),
('88888888888', 'Henrique Santos', 'henrique@email.com', '84999990008', 'Ceará-Mirim - RN', '1992-01-30');




INSERT INTO Paciente (cpf_pessoa, plano_de_saude, senha)
VALUES
('11111111111', TRUE, 'senha1'),
('22222222222', FALSE, 'senha2'),
('33333333333', TRUE, 'senha3'),
('55555555555', FALSE, 'senha4'),
('66666666666', TRUE, 'senha5'),
('77777777777', FALSE, 'senha6'),
('88888888888', TRUE, 'senha7');




INSERT INTO Medico (crm, cpf_pessoa)
VALUES
('CRM1001', '44444444444'),
('CRM1002', '66666666666'),
('CRM1003', '88888888888');



INSERT INTO Especialidade (descricao)
VALUES
('Cardiologia'),
('Pediatria'),
('Dermatologia'),
('Ortopedia');


INSERT INTO Medico_Especialidade (crm_medico, id_especialidade)
VALUES
('CRM1001',1),
('CRM1002',2),
('CRM1002',4),
('CRM1003',3);


INSERT INTO Agendamento
(cpf_paciente, crm_medico, data_hora_agendamento, data_hora_consulta, valor_consulta)
VALUES

-- Mesmo mês
('11111111111','CRM1001',
'2026-05-01 09:00',
'2026-05-15 10:00',
80.00),

-- Consulta em dezembro
('22222222222','CRM1002',
'2026-12-01 08:00',
'2026-12-10 14:00',
120.00),

-- Aniversário (10/12)
('33333333333','CRM1003',
'2026-11-25 09:00',
'2026-12-10 09:00',
95.00),

-- Valor entre 50 e 100
('55555555555','CRM1001',
'2026-07-01 10:00',
'2026-07-08 15:00',
60.00),

-- Aniversário (25/12)
('77777777777','CRM1002',
'2026-12-20 08:00',
'2026-12-25 11:00',
150.00),

-- Outra consulta
('11111111111','CRM1003',
'2026-06-10 08:00',
'2026-06-20 09:30',
70.00);