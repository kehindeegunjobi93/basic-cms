-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2018 at 05:35 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
`id` int(10) unsigned NOT NULL,
  `creatorId` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `dateUpdated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateAdded` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `creatorId`, `title`, `content`, `dateUpdated`, `dateAdded`) VALUES
(1, 2, 'This is a post', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec facilisis eget risus non tempus. Sed lacinia sapien non felis consectetur egestas. Mauris fringilla nunc purus, at finibus justo blandit nec. Aenean pretium consectetur dolor eu sagittis. Quisque ac ligula scelerisque, varius lacus vel, semper leo. Vivamus sit amet massa sed quam facilisis tempus non non quam. Aliquam erat volutpat. Integer rhoncus ex non libero luctus accumsan at vitae diam. Aenean fermentum pulvinar dolor. Morbi venenatis venenatis dignissim. Suspendisse tincidunt nisl lobortis, commodo dolor vel, egestas elit. Aenean euismod accumsan sapien at efficitur. Aliquam accumsan tortor neque, vel dictum lectus dapibus viverra.</p><p>Nulla quis luctus dui. Nunc id vestibulum sapien. Donec porta ante sit amet eros lacinia, eu eleifend tortor hendrerit. Donec in dignissim leo. Nullam a dolor finibus, egestas nisi non, euismod elit. Donec aliquam aliquet placerat. Aenean molestie nunc quis ullamcorper efficitur. Praesent erat felis, efficitur vel sapien vitae, hendrerit facilisis massa. Aliquam consequat vulputate sapien, vel placerat lacus accumsan eu. Fusce tempus neque vitae turpis feugiat, id imperdiet erat ornare. Sed quis congue nulla, sit amet commodo enim. Morbi nunc nunc, mattis vel tortor nec, scelerisque rhoncus sapien. </p>', '2018-06-04 12:51:55', '2018-06-03 17:55:46'),
(2, 3, 'This is another post', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec facilisis eget risus non tempus. Sed lacinia sapien non felis consectetur egestas. Mauris fringilla nunc purus, at finibus justo blandit nec. Aenean pretium consectetur dolor eu sagittis. Quisque ac ligula scelerisque, varius lacus vel, semper leo. Vivamus sit amet massa sed quam facilisis tempus non non quam. Aliquam erat volutpat. Integer rhoncus ex non libero luctus accumsan at vitae diam. Aenean fermentum pulvinar dolor. Morbi venenatis venenatis dignissim. Suspendisse tincidunt nisl lobortis, commodo dolor vel, egestas elit. Aenean euismod accumsan sapien at efficitur. Aliquam accumsan tortor neque, vel dictum lectus dapibus viverra.</p><p>Nulla quis luctus dui. Nunc id vestibulum sapien. Donec porta ante sit amet eros lacinia, eu eleifend tortor hendrerit. Donec in dignissim leo. Nullam a dolor finibus, egestas nisi non, euismod elit. Donec aliquam aliquet placerat. Aenean molestie nunc quis ullamcorper efficitur. Praesent erat felis, efficitur vel sapien vitae, hendrerit facilisis massa. Aliquam consequat vulputate sapien, vel placerat lacus accumsan eu. Fusce tempus neque vitae turpis feugiat, id imperdiet erat ornare. Sed quis congue nulla, sit amet commodo enim. Morbi nunc nunc, mattis vel tortor nec, scelerisque rhoncus sapien. </p>', '2018-06-04 12:52:15', '2018-06-03 17:56:33'),
(3, 4, 'This the The Third Post', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec facilisis eget risus non tempus. Sed lacinia sapien non felis consectetur egestas. Mauris fringilla nunc purus, at finibus justo blandit nec. Aenean pretium consectetur dolor eu sagittis. Quisque ac ligula scelerisque, varius lacus vel, semper leo. Vivamus sit amet massa sed quam facilisis tempus non non quam. Aliquam erat volutpat. Integer rhoncus ex non libero luctus accumsan at vitae diam. Aenean fermentum pulvinar dolor. Morbi venenatis venenatis dignissim. Suspendisse tincidunt nisl lobortis, commodo dolor vel, egestas elit. Aenean euismod accumsan sapien at efficitur. Aliquam accumsan tortor neque, vel dictum lectus dapibus viverra.</p>\r\n<p>\r\nNulla quis luctus dui. Nunc id vestibulum sapien. Donec porta ante sit amet eros lacinia, eu eleifend tortor hendrerit. Donec in dignissim leo. Nullam a dolor finibus, egestas nisi non, euismod elit. Donec aliquam aliquet placerat. Aenean molestie nunc quis ullamcorper efficitur. Praesent erat felis, efficitur vel sapien vitae, hendrerit facilisis massa. Aliquam consequat vulputate sapien, vel placerat lacus accumsan eu. Fusce tempus neque vitae turpis feugiat, id imperdiet erat ornare. Sed quis congue nulla, sit amet commodo enim. Morbi nunc nunc, mattis vel tortor nec, scelerisque rhoncus sapien. </p>', '2018-06-04 13:02:17', '2018-06-04 00:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(10) unsigned NOT NULL,
  `userType` enum('public','author','admin') DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `pass` char(40) NOT NULL,
  `dateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userType`, `username`, `email`, `pass`, `dateAdded`) VALUES
(1, 'public', 'publicUser', 'public@example.com', '390d938f809f8ce397f29c28b1c2365ba79779b0', '2018-06-03 17:53:32'),
(2, 'author', 'authorUser', 'author@example.com', '0a7febe6dd39def478cbd8da188ba4005cdc25ec', '2018-06-03 17:53:32'),
(3, 'admin', 'adminUser', 'admin@example.com', '0f4afdf3a12e95916d9750debbcff3999a502aa9', '2018-06-03 17:53:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
 ADD PRIMARY KEY (`id`), ADD KEY `creatorId` (`creatorId`), ADD KEY `dateUpdated` (`dateUpdated`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`), ADD UNIQUE KEY `email` (`email`), ADD KEY `login` (`email`,`pass`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
