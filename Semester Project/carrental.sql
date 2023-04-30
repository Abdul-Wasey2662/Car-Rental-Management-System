-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2022 at 06:22 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `vehicle_id` int(20) NOT NULL,
  `car_name` varchar(50) NOT NULL,
  `car_nameplate` varchar(50) NOT NULL,
  `car_img` varchar(50) DEFAULT 'NA',
  `daily_rent` int(11) NOT NULL,
  `car_availability` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`vehicle_id`, `car_name`, `car_nameplate`, `car_img`, `daily_rent`, `car_availability`) VALUES
(1, 'Altis', 'BZ 199', 'assets/img/cars/altis.png', 2000, 'yes'),
(2, 'Alto ', 'MHZ 209', 'assets/img/cars/alto-800.png', 1800, 'yes'),
(3, 'Yaris', 'GA 168', 'assets/img/cars/yaris.png', 2600, 'yes'),
(4, 'Mehran', 'GJ 174', 'assets/img/cars/mehran.png', 2200, 'yes'),
(5, 'Civic', 'ABZ 123', 'assets\\img\\cars\\civic.PNG', 2000, 'yes'),
(6, 'Wagon R', 'KL 188', 'assets/img/cars/wagon-r.png', 3000, 'yes'),
(7, 'Prius', 'YX 882', 'assets/img/cars/prius.png', 2800, 'yes'),
(8, 'Swift ', 'BR 018', 'assets/img/cars/swift.png', 2000, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `clientcars`
--

CREATE TABLE `clientcars` (
  `vehicle_id` int(20) NOT NULL,
  `client_username` varchar(50) NOT NULL,
  `index` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clientcars`
--

INSERT INTO `clientcars` (`vehicle_id`, `client_username`, `index`) VALUES
(1, 'Wasey', 1),
(2, 'Wasey', 2),
(3, 'Wasey', 3),
(3, 'Wasey', 4),
(6, 'Wasey', 5),
(7, 'Wasey', 6),
(8, 'Wasey', 8);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `client_username` varchar(50) NOT NULL,
  `client_name` varchar(50) NOT NULL,
  `client_phone` varchar(15) NOT NULL,
  `client_email` varchar(25) NOT NULL,
  `client_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL,
  `client_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`client_username`, `client_name`, `client_phone`, `client_email`, `client_address`, `client_password`) VALUES
('junaid', 'Muhammad Junaid', '335262727', 'junaid@gmail.com', 'rawalpindi', 'admin'),
('Wasey', 'Abdul wasey', '334526271', 'wasey@yahoo.com', 'Islamabad', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_username` varchar(50) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_phone` varchar(15) NOT NULL,
  `customer_email` varchar(25) NOT NULL,
  `customer_address` varchar(50) NOT NULL,
  `customer_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_username`, `customer_name`, `customer_phone`, `customer_email`, `customer_address`, `customer_password`) VALUES
('hamza', 'Hamza Ali', '3365166697', 'hamza@gmail.com', 'gujranwala', 'admin'),
('Hassan', 'Hassan ali', '334526271', 'hassan@gmail.com', 'Islamabad', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(20) NOT NULL,
  `driver_name` varchar(50) NOT NULL,
  `dl_number` varchar(50) NOT NULL,
  `driver_phone` varchar(15) NOT NULL,
  `driver_address` varchar(50) NOT NULL,
  `driver_gender` varchar(10) NOT NULL,
  `client_username` varchar(50) NOT NULL,
  `driver_availability` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`driver_id`, `driver_name`, `dl_number`, `driver_phone`, `driver_address`, `driver_gender`, `client_username`, `driver_availability`) VALUES
(1, 'Junaid', 'DL5974', '9547863157', 'Gujranwala', 'Male', 'Wasey', 'yes'),
(2, 'Najam', 'DL7584', '9147523684', 'Peshawar', 'Male', 'Wasey', 'yes'),
(3, 'Adil', 'DL8451', '9147523682', 'Karachi', 'Male', 'Wasey', 'yes'),
(4, 'Sara', 'DL8415', '9187563240', 'Mandra', 'Female', 'Wasey', 'yes'),
(5, 'Hamza', 'DL9452', '7584960123', 'Lahore', 'Male', 'Wasey', 'yes'),
(9, 'blah', 'DL123', '636636362', 'patna', 'male', 'Wasey', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `rentedcars`
--

CREATE TABLE `rentedcars` (
  `id` int(100) NOT NULL,
  `customer_username` varchar(50) NOT NULL,
  `vehicle_id` int(20) NOT NULL,
  `driver_id` int(20) NOT NULL,
  `booking_date` date NOT NULL,
  `rent_start_date` date NOT NULL,
  `rent_end_date` date NOT NULL,
  `car_return_date` date DEFAULT NULL,
  `no_of_days` int(50) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `return_status` varchar(10) NOT NULL,
  `fare` int(11) NOT NULL,
  `charge_type` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `distance` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rentedcars`
--

INSERT INTO `rentedcars` (`id`, `customer_username`, `vehicle_id`, `driver_id`, `booking_date`, `rent_start_date`, `rent_end_date`, `car_return_date`, `no_of_days`, `total_amount`, `return_status`, `fare`, `charge_type`, `distance`) VALUES
(574681245, 'Hassan', 4, 2, '2022-07-18', '2022-07-01', '2022-07-02', '2022-07-18', 1, 5884, 'R', 10, 'km', 234),
(574681247, 'Hassan', 3, 1, '2022-07-18', '2022-07-19', '2022-07-22', '2022-07-20', 3, 5473, 'R', 20, 'km', 212),
(574681248, 'Hassan', 1, 2, '2022-07-20', '2022-07-28', '2022-07-29', '2022-07-20', 1, 690, 'R', 10, 'km', 222),
(574681249, 'Hassan', 1, 2, '2022-07-23', '2022-07-24', '2022-07-25', '2022-07-23', 1, 5000, 'R', 20, 'km', 787),
(574681258, 'Hassan', 2, 1, '2022-01-02', '2022-01-05', '2022-01-06', '2022-01-02', 1, 0, 'R', 10, 'km', 322),
(574681261, 'Hassan', 2, 2, '2022-01-02', '2022-01-04', '2022-01-05', '2022-01-02', 1, 0, 'R', 20, 'km', 231),
(574681262, 'Hassan', 2, 1, '2022-01-02', '2022-01-03', '2022-01-05', '2022-01-03', 2, 0, 'R', 20, 'km', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`vehicle_id`),
  ADD UNIQUE KEY `car_nameplate` (`car_nameplate`);

--
-- Indexes for table `clientcars`
--
ALTER TABLE `clientcars`
  ADD PRIMARY KEY (`index`),
  ADD KEY `client_username` (`client_username`),
  ADD KEY `car_id` (`vehicle_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_username`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_username`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`),
  ADD UNIQUE KEY `dl_number` (`dl_number`),
  ADD KEY `client_username` (`client_username`);

--
-- Indexes for table `rentedcars`
--
ALTER TABLE `rentedcars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_username` (`customer_username`),
  ADD KEY `car_id` (`vehicle_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `vehicle_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `driver_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rentedcars`
--
ALTER TABLE `rentedcars`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=574681263;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clientcars`
--
ALTER TABLE `clientcars`
  ADD CONSTRAINT `clientcars_ibfk_1` FOREIGN KEY (`client_username`) REFERENCES `clients` (`client_username`),
  ADD CONSTRAINT `clientcars_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `cars` (`vehicle_id`);

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`client_username`) REFERENCES `clients` (`client_username`);

--
-- Constraints for table `rentedcars`
--
ALTER TABLE `rentedcars`
  ADD CONSTRAINT `rentedcars_ibfk_1` FOREIGN KEY (`customer_username`) REFERENCES `customers` (`customer_username`),
  ADD CONSTRAINT `rentedcars_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `cars` (`vehicle_id`),
  ADD CONSTRAINT `rentedcars_ibfk_3` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
