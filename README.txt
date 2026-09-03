======================================================================
SUMÁRIO
======================================================================

1. Sobre o Projeto
   1.1. Objetivos
   1.2. Sobre a SPTrans

2. Escopo, Tecnologias e Metodologias
   - Escopo do Projeto
   2.1. Tecnologias Utilizadas
   2.3. Metodologias

3. Fontes Oficiais dos Dados

4. Arquitetura do Projeto

5. Modelagem do Banco de Dados
   5.1. Estrutura do Modelo Relacional

6. Dicionário de Dados Resumido
   6.1. Tabela: linha
   6.2. Tabela: veiculo
   6.3. Tabela: operacao

7. Criação do Banco de Dados

8. Criação das Tabelas

9. Importação dos Dados (CSV)

10. Criação de Usuários e Controle de Acesso

11. Views para Análise

12. Stored Procedures

13. Limitações dos Dados

14. Instruções Básicas para Execução

15. Equipe Desenvolvedora


======================================================================
DOCUMENTO COMPLETO: Sistema de Análise Operacional (SPTrans - Sambaíba)
======================================================================

* Nome do Projeto: Análise de Atrasos e Ocupação - SPTrans (Área 2 Norte)
* Integrantes da Equipe: Claudine Costa, Heitor Oliveira, João Paulo, Luis Oscar
* Link do Repositório GitHub: https://github.com/ClaudineCosta/SPTrans

----------------------------------------------------------------------

1. Sobre o Projeto
Este projeto desenvolve uma pesquisa de Engenharia de Dados para analisar informações operacionais da Sambaíba Transportes Urbanos, utilizando dados públicos da SPTrans. Os dados são tratados por meio de um processo ETL e armazenados em um banco de dados relacional para geração de indicadores.

A área de estudo corresponde à Área Operacional 2 da SPTrans (Zona Norte), operada pela empresa Sambaíba Transportes Urbanos. Esta região opera com 133 linhas e abrange distritos como Santana, Tucuruvi, Jaçanã, Vila Maria, Vila Guilherme, Tremembé, Vila Medeiros, Mandaqui, Cachoeirinha, Casa Verde e Limão.

### 1.1. Objetivos
Desenvolver uma base de dados que permita analisar:
* Linhas com maior ocupação;
* Horários de pico;
* Dias da semana com maior demanda;
* Linhas com maior índice de atraso.

#### 1.2. SOBRE A SPTRANS
----------------------------------------------------------------------
A SPTrans (São Paulo Transporte S.A.) é a empresa pública responsável pelo 
planejamento, gerenciamento e fiscalização do transporte coletivo municipal 
de São Paulo, além de disponibilizar os dados públicos utilizados no projeto.

----------------------------------------------------------------------


2. Escopo, Tecnologias e Metodologias

### Escopo do Projeto
* Empresa analisada: Sambaíba Transportes Urbanos
* Região: Área 2 – Norte (São Paulo)
* Fonte dos dados: SPTrans (Dados Oficiais - API Olho Vivo e GTFS)
* Banco de Dados: MySQL
* Linguagem / Ferramenta ETL: Power Query / Excel

### 2.1. Tecnologias Utilizadas
* MySQL Workbench: Modelagem e Banco de Dados
* Excel / Power Query: Apoio na transformação dos dados
* GitHub: Versionamento do projeto
* PowerPoint: Apresentação do projeto

### 2.3. Metodologias
* Engenharia de Dados: Base estrutural que orienta todo o fluxo desde a coleta até a disponibilização para análise.
* Processo ETL (Extract, Transform, Load): Pipeline principal onde os dados são extraídos, limpos e carregados no banco relacional.
* Modelagem Relacional: Estruturação de tabelas, chaves primárias, estrangeiras e relacionamentos para garantir integridade.
* Kanban (Trello): Gerenciamento de atividades da equipe (a fazer, em andamento, concluído).
* LGPD (Lei Geral de Proteção de Dados): Alinhamento com princípios de privacidade e uso responsável de dados.

