CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY
);

CREATE TABLE Cadastro (
    id_cadastro SERIAL PRIMARY KEY,
    fk_usuario_id INT not NULL,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(50) not NULL,
    celular VARCHAR(15) not NULL,
    cep VARCHAR(15) not NULL,
    numero INT not NULL,
    complemento VARCHAR(100),
    tipo_de_pessoa VARCHAR(50) not NULL,
  	CONSTRAINT fk_usuario FOREIGN KEY (fk_usuario_id) REFERENCES Usuario(id_usuario)
);


CREATE TABLE Artigos (
    id_artigo SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    conteudo TEXT NOT NULL
);

CREATE TABLE Comentarios (
    id_comentario SERIAL PRIMARY KEY,
    usuario_id_fk INT not NULL,
    nome_comentador VARCHAR(100) NOT NULL,
    email_comentador VARCHAR(50) NOT NULL,
    conteudo_comentario TEXT NOT NULL,
    fk_artigo_id INT NOT NULL,
  	CONSTRAINT usuario_fk FOREIGN key (usuario_id_fk) REFERENCES Usuario(id_usuario),
  	CONSTRAINT artigo_fk FOREIGN KEY (fk_artigo_id) REFERENCES Artigos(id_artigo)
);


INSERT INTO Usuario (id_usuario) 
VALUES 
      (1),
      (2),
      (3);
      

    
INSERT INTO Cadastro (fk_usuario_id, nome, email, celular, cep, numero, complemento, tipo_de_pessoa) 
VALUES 
		(1, 'João Silva', 'joao@email.com', '(11) 99999-9999', '12345-678', 10, 'Apto 101', 'Física'),
        (2, 'Vitoria Galvão', 'vitoriagalvao@email.com', '(11) 98640-4525', '13222-700', 143, 'Casa 2', 'Física'),
        (3, 'Nelson Rocha', 'nelsonrocha@email.com', '(19) 99523-9708', '13468-199', 919, 'Apto 10', 'Física');
        


INSERT INTO Artigos (titulo, conteudo) 
VALUES 
		('Artigo Teste', 'Este é um artigo de teste.');
        

        
INSERT INTO Comentarios (usuario_id_fk, nome_comentador, email_comentador, conteudo_comentario, fk_artigo_id) 
VALUES 
		(1, 'Maria Oliveira', 'maria@email.com', 'Ótimo artigo!', 1);
        
        
INSERT INTO Comentarios (usuario_id_fk, nome_comentador, email_comentador, conteudo_comentario, fk_artigo_id) 
VALUES 
		(2, 'Vitoria Galvão', 'vitoriagalvao@email.com', 'Gostei Muito!', 1);

-- seleciona tudo das tabelas
SELECT * from Usuario;
SELECT * from Cadastro;
SELECT * FROM Comentarios;
SELECT * from Artigos;

-- obter comentarios e artigos
SELECT c.nome_comentador AS nome_do_comentador,
       c.email_comentador AS email,
       a.titulo AS titulo_do_artigo,
       c.conteudo_comentario AS comentario 
FROM Comentarios c
INNER JOIN Artigos a ON c.fk_artigo_id = a.id_artigo;

-- obter artigos e seus comentarios
SELECT * FROM Artigos
JOIN Comentarios ON Artigos.id_artigo = Comentarios.fk_artigo_id;


-- obter numero de comentarios por artigo
SELECT 
    Artigos.titulo,
    COUNT(Comentarios.id_comentario) AS numero_de_comentarios
FROM 
    Artigos
LEFT JOIN 
    Comentarios ON Artigos.id_artigo = Comentarios.fk_artigo_id
GROUP BY 
    Artigos.titulo;



-- Obter todos os comentários de um artigo 
SELECT 
    Comentarios.id_comentario,
    Comentarios.nome_comentador,
    Comentarios.email_comentador,
    Comentarios.conteudo_comentario
FROM 
    Comentarios
WHERE 
    fk_artigo_id = 1; 
