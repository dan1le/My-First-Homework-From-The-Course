-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 27, 2023 at 09:41 PM
-- Server version: 8.0.27
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `g1`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategorije`
--

DROP TABLE IF EXISTS `kategorije`;
CREATE TABLE IF NOT EXISTS `kategorije` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `kategorije`
--

INSERT INTO `kategorije` (`id`, `naziv`) VALUES
(1, 'Mobilni telefoni'),
(2, 'Bela tehnika'),
(3, 'Računari'),
(4, 'Ozvučenja'),
(5, 'Automobili');

-- --------------------------------------------------------

--
-- Table structure for table `komentari`
--

DROP TABLE IF EXISTS `komentari`;
CREATE TABLE IF NOT EXISTS `komentari` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `idProizvoda` int NOT NULL,
  `ime` varchar(50) NOT NULL,
  `komentar` text NOT NULL,
  `vreme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `volime` int NOT NULL DEFAULT '0',
  `nevolime` int NOT NULL DEFAULT '0',
  `dozvoljen` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `komentari`
--

INSERT INTO `komentari` (`id`, `idProizvoda`, `ime`, `komentar`, `vreme`, `volime`, `nevolime`, `dozvoljen`) VALUES
(2, 12, 'Boško', 'Ovo je komentar za id=12', '2022-02-23 16:59:45', 0, 0, 1),
(3, 12, 'Pera', 'Ovo je Prin komentar za id=12', '2022-02-23 17:00:18', 0, 0, 1),
(12, 12, 'Boško', 'window.location.assign(\'http://www.it-akademija.com\')', '2022-02-23 17:47:24', 0, 0, 0),
(7, 8, 'Boško', 'Ne pratimo Zadrugu id=8', '2022-02-23 17:21:51', 0, 0, 0),
(8, 8, 'Pera', 'Bravo Care!!!!! id=8', '2022-02-23 17:22:06', 0, 0, 0),
(9, 8, 'Бошко Богојевић', 'asdsadadsd', '2022-02-23 17:27:28', 0, 0, 0),
(10, 8, 'Djurdjina1', 'aerwerwerwe', '2022-02-23 17:33:19', 0, 0, 0),
(11, 7, 'Pera', 'werewrwrewrewr', '2022-02-23 17:33:28', 0, 0, 0),
(13, 12, 'asdasdsa', 'asdsdasdasd', '2022-03-23 19:18:15', 0, 0, 0),
(14, 12, 'asdasdsa', 'asdsdasdasd', '2022-03-23 19:25:02', 0, 0, 0),
(15, 12, 'asdasdsa', 'asdsdasdasd', '2022-03-23 19:26:09', 0, 0, 0),
(16, 12, 'asdasdsa', 'asdsdasdasd', '2022-03-23 19:26:46', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kontakt`
--

DROP TABLE IF EXISTS `kontakt`;
CREATE TABLE IF NOT EXISTS `kontakt` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `idKorisnika` int DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `pitanje` text NOT NULL,
  `vremePitanja` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `odgovor` text,
  `vremeOdgovora` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `kontakt`
--

INSERT INTO `kontakt` (`id`, `idKorisnika`, `email`, `pitanje`, `vremePitanja`, `odgovor`, `vremeOdgovora`) VALUES
(1, NULL, 'email@skola.com', 'Moje pitanje je prosto?', '2022-02-23 18:30:19', 'Super što je prosto', '2022-02-23 19:07:28'),
(2, 1, 'bbosko@skola.com', 'Ovo je pitanje za admina?', '2022-02-23 18:31:08', 'Admin odgovara na Vaše pitanje', '2022-02-23 19:10:46'),
(3, 3, 'ckurbla@skola.com', 'Ja samo da pitam?', '2022-02-23 18:31:58', NULL, NULL),
(5, 2, 'pperic@skola.com', 'ovo je pitanje od Pere Perića?', '2022-02-23 18:44:23', NULL, NULL),
(6, 1, 'bbosko@skola.com', 'Ali kada će ovo biti gotovo', '2022-02-23 19:13:02', 'Samo što nije', '2022-02-23 19:13:17'),
(7, 3, 'ckurbla@skola.com', 'Ovo je moje kratko pitanje', '2022-02-23 19:14:21', 'Pozz, Cane, iskuliraj', '2022-02-23 19:14:36'),
(8, 3, 'ckurbla@skola.com', 'Ali samo još jedno pitanje...', '2022-02-23 19:14:55', 'Daj, Cane, ne smaraj', '2022-02-23 19:15:06');

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

DROP TABLE IF EXISTS `korisnici`;
CREATE TABLE IF NOT EXISTS `korisnici` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ime` varchar(50) NOT NULL,
  `prezime` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `lozinka` varchar(256) NOT NULL,
  `adresa` varchar(100) DEFAULT NULL,
  `aktivan` int NOT NULL DEFAULT '1',
  `komentar` text,
  `status` enum('Administrator','Urednik','Korisnik') NOT NULL,
  `obrisan` int NOT NULL DEFAULT '0',
  `datumK` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `datumI` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `validan` int UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`id`, `ime`, `prezime`, `email`, `lozinka`, `adresa`, `aktivan`, `komentar`, `status`, `obrisan`, `datumK`, `datumI`, `validan`) VALUES