3. FONTES OFICIAIS DOS DADOS
----------------------------------------------------------------------
- Bases públicas da SPTrans — GTFS e API Olho Vivo.
- Portal de Dados Abertos da Prefeitura de São Paulo.
- Arquivos CSV e Excel tratados posteriormente no Power Query e importados para o MySQL.
- Referência de atualização registrada no projeto: download em 28/07/2026, com última atualização indicada às 11h39.

4. ARQUITETURA DO PROJETO
----------------------------------------------------------------------
SPTrans (GTFS / API Olho Vivo) 
        ↓
Coleta dos dados 
        ↓
Tratamento e padronização — Excel / Power Query 
        ↓
Arquivos CSV tratados 
        ↓
MySQL 
        ↓
Views / Stored Procedures / Consultas 
        ↓
Indicadores de atrasos, demanda e ocupação


5. MODELAGEM DO BANCO DE DADOS
----------------------------------------------------------------------
O banco foi modelado para armazenar informações referentes às linhas, 
veículos e operações da Sambaíba, permitindo análises de ocupação e atrasos.

5.1 Estrutura do Modelo Relacional:
- LINHA (1) ─────────── (N) OPERAÇÃO (N) ─────────── (1) VEÍCULO

6. DICIONÁRIO DE DADOS RESUMIDO
----------------------------------------------------------------------
6.1 Tabela: linha
- id_linha (INT, PK): Identificador único da linha
- numero_linha (VARCHAR 10): Número oficial da linha
- nome_linha (VARCHAR 150): Nome da linha
- origem (VARCHAR 100): Terminal inicial
- destino (VARCHAR 100): Terminal final
- quantidade_frota (INT): Quantidade de ônibus alocados

6.2 Tabela: veiculo
- id_veiculo (INT, PK): Identificador único
- fabricante (VARCHAR 50): Fabricante
- modelo (VARCHAR 100): Modelo do veículo
- tipo (VARCHAR 30): Categoria operacional
- capacidade_sentados (INT): Passageiros sentados
- capacidade_em_pe (INT): Passageiros em pé
- ano (INT/YEAR): Ano de fabricação/modelo

6.3 Tabela: operacao
- id_operacao (INT, PK): Identificador único
- id_linha (INT, FK): FK para linha
- id_veiculo (INT, FK): FK para veiculo
- id_viagem_gtfs (VARCHAR 50): Identificador GTFS da viagem
- sentido (INT): 0 = ida; 1 = volta
- destino_viagem (VARCHAR 30): Destino da viagem
- data_operacao (DATE): Data da operação
- horario_programado (TIME): Horário previsto
- horario_real (TIME): Horário realizado
- atraso_minutos (INT): Diferença em minutos
- embarques (INT): Quantidade de embarques utilizada na análise

7. CRIAÇÃO DO BANCO DE DADOS
----------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS estudo_sptrans;
USE estudo_sptrans;

8. CRIAÇÃO DAS TABELAS
----------------------------------------------------------------------
CREATE TABLE linha (
    id_linha INT PRIMARY KEY AUTO_INCREMENT,
    numero_linha VARCHAR(10) NOT NULL,
    nome_linha VARCHAR(150) NOT NULL,
    origem VARCHAR(100),
    destino VARCHAR(100),
    quantidade_frota INT
);


CREATE TABLE veiculo (
    id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
    fabricante VARCHAR(50) NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    ano INT,
    tipo VARCHAR(30),
    capacidade_sentados INT,
    capacidade_em_pe INT
);

CREATE TABLE operacao (
    id_operacao INT PRIMARY KEY AUTO_INCREMENT,
    id_linha INT NOT NULL,
    id_veiculo INT NOT NULL,
    id_viagem_gtfs VARCHAR(50),
    sentido INT,
    destino_viagem VARCHAR(30),
    horario_programado TIME,
    data_operacao DATE,
    horario_real TIME,
    atraso_minutos INT,
    embarques INT,
    FOREIGN KEY (id_linha) REFERENCES linha(id_linha),
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo)
);

