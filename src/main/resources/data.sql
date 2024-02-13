DROP SCHEMA IF EXISTS klepios;

CREATE SCHEMA IF NOT EXISTS klepios;

SET NAMES 'UTF8MB4'; -- used to set the character encoding for data sent between the client application and the MySQL server
SET time_zone = '+02:00';

-- DROP TABLE IF EXISTS Patients; 
CREATE TABLE Patients (
    id              BIGINT AUTO_INCREMENT PRIMARY KEY,
    first_name      VARCHAR(50) NOT NULL,
    last_name       VARCHAR(50) NOT NULL,
    address         VARCHAR(255) DEFAULT NULL,
    department      VARCHAR(50) DEFAULT NULL,
    postal_code     VARCHAR(10) DEFAULT NULL,
    city            VARCHAR(100) DEFAULT NULL,
    admission_date  DATE DEFAULT NULL,
    birth_date      DATE DEFAULT NULL
);

-- DROP TABLE IF EXISTS Departments;
CREATE TABLE Departments (
    id         BIGINT AUTO_INCREMENT PRIMARY KEY,
    title      VARCHAR(50) NOT NULL,
    manager    VARCHAR(50) NOT NULL,
    phone      VARCHAR(50) NOT NULL,
    CONSTRAINT UQ_Services_Title UNIQUE (title)
);

