-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2019 at 05:40 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `transfer_funds` (IN `senders_acc_no` VARCHAR(11), IN `receivers_acc_no` VARCHAR(11), IN `amount` INT, IN `uniq_id` VARCHAR(30))  BEGIN
       START TRANSACTION;

      UPDATE account
      SET acc_balance = acc_balance - amount
      WHERE acc_no = senders_acc_no;

      UPDATE account
      SET acc_balance = acc_balance + amount
      WHERE acc_no = receivers_acc_no ;
      
      insert into transaction
      values(uniq_id,NOW(),senders_acc_no,receivers_acc_no,amount);
      
     

    COMMIT;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `acc_no` varchar(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `acc_opendate` datetime NOT NULL,
  `acc_balance` int(11) NOT NULL DEFAULT '1000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`acc_no`, `cust_id`, `acc_opendate`, `acc_balance`) VALUES
('456', 1051, '2019-10-24 21:53:55', 1000),
('56', 1045, '2019-10-24 04:15:19', 1000),
('761273', 1043, '2018-11-22 14:48:23', 900),
('789', 1053, '2019-11-14 21:52:38', 1000),
('8564', 1050, '2019-10-24 21:53:15', 1000),
('894', 45, '0000-00-00 00:00:00', 1000),
('8980', 1041, '2018-11-05 23:26:58', 300),
('9934', 1040, '2018-11-05 20:50:26', 1600),
('9935436', 1029, '2018-11-04 22:58:03', 1100),
('9956', 1042, '2018-11-22 14:38:35', 1100),
('new.ph_No', 1039, '2018-11-04 23:14:16', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `ifsc_code` varchar(10) NOT NULL,
  `branch_name` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`ifsc_code`, `branch_name`, `city`, `address`) VALUES
('UBIN0001', 'MAJESTIC', 'BANGALORE', 'MAJESTIC,MARKET'),
('UBIN0002', 'ELECTRONIC CITY', 'BANGALORE', 'KONAPPANA AGRAHARA,BANGALORE,KARNATAKA');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL,
  `cust_Name` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `ph_No` varchar(11) NOT NULL,
  `ifsc_Code` varchar(255) NOT NULL,
  `login_id` varchar(20) NOT NULL,
  `acc_pwd` varchar(250) NOT NULL,
  `last_Login` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_id`, `cust_Name`, `address`, `ph_No`, `ifsc_Code`, `login_id`, `acc_pwd`, `last_Login`) VALUES
(45, 'anand', 'lv-08,lakshmi', '894', 'UBIN0001', 'asd', 'asd', '0000-00-00 00:00:00'),
(1029, 'asdwqe', 'sdwer', '9956436701', 'ubin0001', 'difjiwjfei', '$2y$10$cXuRYOvJ.I9aH0KpcqMdaOAvL3lJ3IYMcFHuqwdlcJIboOdgx9Fra', '2018-11-01 18:36:01'),
(1037, 'new', 'new', '9946523746', 'ubin0001', 'abhishek', 'astr', '2018-11-04 21:07:53'),
(1038, 'trigger', 'some random', '9935436991', 'ubin0001', 'trig', '$2y$10$3WrHwv3PPbc4OHAk2wksi.tFrKt7oyi8BJK/lS9fgnMkPYVAeQ7ym', '2018-11-04 22:16:17'),
(1039, 'new ', 'trigger', '9935436', 'ubin0001', 'wasdf', '$2y$10$U76ZwU5vKnT6OAO29AQbMeEjT6rPk.083txyMmywGtF6XfTj/M5f6', '2018-11-04 23:14:16'),
(1040, 'last', 'signup', '9934', 'ubin0001', 'last', '$2y$10$7lrM03XEteeTTD0cxNzyAukvc1spx1TlaXpV9jSWD0nF1v2a9FqE6', '2018-11-05 20:50:26'),
(1041, 'abhishek', 'lv-08,lakshmi nilaya', '8980', 'UBIN0001', 'astr', 'astr', '2018-11-05 23:26:58'),
(1042, 'abhi', 'lv', '9956', 'ubin0001', 'abhi', '$2y$10$iJKkN.ZRXzTa04PdySgyle.ySt93RJWCAl.780cAzb8ypq7DTEFYO', '2018-11-22 14:38:35'),
(1043, 'Anirudh', 'ajudh', '761273', 'UBIN0001', 'mnb', '$2y$10$LGsMOJ1OMIz9i7V2TAUKv.YyVZshRQCalnXvAmsfGcGdTtoD2wA22', '2018-11-22 14:48:23'),
(1045, 'op', 'op', '56', 'UBIN0001', 'op', 'op', '2019-10-24 04:15:19'),
(1050, '$name', '$address', '8564', 'UBIN0001', '$login_id', '$hashedPwd', '2019-10-24 21:53:15'),
(1051, 'we', 'we', '456', 'UBIN0001', 'we', '$2y$10$bL8u3eVTrjIBL0DDsQ63POvrt0RndK3EDhMpVPsSMftti2lTLTCYi', '2019-10-24 21:53:55'),
(1053, 'delhi', 'delho', '789', 'UBIN0001', 'delhi', '$2y$10$WK1aXB./EJ6RxmiYIs7xhu4u7vA/roL6Qqz7Y7DLR75yB7NW41Ex.', '2019-11-14 21:52:38');

--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `customer_update` AFTER INSERT ON `customer` FOR EACH ROW INSERT into account(acc_no,cust_id,acc_opendate)
VALUES(new.ph_No,new.cust_id,new.last_Login)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `mgr_id` varchar(10) NOT NULL,
  `mgr_name` varchar(30) DEFAULT NULL,
  `interest_rate` int(11) DEFAULT NULL,
  `ifsc_code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`mgr_id`, `mgr_name`, `interest_rate`, `ifsc_code`) VALUES
