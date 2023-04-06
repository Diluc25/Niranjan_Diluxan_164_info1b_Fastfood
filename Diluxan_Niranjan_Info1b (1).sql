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




-- Listage de la structure de table didi. t_avoir_mail
CREATE TABLE IF NOT EXISTS `t_avoir_mail` (
  `ID_Avoir` int NOT NULL,
  `ID_Mail` int DEFAULT NULL,
  `ID_CLient` int DEFAULT NULL,
  PRIMARY KEY (`ID_Avoir`),
  KEY `ID_Mail` (`ID_Mail`),
  KEY `ID_CLient` (`ID_CLient`),
  CONSTRAINT `t_avoir_mail_ibfk_1` FOREIGN KEY (`ID_Mail`) REFERENCES `t_mail` (`ID_Mail`),
  CONSTRAINT `t_avoir_mail_ibfk_2` FOREIGN KEY (`ID_CLient`) REFERENCES `t_client` (`ID_Client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table didi.t_avoir_mail : ~4 rows (environ)
INSERT INTO `t_avoir_mail` (`ID_Avoir`, `ID_Mail`, `ID_CLient`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 1, 4);

-- Listage de la structure de table didi. t_client
CREATE TABLE IF NOT EXISTS `t_client` (
  `ID_Client` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Telephone` int NOT NULL,
  `mot_de_passe` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Client`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table didi.t_client : ~4 rows (environ)
INSERT INTO `t_client` (`ID_Client`, `Nom`, `Prenom`, `Telephone`, `mot_de_passe`) VALUES
	(1, 'Dupont', 'Pierre', 45955452, 'fenfujneiknfej'),
	(2, 'Durand', 'Sophie', 895968755, ' of,niebnfiei'),
	(3, 'Lefebvre', 'Jean', 255415698, ' njbhvce,c,nn'),
	(4, 'Martin', 'Marie', 945656657, ' fefenbjn,,ke');

-- Listage de la structure de table didi. t_commande_passer
CREATE TABLE IF NOT EXISTS `t_commande_passer` (
  `ID_Commande` int NOT NULL,
  `date_commande` date NOT NULL,
  `ID_Client` int DEFAULT NULL,
  `ID_Endroit` int DEFAULT NULL,
  PRIMARY KEY (`ID_Commande`),
  KEY `ID_Client` (`ID_Client`),
  KEY `ID_Endroit` (`ID_Endroit`),
  CONSTRAINT `t_commande_passer_ibfk_1` FOREIGN KEY (`ID_Client`) REFERENCES `t_client` (`ID_Client`),
  CONSTRAINT `t_commande_passer_ibfk_2` FOREIGN KEY (`ID_Endroit`) REFERENCES `t_endroit` (`ID_Endroit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table didi.t_commande_passer : ~4 rows (environ)
INSERT INTO `t_commande_passer` (`ID_Commande`, `date_commande`, `ID_Client`, `ID_Endroit`) VALUES
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
  `ID_Commande` int DEFAULT NULL,
  PRIMARY KEY (`ID_Paiement`),
  KEY `ID_Commande` (`ID_Commande`),
  CONSTRAINT `t_payer_commande_ibfk_1` FOREIGN KEY (`ID_Commande`) REFERENCES `t_commande_passer` (`ID_Commande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table didi.t_payer_commande : ~4 rows (environ)
INSERT INTO `t_payer_commande` (`ID_Paiement`, `date_paiement`, `montant`, `ID_Commande`) VALUES
	(1, '2022-01-01', 20.00, 1),
	(2, '2022-02-15', 15.00, 2),
	(3, '2022-03-10', 8.50, 3),
	(4, '2022-04-05', 12.75, 4);

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
  `ID_Stock` int NOT NULL,
  `Quantite` int NOT NULL,
  `ID_Produit` int DEFAULT NULL,
  `ID_Endroit` int DEFAULT NULL,
  PRIMARY KEY (`ID_Stock`),
  KEY `ID_Produit` (`ID_Produit`),
  KEY `ID_Endroit` (`ID_Endroit`),
  CONSTRAINT `t_stocker_produit_ibfk_1` FOREIGN KEY (`ID_Produit`) REFERENCES `t_produit` (`ID_Produit`),
  CONSTRAINT `t_stocker_produit_ibfk_2` FOREIGN KEY (`ID_Endroit`) REFERENCES `t_endroit` (`ID_Endroit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table didi.t_stocker_produit : ~5 rows (environ)
INSERT INTO `t_stocker_produit` (`ID_Stock`, `Quantite`, `ID_Produit`, `ID_Endroit`) VALUES
	(1, 100, 1, 1),
	(2, 80, 2, 1),
	(3, 150, 3, 2),
	(4, 200, 4, 2),
	(5, 75, 5, 3);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
