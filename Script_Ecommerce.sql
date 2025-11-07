-- CRIAÇÃO DO BANCO DE DADOS PARA E-COMMERCE

CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- CRIAÇÃO DAS TABELAS, INCLUINDO A VERIFICAÇÃO DO TIPO DE CLIENTE (PJ OU PF), OS TIPOS DE PAGAMENTO E A ENTREGA:

-- CRIAÇÃO DA TABELA CLIENTE
CREATE TABLE clients(
	id_Client INT AUTO_INCREMENT PRIMARY KEY,
	F_Name VARCHAR(30),
    Minit CHAR(30),
	L_Name VARCHAR(30),
    Birth_Date DATE,
    Social_Name VARCHAR(150),
	Address VARCHAR(100),
    type_Client ENUM('PJ', 'PF') NOT NULL,
    CPF CHAR(11),
    CNPJ VARCHAR(14),
    CONSTRAINT check_type_client CHECK (
        (type_Client = 'PF' AND CPF IS NOT NULL AND CNPJ IS NULL)
        OR
        (type_Client = 'PJ' AND CNPJ IS NOT NULL AND CPF IS NULL)
	),
	CONSTRAINT unique_cpf UNIQUE (CPF),
    CONSTRAINT unique_cnpj UNIQUE (CNPJ)
);

-- CRIAÇÃO DA TABELA PRODUTO, CONSIDERANDO SIZE = DIMENSÃO DO PRODUTO
CREATE TABLE product(
	id_Product INT AUTO_INCREMENT PRIMARY KEY,
	Pname VARCHAR(30),
	classification_kids BOOL default false,
	category ENUM('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') NOT NULL,
	avaliation FLOAT DEFAULT 0,
	size VARCHAR(10)
);

-- CRIAÇÃO DA TABELA PAGAMENTO
CREATE TABLE payment(
	id_Payment INT AUTO_INCREMENT PRIMARY KEY,
	type_Payment ENUM('Boleto', 'Cartão', 'Dois Cartões', 'Pix'),
	limit_Available FLOAT
);

-- CRIAÇÃO DA TABELA ENTREGA
CREATE TABLE delivery(
	id_delivery INT AUTO_INCREMENT PRIMARY KEY,
	status ENUM("Em rota", "Entregue", "Devolução"),
	cod_tracking VARCHAR(25),
	note VARCHAR(255)
);

-- CRIAÇÃO DA TABELA PEDIDO
CREATE TABLE orders(
	id_Order INT AUTO_INCREMENT PRIMARY KEY,
	id_Order_Client INT,
	id_Order_Payment INT,
	id_Order_Delivery INT,
	order_Status ENUM('Cancelado', 'Confirmado', 'Em processamento') DEFAULT 'Em processamento',
    order_Description VARCHAR(255),
    send_Value FLOAT DEFAULT 10,
    payment_Cash BOOL DEFAULT FALSE,
    CONSTRAINT fk_delivery_order FOREIGN KEY (id_Order_Delivery) REFERENCES delivery(id_delivery)
			ON UPDATE CASCADE,
    CONSTRAINT fk_payment_order FOREIGN KEY (id_Order_Payment) REFERENCES payment(id_Payment),
    CONSTRAINT fk_orders_client FOREIGN KEY (id_Order_Client) REFERENCES clients(id_Client)
			ON UPDATE CASCADE		
);

-- CRIAÇÃO DA TABELA ESTOQUE
CREATE TABLE product_storage(
	id_Product_Storage INT AUTO_INCREMENT PRIMARY KEY,
	storage_Location VARCHAR(255),
    quantity INT DEFAULT 0
);

-- CRIAÇÃO DA TABELA FORNECEDOR
CREATE TABLE supplier(
	id_Supplier INT AUTO_INCREMENT PRIMARY KEY,
	Social_Name VARCHAR(255) NOT NULL,
	CNPJ CHAR(15) NOT NULL,
	contact CHAR(11) NOT NULL,
	CONSTRAINT unique_supplier UNIQUE (CNPJ)
);

-- CRIAÇÃO DA TABELA VENDEDOR
CREATE TABLE seller(
	id_Seller INT AUTO_INCREMENT PRIMARY KEY,
	Social_Name VARCHAR(255) NOT NULL,
	abst_Name VARCHAR(255),
	CNPJ CHAR(15),
    CPF CHAR(9),
    location VARCHAR(255),
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_cnpj_seller UNIQUE (CNPJ),
    CONSTRAINT unique_cpf_seller UNIQUE (CPF)
);

-- RELAÇÃO N:N PRODUTO X VENDEDOR
CREATE TABLE product_seller(
	id_PSeller INT,
	id_PProduct INT,
	prodQuantity INT DEFAULT 1,
	PRIMARY KEY (id_PSeller, id_PProduct),
	CONSTRAINT fk_product_seller FOREIGN KEY (id_PSeller) REFERENCES seller(id_Seller),
	CONSTRAINT fk_product_product FOREIGN KEY (id_PProduct) REFERENCES product (id_Product)
);

-- RELAÇÃO N:N PRODUTO x FORNECEDOR
CREATE TABLE product_supplier(
	id_PsSupplier INT,
	id_PsProduct INT,
	Quantity INT NOT NULL,
	PRIMARY KEY (id_PsSupplier, id_PsProduct ),
	CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (id_PsSupplier) REFERENCES supplier(id_Supplier),
	CONSTRAINT fk_product_supplier_product FOREIGN KEY (id_PsProduct) REFERENCES product(id_Product)
);
					              
-- RELAÇÃO N:N PRODUTO X PEDIDO
CREATE TABLE product_order(
	id_POproduct INT,
    id_POorder INT,
    poQuantity INT DEFAULT 1,
    poStatus ENUM('Disponivel', 'Sem Estoque') DEFAULT 'Disponivel',
    PRIMARY KEY (id_POproduct, id_POorder),
    CONSTRAINT fk_productOrder_seller FOREIGN KEY (id_POproduct) REFERENCES product(id_Product),
    CONSTRAINT fk_productOrder_product FOREIGN KEY (id_POorder) REFERENCES orders(id_Order)
);

-- RELAÇÃO N:N ESTOQUE X PRODUTO
CREATE TABLE storage_location(
	id_Lproduct INT,
	id_Lstorage INT,
	location VARCHAR(255) NOT NULL,
	PRIMARY KEY (id_Lproduct, id_Lstorage),
	CONSTRAINT fk_storage_location_product FOREIGN KEY (id_Lproduct) REFERENCES product(id_Product),
	CONSTRAINT fk_storage_location_storage FOREIGN KEY (id_Lstorage) REFERENCES product_Storage(id_Product_Storage)
);      		

ALTER TABLE clients AUTO_INCREMENT=1;
ALTER TABLE product AUTO_INCREMENT=1;
ALTER TABLE payment AUTO_INCREMENT=1;
ALTER TABLE delivery AUTO_INCREMENT=1;
ALTER TABLE orders AUTO_INCREMENT=1;
ALTER TABLE product_storage AUTO_INCREMENT=1;
ALTER TABLE supplier AUTO_INCREMENT=1;
ALTER TABLE seller AUTO_INCREMENT=1;
ALTER TABLE product_seller AUTO_INCREMENT=1;
ALTER TABLE product_supplier AUTO_INCREMENT=1;
ALTER TABLE product_order AUTO_INCREMENT=1;
ALTER TABLE storage_location AUTO_INCREMENT=1;

show tables;

show databases;

use information_schema;

show tables;

desc referential_constraints;
select * from referential_constraints where constraint_schema = 'ecommerce';

drop database ecommerce;