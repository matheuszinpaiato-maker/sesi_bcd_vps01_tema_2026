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