('12', 'abhi', 5, 'UBIN0001');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transac_id` varchar(30) NOT NULL,
  `transac_Date` datetime NOT NULL,
  `senders_acc_no` varchar(255) NOT NULL,
  `receivers_acc_no` varchar(255) NOT NULL,
  `Amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transac_id`, `transac_Date`, `senders_acc_no`, `receivers_acc_no`, `Amount`) VALUES
('123', '2018-11-05 22:44:46', '9934', '9935436', 100),
('5be08dd17cd49', '2018-11-06 00:07:05', '8980', '8980', 100),
('5be09348d9417', '2018-11-06 00:30:24', '8980', '9934', 100),
('5be09399b91e4', '2018-11-06 00:31:45', '8980', '9934', 100),
('5be093c47760d', '2018-11-06 00:32:28', '8980', '9934', 100),
('5be14cd25b60c', '2018-11-06 13:42:02', '8980', '9934', 100),
('5be18dfc292ca', '2018-11-06 18:20:04', '8980', '9935436', 100),
('5bfe2998899ec', '2018-11-28 11:07:29', '761273', '9956', 100),
('asdfg', '2018-11-06 00:01:10', '8980', '9934', 100),
('atsdrtayd', '2018-11-06 00:16:20', '8980', '9934', 100);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`acc_no`),
  ADD KEY `cust_id` (`cust_id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`ifsc_code`),
  ADD UNIQUE KEY `branch_name` (`branch_name`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_id`),
  ADD UNIQUE KEY `ph_No` (`ph_No`),
  ADD KEY `ifsc_Code` (`ifsc_Code`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`mgr_id`),
  ADD KEY `ifsc_code` (`ifsc_code`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transac_id`),
  ADD KEY `senders_acc_no` (`senders_acc_no`),
  ADD KEY `receivers_acc_no` (`receivers_acc_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1054;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`ifsc_Code`) REFERENCES `branch` (`ifsc_code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`ifsc_code`) REFERENCES `branch` (`ifsc_code`) ON DELETE CASCADE;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`senders_acc_no`) REFERENCES `account` (`acc_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`receivers_acc_no`) REFERENCES `account` (`acc_no`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
