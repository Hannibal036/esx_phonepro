-- Polizei / Bußgelder
CREATE TABLE IF NOT EXISTS `phone_fines` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `identifier` VARCHAR(60),
  `amount` INT,
  `reason` VARCHAR(255),
  `date` VARCHAR(50)
);

-- Mechaniker / Reparaturen
CREATE TABLE IF NOT EXISTS `mechanic_repairs` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `identifier` VARCHAR(60),
  `vehicle` VARCHAR(50),
  `type` VARCHAR(50),
  `date` VARCHAR(50),
  `cost` INT
);

-- Ambulanz Dispatch
CREATE TABLE IF NOT EXISTS `ambulance_calls` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `identifier` VARCHAR(60),
  `description` VARCHAR(255),
  `status` VARCHAR(50),
  `date` VARCHAR(50)
);

-- Feuerwehr Dispatch
CREATE TABLE IF NOT EXISTS `fire_calls` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `identifier` VARCHAR(60),
  `description` VARCHAR(255),
  `status` VARCHAR(50),
  `date` VARCHAR(50)
);

-- Mechaniker Dispatch
CREATE TABLE IF NOT EXISTS `mechanic_calls` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `identifier` VARCHAR(60),
  `vehicle` VARCHAR(50),
  `type` VARCHAR(50),
  `status` VARCHAR(50),
  `date` VARCHAR(50)
);

-- WhatsApp Messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `sender` VARCHAR(60),
  `receiver` VARCHAR(60),
  `message` TEXT,
  `date` VARCHAR(50)
);

-- Twitter Posts
CREATE TABLE IF NOT EXISTS `phone_tweets` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `identifier` VARCHAR(60),
  `handle` VARCHAR(50),
  `content` TEXT,
  `image` VARCHAR(255),
  `date` VARCHAR(50)
);

-- Kontakte / Nummern
CREATE TABLE IF NOT EXISTS `phone_contacts` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `identifier` VARCHAR(60),
  `name` VARCHAR(50),
  `number` VARCHAR(20)
);

-- Kamera / Galerie
CREATE TABLE IF NOT EXISTS `phone_gallery` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `identifier` VARCHAR(60),
  `image` TEXT,
  `date` VARCHAR(50)
);
