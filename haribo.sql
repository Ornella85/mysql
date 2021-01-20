-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 20 jan. 2021 à 15:49
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `haribo`
--

-- --------------------------------------------------------

--
-- Structure de la table `bonbon`
--

CREATE TABLE `bonbon` (
  `id_bonbon` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `saveur` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `bonbon`
--

INSERT INTO `bonbon` (`id_bonbon`, `nom`, `saveur`) VALUES
(1, 'dragibus', 'cola'),
(2, 'Tirlibibi', 'fraise'),
(3, 'roulette', 'framboise'),
(4, 'carensac', 'reglisse'),
(5, 'schtroumpf', 'peche'),
(6, 'tagada', 'purple'),
(7, 'dagibus', 'cola'),
(8, 'dagibus', 'cola'),
(9, 'tagada', 'purple');

-- --------------------------------------------------------

--
-- Structure de la table `manger`
--

CREATE TABLE `manger` (
  `id_manger` int(11) NOT NULL,
  `id_stagiaire` int(11) NOT NULL,
  `id_bonbon` int(11) NOT NULL,
  `date_manger` date NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `manger`
--

INSERT INTO `manger` (`id_manger`, `id_stagiaire`, `id_bonbon`, `date_manger`, `quantite`) VALUES
(1, 7, 4, '2018-09-20', 5),
(2, 1, 5, '2019-10-25', 12),
(3, 10, 2, '2020-03-01', 25),
(4, 2, 1, '2020-04-02', 30),
(5, 12, 3, '2020-01-12', 3),
(6, 8, 1, '2021-05-14', 45),
(7, 7, 2, '2020-02-07', 20),
(8, 5, 4, '2020-06-29', 4),
(9, 13, 9, '2020-09-15', 5);

-- --------------------------------------------------------

--
-- Structure de la table `stagiaire`
--

CREATE TABLE `stagiaire` (
  `id_stagiaire` int(11) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `couleur_des_yeux` varchar(30) NOT NULL,
  `genre` enum('f','h') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `stagiaire`
--

INSERT INTO `stagiaire` (`id_stagiaire`, `prenom`, `couleur_des_yeux`, `genre`) VALUES
(1, 'Jordan', 'marron', 'h'),
(2, 'Amine', 'marron', 'h'),
(3, 'Sara', 'marron', 'f'),
(4, 'Muhammet', 'marron', 'h'),
(5, 'Rachid', 'marron', 'h'),
(6, 'Jeremy', 'bleu', 'h'),
(7, 'Charly', 'marron', 'h'),
(8, 'Mohammed', 'marron', 'h'),
(9, 'Niamatullah', 'marron', 'h'),
(10, 'Zakaria', 'marron', 'h'),
(11, 'David', 'marron', 'h'),
(12, 'Ornella', 'marron', 'f'),
(13, 'Patrick', 'vert', 'h'),
(14, 'Mila', 'marron', 'f');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `bonbon`
--
ALTER TABLE `bonbon`
  ADD PRIMARY KEY (`id_bonbon`);

--
-- Index pour la table `manger`
--
ALTER TABLE `manger`
  ADD PRIMARY KEY (`id_manger`),
  ADD KEY `id_stagiaire` (`id_stagiaire`),
  ADD KEY `id_bonbon` (`id_bonbon`);

--
-- Index pour la table `stagiaire`
--
ALTER TABLE `stagiaire`
  ADD PRIMARY KEY (`id_stagiaire`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `bonbon`
--
ALTER TABLE `bonbon`
  MODIFY `id_bonbon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `manger`
--
ALTER TABLE `manger`
  MODIFY `id_manger` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `stagiaire`
--
ALTER TABLE `stagiaire`
  MODIFY `id_stagiaire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `manger`
--
ALTER TABLE `manger`
  ADD CONSTRAINT `manger_ibfk_1` FOREIGN KEY (`id_stagiaire`) REFERENCES `stagiaire` (`id_stagiaire`),
  ADD CONSTRAINT `manger_ibfk_2` FOREIGN KEY (`id_bonbon`) REFERENCES `bonbon` (`id_bonbon`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
