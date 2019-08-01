-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2019 at 06:10 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `final`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `date` date NOT NULL,
  `comment` varchar(250) NOT NULL,
  `id` int(11) NOT NULL,
  `whichPost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`name`, `email`, `date`, `comment`, `id`, `whichPost`) VALUES
('Pawandeep Singh Sandhu', 'pawandeepsandhu32@gmail.com', '2019-04-06', 'sdfghj', 73, 1),
('sarthak', 'jordan@gmail.com', '2019-04-06', 'asdfghjk', 74, 2),
('parit', 'pawandeepsandhu32@gmail.com', '2019-04-06', 'sdfgthj', 75, 3),
('sadfgh', 'pawandeepsandhu32@gmail.com', '2019-04-06', 'wertfhj', 76, 1),
('kdfnbvkcx', 'jordan@gmail.com', '2019-04-06', 'psdfgdnkbm', 77, 3),
('Pawandeep Singh Sandhu', 'pawandeepsandhu32@gmail.com', '2019-04-06', 'dsfh', 78, 3);

-- --------------------------------------------------------

--
-- Table structure for table `postsids`
--

CREATE TABLE `postsids` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `postsids`
--

INSERT INTO `postsids` (`id`) VALUES
(1),
(2),
(3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postConnection` (`whichPost`);

--
-- Indexes for table `postsids`
--
ALTER TABLE `postsids`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `postConnection` FOREIGN KEY (`whichPost`) REFERENCES `postsids` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
