----------------------------------------------------------
-- 1) Listar produtos com preço acima de R$ 100,
--    ordenados do mais caro para o mais barato.
----------------------------------------------------------
SELECT 
    id_produto,
    nome,
    categoria,
    marca,
    preco
FROM produto
WHERE preco > 100
ORDER BY preco DESC;


----------------------------------------------------------
-- 2) Mostrar todas as vendas com nome do cliente e vendedor
--    (JOIN entre 3 tabelas).
----------------------------------------------------------
SELECT 
    v.id_venda,
    v.data_venda,
    v.valor_total,
    c.nome AS cliente,
    ven.nome AS vendedor
FROM venda v
JOIN cliente c ON c.id_cliente = v.id_cliente
JOIN vendedor ven ON ven.id_vendedor = v.id_vendedor
ORDER BY v.data_venda;


----------------------------------------------------------
-- 3) Listar os itens das vendas com nome do produto
--    (JOIN entre item_venda, produto e venda).
----------------------------------------------------------
SELECT 
    i.id_item,
    v.id_venda,
    p.nome AS produto,
    i.quantidade,
    i.valor_unitario,
    (i.quantidade * i.valor_unitario) AS subtotal
FROM item_venda i
JOIN produto p ON p.id_produto = i.id_produto
JOIN venda v ON v.id_venda = i.id_venda
ORDER BY v.id_venda;


----------------------------------------------------------
-- 4) Listar os 3 produtos mais baratos
----------------------------------------------------------
SELECT 
    id_produto,
    nome,
    preco
FROM produto
ORDER BY preco ASC
LIMIT 3;


----------------------------------------------------------
-- 5) Total vendido por cada vendedor (uso de GROUP BY)
----------------------------------------------------------
SELECT 
    ven.nome AS vendedor,
    SUM(v.valor_total) AS total_vendido
FROM venda v
JOIN vendedor ven ON ven.id_vendedor = v.id_vendedor
GROUP BY ven.nome
ORDER BY total_vendido DESC;


