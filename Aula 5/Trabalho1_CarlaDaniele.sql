CREATE TABLE autor (
	nome varchar(60),
	codigo_autor serial PRIMARY key 
	
);
CREATE TABLE livro (
    id_livro serial PRIMARY KEY,
    titulo varchar(60),
    fk_autor_codigo_autor int
);
CREATE TABLE usuario (
    id_usuario serial PRIMARY KEY,
    nome varchar(60),
    e_mail varchar(60)
);
CREATE TABLE emprestimo_livro (
    fk_usuario_id_usuario int,
    fk_livro_id_livro int,
    id_emprestimo serial PRIMARY KEY,
    data_emprestimo date,
    data_devolucao date,
    valor_emprestimo int    
);

ALTER TABLE livro ADD CONSTRAINT FK_livro_2
    FOREIGN KEY (fk_autor_codigo_autor)
    REFERENCES autor (codigo_autor)
    ON DELETE CASCADE;
   
   ALTER TABLE emprestimo_livro ADD CONSTRAINT FK__emprestimo_2
    FOREIGN KEY (fk_usuario_id_usuario)
    REFERENCES usuario (id_usuario);

   
   ALTER TABLE emprestimo_livro ADD CONSTRAINT FK__emprestimo_3
    FOREIGN KEY (fk_livro_id_livro)
    REFERENCES livro (id_livro)
    ON DELETE CASCADE;
   
      INSERT INTO autor (nome) VALUES
('Ana Carvalho'),
('Pedro Silva'),
('Mariana Costa'),
('João Pereira'),
('Clara Almeida'),
('Felipe Souza'),
('Luísa Martins'),
('Gabriel Oliveira'),
('Beatriz Lima'),
('Rafael Santos'),
('Julia Rocha'),
('Lucas Fernandes'),
('Isabela Nogueira'),
('Gustavo Andrade'),
('Tatiane Ferreira');


INSERT INTO usuario (nome, e_mail) VALUES
('Alice Silva', 'alice.silva@example.com'),
('Bruno Oliveira', 'bruno.oliveira@example.com'),
('Carla Costa', 'carla.costa@example.com'),
('Daniel Souza', 'daniel.souza@example.com'),
('Eduarda Pereira', 'eduarda.pereira@example.com'),
('Felipe Almeida', 'felipe.almeida@example.com'),
('Gabriela Santos', 'gabriela.santos@example.com'),
('Henrique Lima', 'henrique.lima@example.com'),
('Isabela Rocha', 'isabela.rocha@example.com'),
('João Martins', 'joao.martins@example.com'),
('Karine Fernandes', 'karine.fernandes@example.com'),
('Lucas Carvalho', 'lucas.carvalho@example.com'),
('Mariana Almeida', 'mariana.almeida@example.com'),
('Neto Oliveira', 'neto.oliveira@example.com'),
('Olga Ferreira', 'olga.ferreira@example.com');

INSERT INTO emprestimo_livro (fk_usuario_id_usuario,fk_livro_id_livro,data_emprestimo,data_devolucao,valor_emprestimo)
values
(1, 1, '2024-01-15', '2024-02-15', 30.00),
(2, 2, '2024-01-20', '2024-02-20', 25.00),
(3, 3, '2024-02-01', '2024-03-01', 40.00),
(4, 4, '2024-02-10', '2024-03-10', 35.00),
(5, 5, '2024-02-15', '2024-03-15', 50.00),
(6, 6, '2024-03-01', '2024-04-01', 20.00),
(1, 1, '2024-03-05', '2024-04-05', 45.00),
(8, 8, '2024-03-10', '2024-04-10', 55.00),
(9, 9, '2024-03-15', '2024-04-15', 60.00),
(10, 10, '2024-04-01', '2024-05-01', 28.00),
(11, 11, '2024-04-05', '2024-05-05', 33.00),
(12, 12, '2024-04-10', '2024-05-10', 27.00),
(13, 13, '2024-04-15', '2024-05-15', 42.00),
(14, 14, '2024-05-01', '2024-06-01', 38.00),
(1, 1, '2024-01-15', '2024-02-15', 30.00),
(1, 9, '2024-01-15', '2024-02-15', 60.00),
(15, 15, '2024-05-05', '2024-06-05', 48.00);

select * from emprestimo_livro

SELECT l.id_livro, l.titulo
FROM livro l
LEFT JOIN emprestimo_livro e ON l.id_livro = e.fk_livro_id_livro
WHERE e.fk_livro_id_livro IS NULL;

select count(emprestimo_livro.id_emprestimo) from emprestimo_livro

select a.codigo_autor, a.nome, count(l.id_livro) as quantidade_livros
from autor a
left join livro l on l.fk_autor_codigo_autor = a.codigo_autor
group by a.codigo_autor , a.nome
order by quantidade_livros desc;


select l.titulo, emprestimo_livro.valor_emprestimo from emprestimo_livro 
left join livro l on emprestimo_livro.fk_livro_id_livro = l.id_livro
order by valor_emprestimo desc;

delete from autor
WHERE nome = 'Luísa Martins';

select l.id_livro, l.titulo, SUM(emprestimo_livro.valor_emprestimo) AS total_arrecadado
FROM livro l
JOIN emprestimo_livro on l.id_livro = emprestimo_livro.fk_livro_id_livro
GROUP by l.id_livro, l.titulo;