-- Criando banco de dados bdmovies
CREATE DATABASE if not exists bdmovies;
USE bdmovies;

-- Criando a tabela de gêneros
CREATE TABLE generos (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

-- Criando a tabela de diretores
CREATE TABLE diretores (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

-- Criando a tabela de filmes
CREATE TABLE filmes (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    ano_lancamento INTEGER NOT NULL,
    genero_id INTEGER,
    diretor_id INTEGER,
    FOREIGN KEY (genero_id) REFERENCES generos(id),
    FOREIGN KEY (diretor_id) REFERENCES diretores(id)
);

-- Criando a tabela de atores
CREATE TABLE atores (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

-- Criando a tabela associativa entre filmes e atores
CREATE TABLE filme_atores (
    filme_id INTEGER,
    ator_id INTEGER,
    FOREIGN KEY (filme_id) REFERENCES filmes(id),
    FOREIGN KEY (ator_id) REFERENCES atores(id),
    PRIMARY KEY (filme_id, ator_id)
);

-- Inserindo gêneros
INSERT INTO generos (nome) VALUES ('Ação'), ('Comédia'), ('Drama'), ('Ficção Científica');

-- Inserindo diretores
INSERT INTO diretores (nome) VALUES ('Steven Spielberg'), ('Christopher Nolan'), ('Quentin Tarantino');

-- Inserindo filmes
INSERT INTO filmes (titulo, ano_lancamento, genero_id, diretor_id)
VALUES 
('Jurassic Park', 1993, 1, 1),
('Inception', 2010, 4, 2),
('Pulp Fiction', 1994, 3, 3);

-- Inserindo atores
INSERT INTO atores (nome) VALUES ('Leonardo DiCaprio'), ('Samuel L. Jackson'), ('Tom Hanks');

-- Associando filmes com atores
INSERT INTO filme_atores (filme_id, ator_id)
VALUES 
(1, 3), -- Tom Hanks em Jurassic Park
(2, 1), -- Leonardo DiCaprio em Inception
(3, 2); -- Samuel L. Jackson em Pulp Fiction

