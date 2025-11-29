CREATE DATABASE online_store_dev;

CREATE USER 'user'@'localhost' IDENTIFIED BY 'user_pass';
GRANT ALL PRIVILEGES ON online_store_dev.* TO 'user'@'localhost';
FLUSH PRIVILEGES;


-- Script convertido de PostgreSQL a MySQL
-- Compatible con MySQL 8.x
START TRANSACTION;

USE online_store_dev;

CREATE TABLE IF NOT EXISTS customer (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone BIGINT NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    customer_id BIGINT NOT NULL AUTO_INCREMENT UNIQUE
) ENGINE=InnoDB;




CREATE TABLE IF NOT EXISTS product (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(100),
    price DECIMAL(10, 2) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    product_id BIGINT NOT NULL AUTO_INCREMENT UNIQUE
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS orders (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    customer_id BIGINT NOT NULL,
    total_amount DECIMAL(10, 2),
    status VARCHAR(255) NOT NULL DEFAULT 'PENDING',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    order_id BIGINT NOT NULL AUTO_INCREMENT UNIQUE,
    order_total DECIMAL(10, 2),
    CONSTRAINT fk_customer FOREIGN KEY (customer_id)
        REFERENCES customer (id)
        ON UPDATE NO ACTION
        ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE INDEX idx_orders_customer_id ON orders(customer_id);

CREATE TABLE IF NOT EXISTS order_item (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    order_item_id BIGINT NOT NULL AUTO_INCREMENT UNIQUE,
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

COMMIT;


DROP DATABASE online_store_dev;
CREATE DATABASE online_store_dev;
