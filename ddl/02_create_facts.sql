CREATE TABLE IF NOT EXISTS fato_pedido_item (
  sk_pedido_item BIGINT PRIMARY KEY,
  sk_cliente BIGINT REFERENCES dim_cliente(sk_cliente),
  sk_produto BIGINT REFERENCES dim_produto(sk_produto),
  sk_vendedor BIGINT REFERENCES dim_vendedor(sk_vendedor),
  sk_data_compra BIGINT REFERENCES dim_data(sk_data),
  sk_data_entrega BIGINT REFERENCES dim_data(sk_data),
  sk_pagamento BIGINT REFERENCES dim_pagamento(sk_pagamento),
  sk_avaliacao BIGINT REFERENCES dim_avaliacao(sk_avaliacao),
  preco NUMERIC(10,2), frete NUMERIC(10,2),
  receita_total NUMERIC(10,2),
  prazo_entrega_dias INT, atraso_entrega_dias INT,
  num_parcelas INT
);


CREATE INDEX idx_fato_cliente  ON fato_pedido_item(sk_cliente);
CREATE INDEX idx_fato_produto  ON fato_pedido_item(sk_produto);
CREATE INDEX idx_fato_vendedor ON fato_pedido_item(sk_vendedor);
CREATE INDEX idx_fato_data     ON fato_pedido_item(sk_data_compra);

--alterando o tamanho do order_status que ficou pequeno
ALTER TABLE fato_pedido_item
ALTER COLUMN order_status TYPE VARCHAR(20);
