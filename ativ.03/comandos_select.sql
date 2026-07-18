
-- Comando C1. Um comando SELECT para listar todos os campos de todos os registros de uma tabela.
-- Significado: Listar todos os usuários cadastrados e suas informações básicas.
SELECT * FROM Usuario;


-- Comando C2. Um comando SELECT para listar alguns campos dos registros que satisfazem uma condição simples.
-- Significado: Listar o assunto e a data de todos os e-mails enviados pelo usuário 'ana.silva@gmail.com'.
SELECT assunto, data FROM email WHERE endereco_email = 'ana.silva@gmail.com';


-- Comando C3. Um comando SELECT para listar alguns campos dos registros que satisfazem uma condição composta.
-- Significado: Listar ID e e-mail dos registros da caixa de e-mail que estão favoritados AND cujo proprietário não é a Ana Silva.
SELECT id_caixaEmail, endereco_email FROM Caixa_email 
WHERE favoritar = true AND endereco_email <> 'ana.silva@gmail.com';


-- Comando C4. Um comando SELECT usando GROUP BY com os campos dos registros que satisfazem uma condição.
-- Significado: Contar quantos e-mails cada usuário enviou no mês de Julho de 2026.
SELECT endereco_email, COUNT(id_email) AS total_emails_julho
FROM email
WHERE data BETWEEN '2026-07-01' AND '2026-07-31'
GROUP BY endereco_email;


-- Comando C5. Um comando SELECT contendo como condição outro SELECT (SELECTs aninhados).
-- Significado: Listar os dados das mensagens (e-mails) que estão atualmente marcadas como SPAM.
SELECT id_email, assunto, conteudo 
FROM email 
WHERE id_email IN (SELECT id_email FROM Caixa_spam);
