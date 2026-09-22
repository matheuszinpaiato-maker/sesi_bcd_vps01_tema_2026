# sesi_bcd_vps01_tema_2026

# Manutenção de equipamentos Tema04
Um banco de dados de manutenção de equipamentos em uma fábrica, onde o objetivo é controlar os equipamentos, seu histórico de manutenção, os técnicos responsáveis, peças utilizadas e as ordens de serviço.

# Imagens MER DER:


# Dicionário de dados em formato tabela MarkDown

|Entidade|Atributo|Tipo|Tamanho|Descricao|
|--|--|--|--|--|
|Equipamento|id|int|11|Indentificador|
|Equipamento|nome|varchar|100|Nome do Equipamento|
|Equipamento|tipo|varchar|100|Tipo do equipamento|
|Equipamento|marca|varchar|100|Marca do Equipamento|
|Equipamento|modelo|varchar|100|Modelo do Equipamento|
|Equipamento|numero_serie|varchar|11|Numero de Fabricacao do Equipamento|
|Equipamento|data_aquisicao|date|20|Data da compra do Equipamento|
|Equipamento|status|enum||Status do Equipamento|
|Equipamento|setor|varchar|20|Onde esta o Equipamento|
|Equipamento|valor_de_aquisicao|varchar|100|Valor de compra do Equipamento|
|Ordem de Manutencao|id_ordem|int|11|Indentificador|
|Ordem de Manutencao|id_equipamento|int|11|Indentificador|
|Ordem de Manutencao|tipo|varchar|100|Tipo da manutencao|
|Ordem de Manutencao|descricao|text|250+|Descricao do Conserto|
|Ordem de Manutencao|data_abertura|date|20|Data da Abertura de Conserto|
|Ordem de Manutencao|data_inicio|date|20|Data de inicio do Conserto|
|Ordem de Manutencao|data_fim|date|20|Data do final do Conserto|
|Ordem de Manutencao|status|enum||Status da Manutencao|
|Ordem de Manutencao|prioridade|varchar|10|Prioridade da Manutencao|
|Tecnico|id|int|11|Indentificador|
|Tecnico|nome|varchar|100|Nome do Tecnico|
|Tecnico|especialidade|text|250+|Especialidade do Tecnico|
|Tecnico|telefone|varchar|15|Telefone do Tecnico|
|Tecnico|email|varchar|100|Email do Tecnico|
|Peca|id_peca|int|11|Indentificador|
|Peca|nome |varchar|100|nome da Peca|
|Peca|descricao|varchar|50|descricao da Peca|
|Peca|quantidade_estoque|varchar|50|Quantidade da Peca|
|Peca|estoque_minimo|varchar|50|Quantidade minima da Peca|
|Peca|preco|decimal|10|2|Preco da Peca|
|Manutencao|id_manutencao|int|11|Indentificador|
|Manutencao|id_ordem|int|11|identificador|
|Manutencao|id_tecnico|int|11|Indentificador|
|Manutencao|descricao_servico|text|250+|Descricao da Manutencao|
|Manutencao|data_execucao|date|20|Data da Manutencao|
|Manutencao|horas_trabalhadas|varchar|5|Horas totais da Manutencao|
|Manutencao|observacoes|text|250+|Observacoes da Manutencao|
|Peca da Manutencao|id_manutencao|int|11|Indentificador|
|Peca da Manutencao|id_peca|int|11|Indentificador|
|Peca da Manutencao|quantidade|varchar|50|Quantidade da Peca|


# Dados de teste em CSV


