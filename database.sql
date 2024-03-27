-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2024 at 01:44 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `4402151_alert`
--

-- --------------------------------------------------------

--
-- Table structure for table `alert`
--

CREATE TABLE `alert` (
  `alert_id` int(11) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `alert_time` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `barangay_code` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alert`
--

INSERT INTO `alert` (`alert_id`, `latitude`, `longitude`, `label`, `alert_time`, `barangay_code`) VALUES
(61, '6.12437155', '125.19642775282315', 'NDDU-IBED', '2024-03-14 07:31:02.000000', 16),
(62, '6.1169509', '125.17154325059084', 'MSU HIGHSCHOOL', '2024-03-04 07:31:09.000000', 10),
(63, '6.116097', '125.181139', 'SM GENSAN', '2024-03-26 07:31:21.000000', 9);

-- --------------------------------------------------------

--
-- Table structure for table `barangay`
--

CREATE TABLE `barangay` (
  `barangay_code` int(255) NOT NULL,
  `barangay_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangay`
--

INSERT INTO `barangay` (`barangay_code`, `barangay_name`) VALUES
(1, 'Apopong'),
(2, 'Baluan'),
(3, 'Batomelong'),
(4, 'Buayan'),
(5, 'Bula'),
(6, 'Calumpang'),
(7, 'City Heights'),
(8, 'Conel'),
(9, 'Dadiangas East'),
(10, 'Dadiangas North'),
(11, 'Dadiangas South'),
(12, 'Dadiangas West'),
(13, 'Fatima'),
(14, 'Katangawan'),
(15, 'Labangal'),
(16, 'Lagao'),
(17, 'Ligaya'),
(18, 'Mabuhay'),
(19, 'Olympog'),
(20, 'San Isidro'),
(21, 'San Jose'),
(22, 'Siguel'),
(23, 'Sinawal'),
(24, 'Tambler'),
(25, 'Tinagacan'),
(26, 'Upper Labay');

-- --------------------------------------------------------

--
-- Table structure for table `incident_data`
--

CREATE TABLE `incident_data` (
  `incident_id` int(11) NOT NULL,
  `barangay_code` int(255) DEFAULT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `cause` varchar(50) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `time_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `incident_data`
--

INSERT INTO `incident_data` (`incident_id`, `barangay_code`, `latitude`, `longitude`, `cause`, `time`, `time_added`) VALUES
(24, 2, '6.0695177', '125.1262773', 'Arson', '2024-06-06 16:05:23', '2024-03-14 18:47:29'),
(25, 3, '-78.76056789305115', '-154.61819236596878', 'Arson', '2024-09-19 09:54:18', '2024-03-15 14:50:04'),
(26, 4, '-82.65780887814034', '-9.579068449865161', 'Natural Causes', '2024-10-27 04:25:36', '2024-03-15 14:50:04'),
(27, 5, '88.55671271547368', '-136.89159869858213', 'Arson', '2024-10-13 01:01:56', '2024-03-15 14:50:04'),
(28, 6, '-42.99437732714635', '32.61917283071128', 'Arson', '2024-07-26 00:29:22', '2024-03-15 14:50:04'),
(29, 7, '-65.98093743993057', '-162.04797102329132', 'Human Error', '2024-05-14 17:31:24', '2024-03-15 14:50:04'),
(30, 8, '-24.242223439963738', '-167.2026372954274', 'Arson', '2024-07-06 07:06:33', '2024-03-15 14:50:04'),
(31, 9, '-13.90496608233542', '-66.21943217350116', 'Human Error', '2024-06-11 13:30:48', '2024-03-15 14:50:04'),
(32, 10, '51.04213442750475', '16.592026796743284', 'Arson', '2024-07-01 02:59:39', '2024-03-15 14:50:04'),
(33, 11, '-83.93815146194599', '64.57516327926436', 'Electrical Issue', '2024-04-28 15:15:19', '2024-03-15 14:50:04'),
(34, 12, '-42.00526229292644', '-43.48305477153795', 'Natural Causes', '2024-11-06 07:55:43', '2024-03-15 14:50:04'),
(35, 13, '-70.78426685257281', '-89.25684495759833', 'Arson', '2024-11-15 04:18:58', '2024-03-15 14:50:04'),
(36, 14, '30.491939597289942', '52.549616948281994', 'Human Error', '2024-12-22 22:46:04', '2024-03-15 14:50:04'),
(37, 15, '-13.805438861069675', '20.1119433344453', 'Natural Causes', '2024-01-01 19:02:46', '2024-03-15 14:50:04'),
(38, 16, '37.44316774182316', '155.57311979641497', 'Arson', '2024-10-12 13:28:39', '2024-03-15 14:50:04'),
(39, 17, '-6.599127609840707', '123.16308936398764', 'Electrical Issue', '2024-11-05 07:54:41', '2024-03-15 14:50:04'),
(40, 18, '-22.39617581702413', '41.30232127504641', 'Electrical Issue', '2024-09-17 11:20:11', '2024-03-15 14:50:04'),
(41, 19, '-20.764510958236187', '-147.6932148334507', 'Electrical Issue', '2024-12-13 04:05:51', '2024-03-15 14:50:04'),
(42, 20, '-75.3761299004556', '176.05767074605234', 'Human Error', '2024-01-04 11:26:42', '2024-03-15 14:50:04'),
(43, 21, '-24.008630359553393', '-165.4708251221765', 'Arson', '2024-03-17 22:02:24', '2024-03-15 14:50:04'),
(44, 22, '-86.32340456948002', '-111.4674265789496', 'Natural Causes', '2024-12-03 09:12:50', '2024-03-15 14:50:04'),
(45, 23, '-82.9177526504898', '174.96992066034107', 'Electrical Issue', '2024-08-10 12:42:00', '2024-03-15 14:50:04'),
(46, 24, '-77.09103912775501', '-132.7687473900325', 'Natural Causes', '2024-11-22 11:40:58', '2024-03-15 14:50:04'),
(47, 25, '-50.26200940856897', '148.4204991612774', 'Natural Causes', '2024-11-14 10:28:07', '2024-03-15 14:50:04'),
(48, 26, '-53.33455963370815', '83.05549858422529', 'Electrical Issue', '2024-03-04 12:02:38', '2024-03-15 14:50:04'),
(49, 1, '55.19963652379778', '-139.307264535974', 'Electrical Issue', '2024-02-11 15:49:13', '2024-03-15 14:50:04'),
(50, 2, '-30.2313264461526', '-120.68772660632405', 'Electrical Issue', '2024-08-23 13:51:38', '2024-03-15 14:50:04'),
(51, 3, '45.28862660311967', '17.282157835813365', 'Natural Causes', '2024-08-08 02:42:12', '2024-03-15 14:50:04'),
(52, 4, '76.94337597763479', '-81.68600691639446', 'Electrical Issue', '2024-12-09 01:33:32', '2024-03-15 14:50:04'),
(53, 5, '-23.649887585686415', '53.589064137627446', 'Equipment Malfunction', '2024-01-07 11:22:25', '2024-03-15 14:50:04'),
(54, 6, '-30.817741491662098', '73.58290360642869', 'Human Error', '2024-01-09 19:00:37', '2024-03-15 14:50:04'),
(55, 7, '-19.23920691873805', '-67.3461460390558', 'Natural Causes', '2024-01-23 10:02:52', '2024-03-15 14:50:04'),
(56, 8, '80.88778729633222', '-36.19736404735349', 'Human Error', '2024-04-04 15:31:38', '2024-03-15 14:50:04'),
(57, 9, '54.620353304427454', '-125.98486243373236', 'Natural Causes', '2024-08-22 06:29:37', '2024-03-15 14:50:04'),
(58, 10, '-20.704379017189495', '-91.69900632621628', 'Electrical Issue', '2024-08-07 03:58:24', '2024-03-15 14:50:04'),
(59, 11, '18.30190663067802', '-61.699139849933914', 'Arson', '2024-02-06 06:06:43', '2024-03-15 14:50:04'),
(60, 12, '76.48319138817786', '-143.35912145987072', 'Arson', '2024-04-14 05:23:11', '2024-03-15 14:50:04'),
(61, 13, '-84.64920373135172', '-81.79954985324251', 'Human Error', '2024-10-12 08:21:46', '2024-03-15 14:50:04'),
(62, 14, '-72.9842011099534', '41.944101137988355', 'Human Error', '2024-10-27 18:22:34', '2024-03-15 14:50:04'),
(63, 15, '-51.93332050175715', '-155.14658720711859', 'Natural Causes', '2024-10-03 01:59:49', '2024-03-15 14:50:04'),
(64, 16, '83.51993958793574', '-173.61908710898746', 'Electrical Issue', '2024-02-20 05:40:42', '2024-03-15 14:50:04'),
(65, 17, '1.7145840932750787', '-47.519174504577336', 'Electrical Issue', '2024-06-28 08:16:21', '2024-03-15 14:50:04'),
(66, 18, '-36.3269723265683', '-1.3306068455154048', 'Arson', '2024-12-15 16:37:02', '2024-03-15 14:50:04'),
(67, 19, '-88.92130639303598', '44.52792739917331', 'Human Error', '2024-04-29 12:33:14', '2024-03-15 14:50:04'),
(68, 20, '-21.465844410905476', '-57.956002837006', 'Natural Causes', '2024-07-17 23:21:48', '2024-03-15 14:50:04'),
(69, 21, '-64.23624261676915', '-5.376922660858298', 'Natural Causes', '2024-12-06 06:29:39', '2024-03-15 14:50:04'),
(70, 22, '17.74914207658651', '-147.63861545141657', 'Natural Causes', '2024-10-22 02:02:55', '2024-03-15 14:50:04'),
(71, 23, '-60.60167119894332', '79.6480356712342', 'Arson', '2024-07-07 19:24:41', '2024-03-15 14:50:04'),
(72, 24, '-10.499733090866101', '177.04978968673367', 'Natural Causes', '2024-03-21 00:27:12', '2024-03-15 14:50:04'),
(73, 25, '49.10660227677468', '53.980739744362154', 'Arson', '2024-08-22 14:06:42', '2024-03-15 14:50:04'),
(74, 26, '13.680309284180694', '58.50584898004854', 'Natural Causes', '2024-04-03 03:54:08', '2024-03-15 14:50:04'),
(75, 1, '55.55865087132776', '-81.1788923863125', 'Arson', '2024-12-19 10:13:52', '2024-03-15 14:50:04'),
(76, 2, '54.70168911358499', '144.22604795938918', 'Arson', '2024-09-04 18:48:44', '2024-03-15 14:50:04'),
(77, 3, '-45.753909233728336', '79.9052098951351', 'Arson', '2024-04-17 05:16:42', '2024-03-15 14:50:04'),
(78, 4, '-49.51976438939549', '-166.7314388851928', 'Natural Causes', '2024-09-05 07:26:17', '2024-03-15 14:50:04'),
(79, 5, '86.55427939868932', '154.17525974491173', 'Electrical Issue', '2024-03-03 23:20:46', '2024-03-15 14:50:04'),
(80, 6, '-69.12833034911037', '-95.73860723128412', 'Human Error', '2024-11-05 22:03:33', '2024-03-15 14:50:04'),
(81, 7, '33.02965114175309', '60.97983576448618', 'Arson', '2024-07-24 03:08:12', '2024-03-15 14:50:04'),
(82, 8, '86.92651888069372', '-10.247070258713393', 'Electrical Issue', '2024-08-24 14:00:14', '2024-03-15 14:50:04'),
(83, 9, '40.41693153829959', '127.4848975497157', 'Natural Causes', '2024-03-14 06:48:11', '2024-03-15 14:50:04'),
(84, 10, '61.836740944382484', '-89.72442137983109', 'Human Error', '2024-07-20 04:13:34', '2024-03-15 14:50:04'),
(85, 11, '-62.1146608815665', '-62.33801990965196', 'Electrical Issue', '2024-03-23 09:19:23', '2024-03-15 14:50:04'),
(86, 12, '4.553960165524813', '-125.5313515155868', 'Natural Causes', '2024-01-02 20:13:32', '2024-03-15 14:50:04'),
(87, 13, '-59.03935166917681', '89.40897247698996', 'Arson', '2024-02-02 19:43:15', '2024-03-15 14:50:04'),
(88, 14, '-79.64922229726727', '-157.6335582301333', 'Natural Causes', '2024-02-11 18:33:26', '2024-03-15 14:50:04'),
(89, 15, '-86.03362289819273', '104.13491856691883', 'Natural Causes', '2024-07-25 11:44:16', '2024-03-15 14:50:04'),
(90, 16, '5.174053362732792', '-156.0268439501774', 'Arson', '2024-02-21 20:55:00', '2024-03-15 14:50:04'),
(91, 17, '7.90588425277349', '-24.366418350829207', 'Electrical Issue', '2024-04-07 07:45:50', '2024-03-15 14:50:04'),
(92, 18, '53.8911156578838', '-5.930367657849899', 'Arson', '2024-12-09 04:04:49', '2024-03-15 14:50:04'),
(93, 19, '78.27253191570986', '-126.23901615500358', 'Arson', '2024-11-18 23:10:56', '2024-03-15 14:50:04'),
(94, 20, '26.450280767353505', '98.54413214935374', 'Electrical Issue', '2024-03-29 08:06:25', '2024-03-15 14:50:04'),
(95, 21, '-76.05431371000998', '168.68946588476138', 'Electrical Issue', '2024-10-16 16:07:32', '2024-03-15 14:50:04'),
(96, 22, '-77.52413877055434', '50.75168765220016', 'Electrical Issue', '2024-04-18 20:28:46', '2024-03-15 14:50:04'),
(97, 23, '-16.8996450741772', '-152.78730307965287', 'Human Error', '2024-05-31 18:35:41', '2024-03-15 14:50:04'),
(98, 24, '-58.60395320561152', '86.08147794947166', 'Electrical Issue', '2024-08-15 01:27:04', '2024-03-15 14:50:04'),
(99, 25, '15.789584709135426', '117.50824374846019', 'Electrical Issue', '2024-01-11 21:28:38', '2024-03-15 14:50:04'),
(100, 26, '0.4048848994121812', '-53.125992820715524', 'Arson', '2024-10-24 03:11:33', '2024-03-15 14:50:04'),
(101, 1, '-89.65704772589453', '-175.32902150911187', 'Natural Causes', '2024-03-13 08:04:22', '2024-03-15 14:50:04'),
(102, 2, '47.47438370946273', '-0.6768505840346677', 'Natural Causes', '2024-08-28 03:48:36', '2024-03-15 14:50:04'),
(103, 3, '-78.614621189064', '26.611235185164247', 'Electrical Issue', '2024-07-22 23:17:26', '2024-03-15 14:50:04'),
(104, 4, '37.16531469222653', '-3.939790040198517', 'Arson', '2024-05-15 12:30:58', '2024-03-15 14:50:04'),
(105, 5, '32.19892993774165', '142.29316063438836', 'Arson', '2024-05-03 18:51:57', '2024-03-15 14:50:04'),
(106, 6, '32.256997918949466', '59.7945354131931', 'Arson', '2024-03-18 04:20:05', '2024-03-15 14:50:04'),
(107, 7, '64.73876554028948', '159.71532022553993', 'Human Error', '2024-06-08 22:17:41', '2024-03-15 14:50:04'),
(108, 8, '81.23548758331265', '-169.96115281242984', 'Natural Causes', '2024-07-27 18:14:49', '2024-03-15 14:50:04'),
(109, 9, '-39.169030943111544', '116.49040678189175', 'Electrical Issue', '2024-05-19 10:05:09', '2024-03-15 14:50:04'),
(110, 10, '-24.537313873448696', '-176.07624336711712', 'Natural Causes', '2024-06-20 21:02:30', '2024-03-15 14:50:04'),
(111, 11, '55.54336580032796', '160.38580542466212', 'Natural Causes', '2024-06-09 16:02:11', '2024-03-15 14:50:04'),
(112, 12, '-40.96136330716439', '175.60375950821094', 'Natural Causes', '2024-11-03 15:38:17', '2024-03-15 14:50:04'),
(113, 13, '-25.041957586111465', '-98.19182365964336', 'Electrical Issue', '2024-07-13 19:22:28', '2024-03-15 14:50:04'),
(114, 14, '-73.26934591240189', '-124.6398385471104', 'Natural Causes', '2024-04-10 22:52:31', '2024-03-15 14:50:04'),
(115, 15, '-17.082717406640498', '36.86491222760168', 'Arson', '2024-01-19 15:08:42', '2024-03-15 14:50:04'),
(116, 16, '77.44969187998183', '-116.76007741760469', 'Electrical Issue', '2024-02-10 10:54:10', '2024-03-15 14:50:04'),
(117, 17, '39.402662747914576', '80.7257576479816', 'Arson', '2024-03-03 07:06:33', '2024-03-15 14:50:04'),
(118, 18, '-31.34076370051202', '23.204963172976818', 'Natural Causes', '2024-06-19 16:56:40', '2024-03-15 14:50:04'),
(119, 19, '87.53330396258582', '30.975191603391607', 'Arson', '2024-07-25 19:18:09', '2024-03-15 14:50:04'),
(120, 20, '17.435733999531465', '-90.38481610862986', 'Electrical Issue', '2024-10-28 16:55:32', '2024-03-15 14:50:04'),
(121, 21, '37.1215963616237', '95.4383000688984', 'Electrical Issue', '2024-12-23 06:21:01', '2024-03-15 14:50:04'),
(122, 22, '27.47808146986931', '-164.98346405567924', 'Natural Causes', '2024-01-16 03:33:23', '2024-03-15 14:50:04'),
(123, 23, '-80.3709378562597', '37.89722105292344', 'Natural Causes', '2024-04-05 03:56:18', '2024-03-15 14:50:04'),
(124, 24, '-34.30032520024136', '49.396438514251656', 'Natural Causes', '2024-09-01 10:12:42', '2024-03-15 14:50:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_type` varchar(255) NOT NULL DEFAULT 'user',
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `station_location` varchar(255) NOT NULL,
  `barangay_code` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_type`, `username`, `email`, `password`, `station_location`, `barangay_code`) VALUES
(1, 'user', 'fatimaFireBrigade', 'sample@gmail.com', '$2y$10$BGz58klctTuXqhRG5LXNfOCbBxuDhXwnRIMPwSNVDU9Npf2kbHz1W', '6.073838, 125.115167', 13),
(5, 'user', 'apopong', 'apopong@gmail.com', '$2y$10$/9ZEWC2vF2c1sza/apAkeeykUt4hlyDrA5FTpfRSN6qe2YmVcScsi', '6.1313112,125.130319', 1),
(7, 'admin', 'pocho', 'rogeranthony1127@gmail.com', '$2y$10$ughiKSZT6vgDCx5peHanl.RWyP87pEYFQbb/kypNnv7W2iWjwi6wC', 'null', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alert`
--
ALTER TABLE `alert`
  ADD PRIMARY KEY (`alert_id`);

--
-- Indexes for table `barangay`
--
ALTER TABLE `barangay`
  ADD PRIMARY KEY (`barangay_code`);

--
-- Indexes for table `incident_data`
--
ALTER TABLE `incident_data`
  ADD PRIMARY KEY (`incident_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alert`
--
ALTER TABLE `alert`
  MODIFY `alert_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `barangay`
--
ALTER TABLE `barangay`
  MODIFY `barangay_code` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `incident_data`
--
ALTER TABLE `incident_data`
  MODIFY `incident_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