-- DROP TABLE IF EXISTS PatientsDepartments;
CREATE TABLE PatientsDepartments (
    patient_id BIGINT NOT NULL,
    department_id BIGINT NOT NULL,
    -- PRIMARY KEY (patient_id, department_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (department_id) REFERENCES Departments(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT UQ_PatientsDepartments_Id UNIQUE (patient_id)
);

-- DROP TABLE IF EXISTS Users;
CREATE TABLE Users (
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    first_name  VARCHAR(50) NOT NULL,
    last_name   VARCHAR(50) NOT NULL,
    service     VARCHAR(50) NOT NULL,
    username    VARCHAR(50) NOT NULL,
    password    VARCHAR(100) NOT NULL,
    email       VARCHAR(255) DEFAULT NULL,
    role       VARCHAR(255) DEFAULT NULL,
    CONSTRAINT UQ_Users_Email UNIQUE (email),
    CONSTRAINT UQ_Users_Username UNIQUE (username)
);

-- DROP TABLE IF EXISTS Roles;

-- CREATE TABLE Roles (
--     id           BIGINT AUTO_INCREMENT PRIMARY KEY,
--     title        VARCHAR(50) NOT NULL,
--     permissions  VARCHAR(255) DEFAULT NULL, -- admin:read,admin:delete,customer:read etc
--     CONSTRAINT UQ_Roles_Title UNIQUE (title)
-- );

-- DROP TABLE IF EXISTS UsersRoles;

-- CREATE TABLE UserRoles (
--   id    BIGINT AUTO_INCREMENT PRIMARY KEY,
--   user_id BIGINT NOT NULL,
--   role_id BIGINT NOT NULL,
--   FOREIGN KEY (user_id) REFERENCES Users (id),
--   FOREIGN KEY (role_id) REFERENCES Roles (id),
--   CONSTRAINT US_UserRoles_Id UNIQUE (user_id)
-- );

-- DROP TABLE IF EXISTS Events;

-- CREATE TABLE Events 
-- (
--     id           BIGINT AUTO_INCREMENT PRIMARY KEY,
--     type         VARCHAR(50) NOT NULL CHECK(type IN ('LOGIN_ATTEMPT', 'LOGIN_ATTEMPT_FAILURE', 'LOGIN_ATTEMPT_SUCCESS', 'PROFILE_UPDATE', 'PROFILE_PICTURE_UPDATE', 'ROLE_UPDATE', 'ACCOUNT_SETTINGS_UPDATE', 'MFA_UPDATE')),
--     description  VARCHAR(255) NOT NULL,
--     CONSTRAINT UQ_Events_Type UNIQUE (type)
-- );
 
INSERT INTO Patients (first_name, last_name, department, address, postal_code, city, admission_date, birth_date) VALUES
  ('Chuck', 'BORRIS', 'Rhumatologie', '123, Roundhouse Kick Lane', '75001', 'Walker', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Omar', 'SIMPSON', 'Psychiatrie', '742 Evergreen Terrace', '62701', 'Springfield', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Barry', 'POTTER', 'Ophtalmologie', '4 Privet Drive', '10000', 'Little Whinging', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Sherlock', 'HOMESLICE', 'Toxicologie', '221B, Baker Street', '91000', 'London', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Mickey', 'MOUSEKETEER', 'Pédiatrie', 'Walt Disney World', '12300', 'Orlando', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Elon', 'MARS', 'Neurologie', 'Rocket Launchpad', '12345', 'Colony One', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Wonder', 'WOMANIZER', 'Chirurgie', 'Themyscira Island', '88888', 'Paradise', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Jack', 'SPARROWDOUGHNUT', 'Urgences adultes', 'Black Pearl', '55555', 'Tortuga', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Darth', 'VADERADE', 'Pneumologie', 'Death Star', '06660', 'Space', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Bruce', 'WAYNE', 'Urgences adultes', 'Gotham Manor', '12345', 'Gotham City', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Tony', 'STARKY', 'Neurologie', 'Stark Tower', '54321', 'New York', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Clark', 'KENTASTIC', 'Ophtalmologie', 'Daily Planet', '98765', 'Metropolis', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Harley', 'QUINNIPAC', 'Toxicologie', 'Ace Chemicals', '45678', 'Gotham City', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Peter', 'PARKOURLER', 'Pédiatrie', 'Aunt Mays House', '13579', 'New York', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Indiana', 'JONESTOWN', 'Chirurgie', 'Lost Temple', '24680', 'Adventureland', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Hermione', 'GRANGERANGE', 'Urgences enfants', 'Hogwarts Castle', '97531', 'Wizarding World', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Luke', 'SKYWOKKA', 'Urgences adultes', 'Tatooine Farm', '12300', 'Galaxy Far Far Away', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Leia', 'ORGANAUT', 'Chirurgie', 'Alderaan Palace', '45678', 'Galaxy Far Far Away', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  
  ('Walter', 'WHITE', 'Rhumatologie', '308 Negra Arroyo Lane', '87104', 'Albuquerque', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Dexter', 'MORGAN', 'Psychiatrie', '3447 Ocean Drive', '33149', 'Miami', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Hannibal', 'LECTOR', 'Ophtalmologie', 'Casa della famiglia', '80132', 'Florence', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Norman', 'BATES', 'Toxicologie', 'Bates Motel', '97009', 'White Pine Bay', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Voldemort', 'AVADA', 'Chirurgie', 'Malfoy Manor', '12345', 'Wiltshire', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Jason', 'VOORHEES', 'Urgences adultes', 'Camp Crystal Lake', '07070', 'New Jersey', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Freddy', 'KRUETZ', 'Urgences adultes', 'Elm Street', '10001', 'Ohio', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Michael', 'MYERS', 'Pneumologie', 'Haddonfield', '90210', 'Illinois', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Mona', 'LISA', 'Psychiatrie', 'Louvre Museum', '75001', 'Paris', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Elsa', 'ICELANDER', 'Urgences adultes', 'Frozen Castle', '00001', 'Arendelle', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Harry', 'POTTERHEAD', 'Pédiatrie', '4 Privet Drive', '10000', 'Little Whinging', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Dobby', 'ELFKINS', 'Toxicologie', 'The Burrow', '12345', 'Ottery St. Catchpole', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Katniss', 'EVERDEEN', 'Urgences adultes', '12 Mockingjay Lane', '12345', 'District 12', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Shrek', 'SWAMPSTER', 'Pneumologie', '1320 Ogre Swamp', '56789', 'Far Far Away', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Frodo', 'BAGGINS', 'Rhumatologie', '1 Bag End', '12345', 'Hobbiton', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Hercules', 'STRONGMAN', 'Rhumatologie', 'Mount Olympus', '54321', 'Greece', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Mulan', 'DRAGONRIDER', 'Chirurgie', 'Imperial City', '98765', 'China', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Aragorn', 'KINGSLAYER', 'Psychiatrie', 'Gondor Citadel', '00000', 'Middle-earth', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Winnie', 'HONEYBEAR', 'Psychiatrie', 'Hundred Acre Wood', '12345', 'Hilltop', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Arya', 'NOONE', 'Neurologie', 'House of Black and White', '54321', 'Braavos', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Thor', 'THUNDERGOD', 'Ophtalmologie', 'Asgard Palace', '98765', 'Asgard', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Moana', 'OCEANEXPLORER', 'Toxicologie', 'Motunui Island', '00001', 'Polynesia', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Jack', 'SKELLINGTON', 'Urgences adultes', 'Halloween Town', '66666', 'Holidays', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Remy', 'RATATOUILLE', 'Pédiatrie', 'Gusteaus Restaurant', '75001', 'Paris', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Buzz', 'LIGHTYEAR', 'Urgences enfants', 'Star Command', '12345', 'Space', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y')),
  ('Yoda', 'FORCEMASTER', 'Pneumologie', 'Dagobah', '98765', 'Galaxy Far Far Away', STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'), STR_TO_DATE(DATE_FORMAT(NOW(), '%d/%m/%Y'), '%d/%m/%Y'));

INSERT INTO Users (first_name, last_name, service, username, password, email, role) VALUES 
  ('Berney', 'Beckett', 'IT', 'BerneyBeckett', '$2y$10$zVvrf3kNcvTKkrCHQEzyduZYCH2EtPdPcA/Nfg/tbUJdTBMwqtgAm', 'contact@beckett.com', 'ADMIN'),
  ('Julien', 'Riera', 'IT', 'JulienRiera', '$2y$10$0hwNhlnN/97kNdhIoQwav.uqu6UXHuuvdjrzfiGYTaEN4TbAcwFD.', 'contact@riera.com', 'USER');

INSERT INTO Departments (title, manager, phone) VALUES 
  ('Rhumatologie', 'Dr. Henrietta Bonsens', '03 88 11 22 33'), 
  ('Psychiatrie', 'Dr. Lucille Guéritout', '03 88 44 55 66'), 
  ('Ophtalmologie', 'Dr. Auguste Rirelais', '03 88 77 88 99'), 
  ('Toxicologie', 'Dr. Rosalie Panacée', '03 88 33 44 55'), 
  ('Pédiatrie', 'Dr. Gaston Bienportant', '03 88 66 77 88'), 
  ('Neurologie', 'Dr. Hortense Remèdes', '03 88 22 33 44'), 
  ('Chirurgie', 'Dr. Félix Médiciné', '03 88 55 66 77'), 
  ('Urgences adultes', 'Dr. Odette Panacéo', '03 88 88 99 00'), 
  ('Urgences enfants', 'Dr. Romaine Santéclair', '03 88 00 11 22'), 
  ('Pneumologie', 'Dr. Théo Panacotta', '03 88 99 00 11');

INSERT INTO PatientsDepartments (patient_id, department_id) VALUES 
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 10),
  (10, 8),
  (11, 6),
  (12, 3),
  (13, 4),
  (14, 5),
  (15, 7),
  (16, 9),
  (17, 8),
  (18, 7),
  (19, 1),
  (20, 2),
  (21, 3),
  (22, 4),
  (23, 7),
  (24, 8),
  (25, 8),
  (26, 10),
  (27, 2),
  (28, 8),
  (29, 5),
  (30, 4),
  (31, 8),
  (32, 10),
  (33, 1),
  (34, 1),
  (35, 7),
  (36, 2),
  (37, 2),
  (38, 6),
  (39, 3),
  (40, 4),
  (41, 8),
  (42, 5),
  (43, 9),
  (44, 10);