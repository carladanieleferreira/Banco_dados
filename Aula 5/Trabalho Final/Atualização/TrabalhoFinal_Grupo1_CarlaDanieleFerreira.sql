/* ExercicioFinal_Grupo1:CarlaDanieleFerreira*/
/* DDL - SQL de criação das tabelas: */

CREATE TABLE cliente (
    codigo_cliente serial PRIMARY key,
    nome_completo varchar(60),
    nome_usuario varchar(60),
    email varchar(60),
    cpf char(11),
    data_nascimento date,
    endereco varchar(60)    
);

CREATE TABLE funcionario (
    codigo_funcionario serial PRIMARY KEY,
    nome_funcionario varchar(60),
    cpf char(11)
);

CREATE TABLE categoria_produto (
    codigo_categoria serial PRIMARY KEY,
    nome_categoria varchar(60),
    descricao_categoria varchar(60),
    fk_codigo_funcionario smallint,
    
    FOREIGN KEY (fk_codigo_funcionario)
    REFERENCES funcionario (codigo_funcionario)
);

CREATE TABLE produto (
    codigo_produto serial PRIMARY KEY,
    nome_produto varchar(60),
    descricao_produto varchar(60),
    data_fabricacao date,
    valor_unitario numeric,    
    quantidade_estoque smallint,
    fk_codigo_categoria smallint,
    fk_codigo_funcionario smallint,    
    
    FOREIGN KEY (fk_codigo_categoria)
    REFERENCES categoria_produto (codigo_categoria),
   
    FOREIGN KEY (fk_codigo_funcionario)
    REFERENCES funcionario (codigo_funcionario)
);

CREATE TABLE pedido (
    codigo_pedido serial PRIMARY KEY,
    data_pedido date,
    status_pedido varchar(60),
    fk_codigo_cliente smallint,
    
    FOREIGN KEY (fk_codigo_cliente)
    REFERENCES cliente (codigo_cliente)    
);

CREATE TABLE carrinho (
    quantidade_produto smallint,
    valor_na_venda numeric,
    fk_codigo_produto smallint,
    fk_codigo_pedido smallint,
    
    FOREIGN KEY (fk_codigo_produto)
    REFERENCES produto (codigo_produto),

    FOREIGN KEY (fk_codigo_pedido)
    REFERENCES pedido (codigo_pedido)
);
/* DML - Inserção de Dados nas Tabelas */

insert into funcionario (nome_funcionario,cpf) values
('Maria',45645645645),('José',78978978978),('Márcia',15915915915),('Marta',75375375375),('João',12312312312);


insert into cliente (nome_completo, nome_usuario, email, cpf, data_nascimento, endereco) values
('Ana Silva', 'anasilva', 'ana.silva@email.com', '12345678901', '1990-05-15', 'Rua A, 123'),
('Bruno Costa', 'brunocosta', 'bruno.costa@email.com', '23456789012', '1985-08-22', 'Avenida B, 456'),
('Carla Oliveira', 'carlaoliveira', 'carla.oliveira@email.com', '34567890123', '1992-12-30', 'Praça C, 789'),
('Daniela Santos', 'danielasantos', 'daniela.santos@email.com', '45678901234', '1988-03-10', 'Rua D, 101'),
('Eduardo Pereira', 'eduardopereira', 'eduardo.pereira@email.com', '56789012345', '1993-11-05', 'Avenida E, 202');

insert into categoria_produto (nome_categoria, descricao_categoria, fk_codigo_funcionario) values
('Eletrônicos', 'Produtos eletrônicos, como computadores e celulares',1),
('Roupas', 'Vestimentas para todas as estações e estilos',5),
('Alimentos', 'Itens alimentícios, incluindo alimentos frescos e embalados',5),
('Móveis', 'Móveis para todos os ambientes da casa',2),
('Livros', 'Livros de diversos gêneros e autores',3);

insert into produto (nome_produto, descricao_produto, data_fabricacao, 
valor_unitario, quantidade_estoque, fk_codigo_categoria, fk_codigo_funcionario) values
('Smartphone X200', 'Smartphone com 128GB de armazenamento', '2023-01-10', 1200.50, 30, 1, 2),
('Cadeira Ergônomica', 'Cadeira com ajuste de altura e apoio lombar', '2023-02-20', 350.75, 15, 4, 1),
('Camiseta Básica', 'Camiseta de algodão com diversas cores', '2023-03-05', 29.90, 360, 2, 3),
('Notebook Pro 15', 'Notebook com processador Intel i7 e 16GB de RAM', '2023-04-15', 2500.00, 20, 1, 2),
('Livro "Programação em Python"', 'Livro sobre programação em Python para iniciantes', '2023-05-25', 75.00, 50, 5, 3),
('Tablet Pro 10', 'Tablet com tela de 10 polegadas e 64GB de armazenamento', '2023-06-01', 800.00, 25, 1, 4),
('Sofá 3 Lugares', 'Sofá confortável de 3 lugares em tecido', '2023-07-15', 1500.00, 10, 4, 1),
('Tênis Running', 'Tênis para corrida com suporte adicional', '2023-08-10', 180.00, 40, 2, 2),
('Fone de Ouvido Wireless', 'Fone de ouvido sem fio com cancelamento de ruído', '2023-09-05', 350.00, 35, 1, 3),
('Relógio Smartwatch', 'Relógio inteligente com monitoramento de saúde', '2023-10-01', 600.00, 20, 1, 4),
('Barra de Cereal', 'Barra de Cereal com grãos', '2023-11-15', 6.00, 50, 3, 5),
('Mochila Escolar', 'Mochila com vários compartimentos e suporte para laptop', '2023-12-01', 95.00, 60, 2, 2),
('Tênis Casual', 'Tênis confortável para uso diário', '2024-01-20', 150.00, 45, 2, 3),
('Cadeira de Escritório', 'Cadeira ajustável com apoio de braços e lombar', '2024-02-10', 400.00, 12, 4, 4),
('Suplemento Alimentar', 'Frasco com vitaminas e suplementos', '2024-03-05', 5.00, 180, 3, 5);

