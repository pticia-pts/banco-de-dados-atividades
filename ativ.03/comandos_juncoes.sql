-- Comando D1. Um comando SELECT para exibir alguns dados dos registros de DUAS tabelas usando algum operador de junção qualificada (INNER JOIN).
-- Significado: Listar o nome do usuário e o assunto de todos os e-mails que eles enviaram.
SELECT u.nome, e.assunto 
FROM Usuario u
INNER JOIN email e ON u.endereco_email = e.endereco_email;


-- Comando D2. Um comando SELECT para exibir alguns dados dos registros de TRÊS tabelas usando os operadores de junção qualificada (INNER JOIN).
-- Significado: Listar o nome do usuário que recebeu o e-mail na sua Inbox, o assunto do e-mail recebido e se ele foi favoritado ou não.
SELECT u.nome AS proprietario_caixa, e.assunto, ce.favoritar
FROM Caixa_email ce
INNER JOIN Usuario u ON ce.endereco_email = u.endereco_email
INNER JOIN email e ON ce.id_email = e.id_email;


-- Comando D3. Um comando SELECT para exibir alguns dados dos registros das tabelas usando algum operador de junção externa (LEFT JOIN).
-- Significado: Listar todos os e-mails enviados e seus respectivos marcadores (exibindo o e-mail mesmo que ele não possua nenhum marcador associado).
SELECT e.id_email, e.assunto, m.nome AS nome_marcador
FROM email e
LEFT JOIN Marcadores m ON e.id_email = m.id_email;


-- Comando D4. Um comando SELECT para exibir alguns dados dos registros de tabelas usando o operador de junção qualificada FULL OUTER JOIN.
-- Significado: Fazer um mapeamento completo cruzando marcadores e dados da caixa de e-mail pelo identificador do e-mail.
SELECT m.nome AS marcador, ce.id_caixaEmail, ce.favoritar
FROM Marcadores m
FULL OUTER JOIN Caixa_email ce ON m.id_email = ce.id_email;
