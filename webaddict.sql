-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2019 at 02:43 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webaddict`
--

-- --------------------------------------------------------

--
-- Table structure for table `portfolio`
--

CREATE TABLE `portfolio` (
  `id` int(11) NOT NULL,
  `portfolio_name` varchar(255) NOT NULL,
  `platform` varchar(50) NOT NULL,
  `portfolio_image` varchar(80) NOT NULL,
  `portfolio_link` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `portfolio`
--

INSERT INTO `portfolio` (`id`, `portfolio_name`, `platform`, `portfolio_image`, `portfolio_link`, `created_at`, `user_id`) VALUES
(8, 'Cambridge Code', 'WordPress Development', '0b91be80e0bff688.jpg', 'https://thecambridgecode.com/', '2019-07-04 11:59:37', 2),
(9, 'The Finer Group', 'WordPress Development', '3370af4825d02e72.jpg', 'http://www.thefinergroup.co.uk/', '2019-07-04 12:00:09', 2),
(10, 'Blue Turban', 'WordPress Development', 'e2115180c0bc63fc.jpg', 'https://www.blueturban.in/', '2019-07-04 12:00:34', 2),
(11, 'Saskia Dr', 'WordPress Development', '7595fd2015dd2be2.jpg', 'http://saskiadr.com/', '2019-07-04 12:01:05', 2),
(12, '1508 London', 'WordPress Development', '66c6d1a5d1de6c2a.jpg', 'http://1508london.com/', '2019-07-04 12:01:45', 2),
(13, 'Ausconnect', 'WordPress Development', '13f88c33ddded5ad.jpg', 'http://ausconnect.uk/', '2019-07-04 12:02:38', 2),
(14, 'Ankit Patel Sculptures', 'WordPress Development', 'b7c66fd1779f470a.jpg', 'http://ankitpatelsculptures.com/', '2019-07-04 12:03:07', 2),
(15, 'Kassa', 'WordPress Development', '4c64e0eccb6c1ff9.jpg', 'http://studiokassa.com/', '2019-07-04 12:03:42', 2),
(16, 'Hotel Dodas Palace', 'WordPress Development', '4b3047badbd87a5a.jpg', 'http://hoteldodaspalace.com/', '2019-07-04 12:04:15', 2),
(17, 'Expediteps', 'WordPress Development', '5e0afba0481e7d27.jpg', 'http://www.expediteps.com/', '2019-07-04 12:04:40', 2),
(18, 'Audio Vision', 'WordPress Development', 'd9387b0fe3c133f1.jpg', 'http://bsltestsite.co.uk/av', '2019-07-04 12:05:05', 2),
(19, 'Anglo Colombian', 'WordPress Development', 'a35d60384d68fdf3.jpg', 'http://anglocol.co.uk/', '2019-07-04 12:05:33', 2),
(20, 'The One', 'WordPress Development', '0bb8b6316ff7c9e8.jpg', 'http://the-one.rosengart.mc/', '2019-07-04 12:06:10', 2),
(21, 'Thomond', 'WordPress Development', 'c26a8306d732cfdc.jpg', 'http://bsltestsite.co.uk/thomond', '2019-07-04 12:06:36', 2),
(22, 'Rosebourne', 'WordPress Development', '611ad2165141e41c.jpg', 'http://rosebourne.co.uk/', '2019-07-04 12:07:00', 2),
(23, 'Banana Boxers', 'WordPress Development', 'ff743f41a08e8336.jpg', 'http://www.bananaboxers.com/', '2019-07-04 12:07:24', 2),
(24, 'StealNoire', 'WordPress Development', '6d612043a6e25d99.jpg', 'http://stealnoire.com/', '2019-07-04 12:07:57', 2),
(25, 'March London', 'WordPress Development', 'd8a96e6099d985bb.jpg', 'http://marchfashion.co.uk/', '2019-07-04 12:08:31', 2),
(26, 'Paddle', 'WordPress Development', '21b30715f9db4946.jpg', 'http://puntingincambridge.com/', '2019-07-04 12:09:35', 2),
(27, 'Star Dust', 'WordPress Development', 'e127aea334e8ff4e.jpg', 'https://stardustrocks.com/', '2019-07-04 12:09:57', 2),
(28, 'Will Henry London', 'WordPress Development', '1508332a13354dbb.jpg', 'https://www.willhenrylondon.com/', '2019-07-04 12:10:17', 2),
(29, 'Philippa Herbert', 'WordPress Development', 'bba709545a0183ad.jpg', 'https://philippaherbert.co.uk/', '2019-07-04 12:31:32', 2),
(30, 'Map All', 'WordPress Development', 'ab855217dc14f84e.jpg', 'http://www.mapall.com/', '2019-07-04 12:31:21', 2),
(31, 'Burghley Boutique', 'WordPress Development', '50385b7662eb4595.jpg', 'https://burghleyboutique.co.uk/', '2019-07-04 12:31:11', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(80) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(800) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `email`, `password`, `created_at`, `role`) VALUES
(3, 'demo', 'demo', 'demo@gmail.com', '$2b$12$GDYIujCr8wPfF7eYP71T7uHhJnw8OIXQOd2hgQAggd3JCTfTcV5p2', '2019-09-03 12:42:53', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `portfolio`
--
ALTER TABLE `portfolio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
