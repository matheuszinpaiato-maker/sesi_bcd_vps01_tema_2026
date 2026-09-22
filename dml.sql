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