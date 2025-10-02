-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para agrocitro
CREATE DATABASE IF NOT EXISTS `agrocitro` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `agrocitro`;

-- Copiando estrutura para tabela agrocitro.colheita
CREATE TABLE IF NOT EXISTS `colheita` (
  `ID_Colheita` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Plantio` int(11) NOT NULL,
  `Data_Colheita` date NOT NULL,
  `Quantidade_Colhida` int(11) NOT NULL,
  `Qualidade` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_Colheita`),
  KEY `ID_Plantio` (`ID_Plantio`),
  CONSTRAINT `ID_Plantio` FOREIGN KEY (`ID_Plantio`) REFERENCES `plantio` (`ID_Plantio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela agrocitro.irrigacao
CREATE TABLE IF NOT EXISTS `irrigacao` (
  `ID_Irrigacao` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Plantio` int(11) NOT NULL,
  `Horario_Inicial` time NOT NULL,
  `Horario_Final` int(11) NOT NULL,
  PRIMARY KEY (`ID_Irrigacao`),
  KEY `FK_plantio_irrigacao` (`ID_Plantio`),
  CONSTRAINT `FK_plantio_irrigacao` FOREIGN KEY (`ID_Plantio`) REFERENCES `plantio` (`ID_Plantio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela agrocitro.plantio
CREATE TABLE IF NOT EXISTS `plantio` (
  `ID_Plantio` int(11) NOT NULL AUTO_INCREMENT,
  `Variedade` varchar(50) NOT NULL,
  `Data_Plantio` date NOT NULL,
  `Quantidade_Plantada` int(11) NOT NULL,
  `Localizacao` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Plantio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados foi desmarcado.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