9. IMPORTAÇÃO DOS DADOS (CSV)
----------------------------------------------------------------------
Após o tratamento no Excel / Power Query, os arquivos são importados:
- linha.csv -> Tabela 'linha'
- veiculo.csv -> Tabela 'veiculo'
- operacao.csv -> Tabela 'operacao'

No MySQL Workbench, o caminho é: Server -> Data Import -> Table Data Import Wizard.

10. CRIAÇÃO DE USUÁRIOS E CONTROLE DE ACESSO
----------------------------------------------------------------------
-- Administrador
CREATE USER 'admin_sptrans'@'localhost' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON estudo_sptrans.* TO 'admin_sptrans'@'localhost';

-- Analista de dados
CREATE USER 'analista_sptrans'@'localhost' IDENTIFIED BY 'analista123';
GRANT SELECT ON estudo_sptrans.* TO 'analista_sptrans'@'localhost';

-- Usuário ETL
CREATE USER 'etl_sptrans'@'localhost' IDENTIFIED BY 'etl123';
GRANT SELECT, INSERT, UPDATE ON estudo_sptrans.* TO 'etl_sptrans'@'localhost';

11. VIEWS PARA ANÁLISE
----------------------------------------------------------------------
- vw_admin_linhas: visão cadastral e operacional das linhas.
- vw_admin_veiculos: visão geral dos veículos, capacidade, operações e atraso médio.
- vw_atrasos_por_linha: operações com atraso, atraso médio e maior atraso.
- vw_lotacao_por_linha: total e média de embarques, ocupação média percentual.
- vw_desempenho_veiculo: desempenho por veículo.
- vw_desempenho_diario: desempenho por data.

12. STORED PROCEDURES
----------------------------------------------------------------------
- sp_admin_operacoes_periodo: consulta operações por período.
- sp_ranking_atrasos: ranking das linhas por atraso médio.
- sp_etl_inserir_linha / sp_etl_atualizar_linha: gestão de linhas.
- sp_etl_inserir_veiculo: inclusão de veículos.
- sp_etl_inserir_operacao: inclusão de operações.

13. LIMITAÇÕES DOS DADOS
----------------------------------------------------------------------
A documentação registra que não há dados públicos diretos de embarques por viagem 
disponibilizados pela SPTrans. Para fins acadêmicos, os embarques foram estimados 
com base na capacidade da linha.

14. INSTRUÇÕES BÁSICAS PARA EXECUÇÃO
----------------------------------------------------------------------
Para rodar este projeto e configurar o banco de dados da SPTrans localmente, siga os passos abaixo:

1. Criação do Banco de Dados: Abra o seu MySQL Workbench, crie e selecione o banco executando o comando:
   CREATE DATABASE IF NOT EXISTS estudo_sptrans;
   USE estudo_sptrans;

2. Criação das Tabelas: Execute o script SQL estrutural para criar as tabelas principais (`linha`, `veiculo` e `operacao`) com suas respectivas chaves estrangeiras.

3. Tratamento e Exportação (ETL): Realize a limpeza e padronização dos dados brutos utilizando o Excel / Power Query e exporte os resultados nos arquivos CSV correspondentes (`linha.csv`, `veiculo.csv` e `operacao.csv`).

4. Importação dos Dados: No MySQL Workbench, vá em Server -> Data Import -> Table Data Import Wizard, e importe cada arquivo CSV para sua respectiva tabela.

5. Criação de Usuários e Segurança: Execute os scripts de criação de usuários para segregar os perfis de acesso (`admin_sptrans`, `analista_sptrans` e `etl_sptrans`).

6. Views e Procedures: Execute os scripts de criação das Views analíticas e Stored Procedures para automatizar a extração de indicadores gerenciais.

7. Execução de Consultas: Utilize as queries e relatórios prontos para gerar os indicadores de atrasos, horários críticos, demanda e ocupação média da frota.


15. EQUIPE DESENVOLVEDORA
----------------------------------------------------------------------
- Claudine Costa
- Heitor Oliveira
- João Paulo
- Luis Oscar

Repositório GitHub: (https://github.com/ClaudineCosta/SPTrans)
