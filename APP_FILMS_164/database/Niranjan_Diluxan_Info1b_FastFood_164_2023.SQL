-- OM 2021.02.17
-- FICHIER MYSQL POUR FAIRE FONCTIONNER LES EXEMPLES
-- DE REQUETES MYSQL
-- Database: didi

-- Destruction de la BD si elle existe.
-- Pour être certain d'avoir la dernière version des données

DROP DATABASE IF EXISTS didi;

-- Création d'un nouvelle base de donnée

CREATE DATABASE IF NOT EXISTS didi;

-- Utilisation de cette base de donnée

USE didi;
-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.31 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour didi
CREATE DATABASE IF NOT EXISTS `didi` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `didi`;

-- Listage de la structure de table didi. t_appeler_tel
CREATE TABLE IF NOT EXISTS `t_appeler_tel` (
  `ID_appeler` int NOT NULL AUTO_INCREMENT,
  `fk_client` int DEFAULT NULL,
  `fk_tel` int DEFAULT NULL,
  PRIMARY KEY (`ID_appeler`),
  KEY `Index 2` (`fk_client`),
  KEY `Index 3` (`fk_tel`),
  CONSTRAINT `FK_t_appeler_tel_t_client` FOREIGN KEY (`fk_client`) REFERENCES `t_client` (`ID_Client`),
  CONSTRAINT `FK_t_appeler_tel_t_tel` FOREIGN KEY (`fk_tel`) REFERENCES `t_tel` (`ID_tel`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table didi.t_appeler_tel : ~4 rows (environ)
INSERT INTO `t_appeler_tel` (`ID_appeler`, `fk_client`, `fk_tel`) VALUES
	(1, 2, 2),
	(2, 1, 1),
	(3, 3, 3),
	(4, 4, 4);

-- Listage de la structure de table didi. t_avoir_mail
CREATE TABLE IF NOT EXISTS `t_avoir_mail` (
  `ID_Avoir` int NOT NULL,
  `fk_Mail` int DEFAULT NULL,
  `fk_Client` int DEFAULT NULL,
  PRIMARY KEY (`ID_Avoir`),
  KEY `ID_Mail` (`fk_Mail`) USING BTREE,
  KEY `ID_CLient` (`fk_Client`) USING BTREE,
  CONSTRAINT `FK_t_avoir_mail_t_client` FOREIGN KEY (`fk_Client`) REFERENCES `t_client` (`ID_Client`),
  CONSTRAINT `FK_t_avoir_mail_t_mail` FOREIGN KEY (`fk_Mail`) REFERENCES `t_mail` (`ID_Mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table didi.t_avoir_mail : ~4 rows (environ)
INSERT INTO `t_avoir_mail` (`ID_Avoir`, `fk_Mail`, `fk_Client`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 1, 4);

-- Listage de la structure de table didi. t_client
CREATE TABLE IF NOT EXISTS `t_client` (
  `ID_Client` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `mot_de_passe` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Client`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table didi.t_client : ~4 rows (environ)
INSERT INTO `t_client` (`ID_Client`, `Nom`, `Prenom`, `mot_de_passe`) VALUES
	(1, 'Dupont', 'Pierre', 'fenfujneiknfej'),
	(2, 'Durand', 'Sophie', ' of,niebnfiei'),
	(3, 'Lefebvre', 'Jean', ' njbhvce,c,nn'),
	(4, 'Martin', 'Marie', ' fefenbjn,,ke');

-- Listage de la structure de table didi. t_commande_passer
CREATE TABLE IF NOT EXISTS `t_commande_passer` (
  `ID_Commande` int NOT NULL,
  `date_commande` date NOT NULL,
  `fk_Client` int DEFAULT NULL,
  `fk_Endroit` int DEFAULT NULL,
  PRIMARY KEY (`ID_Commande`),
  KEY `ID_Client` (`fk_Client`) USING BTREE,
  KEY `ID_Endroit` (`fk_Endroit`) USING BTREE,
  CONSTRAINT `t_commande_passer_t_Client` FOREIGN KEY (`fk_Client`) REFERENCES `t_client` (`ID_Client`),
  CONSTRAINT `t_commande_passer_t_commande` FOREIGN KEY (`fk_Endroit`) REFERENCES `t_endroit` (`ID_Endroit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table didi.t_commande_passer : ~4 rows (environ)
INSERT INTO `t_commande_passer` (`ID_Commande`, `date_commande`, `fk_Client`, `fk_Endroit`) VALUES
	(1, '2022-01-01', 1, 1),
	(2, '2022-02-15', 3, 2),
	(3, '2022-03-10', 2, 1),
	(4, '2022-04-05', 4, 3);

-- Listage de la structure de table didi. t_endroit
CREATE TABLE IF NOT EXISTS `t_endroit` (
  `ID_Endroit` int NOT NULL AUTO_INCREMENT,
  `Nom_Endroit` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_Endroit`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table didi.t_endroit : ~3 rows (environ)
INSERT INTO `t_endroit` (`ID_Endroit`, `Nom_Endroit`) VALUES
	(1, 'FastFood Paris'),
	(2, 'FastFood Marseille'),
	(3, 'FastFood Lyon');

-- Listage de la structure de table didi. t_mail
CREATE TABLE IF NOT EXISTS `t_mail` (
  `ID_Mail` int NOT NULL AUTO_INCREMENT,
  `Adresse_Mail` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Mail`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table didi.t_mail : ~4 rows (environ)
INSERT INTO `t_mail` (`ID_Mail`, `Adresse_Mail`) VALUES
	(1, 'pierre.dupont@example.com'),
	(2, 'sophie.durand@example.com'),
	(3, 'jean.lefebvre@example.com'),
	(4, 'marie.martin@example.com');

-- Listage de la structure de table didi. t_payer_commande
CREATE TABLE IF NOT EXISTS `t_payer_commande` (
  `ID_Paiement` int NOT NULL,
  `date_paiement` date NOT NULL,
  `montant` decimal(10,2) NOT NULL,
  `fk_Commande` int DEFAULT NULL,
  `fk_Client` int DEFAULT NULL,
  PRIMARY KEY (`ID_Paiement`),
  KEY `ID_Commande` (`fk_Commande`) USING BTREE,
  KEY `fk_Client` (`fk_Client`),
  CONSTRAINT `FK_t_payer_commande_t_client` FOREIGN KEY (`fk_Client`) REFERENCES `t_client` (`ID_Client`),
  CONSTRAINT `FK_t_payer_commande_t_commande_passer` FOREIGN KEY (`fk_Commande`) REFERENCES `t_commande_passer` (`ID_Commande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table didi.t_payer_commande : ~4 rows (environ)
INSERT INTO `t_payer_commande` (`ID_Paiement`, `date_paiement`, `montant`, `fk_Commande`, `fk_Client`) VALUES
	(1, '2022-01-01', 20.00, 1, 1),
	(2, '2022-02-15', 15.00, 2, 2),
	(3, '2022-03-10', 8.50, 3, 3),
	(4, '2022-04-05', 12.75, 4, 4);

-- Listage de la structure de table didi. t_produit
CREATE TABLE IF NOT EXISTS `t_produit` (
  `ID_Produit` int NOT NULL AUTO_INCREMENT,
  `Nom_Produit` varchar(50) NOT NULL,
  `desc_Produit` varchar(50) NOT NULL,
  `Prix_Produit` float NOT NULL,
  PRIMARY KEY (`ID_Produit`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table didi.t_produit : ~5 rows (environ)
INSERT INTO `t_produit` (`ID_Produit`, `Nom_Produit`, `desc_Produit`, `Prix_Produit`) VALUES
	(1, 'Hamburger', 'pain + steak', 4.99),
	(2, 'Cheeseburger', 'pain + steak + fromage', 5.49),
	(3, 'Frites', 'pomme de terre', 2.99),
	(4, 'Boisson gazeuse', ' boissons', 1.99),
	(5, 'Nuggets de poulet', 'poulet', 3.99);

-- Listage de la structure de table didi. t_stocker_produit
CREATE TABLE IF NOT EXISTS `t_stocker_produit` (
  `ID_Stock` int NOT NULL AUTO_INCREMENT,
  `Quantite` int NOT NULL,
  `ID_Produit` int DEFAULT NULL,
  `ID_Endroit` int DEFAULT NULL,
  PRIMARY KEY (`ID_Stock`),
  KEY `ID_Produit` (`ID_Produit`),
  KEY `ID_Endroit` (`ID_Endroit`),
  CONSTRAINT `FK_t_stocker_produit_t_endroit` FOREIGN KEY (`ID_Endroit`) REFERENCES `t_endroit` (`ID_Endroit`),
  CONSTRAINT `FK_t_stocker_produit_t_produit` FOREIGN KEY (`ID_Produit`) REFERENCES `t_produit` (`ID_Produit`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table didi.t_stocker_produit : ~5 rows (environ)
INSERT INTO `t_stocker_produit` (`ID_Stock`, `Quantite`, `ID_Produit`, `ID_Endroit`) VALUES
	(1, 100, 1, 1),
	(2, 80, 2, 1),
	(3, 150, 3, 2),
	(4, 200, 4, 2),
	(5, 75, 5, 3);

-- Listage de la structure de table didi. t_tel
CREATE TABLE IF NOT EXISTS `t_tel` (
  `ID_tel` int NOT NULL AUTO_INCREMENT,
  `numero` float DEFAULT NULL,
  PRIMARY KEY (`ID_tel`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table didi.t_tel : ~4 rows (environ)
INSERT INTO `t_tel` (`ID_tel`, `numero`) VALUES
	(1, 4521570),
	(2, 980548000),
	(3, 8789550000),
	(4, 814848000);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
