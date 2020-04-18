-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2020 at 04:06 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vietgram`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id_comments` int(10) NOT NULL,
  `username` varchar(250) NOT NULL,
  `id_post` int(10) NOT NULL,
  `comment` varchar(2500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `id_folls` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `follow_to` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id_post` int(10) NOT NULL,
  `caption` varchar(2500) NOT NULL,
  `photo` varchar(250) NOT NULL,
  `likes` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `email` varchar(250) NOT NULL,
  `bio` varchar(250) NOT NULL,
  `gender` varchar(250) NOT NULL,
  `id` int(10) NOT NULL,
  `fullname` varchar(250) NOT NULL,
  `phone_number` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `website` varchar(250) NOT NULL,
  `photo` varchar(250) NOT NULL,
  `verified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`email`, `bio`, `gender`, `id`, `fullname`, `phone_number`, `username`, `website`, `photo`, `verified`) VALUES
('arielmermaid@gmail.com', 'little mermaid', 'female', 1, 'Ariel', '123456789', 'arielmermaid', '', 'https://i0.wp.com/www.metimeart.com/wp-content/uploads/2019/12/Ariel-The-little-mermaid-2.jpg?fit=794%2C635&ssl=1', 0),
('buzzlightyear@gmail.com', 'to infinity and beyond', 'Male', 2, 'buzz', '11111111', 'buzzlightyear', '', 'https://images-na.ssl-images-amazon.com/images/I/712fjR1Dm3L._AC_SY606_.jpg', 1),
('elsaaaa@gmail.com', 'FROZEN 2 !1!1!1', 'Female', 3, 'Elsa', '45462892746', 'elsafrozen', '', 'https://upload.wikimedia.org/wikipedia/en/thumb/5/5e/Elsa_from_Disney%27s_Frozen.png/220px-Elsa_from_Disney%27s_Frozen.png', 1),
('oohfik@gmail.com', 'fikaaaa cantik:)', 'Female', 4, 'Fika A', '926352637', 'oohfik', '', 'https://vignette.wikia.nocookie.net/disney/images/2/22/Profile_-_Woody.jpeg/revision/latest?cb=20190623015937', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`) VALUES
('arielmermaid', 'ariel123'),
('buzzlightyear', 'buzz'),
('elsafrozen', 'elsacantik'),
('oohfik', 'fika12345');

-- --------------------------------------------------------

--
-- Table structure for table `user_post`
--

CREATE TABLE `user_post` (
  `id` int(10) NOT NULL,
  `username` varchar(250) NOT NULL,
  `id_post` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id_comments`),
  ADD KEY `user_comment_fk` (`username`),
  ADD KEY `post_comment_fk` (`id_post`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id_folls`),
  ADD KEY `user_follow_fk` (`username`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id_post`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_fk` (`username`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `user_post`
--
ALTER TABLE `user_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_fk` (`id_post`),
  ADD KEY `user_post_fk` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id_comments` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `id_folls` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id_post` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_post`
--
ALTER TABLE `user_post`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `post_comment_fk` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`),
  ADD CONSTRAINT `user_comment_fk` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `user_follow_fk` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `user_fk` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `user_post`
--
ALTER TABLE `user_post`
  ADD CONSTRAINT `post_fk` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`),
  ADD CONSTRAINT `user_post_fk` FOREIGN KEY (`username`) REFERENCES `user` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
