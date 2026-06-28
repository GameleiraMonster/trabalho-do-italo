CREATE TABLE IF NOT EXISTS dim_data (
  sk_data BIGINT PRIMARY KEY, data_completa DATE NOT NULL,
  dia INT, mes INT, ano INT, trimestre INT,
  nome_mes VARCHAR(15), dia_semana INT,
  nome_dia_semana VARCHAR(15), is_fim_semana BOOLEAN
);


CREATE TABLE IF NOT EXISTS dim_cliente (
  sk_cliente BIGINT PRIMARY KEY,
  customer_unique_id VARCHAR(50), customer_zip_code VARCHAR(10),
  customer_city VARCHAR(100), customer_state CHAR(2), regiao VARCHAR(20)
);


CREATE TABLE IF NOT EXISTS dim_produto (
  sk_produto BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  product_id VARCHAR(50) UNIQUE,
  product_category_name VARCHAR(100),
  product_name_lenght INT,
  product_description_lenght INT,
  product_photos_qty INT,
  product_weight_g INT,
  product_length_cm NUMERIC(6,2),
  product_height_cm NUMERIC(6,2),
  product_width_cm NUMERIC(6,2)
);

CREATE TABLE IF NOT EXISTS dim_vendedor (
  sk_vendedor BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  seller_id VARCHAR(50) UNIQUE,
  seller_zip_code_prefix VARCHAR(10),
  seller_city VARCHAR(120),
  seller_state VARCHAR(120),
  regiao VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS dim_pagamento (
  sk_pagamento BIGINT PRIMARY KEY, order_id VARCHAR(50),
  tipo_pagamento VARCHAR(30), num_parcelas INT,
  valor_pagamento NUMERIC(10,2)
);


CREATE TABLE IF NOT EXISTS dim_avaliacao (
  sk_avaliacao BIGINT PRIMARY KEY, review_id VARCHAR(50),
  nota INT, titulo_comentario TEXT,
  comentario TEXT, faixa_nota VARCHAR(20)
);


CREATE TABLE IF NOT EXISTS dim_localizacao (
  sk_localizacao BIGINT PRIMARY KEY, cep_prefixo VARCHAR(10),
  cidade VARCHAR(100), estado CHAR(2),
  latitude NUMERIC(9,6), longitude NUMERIC(9,6), regiao VARCHAR(20)
);


--FOI NECESSARIO DROPAR ALGUMAS TABELAS E CRIAR NOVAMNETE POR QUE ALGUNS NOMES ESTVAM COMFLITANDO NO HOP
--MATHEUS QUE CRIOU AS CONSULTAS NO SUPABASE E QUANDO EU JÂNIO ESTVA MEXENDO NO HOP DEU UMA DIVERGÊNCIA DE NOMES
-- O CASCADE vai apagar a tabela e remover temporariamente a restrição na Fato
DROP TABLE IF EXISTS dim_vendedor CASCADE;

CREATE TABLE dim_vendedor (
  sk_vendedor BIGINT PRIMARY KEY,
  seller_id VARCHAR(50) UNIQUE,
  seller_zip_code_prefix VARCHAR(15),
  seller_city VARCHAR(150),
  seller_state VARCHAR(50),
  regiao VARCHAR(30)
);

DROP TABLE IF EXISTS dim_pagamento CASCADE;

CREATE TABLE dim_pagamento (
  sk_pagamento BIGINT PRIMARY KEY,
  order_id VARCHAR(50),
  payment_sequential INT,
  payment_type VARCHAR(50),
  payment_installments INT,
  payment_value NUMERIC(10,2)
);

DROP TABLE IF EXISTS dim_avaliacao CASCADE;

CREATE TABLE dim_avaliacao (
  sk_avaliacao BIGINT PRIMARY KEY,
  review_id VARCHAR(50),
  order_id VARCHAR(50),
  review_score INT,
  review_comment_title VARCHAR(150),
  review_comment_message TEXT,
  review_creation_date TIMESTAMP,
  review_answer_timestamp TIMESTAMP
);

DROP TABLE IF EXISTS dim_avaliacao CASCADE;

CREATE TABLE dim_avaliacao (
  sk_avaliacao BIGINT PRIMARY KEY,
  review_id VARCHAR(50),
  order_id VARCHAR(50),
  review_score INT,
  review_comment_title VARCHAR(150),
  review_comment_message TEXT,
  review_creation_date TIMESTAMP,
  review_answer_timestamp TIMESTAMP
);


DROP TABLE IF EXISTS dim_localizacao CASCADE;

CREATE TABLE dim_localizacao (
  sk_localizacao BIGINT PRIMARY KEY,
  geolocation_zip_code_prefix VARCHAR(15),
  geolocation_lat NUMERIC(10, 8),
  geolocation_lng NUMERIC(11, 8),
  geolocation_city VARCHAR(150),
  geolocation_state VARCHAR(50)
);

SELECT column_name,
       is_identity,
       column_default
FROM information_schema.columns
WHERE table_name = 'fato_pedido_item'
AND column_name = 'sk_pedido_item';

ALTER TABLE fato_pedido_item
ALTER COLUMN sk_pedido_item
ADD GENERATED ALWAYS AS IDENTITY;



