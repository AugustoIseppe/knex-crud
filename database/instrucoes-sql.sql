-- criar banco de dados
create database esquenta;

-- mostrar banco de dados
show databases;

-- excluir banco de dados
drop database esquenta;

-- selecionar banco de dados
use esquenta;

-- criar tabela
create table cliente (
	id int,
	nome varchar(120),
	salario decimal(10,2),
	pontos int,
	nascimento date,
	administrador boolean,
	data_inclusao datetime
);

-- mostrar tabelas
show tables;

-- excluir tabela (gera erro caso a tabela nao exista)
drop table 'cliente';

-- excluir tabela se existir (não gera erro caso a tabela nao exista)
drop table if exists 'cliente';

-- criar tabela se nao existir
-- CONSTRAINTS = RESTRIÇÕES
create table if not exists cliente (
	id int not null unique,
	nome varchar(120) not null,
	salario decimal(10, 2) default 4000.00,
	pontos int,
	nascimento date,
	administrador boolean,
	data_inclusao datetime
);

-- selecionar o banco de dados 'esquenta'
use esquenta;

-- inserir um registro na tabela 'cliente' com os valores fornecidos
insert into cliente (id, nome, salario, pontos, nascimento, administrador, data_inclusao) 
values (5, 'Clarke Griffin', 6500.00, 22, '1992-11-10', true, NOW());

-- tentar inserir vários registros na tabela 'cliente' (há um erro na citação do nome da tabela)
insert into 'cliente' (id, nome, salario, pontos, nascimento, administrador, data_inclusao) 
values 
(2, 'Octavia', 2500.00, 12, '1992-12-15', false, NOW()), -- inserir registro para 'Octavia'
(3, 'T-Bag', 2500.00, 25, '1992-01-23', false, NOW()),   -- inserir registro para 'T-Bag' (corrigido o formato da data)
(4, 'John Murphy', 7500.00, 35, '1992-03-01', false, NOW()); -- inserir registro para 'John Murphy' (corrigido o formato da data e parênteses de fechamento)

-- selecionar todos os registros da tabela 'cliente'
select * from cliente;

-- selecionar o banco de dados 'esquenta'
use esquenta;

-- selecionar todos os registros da tabela 'cliente'
select * from cliente;

-- selecionar apenas os campos 'nome' e 'pontos' da tabela 'cliente'
select nome, pontos from cliente;

-- selecionar 'id' como 'identificador' e 'nome' como 'nomeCompleto' da tabela 'cliente'
select id as identificador, nome as nomeCompleto from cliente;

-- selecionar o 'nome' da tabela 'cliente' onde o 'id' for igual a 2
select nome from cliente where id = 2;

-- selecionar o 'nome' da tabela 'cliente' onde o 'id' for diferente de 1
select nome from cliente where id <> 1;

-- selecionar todos os registros da tabela 'cliente' onde o 'nome' começar com 'Cla'
select * from cliente where nome like 'Cla%';

-- selecionar todos os registros da tabela 'cliente' onde o 'nome' conter 'Cla' em qualquer posição
select * from cliente where nome like '%Cla%';

-- selecionar todos os registros da tabela 'cliente' onde o 'nome' terminar com 'Cla'
select * from cliente where nome like '%Cla';

-- selecionar todos os registros da tabela 'cliente' onde o 'salario' for maior que 3500
select * from cliente where salario > 3500;

-- selecionar todos os registros da tabela 'cliente' onde o 'salario' for menor que 3500
select * from cliente where salario < 3500;

-- selecionar todos os registros da tabela 'cliente' onde o 'salario' for maior ou igual a 3500
select * from cliente where salario >= 3500;

-- selecionar todos os registros da tabela 'cliente' onde o 'salario' for menor ou igual a 3500
select * from cliente where salario <= 3500;

-- selecionar 'nome' e 'salario' onde o 'salario' for igual a 3500 e o cliente for 'administrador'
select nome, salario from cliente where salario = 3500 and administrador = true;

-- selecionar 'nome' e 'salario' onde o 'salario' for igual a 3500 ou o cliente for 'administrador'
select nome, salario from cliente where salario = 3500 or administrador = true;

-- selecionar 'nome' e 'salario' onde o 'salario' não for menor ou igual a 3500
select nome, salario from cliente where not (salario <= 3500);

-- selecionar todos os registros da tabela 'cliente' ordenados por 'pontos' em ordem crescente (ascendente por padrão)
select * from cliente order by pontos;

-- selecionar todos os registros da tabela 'cliente' ordenados por 'pontos' em ordem decrescente
select * from cliente order by pontos desc;

-- selecionar os primeiros 3 registros da tabela 'cliente'
select * from cliente limit 3;

-- selecionar 3 registros da tabela 'cliente' a partir do 5º registro (ou seja, pular os primeiros 4)
select * from cliente limit 3 offset 4;

-- selecionar o banco de dados 'esquenta'
use esquenta;

-- selecionar todos os registros da tabela 'cliente'
select * from cliente;

-- atualizar o campo 'salario' para 1000000 onde o 'id' for igual a 1
update cliente set salario = 1000000 where id = 1;

-- atualizar o campo 'administrador' para false onde o 'id' for igual a 5
update cliente set administrador = false where id = 5;

-- atualizar o campo 'nome' para 'Lia' e 'pontos' para 0 onde o 'id' for igual a 3
update cliente set nome = 'Lia', pontos = 0 where id = 3;

-- selecionar o banco de dados 'esquenta'
use esquenta;

-- selecionar todos os registros da tabela 'cliente'
select * from cliente;

-- deletar o registro da tabela 'cliente' onde o 'id' for igual a 4
delete from cliente where id = 4;

-- deletar todos os registros da tabela 'cliente' onde o 'salario' for menor ou igual a 2500
delete from cliente where salario <= 2500;

-- deletar o registro da tabela 'cliente' onde o 'nome' for igual a 'Clarke Griffin'
delete from cliente where nome = 'Clarke Griffin';

-- deletar todos os registros da tabela 'cliente' (CUIDADO: NUNCA EXECUTAR ISSO SEM NECESSIDADE!)
delete from cliente; -- NUNCA FAZER ISSO!
