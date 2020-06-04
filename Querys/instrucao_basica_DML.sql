# Selecionando a Tabela
USE DB_HOTEL;

#Exibindo as colunas de uma tabela
SHOW COLUMNS FROM TB_QUARTO;

#Inserindo dados na tabela
INSERT INTO TB_QUARTO (cd_quarto, qt_cama_solteiro, qt_cama_casal) VALUES (100, 1, 0);

#Recuperando os dados da tabela (Todos)
SELECT * FROM TB_QUARTO;

SHOW COLUMNS FROM TB_PESSOA;

INSERT INTO TB_PESSOA(
	cd_cpf,
    nm_nome,
    dt_nascimento,
    nm_placa_veiculo,
    nm_modelo_veiculo,
    nm_cor_veiculo
) VALUES (
#Tipo numerico nao precisa de aspas
29923502811,
#Tipo Texto tem que passar entre aspas
'PATRICK FORMIGONI',
#Tipo Data tem que ser no formato Americano AAAA/MM/DD entre aspas
'1981/08/19',
'DDD2198',
'GOL',
'PRATA'
);

SELECT * FROM TB_PESSOA;

SELECT * FROM TB_HOSPEDAGEM;

SHOW COLUMNS FROM TB_HOSPEDAGEM;

INSERT INTO TB_HOSPEDAGEM(
	#Como é auto Increment nao precisa informar o valor de cd_hospedagem, caso informe, tem que colocar Null
	cd_hospedagem,
	dt_check_in,
    dt_prevista_check_out,
    vl_diaria,
    cd_quarto,
    cd_cpf_responsavel
)VALUES(
	#Como foi informado "cd_hospedagem"  tem que passar Null
    null,
    '2020/05/31',
    '2020/06/01',
    #Quando tiver valor decimal, temos que colocar o "." e não a ","
    250.50,
    100,
    29923502811
);

SELECT * FROM TB_HOSPEDAGEM;

SHOW COLUMNS FROM TB_HOSPEDE;

INSERT INTO TB_HOSPEDE(
	cd_hospedagem,
    cd_cpf
) VALUES(
	2,
    29923502811
);

SELECT * FROM TB_HOSPEDE;

INSERT INTO TB_QUARTO(cd_quarto, qt_cama_solteiro, qt_cama_casal) VALUES (110,2,0);
INSERT INTO TB_QUARTO(cd_quarto, qt_cama_solteiro, qt_cama_casal) VALUES (120,3,0);
INSERT INTO TB_QUARTO(cd_quarto, qt_cama_solteiro, qt_cama_casal) VALUES (210,0,1);
INSERT INTO TB_QUARTO(cd_quarto, qt_cama_solteiro, qt_cama_casal) VALUES (220,1,1);
INSERT INTO TB_QUARTO(cd_quarto, qt_cama_solteiro, qt_cama_casal) VALUES (230,2,1);

SELECT * FROM TB_QUARTO;

#Trazendo apenas a coluna desejada COD_QUARTO
#Para dar um Apelido a Coluna utilizar: AS "Nome da Coluna"
SELECT cd_quarto AS "COD QUARTO"
#Informando o Banco de Dados onde ela se encontra
FROM TB_QUARTO
#Colocando Condição com WHERE
WHERE qt_cama_solteiro > 0
#Adicionando mais condições com AND
AND qt_cama_casal =0
#Ordenando a exibição pode ser Ascendente ou Descendente
ORDER BY cd_quarto DESC
#Limitando a quantidade de Registros que aparecerão
LIMIT 1;


#Atualizando Dado
#Selecionando a tabela onde o dado sera atualizado
UPDATE TB_QUARTO SET
#Informando o campo e o valor
	qt_cama_casal = 1
    #Condição para atualização
    WHERE cd_quarto = 120;

#Deletando DADO
#Selecionando a tabela onde o dado sera apagado
DELETE FROM TB_QUARTO
#Condição para deletar
WHERE cd_quarto = 110;