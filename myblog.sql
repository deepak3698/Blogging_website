-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2019 at 08:54 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `phone_num`, `msg`, `date`, `email`) VALUES
(1, 'first post', '123456789', 'first post', '2018-07-29 11:36:23', 'firstpost@gmail.com'),
(2, 'mera naam', '4434343434', 'Bhai please send ho jaa database mei', NULL, 'meraemail@gmail.com'),
(3, 'mera naam', '4434343434', 'Bhai please send ho jaa database mei', '2018-07-29 11:44:51', 'meraemail@gmail.com'),
(4, 'Bithika Pal', 'dfdf', 'posting now', '2018-07-29 15:46:28', 'bithikapddal@iitkgp.ac.in'),
(5, 'dfdf', 'dsffdfs', 'sd mail send please', '2018-07-29 17:19:41', 'dfdf@df.dfd'),
(6, 'dfdf', 'dsffdfs', 'sd mail send please', '2018-07-29 17:21:58', 'dfdf@df.dfd'),
(7, 'dfdf', 'dsffdfs', 'sd mail send please', '2018-07-29 17:22:33', 'dfdf@df.dfd'),
(8, 'adsfdf', '1234567899', 'ho gaela', '2018-08-14 21:00:55', 'deepakstiwari22@gmail.com'),
(9, 'deeppak tiwari', '1234567899', 'fesfrref', '2018-09-23 21:35:00', 'fdf@gmail.com'),
(10, 'deeppak tiwari', '1234567899', 'wfsf', '2018-09-23 21:38:40', 'deepakstiwari22@gmail.com'),
(11, 'deeppak tiwari', '7663563556', 'lecture hua', '2018-09-24 19:48:54', 'chandrakanttiwari31@gmail.com'),
(12, 'deeppak tiwari', '7663563556', 'lecture hua', '2018-09-24 19:49:34', 'chandrakanttiwari31@gmail.com'),
(13, 'deeppak tiwari', '1234567899', 'mn,nmn', '2018-09-24 19:51:19', 'chandrakanttiwari31@gmail.com'),
(14, 'deeppak tiwari', '1234567899', 'mn,nmn', '2018-09-24 19:52:47', 'chandrakanttiwari31@gmail.com'),
(15, 'guru', '1234567899', 'kkkkkkkk', '2018-09-25 04:34:33', 'chandrakanttiwari31@gmail.com'),
(16, 'deeppak tiwari', '7663563556', 'ab to ho ja', '2018-09-25 04:41:45', 'chandrakanttiwari31@gmail.com'),
(17, 'deeppak tiwari', '1234567899', 'jhghfhg', '2018-09-25 04:43:17', 'deepakstiwari22@gmail.com'),
(18, 'deeppak tiwari', '1111111', 'llllll', '2018-09-25 04:46:43', 'deepakstiwari22@gmail.com'),
(19, 'deeppak tiwari', '1111111', 'llllll', '2018-09-25 04:46:43', 'deepakstiwari22@gmail.com'),
(20, 'deeppak tiwari', '1234567899', 'sdf', '2018-10-29 18:32:22', 'deepakstiwari22@gmail.com'),
(21, 'deeppak tiwari', '7663563556', 'deepak tiwari is a great.......', '2018-10-29 19:03:24', 'deepakstiwari22@gmail.com'),
(22, '', '', '', '2018-12-07 14:10:48', ''),
(23, '', '', '', '2019-01-26 22:55:49', ''),
(24, 'deeppak tiwari', '7663563556', 'hello deepak i am creating a simple librrry', '2019-01-27 17:41:43', 'deepakstiwari22@gmail.com'),
(25, '', '', '', '2019-01-27 17:42:18', ''),
(26, '', '', '', '2019-01-27 17:43:48', ''),
(27, '', '', '', '2019-01-27 17:44:36', ''),
(28, '', '', '', '2019-01-27 17:47:07', ''),
(29, '', '', '', '2019-01-27 17:50:36', ''),
(30, '', '', '', '2019-01-27 17:51:31', ''),
(31, '', '', '', '2019-01-27 17:52:20', ''),
(32, '', '', '', '2019-01-27 17:54:42', ''),
(33, '', '', '', '2019-01-27 17:55:45', ''),
(34, '', '', '', '2019-01-27 17:56:24', ''),
(35, 'deeppak tiwari', '1111111', 'this is used for checking the functionality of the button', '2019-01-27 17:56:59', 'fdf@gmail.com'),
(36, 'deeppak tiwari', '1111111', 'this is used for checking the functionality of the button', '2019-01-27 18:01:55', 'fdf@gmail.com'),
(37, 'deeppak tiwari', '1111111', 'this is used for checking the functionality of the button', '2019-01-27 18:08:42', 'fdf@gmail.com'),
(38, 'deeppak tiwari', '1111111', 'this is used for checking the functionality of the button', '2019-01-27 18:08:46', 'fdf@gmail.com'),
(39, 'deeppak tiwari', '1111111', 'this is used for checking the functionality of the button', '2019-01-27 18:31:44', 'fdf@gmail.com'),
(40, 'deeppak tiwari', '1111111', 'this is used for checking the functionality of the button', '2019-01-27 18:34:00', 'fdf@gmail.com'),
(41, 'deepakt', '1234567899', 'kaho guru', '2019-01-30 20:22:24', 'deepakstiwari22@gmail.com'),
(42, 'deepakt', '1234567899', 'kaho guru', '2019-01-30 20:23:40', 'deepakstiwari22@gmail.com'),
(43, 'deepak', '1234567899', 'vfdbcgb', '2019-01-30 20:24:01', 'deepakstiwari22@gmail.com'),
(44, 'deepak', '1234567899', 'vfdbcgb', '2019-01-30 20:25:46', 'deepakstiwari22@gmail.com'),
(45, 'deepakk', '7663563556', 'fbhgfb', '2019-01-30 20:25:59', 'deepakstiwari22@gmail.com'),
(46, 'deepak', '', 'paass ho ja bhai', '2019-01-30 20:46:54', ''),
(47, '', '', 'zsvb\r\nxbfc\r\nvxbcv\r\nxvcvvb\r\ncxbvv\r\ncvxbv\r\n', '2019-03-19 16:06:03', ''),
(48, '', '', 'zsvb\r\nxbfc\r\nvxbcv\r\nxvcvvb\r\ncxbvv\r\ncvxbv\r\n', '2019-03-19 16:07:33', ''),
(49, '', '', '', '2019-03-19 16:07:36', ''),
(50, '', '', '', '2019-03-19 16:07:40', ''),
(51, '', '', '', '2019-03-19 16:08:01', ''),
(52, '', '', '', '2019-03-19 16:08:03', ''),
(53, '', '33', '', '2019-04-19 23:21:37', ''),
(54, '', '33', '', '2019-04-19 23:22:32', ''),
(55, '', '', '', '2019-04-19 23:22:34', ''),
(56, '', '', '', '2019-04-19 23:23:21', ''),
(57, '', '', '', '2019-04-19 23:23:33', ''),
(58, 'deepak tiwari', '', '', '2019-04-19 23:23:43', 'deepaktiwari221299gmail.com'),
(59, 'deepak tiwari', '', '', '2019-04-19 23:24:56', 'deepaktiwari221299gmail.com'),
(60, 'deepak', '8874500459', 'deepak is a programmer', '2019-04-19 23:25:46', 'df@dxc.ff');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(12) NOT NULL,
  `mname` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `content`, `img_file`, `mname`, `date`) VALUES