insert into pedido (data_pedido,status_pedido,fk_codigo_cliente) values
('2024-08-21','Enviado',5),
('2024-08-21','Enviado',5),
('2024-08-21','Enviado',5),
('2024-08-21','Aguardando Confirmação de Pagamento',3),
('2024-08-22','Preparando para Envio',1),
('2024-08-23','Enviado',5),
('2024-08-24','Em separação de Estoque',5),
('2024-08-24','Em separação de Estoque',2),
('2024-08-24','Em separação de Estoque',2),
('2024-08-24','Em separação de Estoque',3);


insert into carrinho (quantidade_produto,valor_na_venda,fk_codigo_produto,fk_codigo_pedido) values
(2,5,11,1),
(1,350,9,2),
(2,65,12,3),
(5,27,3,3),
(1,2500,4,4),
(1,580,10,5),
(3,28,3,6),
(10,24,3,7),
(1,1200,1,8),
(5,27,3,8),
(5,27,3,9),
(5,27,3,10);

/* 5 SQLs de consulta (2join, 1count() e 1groupby(), 1livre) */

/* Count para saber quantos pedidos cada cliente fez usando inner join e group by */
select c.nome_usuario, count(p.codigo_pedido) from cliente c
inner join pedido p
on c.codigo_cliente = p.fk_codigo_cliente 
group by c.nome_usuario;

/* Join para saber quantos produtos o funcionario cadastrou */
select f.nome_funcionario, count(pr.fk_codigo_funcionario) from funcionario f
inner join produto pr 
on f.codigo_funcionario = pr.fk_codigo_funcionario 
group by f.nome_funcionario;

/* Consulta para saber o valor total de cada produto no estoque: */
select p.nome_produto, sum(p.valor_unitario*p.quantidade_estoque) as "valor_total_em_estoque"
from produto p
group by p.codigo_produto
order by p.codigo_produto asc;

/* Consulta para saber a categoria com os itens mais baratos e mais caros e a categoria com maior montante no estoque */
select cp.nome_categoria, 
sum(p.valor_unitario) as "valor_individual_dos_itens", 
sum(p.valor_unitario*p.quantidade_estoque) as "valor_total_da_categoria"
from categoria_produto cp
inner join produto p on cp.codigo_categoria = p.fk_codigo_categoria
group by cp.codigo_categoria; 

/* Consulta livre para checar todos os produtos do estoque: */
select * from produto p
order by codigo_produto asc;

/* Consulta para saber o valor total dos pedidos */
select ca.fk_codigo_pedido, sum(valor_na_venda*quantidade_produto) as valor_pedido 
from pedido p
inner join carrinho ca ON p.codigo_pedido = ca.fk_codigo_pedido
group by ca.fk_codigo_pedido
order by ca.fk_codigo_pedido asc;

/* Consulta com informações resumidas de um pedido específico */
select p.data_pedido, cl.cpf, pr.nome_produto, pr.valor_unitario, ca.valor_na_venda, 
sum(pr.valor_unitario - ca.valor_na_venda) as desconto, ca.quantidade_produto as qtd,
sum(ca.valor_na_venda*ca.quantidade_produto) as subtotal_item, p.codigo_pedido 
from pedido p
inner join cliente cl on cl.codigo_cliente = p.fk_codigo_cliente 
inner join carrinho ca on ca.fk_codigo_pedido = p.codigo_pedido
inner join produto pr on pr.codigo_produto = ca.fk_codigo_produto 
where p.codigo_pedido = 8
group by 
p.data_pedido,
cl.cpf,
pr.nome_produto,
pr.valor_unitario,
ca.valor_na_venda,
ca.quantidade_produto,
p.codigo_pedido 
order by p.codigo_pedido asc;


/* SQL para construção de nota fiscal */
with vtotal as (select ca.fk_codigo_pedido, sum(valor_na_venda*quantidade_produto) as valor_total_pedido 
from pedido p
inner join carrinho ca ON p.codigo_pedido = ca.fk_codigo_pedido
group by ca.fk_codigo_pedido
order by ca.fk_codigo_pedido asc)
select p.codigo_pedido as pedido, p.data_pedido as data, cl.nome_completo as nome, cl.cpf, 
pr.nome_produto as produto, pr.valor_unitario as preco, ca.valor_na_venda as valor_venda, 
sum(pr.valor_unitario - ca.valor_na_venda) as desconto, ca.quantidade_produto as qtd,
sum(ca.valor_na_venda*ca.quantidade_produto) as subtotal_item, v.valor_total_pedido, p.codigo_pedido as pedido 
from pedido p
inner join cliente cl on cl.codigo_cliente = p.fk_codigo_cliente 
inner join carrinho ca on ca.fk_codigo_pedido = p.codigo_pedido
inner join produto pr on pr.codigo_produto = ca.fk_codigo_produto
left join vtotal v on v.fk_codigo_pedido = p.codigo_pedido
group by 
p.codigo_pedido,
cl.nome_completo,
cl.cpf,
ca.quantidade_produto,
pr.nome_produto,
pr.valor_unitario,
ca.valor_na_venda,
v.valor_total_pedido,
p.codigo_pedido 
order by p.codigo_pedido asc;

