-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mer. 29 sep. 2021 à 14:40
-- Version du serveur :  5.7.24
-- Version de PHP : 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mydb`
--

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE `auteur` (
  `idAUTEUR` int(11) NOT NULL,
  `Date_of_birth` date DEFAULT NULL,
  `Date_of_death` date DEFAULT NULL,
  `Nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `auteur`
--

INSERT INTO `auteur` (`idAUTEUR`, `Date_of_birth`, `Date_of_death`, `Nom`) VALUES
(7, '1759-12-01', '1830-05-08', 'Siri Husvedt'),
(8, '1850-08-05', '1893-07-06', 'Guy de Maupassant'),
(9, '1920-06-12', '1980-09-12', 'Julio Cortazar'),
(10, '1990-12-23', NULL, 'Jack London'),
(11, '1996-11-27', NULL, 'Clément Gibot');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `idCATEGORIES` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`idCATEGORIES`, `Name`) VALUES
(2, 'Arts musiques et cinéma'),
(4, 'Bande-dessinée'),
(5, 'Cuisine'),
(3, 'Développement personnel'),
(6, 'Dictionnaire et langue'),
(7, 'Droit et économie'),
(8, 'Essais et documents'),
(9, 'Guide pratique'),
(10, 'Histoire'),
(11, 'LIttérature'),
(12, 'Policier'),
(13, 'Science-fiction'),
(14, 'Théâtre');

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE `livre` (
  `idLIVRE` int(11) NOT NULL,
  `Titre` varchar(255) NOT NULL,
  `Resume` text NOT NULL,
  `CATEGORIES_idCATEGORIES` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livre`
--

INSERT INTO `livre` (`idLIVRE`, `Titre`, `Resume`, `CATEGORIES_idCATEGORIES`) VALUES
(3, 'Tous les renards que j\'aimais', 'uguhffgiuh', 12),
(4, 'Le horla', 'fifghjhgh', 13),
(5, 'Marelle', 'eoidgjfegij', 14),
(6, 'L\'appel du renard de la forêt', 'rhhdfh', 11),
(7, 'Farenheit 451', 'fjgnhfgj', 13),
(8, 'Le droit des renards', 'eoigjrogij', 7);

-- --------------------------------------------------------

--
-- Structure de la table `livre_has_auteur`
--

CREATE TABLE `livre_has_auteur` (
  `LIVRE_idLIVRE` int(11) NOT NULL,
  `AUTEUR_idAUTEUR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livre_has_auteur`
--

INSERT INTO `livre_has_auteur` (`LIVRE_idLIVRE`, `AUTEUR_idAUTEUR`) VALUES
(3, 7),
(4, 8),
(5, 9),
(6, 10),
(7, 11),
(8, 11);

-- --------------------------------------------------------

--
-- Structure de la table `livre_has_user`
--

CREATE TABLE `livre_has_user` (
  `LIVRE_idLIVRE` int(11) NOT NULL,
  `USER_idUSER` int(11) NOT NULL,
  `dateemprunt` date DEFAULT NULL,
  `dateretourattendue` date DEFAULT NULL,
  `dateretoureffective` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livre_has_user`
--

INSERT INTO `livre_has_user` (`LIVRE_idLIVRE`, `USER_idUSER`, `dateemprunt`, `dateretourattendue`, `dateretoureffective`) VALUES
(5, 1, '2021-08-17', '2021-09-17', '2021-09-28'),
(6, 2, '2021-09-28', '2021-10-28', NULL),
(7, 3, '2021-08-24', '2021-09-24', '2021-09-29'),
(8, 4, '2021-09-21', '2021-10-29', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `idUSER` int(11) NOT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `streetname` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`idUSER`, `mobile`, `postal_code`, `city`, `streetname`, `firstname`, `lastname`) VALUES
(1, '0674783923', '75004', 'Paris', '28 rue du petit musc', 'Clément', 'Gibot'),
(2, '0102030405', '78100', 'Saint Germain en Laye', '7 rue de la tour', 'Clara', 'Chauvin'),
(3, '0908070605', '93300', 'Saint Ouen', '5 avenue de la minardière', 'Julien', 'Falconnet'),
(4, '0646382984', '14000', 'Caen', '37 rue de la gare', 'Flora', 'Hommand'),
(5, '0649562843', '06650', 'Opio', '30 chemin des truites', 'Rookie', 'Balboa');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auteur`
--
ALTER TABLE `auteur`
  ADD PRIMARY KEY (`idAUTEUR`),
  ADD UNIQUE KEY `Date_naissance_UNIQUE` (`Date_of_birth`),
  ADD UNIQUE KEY `Date_of_death_UNIQUE` (`Date_of_death`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`idCATEGORIES`),
  ADD UNIQUE KEY `idCATEGORIES_UNIQUE` (`idCATEGORIES`),
  ADD UNIQUE KEY `Name_UNIQUE` (`Name`);

--
-- Index pour la table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`idLIVRE`,`CATEGORIES_idCATEGORIES`),
  ADD UNIQUE KEY `idLIVRE_UNIQUE` (`idLIVRE`),
  ADD UNIQUE KEY `Titre_UNIQUE` (`Titre`),
  ADD KEY `fk_LIVRE_CATEGORIES_idx` (`CATEGORIES_idCATEGORIES`);

--
-- Index pour la table `livre_has_auteur`
--
ALTER TABLE `livre_has_auteur`
  ADD PRIMARY KEY (`LIVRE_idLIVRE`,`AUTEUR_idAUTEUR`),
  ADD KEY `fk_LIVRE_has_AUTEUR_AUTEUR1_idx` (`AUTEUR_idAUTEUR`),
  ADD KEY `fk_LIVRE_has_AUTEUR_LIVRE1_idx` (`LIVRE_idLIVRE`);

--
-- Index pour la table `livre_has_user`
--
ALTER TABLE `livre_has_user`
  ADD PRIMARY KEY (`LIVRE_idLIVRE`,`USER_idUSER`),
  ADD KEY `fk_LIVRE_has_USER_USER1_idx` (`USER_idUSER`),
  ADD KEY `fk_LIVRE_has_USER_LIVRE1_idx` (`LIVRE_idLIVRE`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUSER`),
  ADD UNIQUE KEY `idUSER_UNIQUE` (`idUSER`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auteur`
--
ALTER TABLE `auteur`
  MODIFY `idAUTEUR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `idCATEGORIES` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `livre`
--
ALTER TABLE `livre`
  MODIFY `idLIVRE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `idUSER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `fk_LIVRE_CATEGORIES` FOREIGN KEY (`CATEGORIES_idCATEGORIES`) REFERENCES `categories` (`idCATEGORIES`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `livre_has_auteur`
--
ALTER TABLE `livre_has_auteur`
  ADD CONSTRAINT `fk_LIVRE_has_AUTEUR_AUTEUR1` FOREIGN KEY (`AUTEUR_idAUTEUR`) REFERENCES `auteur` (`idAUTEUR`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_LIVRE_has_AUTEUR_LIVRE1` FOREIGN KEY (`LIVRE_idLIVRE`) REFERENCES `livre` (`idLIVRE`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `livre_has_user`
--
ALTER TABLE `livre_has_user`
  ADD CONSTRAINT `fk_LIVRE_has_USER_LIVRE1` FOREIGN KEY (`LIVRE_idLIVRE`) REFERENCES `livre` (`idLIVRE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_LIVRE_has_USER_USER1` FOREIGN KEY (`USER_idUSER`) REFERENCES `user` (`idUSER`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


-- LISTE DES LIVRES QUI CONTIENNENT RENARD DANS LEUR TITRE
	-- SELECT * FROM livre WHERE Titre LIKE "%renard%"
    
-- LISTE LIVRES CATEGORIE ROMAN


-- LISTE LIVRES EN COURS D'EMPRUNT


-- LISTE USAGERS EN RETARD POUR LEUR(S) RETOUR(S)