(1, 'Boško', 'Bogojević', 'bbosko@skola.com', 'bbosko1', 'Zemunska 10', 1, 'Ovo je komentar za peru', 'Administrator', 0, '2021-12-29 17:26:03', '2022-04-27 18:35:10', 1),
(2, 'Pera', 'Perić', 'pperic@skola.com', 'pperic', 'Zemunska 10', 1, 'Ovo je komentar za peru', 'Urednik', 0, '2021-12-29 17:28:34', '2022-04-27 16:02:01', 1),
(3, 'Cane', 'Kurbla', 'ckurbla@skola.com', 'ckurbla', 'Zemunska 10sdfsd', 1, 'sdfsdfs', 'Urednik', 0, '2021-12-29 17:28:34', '2022-04-27 16:02:04', 1),
(4, 'Mile', 'Dizna', 'mdizna@skola.com', 'mdizna', 'Neka ulica', 1, '', 'Korisnik', 0, '2022-01-21 18:08:13', '2022-04-27 16:02:06', 1),
(5, 'Laza', 'Lazić', 'asdsad@gfg', '12345', '', 1, '', 'Korisnik', 0, '2022-02-02 18:46:49', '2022-04-27 16:02:09', 1),
(9, 'Joca', 'Karburator', 'kjoca@skola.com', 'Kh_Ak6', 'Neka adresa 10', 1, '', 'Korisnik', 1, '2022-04-20 15:51:53', '2022-04-27 17:40:27', 0),
(17, 'Marko', 'Markovic', 'asdasdfdsfdsf', 'Li&Bm8', '', 1, '', 'Korisnik', 0, '2022-04-27 18:17:39', '2022-07-21 18:28:18', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pogledproizvodi`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `pogledproizvodi`;
CREATE TABLE IF NOT EXISTS `pogledproizvodi` (
`autor` varchar(20)
,`cena` int
,`id` int unsigned
,`ime` varchar(50)
,`kategorija` varchar(20)
,`naslov` varchar(200)
,`naziv` varchar(50)
,`obrisan` int
,`pogledan` int
,`prezime` varchar(100)
,`tekst` text
,`vreme` timestamp
,`vremeIzmene` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pogledvesti`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `pogledvesti`;
CREATE TABLE IF NOT EXISTS `pogledvesti` (
`autor` varchar(20)
,`id` int unsigned
,`ime` varchar(50)
,`kategorija` varchar(20)
,`naslov` varchar(200)
,`naziv` varchar(50)
,`obrisan` int
,`prezime` varchar(100)
,`tekst` text
,`vreme` timestamp
,`vremeIzmene` timestamp
);

-- --------------------------------------------------------

--
-- Table structure for table `proizvodi`
--

DROP TABLE IF EXISTS `proizvodi`;
CREATE TABLE IF NOT EXISTS `proizvodi` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `naslov` varchar(200) NOT NULL,
  `tekst` text NOT NULL,
  `kategorija` varchar(20) NOT NULL,
  `vreme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `autor` varchar(20) NOT NULL,
  `vremeIzmene` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `obrisan` int NOT NULL DEFAULT '0',
  `cena` int NOT NULL,
  `pogledan` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `proizvodi`
--

INSERT INTO `proizvodi` (`id`, `naslov`, `tekst`, `kategorija`, `vreme`, `autor`, `vremeIzmene`, `obrisan`, `cena`, `pogledan`) VALUES
(1, 'Mijailović: Da vratimo Partizan u Evroligu', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '1', '2021-12-29 18:38:48', '1', '2022-01-26 18:31:59', 0, 100, 0),
(2, 'Prvak razočarao – Kobajaši najbolji u Obersdorfu!', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', '2', '2021-12-29 18:38:48', '2', '2022-01-26 18:32:03', 0, 200, 0),
(3, 'Ko je najbolji srpski fudbaler? FOTO', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?', '4', '2021-12-29 18:40:02', '1', '2022-01-26 18:32:10', 0, 1000, 0),
(4, 'Farid stiže u Denverovu filijalu', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.', '1', '2021-12-29 18:40:02', '2', '2022-01-26 18:32:14', 0, 500, 0),
(5, 'MPUS ima najbolji IS u Srbiji', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.', '3', '2022-01-10 18:40:02', '2', '2022-01-21 17:29:13', 0, 0, 0),
(6, 'Noloa izbacili iz Australije', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.', '1', '2022-01-04 18:40:02', '2', '2022-02-09 18:36:41', 0, 0, 1),
(7, 'Partizan dobio Hamburg', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.', '1', '2022-01-02 18:40:02', '1', '2022-02-23 17:33:28', 0, 0, 8),
(8, 'Pobili se Filip Car i Dalila', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.', '4', '2022-01-20 18:40:02', '2', '2022-02-23 17:33:19', 0, 0, 18),
(10, 'Ovo je IZMENA posle dodate statistike', 'Ovo je tekst IZMENA posle dodate statistike', '4', '2022-01-21 19:25:28', '6', '2022-02-23 17:10:05', 1, 0, 1),
(11, 'Novi proizvod', 'Opis novog proizvoda', '5', '2022-02-04 18:55:03', '1', '2022-02-23 17:10:01', 1, 1000, 1),
(12, 'Proizvod sa slikama', 'Tekst proizvoda sa slikama', '5', '2022-02-04 19:04:20', '1', '2022-04-27 15:16:40', 0, 1000, 67);

-- --------------------------------------------------------

--
-- Table structure for table `slikeproizvoda`
--

DROP TABLE IF EXISTS `slikeproizvoda`;
CREATE TABLE IF NOT EXISTS `slikeproizvoda` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `idProizvoda` int NOT NULL,
  `imeSlike` varchar(256) NOT NULL,
  `komentar` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `slikeproizvoda`
--

INSERT INTO `slikeproizvoda` (`id`, `idProizvoda`, `imeSlike`, `komentar`) VALUES
(1, 12, '1644001460.2886_istockphoto-1016242234-612x612.jpg', NULL),
(2, 12, '1644001460.2899_istockphoto-1322518125-170667a.jpg', NULL),
(3, 12, '1644001460.3003_Summer-beach-image.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `statistika`
--

DROP TABLE IF EXISTS `statistika`;
CREATE TABLE IF NOT EXISTS `statistika` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `ipadresa` varchar(50) NOT NULL,
  `stranica` varchar(50) NOT NULL,
  `parametri` varchar(50) DEFAULT NULL,
  `tekst` text,
  `vreme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `statistika`
--

INSERT INTO `statistika` (`id`, `ipadresa`, `stranica`, `parametri`, `tekst`, `vreme`) VALUES
(1, '::1', '/aphp/p1/index2.php', '', '', '2022-01-21 18:24:32'),
(2, '::1', '/aphp/p1/index2.php', 'kategorija=1', '', '2022-01-21 18:24:56'),
(3, '::1', '/aphp/p1/index2.php', 'kategorija=1', '', '2022-01-21 18:25:11'),
(4, '::1', '/aphp/p1/index2.php', 'kategorija=1', '', '2022-01-21 18:25:11'),
(5, '::1', '/aphp/p1/index2.php', 'kategorija=1', '', '2022-01-21 18:25:11'),
(6, '::1', '/aphp/p1/index2.php', 'kategorija=1', '', '2022-01-21 18:25:12'),
(7, '::1', '/aphp/p1/index2.php', 'kategorija=1', '', '2022-01-21 18:25:12'),
(8, '::1', '/aphp/p1/index2.php', 'kategorija=1', '', '2022-01-21 18:25:12'),
(9, '::1', '/aphp/p1/index2.php', 'kategorija=1', '', '2022-01-21 18:25:13'),
(10, '::1', '/aphp/p1/vest.php', 'id=7', '', '2022-01-21 18:25:52'),
(11, '::1', '/aphp/p1/vest.php', 'id=7', '', '2022-01-21 18:25:54'),
(12, '::1', '/aphp/p1/vest.php', 'id=7', '', '2022-01-21 18:25:55'),
(13, '::1', '/aphp/p1/vest.php', 'id=7', '', '2022-01-21 18:25:55'),
(14, '::1', '/aphp/p1/vest.php', 'id=7', '', '2022-01-21 18:25:55'),
(15, '172.15.12.31', '/aphp/p1/vest.php', 'id=7', '', '2022-01-21 18:25:56'),
(16, '::1', '/aphp/p1/index2.php', '', '', '2022-01-21 18:25:57'),
(17, '::1', '/aphp/p1/vest.php', 'id=6', '', '2022-01-21 18:25:58'),
(18, '::1', '/aphp/p1/vest.php', 'id=6', '', '2022-01-21 18:26:00'),
(19, '::1', '/aphp/p1/vest.php', 'id=6', '', '2022-01-21 18:26:01'),
(20, '::1', '/aphp/p1/vest.php', 'id=6', '', '2022-01-21 18:26:01'),
(21, '172.15.12.31', '/aphp/p1/vest.php', 'id=6', '', '2022-01-21 18:26:01'),
(22, '::1', '/aphp/p1/vest.php', 'id=6', '', '2022-01-21 18:26:02'),
(23, '::1', '/aphp/p1/vest.php', 'id=6', '', '2022-01-21 18:26:02'),
(24, '::1', '/aphp/p1/vest.php', 'id=6', '', '2022-01-21 18:26:02'),
(25, '::1', '/aphp/p1/vest.php', 'id=6', '', '2022-01-21 18:26:02'),
(26, '172.15.12.32', '/aphp/p1/vest.php', 'id=6', '', '2022-01-21 18:26:03'),
(27, '::1', '/aphp/p1/index2.php', '', '', '2022-01-21 18:26:04'),
(28, '::1', '/aphp/p1/vest.php', 'id=4', '', '2022-01-21 18:26:07'),
(29, '::1', '/aphp/p1/vest.php', 'id=4', '', '2022-01-21 18:26:09'),
(30, '::1', '/aphp/p1/index2.php', '', '', '2022-01-21 18:26:11'),
(31, '::1', '/aphp/p1/vest.php', 'id=8', '', '2022-01-21 18:26:13'),
(32, '::1', '/aphp/p1/index2.php', '', '', '2022-01-21 19:00:34'),
(33, '::1', '/aphp/p1/index2.php', '', '', '2022-01-21 19:11:28'),
(34, '::1', '/aphp/p1/index2.php', '', '', '2022-01-21 19:21:18'),
(35, '::1', '/aphp/p1/index2.php', '', '', '2022-01-21 19:21:58'),
(36, '::1', '/aphp/p1/index3.php', '', 'Dodata vest sa id: 10', '2022-01-21 19:25:28'),
(37, '::1', '/aphp/p1/index2.php', '', '', '2022-01-21 19:26:23'),
(38, '::1', '/aphp/p1/index4.php', '', 'Izmena vesti sa id: 10', '2022-01-21 19:26:33'),
(39, '::1', '/aphp/p1/index2.php', '', '', '2022-01-21 19:26:37'),
(40, '::1', '/aphp/p1/index6.php', '', 'Brisanje vesti sa id: 1', '2022-01-21 19:27:00'),
(41, '::1', '/aphp/p1/index2.php', '', '', '2022-01-26 15:31:32'),
(42, '::1', '/aphp/p1/index2.php', 'autor=1', '', '2022-01-26 15:32:36'),
(43, '::1', '/aphp/p1/index2.php', 'kategorija=4', '', '2022-01-26 15:32:38'),
(44, '::1', '/aphp/p1/index2.php', 'kategorija=1', '', '2022-01-26 15:32:40'),
(45, '::1', '/aphp/p1/index2.php', 'kategorija=2', '', '2022-01-26 15:32:41'),
(46, '::1', '/aphp/p1/index2.php', 'kategorija=4', '', '2022-01-26 15:32:42'),
(47, '::1', '/aphp/p1/index2.php', 'kategorija=5', '', '2022-01-26 15:32:43'),
(48, '::1', '/aphp/p1/index2.php', '', '', '2022-01-26 15:32:45'),
(49, '::1', '/aphp/p1/vest.php', 'id=10', '', '2022-01-26 15:32:47'),
(50, '::1', '/aphp/p1/index2.php', 'kategorija=4', '', '2022-01-26 15:32:50');

-- --------------------------------------------------------

--
-- Table structure for table `vesti`
--

DROP TABLE IF EXISTS `vesti`;
CREATE TABLE IF NOT EXISTS `vesti` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `naslov` varchar(200) NOT NULL,
  `tekst` text NOT NULL,
  `kategorija` varchar(20) NOT NULL,
  `vreme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `autor` varchar(20) NOT NULL,
  `vremeIzmene` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `obrisan` int NOT NULL DEFAULT '0',
  `cena` int NOT NULL,
  `pogledan` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `vesti`
--

INSERT INTO `vesti` (`id`, `naslov`, `tekst`, `kategorija`, `vreme`, `autor`, `vremeIzmene`, `obrisan`, `cena`, `pogledan`) VALUES
(1, 'Mijailović: Da vratimo Partizan u Evroligu', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '1', '2021-12-29 18:38:48', '1', '2022-01-21 19:27:29', 0, 0, 0),
(2, 'Prvak razočarao – Kobajaši najbolji u Obersdorfu!', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', '2', '2021-12-29 18:38:48', '2', '2022-01-21 16:51:56', 0, 0, 0),
(3, 'Ko je najbolji srpski fudbaler? FOTO', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?', '4', '2021-12-29 18:40:02', '1', '2022-01-21 16:51:50', 0, 0, 0),
(4, 'Farid stiže u Denverovu filijalu', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.', '1', '2021-12-29 18:40:02', '2', '2022-01-21 16:51:45', 0, 0, 0),
(5, 'MPUS ima najbolji IS u Srbiji', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.', '3', '2022-01-10 18:40:02', '2', '2022-01-21 17:29:13', 0, 0, 0),
(6, 'Noloa izbacili iz Australije', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.', '1', '2022-01-04 18:40:02', '2', '2022-01-21 17:29:23', 0, 0, 0),
(7, 'Partizan dobio Hamburg', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.', '1', '2022-01-02 18:40:02', '1', '2022-01-21 17:46:21', 0, 0, 0),
(8, 'Pobili se Filip Car i Dalila', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.', '4', '2022-01-20 18:40:02', '2', '2022-01-21 17:29:34', 0, 0, 0),
(10, 'Ovo je IZMENA posle dodate statistike', 'Ovo je tekst IZMENA posle dodate statistike', '4', '2022-01-21 19:25:28', '1', '2022-01-21 19:26:33', 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure for view `pogledproizvodi`
--
DROP TABLE IF EXISTS `pogledproizvodi`;

DROP VIEW IF EXISTS `pogledproizvodi`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pogledproizvodi`  AS SELECT `proizvodi`.`id` AS `id`, `proizvodi`.`naslov` AS `naslov`, `proizvodi`.`tekst` AS `tekst`, `proizvodi`.`kategorija` AS `kategorija`, `proizvodi`.`vreme` AS `vreme`, `proizvodi`.`autor` AS `autor`, `proizvodi`.`vremeIzmene` AS `vremeIzmene`, `proizvodi`.`obrisan` AS `obrisan`, `proizvodi`.`cena` AS `cena`, `proizvodi`.`pogledan` AS `pogledan`, `kategorije`.`naziv` AS `naziv`, `korisnici`.`ime` AS `ime`, `korisnici`.`prezime` AS `prezime` FROM ((`proizvodi` join `kategorije` on((`proizvodi`.`kategorija` = `kategorije`.`id`))) join `korisnici` on((`proizvodi`.`autor` = `korisnici`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `pogledvesti`
--
DROP TABLE IF EXISTS `pogledvesti`;

DROP VIEW IF EXISTS `pogledvesti`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pogledvesti`  AS SELECT `vesti`.`id` AS `id`, `vesti`.`naslov` AS `naslov`, `vesti`.`tekst` AS `tekst`, `vesti`.`kategorija` AS `kategorija`, `vesti`.`vreme` AS `vreme`, `vesti`.`autor` AS `autor`, `vesti`.`vremeIzmene` AS `vremeIzmene`, `vesti`.`obrisan` AS `obrisan`, `kategorije`.`naziv` AS `naziv`, `korisnici`.`ime` AS `ime`, `korisnici`.`prezime` AS `prezime` FROM ((`vesti` join `korisnici` on((`vesti`.`autor` = `korisnici`.`id`))) join `kategorije` on((`vesti`.`kategorija` = `kategorije`.`id`))) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
