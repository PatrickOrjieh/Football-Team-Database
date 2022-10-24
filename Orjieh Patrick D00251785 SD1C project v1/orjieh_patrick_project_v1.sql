drop database if exists manchester_united;
create database manchester_united;
use manchester_united;
drop table if exists competition, player, matches, statistics_play, contract;

CREATE TABLE `manchester_united`.`competition` 
( `comp_id` VARCHAR(10) NOT NULL ,
  `comp_name` VARCHAR(30),
  `host` VARCHAR(20),
  `position` VARCHAR(30),
  PRIMARY KEY  (`comp_id`)) ENGINE = InnoDB;

CREATE TABLE `manchester_united`.`player` 
( `player_id` INT NOT NULL ,
  `player_name` VARCHAR(30),
  `age` INT,
  `player_position` VARCHAR(20),
  `nationality` VARCHAR(30),
  `preferred_foot` VARCHAR(10),
  PRIMARY KEY  (`player_id`)) ENGINE = InnoDB;
  
  CREATE TABLE `manchester_united`.`statistics_play` 
  ( `comp_id` VARCHAR(10) NOT NULL ,
  `player_id` INT NOT NULL ,
  `apps` INT,
  `goals` INT,
  `assists` INT,
  `yellow_card` INT,
  `red_card` INT,
  `motm` INT,
  PRIMARY KEY  (`comp_id`, `player_id`),
  FOREIGN KEY (`comp_id`) REFERENCES `competition`(`comp_id`),
  FOREIGN KEY (`player_id`) REFERENCES `player`(`player_id`));  
  
  CREATE TABLE `manchester_united`.`matches` 
  ( `match_no` VARCHAR(10) NOT NULL ,
  `comp_id` VARCHAR(10) NOT NULL ,
  `opponent` VARCHAR(30),
  `venue` VARCHAR(30),
  `kick-off` DATE,
  PRIMARY KEY  (`match_no`),
  FOREIGN KEY (`comp_id`) REFERENCES `competition`(`comp_id`));
  
  CREATE TABLE `manchester_united`.`contract` 
  ( `contract_id` INT NOT NULL ,
  `player_id` INT NOT NULL ,
  `value_mill` DECIMAL(10,2) DEFAULT 0,
  `date` DATE,
  `agent` VARCHAR(30),
  PRIMARY KEY  (`contract_id`),
  FOREIGN KEY (`player_id`) REFERENCES `player`(`player_id`));
  
  INSERT INTO `competition`  
  (`comp_id`, `comp_name`, `host`, `position`) VALUES
  ('PrL', 'Premier League', 'England', '3rd'), 
  ('ChL', 'Champions League', 'Europe', 'Quarter-Final'), 
  ('FaC', 'FA Cup', 'England', 'Round Of 32'), 
  ('EfC', 'EFL Cup', 'England', 'Knockout'), 
  ('CwC', 'Club World Club', 'World', 'Semi-Final');
  
  INSERT INTO `player`  
  (`player_id`, `player_name`, `age`, `player_position`, `nationality`, `preferred_foot`) VALUES
  (1, 'David de Gea', 31, 'Goalkeeper', 'Spain', 'right'), 
  (2, 'Victor Lindelof', 27, 'Defender', 'Sweden', 'right'),
