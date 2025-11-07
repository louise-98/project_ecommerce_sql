-- CRIAÇÃO DA BASE DE DADOS PARA E-COMMERCE

USE ecommerce;

-- DADOS DOS CLIENTES
INSERT INTO clients (F_Name, Minit, L_Name, Birth_Date, Social_Name, Address, type_Client, CPF, CNPJ)
	VALUES 
			('Ana', 'M', 'Silva', '1990-05-12', NULL, 'Rua das Flores, 45', 'PF', '12345678901', NULL),
			('Bruno', 'L', 'Oliveira', '1985-03-20', NULL, 'Av. Brasil, 230', 'PF', '23456789012', NULL),
			('Empresa X', NULL, NULL, NULL, 'Empresa X LTDA', 'Rua Industrial, 100', 'PJ', NULL, '12345678000199'),
			('Carla', 'R', 'Mendes', '1992-10-08', NULL, 'Rua Verde, 78', 'PF', '34567890123', NULL),
			('EcoVida', NULL, NULL, NULL, 'EcoVida Sustentável ME', 'Av. Central, 400', 'PJ', NULL, '98765432000188');

-- DADOS DOS PRODUTOS
INSERT INTO product (Pname, classification_kids, category, avaliation, size)
	VALUES
			('Smartphone X', FALSE, 'Eletrônico', 4.5, '15cm'),
			('Camisa Polo', FALSE, 'Vestimenta', 4.0, 'M'),
			('Boneca Barbie', TRUE, 'Brinquedos', 5.0, '30cm'),
			('Cadeira Gamer', FALSE, 'Móveis', 4.8, '120cm'),
			('Chocolate Amargo', FALSE, 'Alimentos', 4.6, '200g');

-- DADOS DOS PAGAMENTOS
INSERT INTO payment (type_Payment, limit_Available)
	VALUES
			('Cartão', 3000),
			('Pix', 1000),
			('Boleto', 2000),
			('Dois Cartões', 5000),
			('Cartão', 2500);
            
-- DADOS DAS ENTREGAS
INSERT INTO delivery (status, cod_tracking, note)
	VALUES
			('Em rota', 'BR123456789', 'Saindo do centro de distribuição'),
			('Entregue', 'BR987654321', 'Recebido pelo cliente'),
			('Devolução', 'BR112233445', 'Produto devolvido'),
			('Entregue', 'BR223344556', 'Sem observações'),
			('Em rota', 'BR334455667', 'A caminho do destino');
            
-- DADOS DOS PEDIDOS
INSERT INTO orders (id_Order_Client, id_Order_Payment, id_Order_Delivery, order_Status, order_Description, send_Value, payment_Cash)
	VALUES
			(1, 1, 1, 'Confirmado', 'Compra de smartphone', 25.0, FALSE),
			(2, 2, 2, 'Confirmado', 'Compra de vestuário', 15.0, TRUE),
			(3, 3, 3, 'Cancelado', 'Compra corporativa', 30.0, FALSE),
			(4, 4, 4, 'Em processamento', 'Compra de brinquedo', 20.0, FALSE),
			(5, 5, 5, 'Confirmado', 'Compra de móveis e alimentos', 40.0, TRUE);

-- DADOS DOS ESTOQUES
INSERT INTO product_storage (storage_Location, quantity)
	VALUES
			('Depósito A', 100),
			('Depósito B', 250),
			('Depósito C', 300),
			('Depósito D', 150),
			('Depósito E', 200);

-- DADOS DOS FORNECEDORES
INSERT INTO supplier (Social_Name, CNPJ, contact)
	VALUES
			('TechSupply', '11222333000100', '11999990001'),
			('ModaBrasil', '22333444000111', '21988880002'),
			('ToyWorld', '33444555000122', '31977770003'),
			('MoveisLtda', '44555666000133', '41966660004'),
			('FoodHouse', '55666777000144', '51955550005');

-- DADOS DOS VENDEDORES
INSERT INTO seller (Social_Name, abst_Name, CNPJ, CPF, location, contact)
	VALUES
			('Loja Digital', 'LD', '11222333000100', NULL, 'São Paulo - SP', '11999990001'),
			('Estilo Moda', 'EM', '22333444000111', NULL, 'Rio de Janeiro - RJ', '21988880002'),
			('Mundo Brinquedo', 'MB', '33444555000122', NULL, 'Belo Horizonte - MG', '31977770003'),
			('Conforto Moveis', 'CM', '44555666000133', NULL, 'Curitiba - PR', '41966660004'),
			('Doces & Sabores', 'DS', '55666777000144', NULL, 'Porto Alegre - RS', '51955550005');

-- DADOS PARA RELAÇÃO PRODUTO x VENDEDOR
INSERT INTO product_seller (id_PSeller, id_PProduct, prodQuantity)
	VALUES
			(1, 1, 50),
			(2, 2, 100),
			(3, 3, 80),
			(4, 4, 40),
			(5, 5, 120);

-- DADOS PARA RELAÇÃO PRODUTO x FORNECEDOR
INSERT INTO product_supplier (id_PsSupplier, id_PsProduct, Quantity)
	VALUES
			(1, 1, 200),
			(2, 2, 300),
			(3, 3, 150),
			(4, 4, 100),
			(5, 5, 500);

-- DADOS PARA RELAÇÃO PRODUTO x PEDIDO
INSERT INTO product_order (id_POproduct, id_POorder, poQuantity, poStatus)
	VALUES
			(1, 1, 1, 'Disponivel'),
			(2, 2, 2, 'Disponivel'),
			(3, 4, 1, 'Disponivel'),
			(4, 5, 1, 'Disponivel'),
			(5, 3, 3, 'Sem Estoque');

-- DADOS PARA RELAÇÃO ESTOQUE x PRODUTO
INSERT INTO storage_location (id_Lproduct, id_Lstorage, location)
	VALUES
			(1, 1, 'Corredor A1'),
			(2, 2, 'Corredor B2'),
			(3, 3, 'Corredor C3'),
			(4, 4, 'Corredor D4'),
			(5, 5, 'Corredor E5');