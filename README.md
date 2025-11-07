# Projeto E-commerce no MySQL Workbench

  Construindo meu Primeiro Projeto Lógico de Banco de Dados, usando o seguinte tema: E-commerce.

  O projeto lógico E-commerce tenta simular o modelo de dados de um sistema de comércio eletrônico. Ele organiza e relaciona informações sobre clientes, produtos, pedidos, pagamentos, entregas, fornecedores, vendedores e estoques.

  As principais entidades são:

  - clients: armazena dados de clientes pessoa física (PF) e jurídica (PJ), com restrição para CPF/CNPJ;

  - product: contém as informações dos produtos e suas categorias;

  - orders: registra os pedidos feitos pelos clientes, ligados a pagamentos e entregas;

  - payment e delivery: detalham as formas de pagamento e o status das entregas;

  - supplier e seller: representam, respectivamente, os fornecedores e os vendedores;

  - product_storage e storage_location: controlam a localização e a quantidade dos produtos em estoque.

  As tabelas intermediárias (product_seller, product_supplier, product_order, storage_location) estabelecem relacionamentos N:N, permitindo a integração entre produtos, fornecedores, vendedores, pedidos e estoques. O presente esquema busca representar uma base estruturada para o gerenciamento de todo o fluxo de vendas e logística de um e-commerce.

---

## DER (Diagrama Entidade-Relacionamento) 

![DER]

---

## Arquivos Elaborados

  - **[Script_Ecommerce.sql](Script_Ecommerce.sql)** | Estrutura do Banco de Dados
  - **[Dados_Ecommerce.sql](Dados_Ecommerce.sql)** | Base de Dados
  - **[Queries_Ecommerce.sql](Queries_Ecommerce.sql)** | Consultas (Queries) ao Banco de Dados
  - **[Diagrama_Ecommerce.mwb](Diagrama_Ecommerce.mwb)** | Diagrama Entidade-Relacionamento

---

## Tecnologias Envolvidas

  - Software utilizado: MySQL Workbench (IDE - Ambiente de Desenvolvimento Integrado)
  - Linguagem aplicada: SQL (Structured Query Language - Linguagem de Consulta Estruturada)
