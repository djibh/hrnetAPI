CREATE SCHEMA IF NOT EXISTS hrnet;

SET NAMES 'UTF8MB4'; -- used to set the character encoding for data sent between the client application and the MySQL server
SET time_zone = '+02:00';

DROP TABLE IF EXISTS patients; 
 
CREATE TABLE patients (
    id           BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name   VARCHAR(50) NOT NULL,
    last_name    VARCHAR(50) NOT NULL,
    address      VARCHAR(255) DEFAULT NULL,
    department      VARCHAR(50) DEFAULT NULL,
    postal_code  VARCHAR(10) DEFAULT NULL,
    city         VARCHAR(100) DEFAULT NULL,
    admission_date   DATE DEFAULT NULL,
    birth_date   DATE DEFAULT NULL
);
 
INSERT INTO patients (first_name, last_name, department, address, postal_code, city, admission_date, birth_date) VALUES
  ('Chuck', 'BORRIS', 'Legal', '123, Roundhouse Kick Lane', '75001', 'Walker', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Omar', 'SIMPSON', 'Engineering', '742 Evergreen Terrace', '62701', 'Springfield', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Barry', 'POTTER', 'Marketing', '4 Privet Drive', '10000', 'Little Whinging', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Sherlock', 'HOMESLICE', 'Legal', '221B, Baker Street', '91000', 'London', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Mickey', 'MOUSEKETEER', 'Sales', 'Walt Disney World', '12300', 'Orlando', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Elon', 'MARS', 'Engineering', 'Rocket Launchpad', '12345', 'Colony One', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Wonder', 'WOMANIZER', 'Legal', 'Themyscira Island', '88888', 'Paradise', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Jack', 'SPARROWDOUGHNUT', 'Human Resources', 'Black Pearl', '55555', 'Tortuga', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Darth', 'VADERADE', 'Human Resources', 'Death Star', '06660', 'Space', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'));