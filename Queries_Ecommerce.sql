-- CRIAÇÃO DE CONSULTAS (QUERIES) PARA E-COMMERCE

USE ecommerce;

-- RECUPERAÇÃO DE TODOS OS DADOS INSERIDOS NAS TABELAS COM "SELECT" STATEMENT:
SELECT * FROM clients;
SELECT * FROM product;
SELECT * FROM payment;
SELECT * FROM delivery;
SELECT * FROM orders;
SELECT * FROM product_storage;
SELECT * FROM supplier;
SELECT * FROM seller;
SELECT * FROM product_seller;
SELECT * FROM product_supplier;
SELECT * FROM product_order;
SELECT * FROM storage_location;

-- RECUPERAÇÕES SIMPLES COM "SELECT" STATEMENT:
-- Retornar os nomes e tipos de todos os clientes cadastrados
SELECT F_Name, L_Name, type_Client FROM clients;

-- FILTROS COM "WHERE":
-- Listar apenas os produtos da categoria 'Eletrônico'
SELECT Pname, category FROM product
		WHERE category = 'Eletrônico';

-- EXPRESSÕES PARA GERAR ATRIBUTOS DERIVADOS:
-- Criar um atributo derivado (total_com_taxa), acrescentando 10% ao valor de envio
SELECT id_Order, send_Value, round((send_Value * 1.1), 2) AS total_com_taxa FROM orders;

-- ORDENAÇÃO DOS DADOS COM "ORDER BY":
-- Mostrar os produtos ordenados pela avaliação (da maior para a menor)
SELECT Pname, avaliation FROM product
		ORDER BY avaliation DESC;

-- CONDIÇÕES DE FILTROS AOS GRUPOS COM "HAVING":
-- Exibir apenas os clientes que fizeram mais de 1 pedido
SELECT id_Order_Client, COUNT(*) AS total_pedidos FROM orders
		GROUP BY id_Order_Client
				HAVING COUNT(*) > 1;

-- JUNÇÕES ENTRE TABELAS COM "JOIN":
-- Relacionar produtos, fornecedores e estoques
SELECT p.Pname, f.Social_Name, ps.Quantity FROM product p
		JOIN product_supplier ps ON p.id_Product = ps.id_PsProduct
		JOIN supplier f ON f.id_Supplier = ps.id_PsSupplier;