#Comentario no MySQL Server Linha
/*Comentario no MySQL Server BLOCO*/

# Criando Banco de dados
CREATE DATABASE DB_HOTEL;

#Exibindo os Bancos de dados
SHOW DATABASES;

# Utilizando o Banco de dados
USE DB_HOTEL;

#Criando as Tabelas do Banco de Dados
CREATE TABLE TB_QUARTO(
cd_quarto INT NOT NULL,
qt_cama_solteiro INT NOT NULL,
qt_cama_casal INT NOT NULL,
PRIMARY KEY (cd_quarto)
);

# Exibir todas as tabelas do Banco de Dados
SHOW TABLE STATUS;

/* Exibir todas as colunas (campos) da tabela
Tem que Especificar a Tabela*/
SHOW COLUMNS FROM TB_QUARTO;

CREATE TABLE TB_HOSPEDAGEM(
cd_hospedagem BIGINT NOT NULL AUTO_INCREMENT,
dt_check_in DATE NOT NULL,
dt_prevista_check_out DATE NOT NULL,
dt_check_out DATE,
vl_diaria DECIMAL (6,2) NOT NULL,
cd_quarto INT NOT NULL,
cd_cpf_responsavel BIGINT NOT NULL,
PRIMARY KEY (cd_hospedagem),

#Criando uma chave Estrangeira
CONSTRAINT FK_TB_HOSPEDAGEM_CD_QUARTO FOREIGN KEY (cd_quarto) REFERENCES TB_QUARTO (cd_quarto)
);

SHOW TABLE STATUS;

CREATE TABLE TB_PESSOA(
cd_cpf BIGINT NOT NULL,
nm_nome VARCHAR (80) NOT NULL,
dt_nascimento DATE NOT NULL,
nm_email VARCHAR(120),
cd_celular VARCHAR(16),
nm_placa_veiculo VARCHAR(7),
nm_modelo_veiculo VARCHAR(30),
nm_cor_veiculo VARCHAR(15),
PRIMARY KEY (cd_cpf)
);

SHOW TABLE STATUS;

#Alterando a Tabela Ativa (que sera utilizada para alteração)
ALTER TABLE TB_HOSPEDAGEM ADD CONSTRAINT FK_HOSPEDAGEM_CD_RESPONSAVEL FOREIGN KEY (cd_cpf_responsavel) REFERENCES TB_PESSOA (cd_cpf);


CREATE TABLE TB_HOSPEDE(
cd_hospedagem BIGINT NOT NULL,
cd_cpf BIGINT NOT NULL,
CONSTRAINT FK_TB_HOSPEDE_CD_HOSPEDAGEM FOREIGN KEY (cd_hospedagem) REFERENCES TB_HOSPEDAGEM (cd_hospedagem),
CONSTRAINT FK_TB_HOSPEDE_CD_CPF FOREIGN KEY (cd_cpf) REFERENCES TB_PESSOA (cd_cpf)
);

SHOW TABLE STATUS;

#Adicionando Atributos (colunas) em tabelas ja criadas
ALTER TABLE TB_PESSOA ADD COLUMN cd_rg VARCHAR(10);

#Listando as Colunas
SHOW COLUMNS FROM TB_PESSOA;

#Deletando Atributos (colunas) em tabelas ja criadas
ALTER TABLE TB_PESSOA DROP COLUMN cd_rg;

#Criando tabela teste (para poder apaga-la)
CREATE TABLE TB_RESERVA(
cd_reserva BIGINT NOT NULL,
PRIMARY KEY (cd_reserva)
);

SHOW TABLE STATUS;

#Apagando tabela teste e todos os registros dela  (CUIDADO COM ESSE COMANDO!!!!)
DROP TABLE tb_reserva;

#Apagando um Banco de dados
DROP DATABASE DB_TESTE;