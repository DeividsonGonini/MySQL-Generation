CREATE DATABASE DB_LIVRARIA;

USE DB_LIVRARIA;

CREATE TABLE TB_GENERO(
	cd_genero INT NOT NULL,
    nm_nome_genero VARCHAR (50) NOT NULL,
    PRIMARY KEY (cd_genero)
);


CREATE TABLE TB_PESSOA(
	cd_cpf VARCHAR (11) NOT NULL,
    nm_nome VARCHAR(80) NOT NULL,
    td_nascimento DATE NOT NULL,
    nm_email VARCHAR(120) NOT NULL,
    cd_celular VARCHAR(16) NOT NULL,
    cd_genero_favorito INT NOT NULL,
    PRIMARY KEY (cd_cpf),
    CONSTRAINT FK_TB_PESSOA_CD_GENERO_FAVORITO FOREIGN KEY (cd_genero_favorito) REFERENCES TB_GENERO (cd_genero)
    );
    
    CREATE TABLE TB_LIVRO(
		cd_isbn INT NOT NULL AUTO_INCREMENT,
        nm_nome VARCHAR(255) NOT NULL,
        qt_livros INT NOT NULL,
        cd_genero INT,
        PRIMARY KEY (cd_isbn),
		CONSTRAINT FK_TB_LIVRO_CD_GENERO FOREIGN KEY (cd_genero) REFERENCES TB_GENERO (cd_genero)
    );
  
  CREATE TABLE TB_EMPRESTIMO(
	cd_emprestimo INT NOT NULL AUTO_INCREMENT,
    cd_cpf_cliente VARCHAR (11) NOT NULL,
	cd_isbn_livro INT NOT NULL,
    dt_emprestimo DATE NOT NULL,
    dt_previsao_devolucao DATE NOT NULL,
    dt_devolucao DATE,
    PRIMARY KEY (cd_emprestimo),
	CONSTRAINT FK_TB_EMPRESTIMO_CD_CPF_CLIENTE FOREIGN KEY (cd_cpf_cliente) REFERENCES TB_PESSOA (cd_cpf),
    CONSTRAINT FK_TB_EMPRESTIMO_CD_ISBN_LIVRO FOREIGN KEY (cd_isbn_livro) REFERENCES TB_LIVRO (cd_isbn)
);
  
  
  
  
  
  
  