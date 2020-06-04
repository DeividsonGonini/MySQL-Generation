CREATE TABLE `PRODUTO` (
	`cd_produto` bigint(10) NOT NULL,
	`nm_nome` varchar(120) NOT NULL,
	`nm_descricao` varchar(500) NOT NULL,
	`vl_preco` DECIMAL(6.0,2.0) NOT NULL,
	`nm_img` varchar(200) NOT NULL,
	`cd_produto_ativo` BOOLEAN NOT NULL,
	`dt_publicacao` DATE NOT NULL,
	`cd_cpf_cnpj` bigint(14) NOT NULL,
	`cd_categoria` bigint(10) NOT NULL,
	PRIMARY KEY (`cd_produto`)
);

CREATE TABLE `USUARIO` (
	`cd_cpf_cnpj` bigint(14) NOT NULL,
	`nm_nome` varchar(120) NOT NULL,
	`nm_email` varchar(50) NOT NULL,
	`cd_tel` varchar(11) NOT NULL,
	`cd_senha` bigint(30) NOT NULL,
	`cd_permissao` int(2) NOT NULL,
	PRIMARY KEY (`cd_cpf_cnpj`)
);

CREATE TABLE `PERMISSAO` (
	`cd_permissao` int(2) NOT NULL,
	`nm_permissao` varchar(10) NOT NULL,
	PRIMARY KEY (`cd_permissao`)
);

CREATE TABLE `CATEGORIA` (
	`cd_categoria` bigint(10) NOT NULL,
	`nm_categoria` varchar(30) NOT NULL,
	PRIMARY KEY (`cd_categoria`)
);

CREATE TABLE `NEGOCIACAO` (
	`cd_negociacao` bigint(10) NOT NULL,
	`cd_id_fornecedor` bigint(14),
	`cd_id_comprador` bigint(14),
	`cd_produto` bigint(10) NOT NULL,
	`cd_venda` int(10),
	`dt_negociacao` DATE NOT NULL,
	PRIMARY KEY (`cd_negociacao`)
);

ALTER TABLE `PRODUTO` ADD CONSTRAINT `PRODUTO_fk0` FOREIGN KEY (`cd_cpf_cnpj`) REFERENCES `USUARIO`(`cd_cpf_cnpj`);

ALTER TABLE `PRODUTO` ADD CONSTRAINT `PRODUTO_fk1` FOREIGN KEY (`cd_categoria`) REFERENCES `CATEGORIA`(`cd_categoria`);

ALTER TABLE `USUARIO` ADD CONSTRAINT `USUARIO_fk0` FOREIGN KEY (`cd_permissao`) REFERENCES `PERMISSAO`(`cd_permissao`);

ALTER TABLE `NEGOCIACAO` ADD CONSTRAINT `NEGOCIACAO_fk0` FOREIGN KEY (`cd_id_fornecedor`) REFERENCES `USUARIO`(`cd_cpf_cnpj`);

ALTER TABLE `NEGOCIACAO` ADD CONSTRAINT `NEGOCIACAO_fk1` FOREIGN KEY (`cd_id_comprador`) REFERENCES `USUARIO`(`cd_cpf_cnpj`);

ALTER TABLE `NEGOCIACAO` ADD CONSTRAINT `NEGOCIACAO_fk2` FOREIGN KEY (`cd_produto`) REFERENCES `PRODUTO`(`cd_produto`);

