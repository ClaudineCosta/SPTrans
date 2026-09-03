**Sumario:**
1.Sobre o projeto
2.Objetivos
3.A SpTrans
4.Tecnologias utilizada
5.Metodologias
5.Como executar
6.Equipe Desenvolvedora

--- 
# Projeto: Sistema de Análise Operacional (SPTrans - Sambaíba)

* **Nome do Projeto:** Análise de Atrasos e Ocupação - SPTrans (Área 2 Norte)

* **Integrantes da Equipe:** Claudine Costa, Heitor Oliveira, João Paulo, Luis Oscar
* **Link do Repositório GitHub:** [https://github.com/ClaudineCosta/SPTrans]

---

## 1. Sobre o Projeto
Este projeto desenvolve uma pesquisa de Engenharia de Dados para analisar informações operacionais da Sambaíba Transportes Urbanos, utilizando dados públicos da SPTrans. Os dados são tratados por meio de um processo ETL e armazenados em um banco de dados relacional para geração de indicadores.

A área de estudo corresponde à Área Operacional 2 da SPTrans (Zona Norte), operada pela empresa Sambaíba Transportes Urbanos. Esta região opera com 133 linhas e abrange distritos como Santana, Tucuruvi, Jaçanã, Vila Maria, Vila Guilherme, Tremembé, Vila Medeiros, Mandaqui, Cachoeirinha, Casa Verde e Limão.

### Objetivos
Desenvolver uma base de dados que permita analisar:
* Linhas com maior ocupação;
* Horários de pico;
* Dias da semana com maior demanda;
* Linhas com maior índice de atraso.

### Sobre a SPTrans
A SPTrans (São Paulo Transporte S.A.) é a empresa pública responsável pelo planejamento, gerenciamento e fiscalização do transporte coletivo municipal de São Paulo, além de disponibilizar os dados públicos utilizados neste projeto.

---

## 2. Escopo, Tecnologias e Metodologias

### Escopo do Projeto
* **Empresa analisada:** Sambaíba Transportes Urbanos
* **Região:** Área 2 – Norte (São Paulo)
* **Fonte dos dados:** SPTrans (Dados Oficiais - API Olho Vivo e GTFS)[cite: 1]
* **Banco de Dados:** MySQL[cite: 1]
* **Linguagem / Ferramenta ETL:** Power Query / Excel[cite: 1]

### Tecnologias Utilizadas
* **MySQL Workbench:** Modelagem e Banco de Dados[cite: 1]
* **Excel / Power Query:** Apoio na transformação dos dados[cite: 1]
* **GitHub:** Versionamento do projeto[cite: 1]
* **PowerPoint:** Apresentação do projeto[cite: 1]

### Metodologias
* **Engenharia de Dados:** Base estrutural que orienta todo o fluxo desde a coleta até a disponibilização para análise[cite: 1].
* **Processo ETL (Extract, Transform, Load):** Pipeline principal onde os dados são extraídos, limpos e carregados no banco relacional[cite: 1].
* **Modelagem Relacional:** Estruturação de tabelas, chaves primárias, estrangeiras e relacionamentos para garantir integridade[cite: 1].
* **Kanban (Trello):** Gerenciamento de atividades da equipe (a fazer, em andamento, concluído)[cite: 1].
* **LGPD (Lei Geral de Proteção de Dados):** Alinhamento com princípios de privacidade e uso responsável de dados[cite: 1].
---
## 3. Instruções Básicas para Execução
Para rodar este projeto e configurar o banco de dados da SPTrans localmente, siga os passos abaixo:

1. **Criação do Banco de Dados:** Abra o seu MySQL Workbench, crie e selecione o banco de dados executando[cite: 1]:
   ```sql
  CREATE DATABASE IF NOT EXISTS estudo_sptrans;
   USE estudo_sptrans;

