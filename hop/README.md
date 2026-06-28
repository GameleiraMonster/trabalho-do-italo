# 📊 Cloud Analytics com Olist

Projeto de construção de uma plataforma de **Cloud Analytics** utilizando o conjunto de dados públicos da **Olist**, contemplando todas as etapas de uma solução moderna de Business Intelligence: modelagem dimensional, desenvolvimento de pipelines ETL, armazenamento em Data Warehouse na nuvem e criação de dashboards analíticos.

## 📖 Sobre o Projeto

O objetivo deste projeto é transformar dados transacionais da Olist em informações estratégicas para apoio à tomada de decisão.

A solução foi desenvolvida seguindo a arquitetura de um **Data Warehouse** baseado em **Star Schema**, utilizando um processo completo de ETL para integrar os dados e disponibilizá-los para análises em ferramentas de BI.

O fluxo completo da solução é composto pelas seguintes etapas:

```
Dataset Olist (CSV)
        │
        ▼
 Apache Hop (ETL)
        │
        ▼
 Supabase (PostgreSQL)
        │
        ▼
 Preset.io (Apache Superset)
        │
        ▼
 Dashboards e Insights de Negócio
```

---

# 🎯 Objetivos

* Construir um Data Warehouse em ambiente Cloud;
* Implementar um processo ETL utilizando Apache Hop;
* Aplicar modelagem dimensional (Star Schema);
* Gerar métricas de vendas e logística;
* Criar dashboards interativos para análise de dados;
* Demonstrar uma arquitetura moderna de Analytics.

---

# 🛠 Tecnologias Utilizadas

| Tecnologia                  | Finalidade            |
| --------------------------- | --------------------- |
| PostgreSQL (Supabase)       | Data Warehouse        |
| Apache Hop                  | Processo ETL          |
| Preset.io (Apache Superset) | Dashboards            |
| SQL                         | Consultas e Modelagem |
| Git/GitHub                  | Versionamento         |
| Dataset Olist               | Fonte dos Dados       |

---

# 🏗 Arquitetura da Solução

A arquitetura foi dividida em três camadas principais:

### 1. Modelagem Dimensional

Foi desenvolvido um modelo dimensional utilizando Star Schema composto por:

* Fato Pedido Item
* Dimensão Cliente
* Dimensão Produto
* Dimensão Vendedor
* Dimensão Data
* Dimensão Pagamento
* Dimensão Avaliação
* Dimensão Localização

A tabela fato possui granularidade de **um registro para cada item vendido em um pedido**, permitindo análises detalhadas sobre vendas, frete, prazos de entrega e faturamento.

---

### 2. Processo ETL

O pipeline ETL foi desenvolvido no Apache Hop e realiza:

* Leitura dos arquivos CSV da Olist;
* Limpeza dos dados;
* Padronização das informações;
* Junção entre tabelas;
* Geração de Surrogate Keys;
* Cálculo de métricas de negócio;
* Carga das dimensões;
* Carga da tabela fato;
* Armazenamento no Supabase.

Os workflows garantem que todas as dimensões sejam carregadas antes da execução da carga da tabela fato.

---

### 3. Business Intelligence

Após o carregamento dos dados, o Data Warehouse é conectado ao Preset.io (Apache Superset), onde são desenvolvidos dashboards analíticos capazes de responder perguntas estratégicas do negócio.

Entre os indicadores produzidos estão:

* Volume de vendas por estado;
* Categorias de produtos mais vendidas;
* Distribuição geográfica dos vendedores;
* Receita total;
* Custos de frete;
* Prazo médio de entrega;
* Distribuição das vendas por categoria e região.

---

# 📂 Estrutura do Projeto

```
olist-cloud-analytics/
│
├── README.md
│
├── etapa1-modelagem/
│   ├── Diagramas
│   ├── DER
│   └── Documentação das dimensões
│
├── etapa2-etl/
│   ├── ddl/
│   ├── pipelines/
│   └── workflows/
│
└── etapa3-bi/
    ├── Dashboards
    ├── Relatório Executivo
    └── Queries SQL
```

---

# 📈 Principais Métricas

O projeto disponibiliza indicadores como:

* Receita Total
* Valor Médio dos Pedidos
* Valor do Frete
* Prazo Médio de Entrega
* Volume de Pedidos
* Produtos Mais Vendidos
* Estados com Maior Volume de Vendas
* Categorias Líderes em Comercialização

---

# 💡 Insights Obtidos

A análise dos dados permitiu identificar importantes características do marketplace da Olist, como:

* Forte concentração de vendedores no estado de São Paulo;
* Predominância de algumas categorias no volume total de vendas;
* Impacto da localização dos vendedores sobre os custos logísticos;
* Oportunidades para descentralização de estoques;
* Potencial de expansão comercial em regiões menos exploradas.

---

# 🚀 Como Executar o Projeto

### 1. Clone o repositório

```bash
git clone https://github.com/seu-usuario/olist-cloud-analytics.git
```

### 2. Configure o banco de dados

* Crie um projeto no Supabase;
* Execute os scripts SQL da pasta `ddl`.

### 3. Configure o Apache Hop

* Instale o Apache Hop;
* Configure a conexão JDBC com o PostgreSQL;
* Abra os pipelines do projeto.

### 4. Execute os Workflows

1. Workflow das Dimensões
2. Workflow da Tabela Fato
3. Workflow Principal

### 5. Visualize os Dados

Conecte o Preset.io ao banco PostgreSQL e importe os datasets para visualizar os dashboards.

---

# 📊 Modelo Dimensional

O Data Warehouse foi modelado utilizando a arquitetura Star Schema, composta por uma tabela fato central relacionada às dimensões de Cliente, Produto, Vendedor, Data, Pagamento, Avaliação e Localização.

Essa estrutura foi projetada para otimizar consultas analíticas e facilitar a criação de indicadores de desempenho.

---

# 👨‍💻 Equipe

* Jânio Silva Gameleira Júnior
* Matheus Ferreira de Lima
* Guilherme Henrique Costa Lima

---

# 📄 Licença

Este projeto possui fins exclusivamente acadêmicos e utiliza o conjunto de dados públicos disponibilizados pela Olist para estudos de Engenharia de Dados, Business Intelligence e Cloud Analytics.