(14, 'dt', 'hello everybody as you can see me I am doing great job...', 'tag1', 'let\'s take some enjoyment', 'about-bg.jpg', 'admin', '2019-03-19 16:02:37'),
(15, 'python', 'it;s worth now hahahhaha', 'tag4', 'python is a very effective programming language', 'about-bg.jpg', 'admin', '2019-03-19 16:21:32'),
(16, 'java', 'bhai post dekh lo achha hai mja bhi aayege aapko', 'tag3', 'ab ja bhi', 'about1-bg.jp', 'admin', '2019-03-19 16:03:46'),
(17, 'dt', 'tag1', 'python is a very effectiv', 'sssssssssssaaaaaaaaaaaakkkkk', 'fnmbnb.jj', 'admin', '2019-04-14 16:34:07'),
(18, 'pahila user', 'pahila tag', 'pahila slug', 'pahila data', 'fnmbnb.jj', 'deepak tiwari', '2019-04-14 16:46:28'),
(19, 'dtsg', 'gfgfghc', 'hchgc', 'hchcgh', 'hchghc', 'deepak tiwari', '2019-04-14 16:53:53'),
(20, 'pahila user deepak', 'tag3', 'hchgc', 'rtyrygj', 'fnmbnb.jj', 'deepakk', '2019-04-14 17:03:50');

-- --------------------------------------------------------

--
-- Table structure for table `user_reg`
--

CREATE TABLE `user_reg` (
  `sno` int(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_reg`
--

INSERT INTO `user_reg` (`sno`, `name`, `email`, `password`) VALUES
(1, 'deepak tiwari', 'deepaktiwari221299@gmail.com', '12345678'),
(2, 'deepak tiwari', 'deepaktiwari221299@gmail.com', '12345678'),
(3, 'deepakk', 'df@dxc.ff', '87654321'),
(4, '', '', ''),
(5, '', '', ''),
(6, 'dt', 'dt@pt.com', 'Deepak@123'),
(7, 'dtt', 'dt@pt.commm', 'Deepak@1234'),
(8, 'dtt', 'dt@pt.commm', 'Deepak@1234'),
(9, 'dtt', 'dt@pt.commm', 'Deepak@1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `user_reg`
--
ALTER TABLE `user_reg`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user_reg`
--
ALTER TABLE `user_reg`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
