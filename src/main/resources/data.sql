CREATE SCHEMA IF NOT EXISTS hrnet;

SET NAMES 'UTF8MB4'; -- used to set the character encoding for data sent between the client application and the MySQL server
SET time_zone = '+02:00';

DROP TABLE IF EXISTS employees; 
 
CREATE TABLE employees (
    id           BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name   VARCHAR(50) NOT NULL,
    last_name    VARCHAR(50) NOT NULL,
    address      VARCHAR(255) DEFAULT NULL,
    department      VARCHAR(50) DEFAULT NULL,
    postal_code  VARCHAR(10) DEFAULT NULL,
    city         VARCHAR(100) DEFAULT NULL,
    state         VARCHAR(100) DEFAULT NULL,
    start_date   DATE DEFAULT NULL,
    birth_date   DATE DEFAULT NULL
);
 
INSERT INTO employees (first_name, last_name, department, address, postal_code, city, state, start_date, birth_date) VALUES
  ('Laurent', 'GINA', 'Marketing', '3, rue du soda', '75001', 'Paris', 'WA', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'));