# Script SQL DDL (Desenvolvimanto: Criação do Banco de dados)
```SQL
drop database if exists manutencao_de_equipamentos;
create database manutencao_de_equipamentos;
use manutencao_de_equipamentos;

create table equipamento(
    id int not null primary key auto_increment,
    nome varchar(100) not null,
    tipo varchar(100) not null,
    marca varchar(100) not null,
    modelo varchar(100) not null,
    numero_serie varchar(11) not null,
    data_aquisicao date not null,
    status ENUM('ATIVO', 'INATIVO') not null default('ATIVO'),
    setor varchar(20) not null,
    valor_de_aquisicao varchar(100) not null
);
create table ordem_manutencao(
    id_ordem int not null primary key,
    id_equipamento int not null,
    tipo varchar(100) not null,
    descricao text,
    data_abertura datetime not null,
    data_inicio date time not null default(curtime()),
    data_fim date time not null,
    status ENUM('CONSERTADO', 'PENDENTE') not null default('CONSERTADO'),
    prioridade varchar(10) not null
);
create table tecnico(
    id int not null primary key,
    nome varchar(100) not null,
    especialidade text not null,
    telefone varchar(15),
    email varchar(100)
);
create table peca(
    id_peca int not null primary key,
    nome varchar(100) not null,
    descricao varchar(50) not null,
    quantidade_estoque varchar(50) not null,
    estoque_minimo varchar(10) not null,
    preco decimal(10,2) not null
);
create table manutencao(
    id_manutencao int not null,
    id_ordem int not null,
    id_tecnico int not null,
    descricao_servico text not null,
    data_execucao date not null,
    horas_trabalhadas varchar(5) not null,
    observacoes text
);
create table peca_manutencao(
    id_manutencao int not null,
    id_peca int not null,
    quantidade varchar(50) not null,
);

alter table equipamento add constraint fk_equipamento foreign key (id_ordem) references orde_manutencao(id);
alter table orde_manutencao add constraint fk_faz foreign key (id_tecnico) references orde_manutencao(id);
alter table tecnico add constraint fk_possui foreign key (id_peca) references peca(id);
alter table peca add constraint fk_possui foreign key (id_manutencao) references peca(id);
alter table manutencao add constraint fk_possui foreign key (id_manutencao) references manutencao(id);


describe equipamento;
describe ordem_manutencao;
describe tecnico;
describe peca;
describe manutencao;
describe peca_manutencao;
show tables;
```

# Script SQL DML(Manipulação: População com dados de teste)
```SQL
use manutencao_de_equipamentos;
insert into equipamento(id,nome,marca,modelo,numero_serie,data_aquisicao,status,setor,valor_de_aquisicao) values
("Martelo","mizuno","v2","16","2025-09-11","ATIVO","setor04",67),
("Empilhadeira","cat","22","17","2026-10-11","ATIVO","setor05",200000),
("Furadeira","xiomi","v42","18","2024-08-07","INATIVO","setor06",600);

insert into orde_manutencao(id_ordem,id_equipamento,tipo,descricao,data_abertura,data_inicio,data_fim,status,prioridade) values
(1,2,"eletronico","Consertado a placa de funcionamento da Empilhadeira","2025-04-04","2025-04-05","2025-04-07","RESOLVIDO","urgente"),
(2,3,"eletronico","Consertado ","2025-04-04","2025-04-05","2025-04-07","RESOLVIDO","urgente"),
(3,4,"ferramenta","Consertado do Martelo","2025-05-05","2025-05-06","2025-05-06","RESOLVIDO","não urgente");

insert into tecnico(id,nome,especialidade,telefone,email) values
(1,"Jeferson","computacao","19 19949839", "jeferson@gmail.com"),
(2,"Joao sem Braco","eletronica","19 19946769", "joao@gmail.com"),
(3,"Davi sem Canela","carpintaria","19 1869472", "davi@gmail.com"),

insert into peca(id_peca,nome,descricao,quantidade_estoque,estoque_minimo,preco) values
(1,"prego","prego afiado","60","30",3),
(2,"grampo","grampo para grampriador","60","30",3),
(3,"cola","cola branca","60","30",3),

insert into manutencao(id_manutencao,id_ordem,id_tecnico,descricao_servico,data_execucao,horas_trabalhadas,observacoes) values
(1,2,3,"feito reparo no martelo","2","1","mais cuidado na proxima"),
(2,3,4,"feito reparo no grampiador","2","1","foi tacado na parede sem do"),
(3,4,5,"feito reparo na empilhadeira","2","4","roda furada, juntas desgastadas"),

insert into peca_manutencao(id_manutencao,id_peca,quantidade) values
(1,2,"10"),
(2,3,"12"),
(3,4,"13");

select * from equipamento;
select * from ordem_manutencao;
select * from tecnico;
select * from peca;
select * from manutencao;
select * from peca_manutencao;
```
