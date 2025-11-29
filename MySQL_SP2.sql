CREATE DATABASE online_store_prod;

CREATE USER 'user'@'localhost' IDENTIFIED BY 'user_pass';
GRANT ALL PRIVILEGES ON online_store_prod.* TO 'user'@'localhost';
FLUSH PRIVILEGES;


-- Script convertido de PostgreSQL a MySQL
-- Compatible con MySQL 8.x
START TRANSACTION;

USE online_store_prod;

CREATE TABLE IF NOT EXISTS customer (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone BIGINT NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    customer_id BIGINT NOT NULL UNIQUE
) ENGINE=InnoDB;




USE online_store_prod;
CREATE TABLE IF NOT EXISTS product (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(100),
    price DECIMAL(10, 2) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    product_id BIGINT NOT NULL UNIQUE
) ENGINE=InnoDB;

USE online_store_prod;
CREATE TABLE IF NOT EXISTS orders (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    customer_id BIGINT NOT NULL,
    total_amount DECIMAL(10, 2),
    status VARCHAR(255) NOT NULL DEFAULT 'PENDING',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    order_id BIGINT NOT NULL UNIQUE,
    order_total DECIMAL(10, 2),
    CONSTRAINT fk_customer FOREIGN KEY (customer_id)
        REFERENCES customer (id)
        ON UPDATE NO ACTION
        ON DELETE CASCADE
) ENGINE=InnoDB;

USE online_store_prod;
CREATE INDEX idx_orders_customer_id ON orders(customer_id);

CREATE TABLE IF NOT EXISTS order_item (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    order_item_id BIGINT NOT NULL  UNIQUE,
    CONSTRAINT fk_order FOREIGN KEY (order_id)
        REFERENCES orders (id)
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT fk_product FOREIGN KEY (product_id)
        REFERENCES product (id)
        ON UPDATE NO ACTION
        ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE INDEX idx_order_item_order_id ON order_item(order_id);
CREATE INDEX idx_order_item_product_id ON order_item(product_id);

COMMIT;id




USE online_store_prod;

-- ⿡ Clientes
INSERT INTO customer (name, phone, email, customer_id)
VALUES
('Juan Pérez', 5512345678, 'juan.perez@example.com', 1),
('María López', 5587654321, 'maria.lopez@example.com', 2),
('Carlos Ramírez', 5522334455, 'carlos.ramirez@example.com', 3),
('Ana Torres', 5544556677, 'ana.torres@example.com', 4),
('Luis García', 5599887766, 'luis.garcia@example.com', 5);

-- ⿢ Productos
INSERT INTO product (name, description, price, is_active, product_id)
VALUES
('Laptop HP 14"', 'Laptop con procesador i5 y 8GB RAM', 14500.00, TRUE, 1),
('Smartphone Samsung A54', 'Pantalla AMOLED 6.4", 128GB', 8900.00, TRUE, 2),
('Audífonos Bluetooth', 'Cancelación de ruido, batería 24h', 1200.00, TRUE, 3),
('Mouse inalámbrico Logitech', 'Sensor óptico de alta precisión', 450.00, TRUE, 4),
('Monitor LG 24"', 'Full HD, 75Hz, HDMI', 3500.00, TRUE, 5);

-- ⿣ Pedidos
INSERT INTO orders (customer_id, total_amount, status, created_at, updated_at, order_id, order_total)
VALUES
(1, 15700.00, 'COMPLETED', NOW(), NOW(), 1, 15700.00),
(2, 3500.00, 'PENDING', NOW(), NOW(), 2, 3500.00),
(3, 8900.00, 'SHIPPED', NOW(), NOW(), 3, 8900.00),
(4, 1650.00, 'CANCELLED', NOW(), NOW(), 4, 1650.00),
(5, 450.00, 'PENDING', NOW(), NOW(), 5, 450.00);

-- ⿤ Detalle de pedidos (order_item)
INSERT INTO order_item (order_id, product_id, quantity, unit_price, order_item_id)
VALUES
(1, 1, 1, 14500.00, 1), -- Juan compró una laptop
(1, 3, 1, 1200.00, 2),  -- Juan compró audífonos
(2, 5, 1, 3500.00, 3),  -- María compró monitor
(3, 2, 1, 8900.00, 4),  -- Carlos compró celular
(4, 4, 2, 450.00, 5),   -- Ana compró dos mouse
(5, 4, 1, 450.00, 6);   -- Luis compró un mouse

-- ✅ Verificación rápida
SELECT * FROM customer;
SELECT * FROM product;
SELECT * FROM orders;
SELECT * FROM order_item;



