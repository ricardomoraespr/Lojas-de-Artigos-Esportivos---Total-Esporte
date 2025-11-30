BEGIN TRANSACTION;

----------------------------------------------------------
-- UPDATES (3 comandos)
----------------------------------------------------------

-- 1) Atualizar o preço de um produto específico
UPDATE produto
SET preco = preco + 10     -- aumento de R$10
WHERE nome = 'Bola de Futebol';

-- 2) Corrigir o telefone de um cliente
UPDATE cliente
SET telefone = '(11) 98888-7777'
WHERE cpf = '987.654.321-00';

-- 3) Alterar a quantidade de um item de venda
UPDATE item_venda
SET quantidade = 2
WHERE id_venda = 3
  AND id_produto = 5;


----------------------------------------------------------
-- DELETES (3 comandos)
----------------------------------------------------------

-- 1) Remover um item de venda específico
DELETE FROM item_venda
WHERE id_item = 1;

-- 2) Excluir produtos de uma categoria específica
DELETE FROM produto
WHERE categoria = 'Vestuário';

-- 3) Remover clientes sem vendas registradas
DELETE FROM cliente
WHERE id_cliente NOT IN (SELECT id_cliente FROM venda);


