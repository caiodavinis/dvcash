ALTER TABLE tec_products
ADD COLUMN id_ad INT NULL AFTER alert_quantity;

INSERT INTO tec_categories (id, code, name, image) VALUES ('10000', '00', 'Adicional', 'no_image.png');

ALTER TABLE tec_sales
ADD COLUMN observacao TEXT NULL AFTER rounding,
ADD COLUMN cpf VARCHAR(45) NULL AFTER observacao;

ALTER TABLE tec_suspended_sales
ADD COLUMN observacao TEXT NULL AFTER hold_ref;

ALTER TABLE tec_suspended_sales
ADD COLUMN cpf VARCHAR(45) NULL AFTER observacao;