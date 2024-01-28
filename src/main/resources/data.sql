CREATE SCHEMA IF NOT EXISTS klepios;

SET NAMES 'UTF8MB4'; -- used to set the character encoding for data sent between the client application and the MySQL server
SET time_zone = '+02:00';

DROP TABLE IF EXISTS Patients; 
CREATE TABLE Patients (
    id              BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name      VARCHAR(50) NOT NULL,
    last_name       VARCHAR(50) NOT NULL,
    address         VARCHAR(255) DEFAULT NULL,
    department      VARCHAR(50) DEFAULT NULL,
    postal_code     VARCHAR(10) DEFAULT NULL,
    city            VARCHAR(100) DEFAULT NULL,
    admission_date  DATE DEFAULT NULL,
    birth_date      DATE DEFAULT NULL
);

DROP TABLE IF EXISTS Departments;
CREATE TABLE Departments (
    id         BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title      VARCHAR(50) NOT NULL,
    manager    VARCHAR(50) NOT NULL,
    CONSTRAINT UQ_Services_Title UNIQUE (title)
);

CREATE TABLE PatientsDepartments (
    patient_id BIGINT UNSIGNED NOT NULL,
    department_id BIGINT UNSIGNED NOT NULL,
    PRIMARY KEY (patient_id, department_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(id),
    FOREIGN KEY (department_id) REFERENCES Departments(id)
);

DROP TABLE IF EXISTS Users;
CREATE TABLE Users (
    id          BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name  VARCHAR(50) NOT NULL,
    last_name   VARCHAR(50) NOT NULL,
    username    VARCHAR(50) NOT NULL,
    service     VARCHAR(50) NOT NULL,
    email       VARCHAR(255) DEFAULT NULL,
    CONSTRAINT UQ_Users_Email UNIQUE (email),
    CONSTRAINT UQ_Users_Username UNIQUE (username)
);

-- DROP TABLE IF EXISTS Roles;

-- CREATE TABLE Roles (
--     id           BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     title        VARCHAR(50) NOT NULL,
--     permissions  VARCHAR(255) DEFAULT NULL, -- admin:read,admin:delete,customer:read etc
--     CONSTRAINT UQ_Roles_Title UNIQUE (title)
-- );

-- DROP TABLE IF EXISTS UsersRoles;

-- CREATE TABLE UserRoles (
--   id    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
--   user_id BIGINT UNSIGNED NOT NULL,
--   role_id BIGINT UNSIGNED NOT NULL,
--   FOREIGN KEY (user_id) REFERENCES Users (id),
--   FOREIGN KEY (role_id) REFERENCES Roles (id),
--   CONSTRAINT US_UserRoles_Id UNIQUE (user_id)
-- );

-- DROP TABLE IF EXISTS Events;

-- CREATE TABLE Events 
-- (
--     id           BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     type         VARCHAR(50) NOT NULL CHECK(type IN ('LOGIN_ATTEMPT', 'LOGIN_ATTEMPT_FAILURE', 'LOGIN_ATTEMPT_SUCCESS', 'PROFILE_UPDATE', 'PROFILE_PICTURE_UPDATE', 'ROLE_UPDATE', 'ACCOUNT_SETTINGS_UPDATE', 'MFA_UPDATE')),
--     description  VARCHAR(255) NOT NULL,
--     CONSTRAINT UQ_Events_Type UNIQUE (type)
-- );
 
INSERT INTO Patients (first_name, last_name, department, address, postal_code, city, admission_date, birth_date) VALUES
  ('Chuck', 'BORRIS', 'Legal', '123, Roundhouse Kick Lane', '75001', 'Walker', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Omar', 'SIMPSON', 'Engineering', '742 Evergreen Terrace', '62701', 'Springfield', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Barry', 'POTTER', 'Marketing', '4 Privet Drive', '10000', 'Little Whinging', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Sherlock', 'HOMESLICE', 'Legal', '221B, Baker Street', '91000', 'London', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Mickey', 'MOUSEKETEER', 'Sales', 'Walt Disney World', '12300', 'Orlando', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Elon', 'MARS', 'Engineering', 'Rocket Launchpad', '12345', 'Colony One', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Wonder', 'WOMANIZER', 'Legal', 'Themyscira Island', '88888', 'Paradise', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Jack', 'SPARROWDOUGHNUT', 'Human Resources', 'Black Pearl', '55555', 'Tortuga', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Darth', 'VADERADE', 'Human Resources', 'Death Star', '06660', 'Space', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'));

INSERT INTO Users (first_name, last_name, service, username, email) VALUES 
  ('Berney', 'Beckett', 'IT', 'djibh', 'contact@beckett.com');

INSERT INTO Departments (title, manager) VALUES 
  ('Rhumatologie', 'Dr. Henrietta Bonsens'), 
  ('Psychiatrie', 'Dr. Lucille Guéritout'), 
  ('Ophtalmologie', 'Dr. Auguste Rirelais'), 
  ('Toxicologie'), 'Dr. Rosalie Panacée', 
  ('Pédiatrie', 'Dr. Gaston Bienportant'), 
  ('Neurologie', 'Dr. Hortense Remèdes'), 
  ('Chirurgie', 'Dr. Félix Médiciné'), 
  ('Urgences adultes', 'Dr. Odette Panacéo'), 
  ('Urgences enfants', 'Dr. Romaine Santéclair'), 
  ('Pneumologie', 'Dr. Théo Panacotta');