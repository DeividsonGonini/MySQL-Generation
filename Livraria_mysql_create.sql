CREATE TABLE `TB_EMPRESTIMO` (
	`cd_emprestimo` bigint NÃO NULL AUTO_INCREMENT,
	`cd_cpf_cliente` bigint NÃO NULL,
	`cd_isbn_livro` bigint NÃO NULL,
	`dt_emprestimo` DATA NÃO NULL,
	`dt_previsao_devolucao` DATE NOT NULL,
	`dt_devolucao` DATE,
	CHAVE PRIMÁRIA (`cd_emprestimo`)
);

CREATE TABLE `TB_PESSOA` (
	`cd_cpf` bigint NÃO NULL,
	`nm_nome` varchar (80) NÃO NULL,
	`dt_nascimento` DATE NOT NULL,
	`nm_email` varchar (120) NÃO NULL,
	`cd_celular` varchar (16) NÃO NULL,
	`cd_genero_favorito` bigint (16),
	CHAVE PRIMÁRIA (`cd_cpf`)
);

CRIAR O QUADRO LIVRO
	`cd_isbn` bigint NÃO NULL,
	`nm_titulo` varchar (255) NÃO NULL,
	`qt_livros` int NÃO NULL,
	`cd_genero` bigint NÃO NULL,
	CHAVE PRIMÁRIA (`cd_isbn`)
);

CREATE TABLE `TB_GENERO` (
	`cd_genero` bigint NÃO NULL AUTO_INCREMENT,
	`nm_genero` varchar (50) NÃO NULL ÚNICO,
	CHAVE PRIMÁRIA (`cd_genero`)
);

CREATE TABLE `CLIENTE` (
	`cd_emprestimo` bigint NÃO NULL,
	`cd_cpf_cliente` bigint NÃO NULL,
	`qt_emprestimo_ativos` int
);

ALTER TABLE `TB_EMPRESTIMO` ADD CONSTRAINT` TB_EMPRESTIMO_fk0` FOREIGN KEY (`cd_cpf_cliente`) REFERÊNCIAS` TB_PESSOA` (`cd_cpf`);

ALTER TABLE `TB_EMPRESTIMO` ADD CONSTRAINT` TB_EMPRESTIMO_fk1` FOREIGN KEY (`cd_isbn_livro`) REFERÊNCIAS` LIVRO` (`cd_isbn`);

ALTER TABLE `TB_PESSOA` ADD CONSTRAINT` TB_PESSOA_fk0` CHAVE ESTRANGEIRA (`cd_genero_favorito`) REFERÊNCIAS` TB_GENERO` (`cd_genero`);

ALTER TABLE `LIVRO` ADD CONSTRAINT` LIVRO_fk0` CHAVE ESTRANGEIRA (`cd_genero`) REFERÊNCIAS` TB_GENERO` (`cd_genero`);

ALTER TABLE `CLIENTE` ADD CONSTRAINT` CLIENTE_fk0` CHAVE ESTRANGEIRA (`cd_emprestimo`) REFERÊNCIAS` TB_EMPRESTIMO` (`cd_emprestimo`);

ALTER TABLE `CLIENTE` ADD CONSTRAINT` CLIENTE_fk1` CHAVE ESTRANGEIRA (`cd_cpf_cliente`) REFERÊNCIAS` TB_PESSOA` (`cd_cpf`);

