-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 10. Okt 2024 um 10:01
-- Server-Version: 10.4.24-MariaDB
-- PHP-Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `vertriebsleitung`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `artikels`
--

CREATE TABLE `artikels` (
  `id` int(11) NOT NULL,
  `artnr` varchar(20) NOT NULL,
  `artbezeichnung` varchar(50) NOT NULL,
  `artbescrheibung` varchar(300) DEFAULT NULL,
  `artpreis` decimal(10,2) NOT NULL,
  `artfarbe` varchar(20) DEFAULT NULL,
  `artmaterialien` varchar(100) DEFAULT NULL,
  `artbreite` decimal(10,2) DEFAULT NULL,
  `arttiefe` decimal(10,2) DEFAULT NULL,
  `arthoehe` decimal(10,2) DEFAULT NULL,
  `artauflager` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `artikels`
--

INSERT INTO `artikels` (`id`, `artnr`, `artbezeichnung`, `artbescrheibung`, `artpreis`, `artfarbe`, `artmaterialien`, `artbreite`, `arttiefe`, `arthoehe`, `artauflager`) VALUES
(24, '204.317.43', 'Sofa Monika', NULL, '199.49', 'Blau', NULL, '126.00', '76.00', '61.00', 3),
(25, '204.317.47', 'Sofa Monika', NULL, '199.49', 'Pink', 'Stoff: 100% Polyester (mind. 90% recycelt)', '126.00', '76.00', '61.00', 1),
(26, '542.691.25', 'Sessel Tokyo Ernesto', NULL, '149.39', 'Rot-schwarz', '100% Polyester', '64.00', '78.00', '76.00', 1),
(27, '475.585.55', 'Sessel Anatolii', NULL, '125.49', 'Schwarz', '100% Polypropylen', '63.00', '75.00', '68.00', 1),
(28, '755.445.85', 'Drehstuhl Natascha', NULL, '100.49', 'Gelb', NULL, '70.00', '70.00', '81.00', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bestelltartikels`
--

CREATE TABLE `bestelltartikels` (
  `id` int(11) NOT NULL,
  `baartikelid` int(11) NOT NULL,
  `babestellungid` int(11) NOT NULL,
  `baanzahl` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bestellungs`
--

CREATE TABLE `bestellungs` (
  `id` int(11) NOT NULL,
  `bkundeid` int(11) NOT NULL,
  `bbestelldatum` date NOT NULL,
  `blieferdatum` date NOT NULL,
  `bstrasse` varchar(20) NOT NULL,
  `bhaus` varchar(10) NOT NULL,
  `bplz` varchar(5) NOT NULL,
  `bort` varchar(20) NOT NULL,
  `brechnung` int(11) NOT NULL,
  `bsumme` decimal(10,2) NOT NULL,
  `banmerkung` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kundes`
--

CREATE TABLE `kundes` (
  `id` int(11) NOT NULL,
  `KName` varchar(100) NOT NULL,
  `KEmail` varchar(50) DEFAULT NULL,
  `KTelefonnummer` varchar(20) DEFAULT NULL,
  `KStrasse` varchar(20) DEFAULT NULL,
  `KHaus` varchar(10) DEFAULT NULL,
  `KPLZ` varchar(5) DEFAULT NULL,
  `KOrt` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `kundes`
--

INSERT INTO `kundes` (`id`, `KName`, `KEmail`, `KTelefonnummer`, `KStrasse`, `KHaus`, `KPLZ`, `KOrt`) VALUES
(1, 'Tim', 'tim@gmail.com', '123456789', 'Berlinerstr.', '1', '12345', 'Berlin'),
(2, 'Julia', 'julia@gmail.com', '987654321', 'Juliesstr.', '2', '67890', 'Köln');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `artikels`
--
ALTER TABLE `artikels`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `bestelltartikels`
--
ALTER TABLE `bestelltartikels`
  ADD KEY `fk_bestelltartikels_artikels` (`baartikelid`),
  ADD KEY `fk_bestelltartikels_bestellungs` (`babestellungid`);

--
-- Indizes für die Tabelle `bestellungs`
--
ALTER TABLE `bestellungs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bestellungs_kundes` (`bkundeid`);

--
-- Indizes für die Tabelle `kundes`
--
ALTER TABLE `kundes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `artikels`
--
ALTER TABLE `artikels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT für Tabelle `kundes`
--
ALTER TABLE `kundes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `bestelltartikels`
--
ALTER TABLE `bestelltartikels`
  ADD CONSTRAINT `fk_bestelltartikels_artikels` FOREIGN KEY (`baartikelid`) REFERENCES `artikels` (`id`),
  ADD CONSTRAINT `fk_bestelltartikels_bestellungs` FOREIGN KEY (`babestellungid`) REFERENCES `bestellungs` (`id`);

--
-- Constraints der Tabelle `bestellungs`
--
ALTER TABLE `bestellungs`
  ADD CONSTRAINT `fk_bestellungs_kundes` FOREIGN KEY (`bkundeid`) REFERENCES `kundes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