(3, 'Eric Bailly', 27, 'Defender', 'Ivory Coast', 'right'),
(4, 'Phil Jones', 30, 'Defender', 'England', 'right'),
(5, 'Harry Maguire', 29, 'Defender', 'England', 'right'),
(6, 'Paul Pogba', 29, 'Midfielder', 'France', 'both'),
(7, 'Cristiano Ronaldo', 37, 'Forward', 'Portugal', 'both'),
(8, 'Juan Mata', 33, 'Midfielder', 'Spain', 'left'),
(9, 'Anthony Martial', 26, 'Forward', 'France', 'right'),
(10, 'Marcus Rashford', 24, 'Forward', 'England', 'right'),
(11, 'Mason Greenford', 20, 'Forward', 'England', 'both'),
(13, 'Lee Grant ', 39, 'Goalkeeper', 'England', 'right'),
(14, 'Jesse Lingard', 29, 'Midfielder', 'England', 'right'),
(15, 'Andreas Pereira', 26, 'Midfielder', 'Brazil', 'right'),
(16, 'Amad Diallo', 19, 'Midfielder', 'Ivory Coast', 'left'),
(17, 'Fred', 29, 'Midfielder', 'Brazil', 'left'),
(18, 'Bruno Fernandes', 27, 'Midfielder', 'Portugal', 'right'),
(20, 'Diogo Dalot', 23, 'Defender', 'Portugal', 'right'),
(21, 'Edison Cavani', 35, 'Forward', 'Uruguay', 'right'),
(23, 'Luke Shaw', 26, 'Defender', 'England', 'left'),
(25, 'Jadon Sancho', 22, 'Forward', 'England', 'right'),
(26, 'Dean Henderson', 25, 'Goalkeeper', 'England', 'right'),
(27, 'Alex Telles', 29, 'Defender', 'Brazil', 'left');
  
  INSERT INTO `statistics_play` (`comp_id`, `player_id`, `apps`, `goals`, `assists`, `yellow_card`, `red_card`, `motm`) VALUES 
  ('PrL', '1', '30', '0', '0', '0', '0', '7'), 
  ('ChL', '1', '7', '0', '0', '1', '0', '1'),
  ('EfC', '3', '1', '0', '1', '1', '0', '0'),
  ('PrL', '5', '25', '1', '0', '7', '0', '3'),
  ('CwC', '5', '7', '4', '0', '1', '1', '2'), 
  ('FaC', '6', '2', '0', '1', '2', '0', '0'), 
  ('EfC', '6', '11', '2', '2', '2', '0', '2'),
  ('PrL', '7', '24', '12', '3', '5', '0', '8'),
  ('ChL', '7', '7', '6', '0', '1', '0', '4'), 
  ('CwC', '7', '4', '2', '1', '0', '0', '1'),
  ('EfC', '10', '3', '4', '1', '0', '0', '2'),
  ('PrL', '14', '16', '9', '5', '3', '0', '5'), 
  ('FaC', '17', '2', '0', '1', '0', '0', '0'),
  ('PrL', '18', '28', '9', '6', '7', '0', '6'), 
  ('EfC', '18', '18', '1', '0', '0', '0', '0'),
  ('PrL', '21', '12', '2', '1', '0', '0', '1'), 
  ('CwC', '21', '5', '6', '3', '2', '0', '2'), 
  ('ChL', '25', '6', '2', '3', '0', '0', '0');
  
  INSERT INTO `matches` (`match_no`, `comp_id`, `opponent`, `venue`, `kick-off`) VALUES
  ('A01', 'CwC', 'Gamba Osaka', 'Panasonic Stadium Suita', '2022-01-05'), 
  ('N04', 'FaC', 'West Ham', 'Old Trafford', '2022-12-27'), 
  ('F05', 'ChL', 'Athletico Madrid', 'Estadio Vicente', '2022-05-14'), 
  ('D03', 'PrL', 'Chelsea', 'Stamford Bridge', '2021-11-28'),
  ('E01', 'EfC', 'Watford', 'Old Trafford', '2022-01-16'), 
  ('D07', 'PrL', 'Brentford', 'Brentford Community Stadium', '2022-07-03'), 
  ('B02', 'FaC', 'Manchester City', 'Etihad Stadium', '2022-09-30'), 
  ('A02', 'CwC', 'Pachuca', 'Estagio Hidalgo', '2022-04-15'), 
  ('D02', 'PrL', 'Southampton', 'Saint Mary\'s Stadium', '2021-10-22'), 
  ('E05', 'EfC', 'Arsenal', 'Old Trafford', '2022-03-19'), 
  ('F02', 'ChL', 'Atalanta', 'Gewiss Stadium', '2023-01-03');
  
  INSERT INTO `contract` (`contract_id`, `player_id`, `value_mill`, `date`, `agent`) VALUES 
  ('2625', '26', '16.20', '2023-06-30', 'ICM Stellar Sports'),
  ('123', '1', '13.50', '2023-06-30', 'Relatives'),
  ('224', '2', '21.60', '2024-06-30', 'HCM Sports Management'), 
  ('324', '3', '7.20', '2024-06-30', 'AMS CONSULTING'), 
  ('423', '4', '3.60', '2023-06-30', 'Wasserman'), 
  ('525', '5', '36.00', '2025-06-30', 'Triple S Sports'),
  ('622', '6', '49.50', '2022-06-30', 'Mino Raiola'), 
  ('723', '7', '31.50', '2023-06-30', 'Gestifute'), 
  ('822', '8', '2.70', '2022-06-30', 'JM10 SPORT'),
  ('922', '9', '25.20', '2022-06-30', 'USFA Management'),
  ('1023', '10', '63.00', '2023-06-30', 'Relatives'), 
  ('1125', '11', '75.80', '2025-06-30', 'Academy'), 
  ('1322', '13', '0.23', '2022-06-30', NULL), 
  ('1422', '14', '18.00', '2022-06-30', NULL),
  ('1523', '15', '7.20', '2023-06-30', 'Bertolucci Sports'),
  ('1625', '16', '16.20', '2025-06-30', 'Sport Agency Future'),
  ('1723', '17', '19.80', '2023-06-30', 'Fabio Mello Sports'), 
  ('1826', '18', '81.00', '2026-06-30', 'MRP.POSITIONUMBER'), 
  ('2023', '20', '16.20', '2023-06-30', 'Proeleven Gestao Desportiva'),
  ('2122', '21', '3.60', '2022-06-30', NULL), 
  ('2323', '13', '37.80', '2023-06-30', 'ICM Stellar Sports'),
  ('2526', '25', '72.00', '2026-06-30', 'Elite Project Group ltd'),
  ('2724', '27', '16.20', '2024-06-30', 'Pini Zahavi');
  





