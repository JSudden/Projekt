-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Värd: 127.0.0.1
-- Tid vid skapande: 20 apr 2018 kl 15:42
-- Serverversion: 10.1.31-MariaDB
-- PHP-version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databas: `blogposts`
--
CREATE DATABASE IF NOT EXISTS `blogposts` DEFAULT CHARACTER SET latin1 COLLATE latin1_bin;
USE `blogposts`;
--
-- Databas: `exempel`
--
CREATE DATABASE IF NOT EXISTS `exempel` DEFAULT CHARACTER SET latin1 COLLATE latin1_bin;
USE `exempel`;

-- --------------------------------------------------------

--
-- Tabellstruktur `blogposts`
--

CREATE TABLE `blogposts` (
  `ID` int(11) NOT NULL,
  `Title` text COLLATE latin1_bin,
  `Content` text COLLATE latin1_bin
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Dumpning av Data i tabell `blogposts`
--

INSERT INTO `blogposts` (`ID`, `Title`, `Content`) VALUES
(1290, 'Jesper', 'Ã„r kung'),
(1291, 'Tjo', 'Henke'),
(1292, 'King', 'BlogginlÃ¤gg\r\n\r\nServer/Klient arkitektur\r\nKlienten arkitekturen ligger pÃ¥ anvÃ¤ndarens dator, i detta fall i form utav en webblÃ¤sare. Servern Ã¤r en lokal server som tar emot data ifrÃ¥n klient primÃ¤rt genom att anvÃ¤nda sig utav protokoll. Ett protokoll Ã¤r anvÃ¤ndbart fÃ¶r att sÃ¤kerhetsstÃ¤lla att data skickas sÃ¤kert och kan skicka fÃ¶rfrÃ¥gningar till servern som returnerar den Ã¶nskade frÃ¥gan. PHPs funktion i det hela Ã¤r att den tar emot en frÃ¥ga ifrÃ¥n klient sidan som senare skickar en fÃ¶rfrÃ¥gan till servern som genererar ut det Ã¶nskade resultatet och omvandlar dat till ren html kod som sedan visas pÃ¥ klient sidan. Klientsidan har egentligen ingen koll pÃ¥ serverns funktion och kan dÃ¤rfÃ¶r endast kommunicera med den genom att anvÃ¤nda sig utav PHP fÃ¶rfrÃ¥gningar.\r\n\r\nVilka teknologier anvÃ¤nds i mitt projekt\r\nDen lokala Webbservern och databasen skapas genom att anvÃ¤nda XAMPP, XAMPP skapar en server och en databas genom att installera Apache och MySQL till kontrollpanelen Detta gÃ¶r det senare mÃ¶jligt fÃ¶r anvÃ¤ndaren att simpelt starta servern och databasen genom att trycka pÃ¥ ett par knappar, det finns anvÃ¤ndarvÃ¤nliga knappar som tar dig direkt till databasens instÃ¤llningar om man vill konfigurera sin databas.\r\nKlienten som anvÃ¤nds i projektet Ã¤r i form utav en webblÃ¤sare som Ã¤r i mitt fall Google chrome. Klienten skickar fÃ¶rfrÃ¥gningar till servern genom att anvÃ¤nda sig utav internetprotokoll i detta fall i form utav HTTP protokoll som anvÃ¤nds fÃ¶r att skicka bilder ifrÃ¥n hemsidor och andra filer som en hemsida innehÃ¥ller. En fÃ¶rfrÃ¥gning frÃ¥n klienten och dess protokoll skickas till servern som tar emot fÃ¶rfrÃ¥gan och kollar vad fÃ¶r fil som har skickats med i fÃ¶rfrÃ¥gan som sedan startar scripten som skickar en fÃ¶rfrÃ¥gan till databasen som hÃ¤mtar hem data till servern. Till sist gÃ¶r scripten om den data som den fÃ¥tt ifrÃ¥n databasen till fÃ¤rdig html kod som sedan skickas till klienten och visas fÃ¶r anvÃ¤ndaren. \r\nSÃ¥ arkitekturen Ã¤r att klienten skickar fÃ¶rfrÃ¥gningar till servern som kÃ¶r scripten pÃ¥ servern som skickar fÃ¶rfrÃ¥gningar till databasen som skickar tillbaks data till servern som gÃ¶r att scripten omvandlar data till html kod som sedan visas pÃ¥ klient sidan.\r\nJavaScript och Ajax Ã¤r scripts som kan kÃ¶ras och hÃ¤mta data och skicka data som omvandlas till html kod utan att sidan behÃ¶ver laddas om. Detta Ã¤r anvÃ¤ndbart ifall dÃ¤r du ska ta bort anvÃ¤ndare eller tex gilla ett inlÃ¤gg pÃ¥ Facebook, fÃ¶r det hade inte varit smart om du var tvungen att ladda om sidan varje gÃ¥ng du gillade ett inlÃ¤gg pÃ¥ nÃ¥gons profil.\r\n\r\nOWASP \r\nMin sidas risker, de risker jag anser att mina sida skulle behÃ¶va skyddas emot Ã¤r frÃ¤mst 	Cross-site Scripting, injections, Broken Acess Controls, Sensitive Data Exposure, och Broken Authentication.\r\nCross-site Scripting: AnvÃ¤nder sig utav ett program som letar efter sÃ¤kerhetsbrister som anvÃ¤nds fÃ¶r att tex skicka ut alla cookies som en sida lagrar till en privat server som senare kan anvÃ¤ndas fÃ¶r sÃ¤kerhets intrÃ¥ng pÃ¥ sidan. \r\nSkydd:SÃ¤tten att skydda sig pÃ¥ Ã¤r att inte lÃ¤gga ut http fÃ¶rfrÃ¥gningar i http outputen.\r\nInjections: Injections Ã¤r nÃ¤r du skriver SQL kod som text lÃ¥ter dig gÃ¥ fÃ¶rbi inloggingar pÃ¥ hemsidan genom att sÃ¤tta sÃ¥ att anvÃ¤ndarnamnet och lÃ¶senordet Ã¤r sant. Detta gÃ¥r sÃ¥ att du kommer in pÃ¥ hemsidan fastÃ¤n du inte har nÃ¥gon anvÃ¤nder i databasen.\r\nSkydd: Argumenten som skickas till en query borde alltid bli hanterade som att den vore skadlig.\r\nBroke Acess Control: Ett undantag ska gÃ¶ras sÃ¥ att publika medel inte ska vara tillÃ¥tna som en standard dÃ¥ detta Ã¶kar risken fÃ¶r intrÃ¥ng.\r\nSensitive Data Exposure: Det Ã¤r nÃ¤r en applikation krypterar tex ett kortnummer genom att automatiskt gÃ¶ra det via en databasens kryptering om den stÃ¶djer sÃ¥dant. Detta kan stÃ¤lla till problem dÃ¥ nÃ¤r datan blir hÃ¤mtad blir den oftast dekrypterad vilket gÃ¶r det mÃ¶jligt fÃ¶r en SQL injection att hÃ¤mta ut datan och sedan lagra den. \r\nSkydd: Det finns flera sÃ¤tt att skydda sig emot detta, dock sÃ¤ttet jag har anvÃ¤nt Ã¤r att kryptera mina lÃ¶senord genom salt och has. Hashalgoritmen som jag anvÃ¤nder mig utav Ã¤r bcrypt, som krypterar lÃ¶senorden innan dom kommer in i databasen vilket gÃ¶r det svÃ¥rare fÃ¶r injections att hÃ¤mta ut datan.\r\nBroken Autentication: Detta Ã¤r nÃ¤r en hackar anvÃ¤nder ett program som utnyttjar de vanligaste lÃ¶senorden och anvÃ¤ndarnamnen som kÃ¶r detta tillsammans med en algoritm som testar olika anvÃ¤ndarnamn och lÃ¶senord tills applikationen lyckas komma in pÃ¥ sidan. Denna metod i vanliga fall kallas brute force.\r\nSkydd: FÃ¶r att skydda sig emot brute force Ã¤r det bÃ¤sta sÃ¤tten att fÃ¶rst och frÃ¤mst gÃ¶ra sÃ¥ att dina anvÃ¤ndare som registrerar sig mÃ¥ste ha ett lÃ¶senord som Ã¤r x antal tecken lÃ¥ngt och innehÃ¥ller minst en stor bokstav samt en siffra. Genom att gÃ¶ra detta blir det svÃ¥rare fÃ¶r algoritmen att knÃ¤cka lÃ¶senorden och anvÃ¤ndarnamnen. Det som ocksÃ¥ bÃ¶r gÃ¶ras Ã¤r att sÃ¤tta en timer pÃ¥ sidan som gÃ¶r att du fÃ¥r testa att logga in tex 5gÃ¥nger pÃ¥ 5minuter. Ã–verskrids detta bÃ¶r anvÃ¤ndaren fÃ¥ en timeout som gÃ¶r att du inte fÃ¥r testa logga in igen pÃ¥ 10minuter osv.. \r\n\r\n');

-- --------------------------------------------------------

--
-- Tabellstruktur `comments`
--

CREATE TABLE `comments` (
  `ID` int(11) NOT NULL,
  `blogpost_Id` int(11) DEFAULT NULL,
  `Name` text COLLATE latin1_bin,
  `Content` text COLLATE latin1_bin
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Dumpning av Data i tabell `comments`
--

INSERT INTO `comments` (`ID`, `blogpost_Id`, `Name`, `Content`) VALUES
(1269, 1241, '1242', 'Yo'),
(1270, 1241, '1242', 'Yo'),
(1271, 1241, '1242', 'Yo'),
(1272, 1241, '1242', 'Yo'),
(1273, 1241, '1242', 'Yo'),
(1274, 1241, '1242', 'Yo'),
(1275, 1241, '1242', 'Yo'),
(1276, 1241, '1242', 'Yo'),
(1277, 1241, '1242', 'Yo'),
(1278, 1285, '1245', 'ful unge\r\n'),
(1279, 1286, '1245', 'hej'),
(1280, 1287, '1245', 'asdl'),
(1281, 1288, '1245', 'Lol'),
(1282, 1288, '1245', 'asdioj'),
(1283, 1288, '1245', 'asdioj'),
(1284, 1288, '1245', 'asdioj'),
(1285, 1288, '1245', 'asdioj'),
(1286, 1288, '1245', 'asdioj'),
(1287, 1288, '1245', 'asdioj'),
(1288, 1288, '1245', 'asdioj'),
(1289, 1288, '1245', 'o'),
(1290, 1288, '1245', 'o'),
(1291, 1287, '1245', 'asdoijasd'),
(1292, 1287, '1245', 'asdoijasd'),
(1293, 1287, '1245', 'asdoijasd'),
(1294, 1287, '1245', 'asdoijasd'),
(1295, 1287, '1245', 'asdoijasd'),
(1296, 1287, '1245', 'asdoijasd'),
(1297, 1287, '1245', 'asdoijasd'),
(1298, 1287, '1245', 'asdoijasd'),
(1299, 1287, '1245', 'asdoijasd'),
(1300, 1287, '1245', 'asdoijasd'),
(1301, 1287, '1245', 'asdoijasd'),
(1302, 1287, '1245', 'asdoijasd'),
(1303, 1287, '1245', 'asdoijasd'),
(1304, 1287, '1245', 'asdoijasd'),
(1305, 1287, '1245', 'asdoijasd'),
(1306, 1287, '1245', 'asdoijasd'),
(1307, 1287, '1245', 'asdoijasd'),
(1308, 1287, '1245', 'asdoijasd'),
(1309, 1287, '1245', 'asdoijasd'),
(1310, 1287, '1245', 'asdoijasd'),
(1311, 1287, '1245', 'asdoijasd'),
(1312, 1287, '1245', 'asdoijasd'),
(1313, 1289, '1245', 'Tjo brush'),
(1314, 1289, '1245', 'Tjo brush'),
(1315, 1289, '1245', 'Tjo brush'),
(1316, 1289, '1245', 'Tjo brush'),
(1317, 1289, '1245', 'Tjo brush'),
(1318, 1289, '1245', 'Tjo brush'),
(1319, 1289, '1245', 'Tjo brush'),
(1320, 1289, '1245', 'Tjo brush'),
(1321, 1289, '1245', 'Tjo brush'),
(1322, 1289, '1245', 'Tjo brush'),
(1323, 1289, '1245', 'Tjo brush'),
(1324, 1289, '1245', 'Tjo brush'),
(1325, 1289, '1245', 'Tjo brush'),
(1326, 1289, '1245', 'Tjo brush'),
(1327, 1289, '1245', 'Tjo brush'),
(1328, 1289, '1245', 'Tjo brush'),
(1329, 1289, '1245', 'Tjo brush'),
(1330, 1289, '1245', 'Tjo brush'),
(1331, 1289, '1245', 'Tjo brush'),
(1332, 1289, '1245', 'Tjo brush'),
(1333, 1289, '1245', 'Tjo brush'),
(1334, 1289, '1245', 'Tjo brush'),
(1335, 1289, '1245', 'Tjo brush'),
(1336, 1289, '1245', 'Tjo brush'),
(1337, 1289, '1245', 'Tjo brush'),
(1338, 1289, '1245', 'Tjo brush'),
(1339, 1290, '1245', 'Legend'),
(1340, 1290, '1247', 'Bastu'),
(1341, 1291, '1245', 'kung');

-- --------------------------------------------------------

--
-- Tabellstruktur `path`
--

CREATE TABLE `path` (
  `postId` int(11) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `path`
--

INSERT INTO `path` (`postId`, `path`) VALUES
(1271, 'uploads/1523616999sidewall-skiing-car-saudi-arabia4.jpg'),
(1272, 'uploads/1523619510affischtom.jpg'),
(1273, 'uploads/1523620574sidewall-skiing-car-saudi-arabia4.jpg'),
(1274, 'uploads/1523876994'),
(1275, 'uploads/1523877017'),
(1276, 'uploads/1523877149'),
(1277, 'uploads/1523877319'),
(1278, 'uploads/1523957315'),
(1279, 'uploads/1523957332'),
(1280, 'uploads/1523957688'),
(1281, 'uploads/1523957830'),
(1282, 'uploads/1523957882'),
(1283, 'uploads/1523958028'),
(1284, 'uploads/1523958444'),
(1285, 'uploads/1523958474'),
(1286, 'uploads/1523958584'),
(1287, 'uploads/1523958757'),
(1288, 'uploads/1524055667'),
(1289, 'uploads/1524057273'),
(1290, 'uploads/1524057574'),
(1291, 'uploads/1524121029bd5v.jpg'),
(1292, 'uploads/1524231305maxresdefault (3).jpg');

-- --------------------------------------------------------

--
-- Tabellstruktur `pictures`
--

CREATE TABLE `pictures` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Dumpning av Data i tabell `pictures`
--

INSERT INTO `pictures` (`id`) VALUES
(1270);

-- --------------------------------------------------------

--
-- Tabellstruktur `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1247, 'Mats', '$2y$10$8LhS88IZDRzKMHS2NfjoQegWPUcEXkZtyF68vKOYH8RRdDWBd8MNq'),
(1244, 'johannes', '$2y$10$ZLyNSCIUmIOARw1E8pfneuEnB9JMZI.m3DKMzWSz3zk.fnPPuWu8i'),
(1245, 'sudden', '$2y$10$To.d3KeYEJzaFHCnwJYf6ORlk3BQhOjnfFZdvY/tT.YGJ59cCErYu'),
(1246, 'sudden', '$2y$10$9fUqmcwyI0dEE4HvMathOODrjkSN6vfrJcgEuGLcBU9k3XcEPaGYW'),
(1248, 'erik', '$2y$10$yZlJSaOfLWksIYLnGQz6VOd/sBxBrfhSJbPYN1cFW8wIb7tD6n6IK');

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `blogposts`
--
ALTER TABLE `blogposts`
  ADD PRIMARY KEY (`ID`);

--
-- Index för tabell `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`ID`);

--
-- Index för tabell `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`id`);

--
-- Index för tabell `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `blogposts`
--
ALTER TABLE `blogposts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1293;

--
-- AUTO_INCREMENT för tabell `comments`
--
ALTER TABLE `comments`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1342;

--
-- AUTO_INCREMENT för tabell `pictures`
--
ALTER TABLE `pictures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1271;

--
-- AUTO_INCREMENT för tabell `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1249;
--
-- Databas: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumpning av Data i tabell `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"exempel\",\"table\":\"comments\"},{\"db\":\"exempel\",\"table\":\"users\"},{\"db\":\"exempel\",\"table\":\"blogposts\"},{\"db\":\"exempel\",\"table\":\"path\"},{\"db\":\"exempel\",\"table\":\"pictures\"},{\"db\":\"mysql\",\"table\":\"user\"}]');

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumpning av Data i tabell `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2018-03-16 14:45:55', '{\"lang\":\"sv\",\"collation_connection\":\"utf8mb4_unicode_ci\"}');

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Tabellstruktur `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Index för tabell `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Index för tabell `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Index för tabell `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Index för tabell `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Index för tabell `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Index för tabell `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Index för tabell `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Index för tabell `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Index för tabell `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Index för tabell `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Index för tabell `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Index för tabell `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Index för tabell `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Index för tabell `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Index för tabell `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Index för tabell `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Index för tabell `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Index för tabell `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT för tabell `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT för tabell `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT för tabell `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT för tabell `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT för tabell `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Databas: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
