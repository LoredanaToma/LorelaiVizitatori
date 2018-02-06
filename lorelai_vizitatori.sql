-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2018 at 09:31 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lorelai`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(6) NOT NULL,
  `nume` varchar(10) NOT NULL,
  `parola` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nume`, `parola`) VALUES
(1, 'loredana', '123456'),
(2, 'ana', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `categorii`
--

CREATE TABLE `categorii` (
  `id_categ` int(2) NOT NULL,
  `categoria` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categorii`
--

INSERT INTO `categorii` (`id_categ`, `categoria`) VALUES
(5, 'Accesorii'),
(6, 'Camasi_barbati'),
(3, 'Camasi_dama'),
(2, 'Fuste'),
(8, 'Lenjerie_barbati'),
(9, 'Lenjerie_dama'),
(7, 'Pantaloni_barbati'),
(4, 'Pantaloni_dama'),
(1, 'Rochii');

-- --------------------------------------------------------

--
-- Table structure for table `clienti`
--

CREATE TABLE `clienti` (
  `cnp` bigint(13) NOT NULL,
  `parola` char(32) NOT NULL,
  `nume` varchar(30) NOT NULL,
  `prenume` varchar(30) CHARACTER SET utf8 COLLATE utf8_romanian_ci NOT NULL,
  `oras` varchar(30) CHARACTER SET utf8 COLLATE utf8_romanian_ci NOT NULL,
  `adresa` varchar(50) CHARACTER SET utf8 COLLATE utf8_romanian_ci NOT NULL,
  `telefon` varchar(20) CHARACTER SET utf8 COLLATE utf8_romanian_ci NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clienti`
--

INSERT INTO `clienti` (`cnp`, `parola`, `nume`, `prenume`, `oras`, `adresa`, `telefon`, `email`) VALUES
(0, '42664fd9d3b703cf4a147838ea19b584', 'nelu', 'ghgn', 'nbn', 'bnbn', 'bnbn', 'bnb'),
(444, '31e6a7de72799d9cd2469a064d5f82bf', 'ion', 'gnmhbn', 'bnmbn', 'nmnb', '014', 'bmb'),
(2860104270049, 'toma', 'toma', 'Ana', 'Cluj-Napoca', 'Aleea Padin nr 13', '0746323991', 'tomaloredana@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `comenzi`
--

CREATE TABLE `comenzi` (
  `cod_comanda` int(4) NOT NULL,
  `cnp` bigint(13) NOT NULL,
  `id_produs` int(2) NOT NULL,
  `bucati` int(2) NOT NULL,
  `data_comenzii` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comenzi`
--

INSERT INTO `comenzi` (`cod_comanda`, `cnp`, `id_produs`, `bucati`, `data_comenzii`) VALUES
(10, 2860104270049, 1, 1, '2017-06-01'),
(11, 0, 22, 1, '2017-06-17'),
(12, 444, 23, 1, '2017-06-25'),
(13, 444, 12, 1, '2017-06-25'),
(14, 444, 9, 1, '2017-07-05');

-- --------------------------------------------------------

--
-- Table structure for table `produse`
--

CREATE TABLE `produse` (
  `id_produs` int(2) NOT NULL,
  `fisier_imagine` varchar(50) NOT NULL,
  `imagine_mare` varchar(50) NOT NULL,
  `id_categ` int(2) NOT NULL,
  `nume_produs` varchar(30) NOT NULL,
  `prezentare` varchar(200) NOT NULL,
  `pret` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produse`
--

INSERT INTO `produse` (`id_produs`, `fisier_imagine`, `imagine_mare`, `id_categ`, `nume_produs`, `prezentare`, `pret`) VALUES
(10, 'imagine10.jpg', 'imagine10M.jpg', 1, 'Rochie dantela scurta', 'Este o rochie pentru evenimente festive', 320),
(11, 'imagine11.jpg', 'imagine11M.jpg', 1, 'Rochita bleu scurta', 'Rochie ideala pentru evenimente festive', 350),
(12, 'imagine12.jpg', 'imagine12M.jpg', 2, 'Fusta imprimeu multicolor', 'Fusta casual', 59),
(13, 'imagine13.png', 'imagine13M.png', 5, 'Colier pietricele bleu', 'Ideal pentru accesorizarea tinutelor de seara', 35),
(14, 'imagine14.jpg', 'imagine14M.jpg', 3, 'Camasa carouri', 'Este o camasa casual', 75),
(16, 'imagine16.jpg', 'imagine16M.jpg', 3, 'Camasa alba', 'Este o camsa office ideala pentru birou', 89),
(17, 'imagine17.jpg', 'imagine17M.jpg', 6, 'Camasa bleu bumbac', 'Camasa din bumbac 100%', 245),
(19, '42-mic.jpg', '42-mare.jpg', 8, 'Boxeri albi', 'boxeri barbati 100% bbc', 0),
(20, 'imagine20.jpg', 'imagine20M.jpg', 8, 'Boxeri albi', 'Boxeri din bumbac 100% albi', 65),
(21, 'imagine21.jpg', 'imagine21M.jpg', 9, 'Sutien fara bretele alb', 'Ideal pentru elemente de vestimentatie cu umerii goi', 75),
(22, 'imagine22.jpg', 'imagine22M.jpg', 9, 'Compleu alb', 'Sutien si bikini albi', 145),
(23, 'imagine23.jpg', 'imagine23M.jpg', 7, 'Pantaloni bleu', 'Pantaloni bleu din material elastic(casual)', 220),
(24, 'imagine24.jpg', 'imagine24M.jpg', 7, 'Pantalon elegant', 'Pantalon clasic elegant', 300),
(25, 'imagine25.jpg', 'imagine25M.jpg', 4, 'Pantalon 3/4', 'Pantalon 3/4 bej', 250),
(26, 'imagine26.jpg', 'imagine26M.jpg', 4, 'Pantalon3/4', 'Pantalon 3/4 bleumarin', 230),
(27, '42-mic.jpg', '242-mare.jpg', 8, 'System.Windows.Forms.TextBox, ', 'System.Windows.Forms.TextBox, Text: ggg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vizitatori`
--

CREATE TABLE `vizitatori` (
  `id` int(4) NOT NULL,
  `Nume` varchar(30) NOT NULL,
  `Prenume` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Mesaj` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vizitatori`
--

INSERT INTO `vizitatori` (`id`, `Nume`, `Prenume`, `Email`, `Mesaj`) VALUES
(3, 'Maria', 'Toma', 'Maria_toma@gmail.com', 'Sunteti foarte buni'),
(4, 'Iulian', 'Rosu', 'rosuIulian@yahoo.com', 'Sunteti minunati'),
(5, 'Munteanu', 'Beatrice', 'Munteanu_betty@yahoo.com', 'Sunteti o echipa foarte buna!tineti-o tot asa!'),
(6, 'Iosiv', 'Magdalena', 'magy_magy@yahoo.com', 'Sunteti o echipa foarte buna!tineti-o tot asa!'),
(7, 'Calvarasan', 'Ionut', 'ionut_calvarasan@gmail.com', 'Am doar de bine de spus...'),
(8, 'Elenus', 'Gabriela', 'gabi_ele_1@gmail.com', 'sunteti foarte buni');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD KEY `nume` (`nume`);

--
-- Indexes for table `categorii`
--
ALTER TABLE `categorii`
  ADD PRIMARY KEY (`id_categ`),
  ADD KEY `categoria` (`categoria`) USING BTREE;

--
-- Indexes for table `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`cnp`);

--
-- Indexes for table `comenzi`
--
ALTER TABLE `comenzi`
  ADD PRIMARY KEY (`cod_comanda`);

--
-- Indexes for table `produse`
--
ALTER TABLE `produse`
  ADD PRIMARY KEY (`id_produs`);

--
-- Indexes for table `vizitatori`
--
ALTER TABLE `vizitatori`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `categorii`
--
ALTER TABLE `categorii`
  MODIFY `id_categ` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `comenzi`
--
ALTER TABLE `comenzi`
  MODIFY `cod_comanda` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `produse`
--
ALTER TABLE `produse`
  MODIFY `id_produs` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `vizitatori`
--
ALTER TABLE `vizitatori`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
