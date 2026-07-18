-- =========================================================================
-- ARTEFATO B. Comandos DML (INSERT, UPDATE, DELETE)
-- =========================================================================

TRUNCATE TABLE
    Caixa_Spam,
    Caixa_email,
    Marcadores,
    email,
    Usuario
RESTART IDENTITY CASCADE;

-- Comando B1. Inserir 5 registros em cada uma das tabelas que compõem o modelo relacional.
INSERT INTO Usuario (endereco_email, nome, data_nasc, senha) VALUES
('ana.silva@gmail.com', 'Ana Silva', '1995-04-12', 'senhaAna123'),
('bruno.costa@gmail.com', 'Bruno Costa', '1988-11-23', 'bruno@2026'),
('carla.souza@gmail.com', 'Carla Souza', '2001-07-05', 'carlaSpass'),
('diego.lima@gmail.com', 'Diego Lima', '1992-02-18', 'diego#92'),
('elena.martins@gmail.com', 'Elena Martins', '1999-09-30', 'elenaM789');

INSERT INTO email (assunto, conteudo, data, hora, endereco_email) VALUES
('Reunião de Alinhamento', 'Olá equipe, confirmando nossa reunião amanhã às 14h.', '2026-07-15', '09:30:00', 'ana.silva@gmail.com'),
('Oferta Imperdível de Cripto', 'Ganhe 1000% de lucro investindo agora no link abaixo!', '2026-07-16', '14:25:00', 'bruno.costa@gmail.com'),
('Confirmação de Inscrição', 'Sua inscrição no workshop de Banco de Dados foi realizada.', '2026-07-17', '10:00:00', 'carla.souza@gmail.com'),
('Parabéns pelo Aniversário!', 'Aproveite seu cupom de 20% de desconto na nossa loja.', '2026-07-18', '08:00:00', 'diego.lima@gmail.com'),
('Aviso de Segurança', 'Detectamos um novo login no seu dispositivo Linux.', '2026-07-18', '11:15:00', 'elena.martins@gmail.com');

INSERT INTO Caixa_Spam (endereco_email, id_email) VALUES
('bruno.costa@gmail.com', 2), -- Oferta de Cripto
('ana.silva@gmail.com', 4),   -- Cupom promocional
('carla.souza@gmail.com', 5), -- Aviso de segurança
('diego.lima@gmail.com', 2),  -- Oferta de Cripto
('elena.martins@gmail.com', 4); -- Cupom promocional

INSERT INTO Caixa_email (favoritar, endereco_email, id_email) VALUES
(true, 'ana.silva@gmail.com', 1),
(false, 'carla.souza@gmail.com', 3),
(true, 'diego.lima@gmail.com', 4),
(false, 'elena.martins@gmail.com', 5),
(true, 'bruno.costa@gmail.com', 2);

INSERT INTO Marcadores (nome, cor, id_email) VALUES
('Trabalho', 'Azul', 1),
('Eventos', 'Verde', 3),
('Importante', 'Vermelho', 1),
('Finanças', 'Amarelo', 4),
('Segurança', 'Cinza', 5);


-- Comando B2. Um comando UPDATE para atualizar um campo de todos os registros de uma tabela.
-- Significado: Atualizar a cor de todos os marcadores cadastrados para 'Preto'.
UPDATE Marcadores SET cor = 'Preto';


-- Comando B3. Um comando UPDATE para atualizar um campo dos registros que satisfazem uma condição simples.
-- Significado: Favoritar todas as caixas de e-mail pertencentes à Ana Silva.
UPDATE Caixa_email SET favoritar = true WHERE endereco_email = 'ana.silva@gmail.com';


-- Comando B4. Um comando UPDATE para atualizar um campo dos registros que satisfazem uma condição composta.
-- Significado: Mudar o assunto de e-mails enviados em uma data específica por um usuário específico.
UPDATE email SET assunto = '[URGENTE] Reunião Importante' 
WHERE data = '2026-07-15' AND endereco_email = 'ana.silva@gmail.com';


-- Comando B5. Um comando UPDATE para atualizar dois campos dos registros que satisfazem uma condição.
-- Significado: Atualizar o nome e a senha do usuário Bruno Costa.
UPDATE Usuario SET nome = 'Bruno Costa Silva', senha = 'NovaSenhaBruno2026' 
WHERE endereco_email = 'bruno.costa@gmail.com';


-- Comando B6. Um comando UPDATE para atualizar um campo usando o antigo valor desse campo.
-- Significado: Concatenar um aviso de "[Modificado]" no início do conteúdo do e-mail de id 3.
UPDATE email SET conteudo = CONCAT('[Modificado] ', conteudo) WHERE id_email = 3;


-- Comando B7. Um comando UPDATE para atualizar um campo usando uma função.
-- Significado: Forçar que todos os e-mails de usuários usem endereços em letras minúsculas (usando a função LOWER).
UPDATE Usuario SET endereco_email = LOWER(endereco_email);


-- Comando B8. Um comando DELETE para remover todos os registros de uma tabela.
-- Significado: Limpar completamente a caixa de SPAM de todos os usuários do sistema.
DELETE FROM Caixa_Spam;


-- Comando B9. Um comando DELETE para remover os registros que satisfazem uma condição simples.
-- Significado: Remover o marcador chamado 'Eventos'.
DELETE FROM Marcadores WHERE nome = 'Eventos';


-- Comando B10. Um comando DELETE para remover os registros que satisfazem uma condição composta.
-- Significado: Remover e-mails antigos enviados antes de 2026 que pertençam ao Diego.
DELETE FROM email WHERE data < '2026-01-01' AND endereco_email = 'diego.lima@gmail.com';


-- Comando B11. Um comando DELETE para remover registros usando uma função na condição.
-- Significado: Remover usuários cuja senha possua menos de 8 caracteres (usando a função LENGTH).
DELETE FROM Usuario WHERE LENGTH(senha) < 8;
