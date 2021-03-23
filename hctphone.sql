-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2020 at 04:09 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hctphone`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account_id` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pass` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adeleted` tinyint(1) DEFAULT 0,
  `account_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_id`, `username`, `pass`, `fullname`, `address`, `phone_number`, `mail`, `adeleted`, `account_type_id`) VALUES
(1, 'minhchau', 'minhchau', 'Võ Ngọc Minh Châu', 'Bình Thạnh, Hồ Chí Minh', '0922744693', 'minhchau@gmail.com', 0, 1),
(2, 'minhtriet', 'minhtriet', 'Minh Triết', 'Quận 8, Hồ Chí Minh', '0907163683', 'minhtriet@gmail.com', 0, 1),
(6, 'huongnguyen', '12345', 'Hương Quỳnh Nguyễn', 'Quan 9, Ho Chi Minh', '789456', 'HuongNguyen@gmail.com', 0, 1),
(7, 'admin', 'admin', 'Admin', NULL, NULL, NULL, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `acounttype`
--

CREATE TABLE `acounttype` (
  `account_type_id` int(11) NOT NULL,
  `account_type_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `acounttype`
--

INSERT INTO `acounttype` (`account_type_id`, `account_type_name`) VALUES
(1, 'User'),
(2, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `banking`
--

CREATE TABLE `banking` (
  `banking_id` int(11) NOT NULL,
  `card_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `card_id` int(11) NOT NULL,
  `card_username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `account_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `banking`
--

INSERT INTO `banking` (`banking_id`, `card_type`, `card_id`, `card_username`, `account_id`) VALUES
(1, 'Visa card', 1857, 'Vo Ngoc Minh Chau', 1),
(2, 'Master card', 1827, 'Nguyen Cao Minh Triet', 2),
(3, 'Visa Card', 1868, 'Nguyen Quynh Huong', 6);

-- --------------------------------------------------------

--
-- Table structure for table `billcod`
--

CREATE TABLE `billcod` (
  `bill_COD_id` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `total_cost` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `process_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `billcod`
--

INSERT INTO `billcod` (`bill_COD_id`, `order_date`, `total_cost`, `account_id`, `process_id`) VALUES
('1', '2020-05-13 14:45:17', 71700000, 6, 2),
('12431', '2020-05-13 14:17:05', 0, 1, 1),
('2', '2020-04-11 11:16:20', 42949000, 2, 1),
('21169', '2020-05-13 14:17:23', 20196000, 1, 1),
('3', '2020-01-18 01:36:00', 41999000, 1, 2),
('4', '2020-03-27 08:50:45', 41689000, 1, 2),
('5', '2020-02-21 14:50:45', 24000000, 2, 2),
('6', '2020-01-26 14:50:45', 32000000, 6, 3),
('83028', '2020-05-13 14:22:19', 40000000, 6, 1),
('96720', '2020-05-13 14:16:26', 149500000, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `billdetail`
--

CREATE TABLE `billdetail` (
  `bill_detail_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `bill_COD_id` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `pid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `billdetail`
--

INSERT INTO `billdetail` (`bill_detail_id`, `amount`, `cost`, `bill_COD_id`, `pid`) VALUES
('1', 3, 71700000, '1', 13),
('1381615680', 1, 40000000, '83028', 4),
('1463572744', 4, 5049000, '21169', 1),
('1655183609', 5, 29900000, '96720', 11),
('2', 1, 5049000, '2', 1),
('3', 1, 37900000, '2', 10),
('4', 1, 41999000, '3', 3),
('5', 1, 38999000, '4', 18),
('6', 1, 2690000, '4', 19),
('7', 2, 24000000, '5', 12),
('8', 2, 32000000, '6', 5);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cid` int(11) NOT NULL,
  `cname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cdeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cid`, `cname`, `cdeleted`) VALUES
(1, 'SMART PHONE', 0),
(2, 'TABLET', 0),
(3, 'HEADPHONE', 0),
(4, 'LAPTOP', 0);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE `manufacturer` (
  `mid` int(11) NOT NULL,
  `mname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LogoURL` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mdeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`mid`, `mname`, `LogoURL`, `mdeleted`) VALUES
(1, 'APPLE', 'apple.png', 0),
(2, 'SAMSUNG', 'samsung.png', 0),
(3, 'LG', 'lg.png', 0),
(4, 'HUAWEI', 'huawei.png', 0),
(5, 'DELL', 'dell.png', 0),
(6, 'HP', 'hp.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `process`
--

CREATE TABLE `process` (
  `process_id` int(11) NOT NULL,
  `process_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `process`
--

INSERT INTO `process` (`process_id`, `process_name`) VALUES
(1, 'Order'),
(2, 'Paid'),
(3, 'Delivery'),
(4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `pid` int(11) NOT NULL,
  `pname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picURL` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `importdate` datetime DEFAULT NULL,
  `storage_amount` int(11) DEFAULT NULL,
  `sold_out_amount` int(11) DEFAULT NULL,
  `product_view` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdeleted` tinyint(1) DEFAULT 0,
  `cid` int(11) NOT NULL,
  `mid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pid`, `pname`, `picURL`, `price`, `importdate`, `storage_amount`, `sold_out_amount`, `product_view`, `description`, `pdeleted`, `cid`, `mid`) VALUES
(1, 'Apple\'s Second-Generation AirPods', 'Airpod2.png', 5049000, '2019-12-14 00:00:00', 0, 3, 190, '•	Automatically on, automatically connected\r\n•	Easy setup for all your Apple devices\r\n•	Quick access to Siri by saying “Hey Siri”\r\n•	Double-tap to play or skip forward\r\n•	New Apple H1 headphone chip delivers faster wireless connection to your devices\r\n•	Charges quickly in the case\r\n•	Case can be charged using the Lightning connector\r\n•	Rich, high-quality audio and voice\r\n•	Seamless switching between devices\r\n•	Listen and talk all day with multiple charges from the Charging Case\r\n', 0, 3, 1),
(2, ' Dell Gaming G7 Inspiron 7588', 'DellG7_7588.png', 29999000, '2019-11-01 00:00:00', 10, 9, 212, 'A stunning view: With up to NVIDIA GeForce GTX 1060 graphics with Max-Q Design Technology and up to 6GB GDDR5 video memory, gameplay is clear and detailed.\r\n\r\nUnparalleled viewing experience: Witness everything on screen with stunning clarity and superior color richness thanks to IPS FHD display with HDMI 2.0 for\r\n60Hz 4K output. Equipped with anti-glare panels to create a wider range of environments.\r\n\r\nSuperior sound: Experience every beat of the action with improved clarity and imaging thanks to two tuned, front-firing speakers powered by Waves MaxxAudio Pro.\r\n\r\nThe ultimate personal theatre experience: Elevate your gaming, viewing and mega-tasking with the one-two combo of SmartByte and Waves MaxxAudio Pro. You’ll be\r\nsucked into every game like never before, with powerful streaming and encompassing sound—no drops.\r\n\r\nA processing powerhouse: i7 8th Gen Intel Quad- and Hex-Core H-Series CPUs rip through processing functions when throttled.\r\n\r\nA keyboard crafted with precision: The aggressive sub-1\" design is equipped with huge cooling vents and dual-fan cooling technology to ensure your system never\r\nbuckles under the load of demanding games while still staying cool and quiet.\r\n\r\nStay cool under pressure: Make every click count on a keyboard built with multiple layers of reinforcement, 1.4mm keystroke travel and blue backlighting with WASD keys.\r\n', 0, 4, 5),
(3, 'DELL XPS 13 2020', 'DellXPS_13.png', 41999000, '2020-01-14 00:00:49', 18, 10, 545, 'Product Overview:\r\nWith Intel Core i7-1065G7 Processor, 4-Core Upgrade performance with smooth responsiveness. This smart system accelerator learns from your everyday computing and helps your performance, 2020 Dell XPS 7390 13.4 Inch Laptop making everything fast, smooth, and responsive. \r\nKey Specifications:\r\nOperating System: Windows 10 Home\r\nDisplay: 13.4 inch Touchscreen InfinityEdge FHD (1920 x 1200) Display\r\nProcessor: Intel Core i7-1065G7 (1.3 GHz base frequency up to 3.9 GHz, 8 MB cache, 4 cores)\r\nStorage Drive: 512GB SSD\r\nMemory (RAM): 16GB DDR4 RAM\r\nWireless Connectivity: KILLER AX1650 (2x2/160) Wi-Fi 6 Gig+ and Bluetooth 5.0\r\nGraphics: Intel Iris Plus Graphics\r\nWebcam: Yes\r\nTouchscreen: Yes\r\nBacklit Keyboard: Yes\r\nOption Drive: No\r\nWireless Mouse: Yes\r\nPorts:\r\n•	2 x Thunderbolt 3\r\n•	1 x Micro SD Card Reader\r\n•	1 x Headphone/Microphone Combo Jack\r\nBattery Type: 4-Cell, 51WHr Battery, up to 10 hours\r\nWeight: 2.9lbs\r\nDimensions(inches): 11.69 x 8.15 x 0.28 inches\r\n', 0, 4, 5),
(4, 'Galaxy Fold', 'Galaxyfold.png', 40000000, '2020-01-13 08:12:49', 0, 12, 356, 'Change the way you communicate and connect with this unlocked Samsung Galaxy Fold smartphone. The 12GB of RAM and octa-core processor offer fast, powerful performance for seamless multitasking and gaming, while the 512GB of storage space leaves ample room for important files, photos and videos. This black Samsung Galaxy Fold smartphone features six cameras to accommodate selfie, wide-angle, ultrawide and telephoto shots', 0, 1, 2),
(5, 'GalaxytabS6', 'GalaxytabS6.png', 16000000, '2019-01-06 12:18:23', 15, 2, 254, NULL, 0, 2, 2),
(6, 'HP Pavilion Gaming 15', 'HPPavilionGaming_15.png', 18900000, '2020-01-12 12:20:39', 14, 9, 125, 'Fast and easy multitasking: experience high-grade Graphics and processing power that meets your gaming and multitasking needs for the latest games including Fortnight, PUBG, and Overwatch\r\n\r\nAdvanced thermal Management: optimized thermal design and IR sensor keeps your laptop cool to the touch, without affecting acoustics.\r\n\r\nBios recovery and protection: automatically checks the health of your PC, protects against unauthorized access, secures local storage and recovers itself from boot-up issues\r\n\r\nFast Processor: 9th Generation intel(r) core(tm) i5-9300h Processor, quad-core, 2.4GHz up to 4.1GHz with Intel\'s) Turbo Boost\r\n\r\nRealistic graphics: nvidia(r) geforce(r) GTX 1050 (3 GB GDDR5 dedicated). enjoy NVIDIA Pascal) architecture for amazing speed and power efficiency. Vr/mr ready. 15.6-Inch diagonal FHD IPS Anti-Glare micro-edge WLED-backlit Display (1920x1080) with 60Hz refresh rate\r\n\r\nMemory and storage: 8 GB DDR4-2400 SDRAM (upgradable with 2 accessible Memory Slots) and Fast boot-up, file transfer and a snappier experience with the internal 256 GB pcie(r) nvme(tm) M.2 Solid State Drive\r\n\r\nBattery life: up to 10 hours (mixed usage); up to 9 hours (video playback); up to 7 hours and 15 minutes (wireless streaming).\r\n', 0, 4, 6),
(7, 'HP Spectra x360', 'HPSpectrax360.png', 27900000, '2020-02-21 00:00:39', 15, 5, 1321, 'HP Spectre x360 Convertible 2-in-1 Laptop: Embrace your creativity with this 15.6-inch HP Spectre x360 convertible laptop. Featuring a 15.6-inch 4K touch display and an HP digital pen, this laptop lets you write, make notes and express yourself with precise touch controls. This HP Spectre x360 convertible laptop provides a fast, responsive user experience with an Intel Core i7 processor.\r\nIntel Core i7 8565U (1.8 GHz base frequency(2b), up to 4.6 GHz with Intel Turbo Boost Technology(2g), 8 MB cache, 4 cores)\r\n\r\n15.6\" diagonal 4K IPS anti-glare WLED-backlit micro-edge touch screen (3840 x 2160)\r\n\r\n512 GB PCIe NVMe M.2 SSD, 16 GB DDR4-2400 SDRAM (2 x 8 GB)\r\n\r\nNVIDIA GeForce MX150 (2 GB GDDR5 dedicated)\r\n', 0, 4, 6),
(8, 'Huawei Mate X', 'HuaweiMate X.png', 17000000, '2020-01-11 12:26:47', 0, 9, 125, 'Huawei Mate X smartphone was launched in February 2019. The phone comes with a 8.00-inch touchscreen display with a resolution of 2200x2480 pixels. Huawei Mate X is powered by a 1.8GHz octa-core HiSilicon Kirin 980 processor that features 2 cores clocked at 2.6GHz, 2 cores clocked at 1.92GHz and 4 cores clocked at 1.8GHz. It comes with 8GB of RAM. The Huawei Mate X runs Android 9.0 and is powered by a 4500mAh battery. The Huawei Mate X supports proprietary fast charging.\r\nAs far as the cameras are concerned, the Huawei Mate X on the rear packs a 40-megapixel primary camera; a second 16-megapixel camera and a third 8-megapixel camera. It sports a camera on the front for selfies.\r\nThe Huawei Mate X runs EMUI 9.1.1 based on Android 9.0 and packs 512GB of inbuilt storage (up to 256GB). The Huawei Mate X is a single SIM (GSM) smartphone that accepts a Nano-SIM card. The Huawei Mate X measures 161.30 x 78.30 x 11.00mm (height x width x thickness) and weighs 295.00 grams. It was launched in Interstellar Blue colour.\r\nConnectivity options on the Huawei Mate X include Wi-Fi 802.11 a/b/g/n/ac, GPS, Bluetooth v5.00, NFC, USB Type-C, 3G, and 4G. Sensors on the phone include accelerometer, ambient light sensor, barometer, compass/ magnetometer, gyroscope, proximity sensor, and fingerprint sensor.\r\n', 0, 1, 4),
(9, 'Huawei P40 Pro', 'HuaweiP40Pro.png', 22900000, '2020-09-18 00:01:00', 15, 10, 357, 'The HUAWEI P40 Pro 5G comes with the new HUAWEI AppGallery and is not compatible with Google Play Store and Services. Find more about HUAWEI AppGallery on the Huawei Community\r\n\r\nUltra Vision Leica Quad Camera: 50 MP Ultra Vision Sensor (1/1.28 Inch Ultra Vision Sensor, RYYB colour filter array, Octa PD Autofocus), 40 MP Ultra Wide Cine Camera, 12 MP Telephoto Cameras, 3D Depth Sensing Camera\r\n12 MP Telephoto Camera: 5x Optical Zoom, 10x Hybrid Zoom, 50x Max Zoom. Thus you can see things clearly from right before your eyes to somewhere out of sight\r\n\r\nWi-Fi 6 Plus: Using Dynamic Narrow Bandwidth technology, the Wi-Fi 6 Plus enabled phone penetrates more walls and floors. Supporting 160 MHz bandwidth, it brings out optimal speed reaching up to 2.4 Gbps\r\n\r\n5G and Outstanding Performance: Embrace the ultra-fast speed with the world’s first integrated 5G SoC, Kirin 990 5G chipset. Thanks to the 7nm+ EUV technology and innovative CPU architectures, HUAWEI P40 Pro can achieve high efficiency and system fluidity\r\n\r\nLong-Lasting, Fast Charging Battery: The AI allocation mechanism makes better use of the 4200 mAh battery to achieve great performance and longer working time. Thanks to the 40 W HUAWEI SuperCharge and 27 W Wireless HUAWEI SuperCharge, which you can enjoy the safe and fast charging\r\n\r\nQuad-curve Overflow Display, IP68: The Quad-Curve Overflow Display is innovated to dissolve the barriers of vision and imagination on every edge. Plus with the 90 Hz refresh rate, you can enjoy an immersive view over the entire fluid screen\r\n\r\n', 0, 1, 4),
(10, 'IpadPro.png', 'IpadPro.png', 37900000, '2020-01-12 12:20:39', 0, 9, 125, '•	11-inch edge-to-edge Liquid Retina display with ProMotion, True Tone, and P3 wide color\r\n•	A12Z Bionic chip with Neural Engine\r\n•	12MP Wide camera, 10MP Ultra Wide camera, and LiDAR Scanner\r\n•	7MP TrueDepth front camera\r\n•	Face ID for secure authentication and Apple Pay\r\n•	Four speaker audio and five studio-quality microphones\r\n•	802.11ax Wi-Fi 6\r\n•	Up to 10 hours of battery life\r\n•	USB-C connector for charging and accessories\r\n•	Support for Magic Keyboard, Smart Keyboard Folio, and Apple Pencil\r\n', 0, 2, 1),
(11, 'Iphone11 Pro Max', 'Iphone11Pro Max.png', 29900000, '2020-09-18 00:01:00', 0, 20, 452, '•	Carrier - This phone is locked to simple Mobile from Tracfone, which means this Device can only be used on the Simple Mobile wireless network.\r\n•	Plans - simple Mobile offers a variety of coverage plans, including 30-day unlimited Talk, text & data. No Activation Fees, No Credit Checks, and no Hassles On a Nationwide Lightning-fast Network. For more information or plan options, please visit the Simple Mobile website.\r\n•	Activation - You’ll receive a simple Mobile SIM kit with this iPhone. Follow the instructions to get service activated with the simple Mobile plan of your choice.\r\n•	6. 5-inch Super Retina XDR OLED display\r\n•	Water and dust resistant (4 meters for up to 30 minutes, IP68)\r\n•	Triple-camera system with 12MP Ultra wide, wide, and telephoto cameras; night mode, Portrait mode, and 4K video up to 60fps\r\n•	12MP True Depth front Camera with Portrait mode, 4K video, and slo-mo\r\n•	Face ID for secure authentication and Apple Pay\r\n•	A13 Bionic chip with third-generation Neural Engine\r\n•	Fast Charge with 18W adapter included.\r\n', 0, 1, 1),
(12, 'IphoneSE 2020', 'IphoneSE 2020.png', 12000000, '2020-01-12 12:20:39', 14, 9, 125, '•	A very familiar (read: old) design\r\n•	Retina HD display \r\n•	iPhone SE 2020 come in black, white and red\r\n•	Much more powerful than the iPhone 8\r\n•	Can open apps with good speed\r\n•	Even manages to go toe-to-toe with the iPhone 11 Pro at times\r\n•	12MP single sensor, imbued with advanced image processing\r\n•	Good photos, but not market leading\r\n•	High range of video recording options\r\n', 0, 1, 1),
(13, 'IphoneXS Max', 'IphoneXS Max.png', 23900000, '2020-01-13 08:12:49', 25, 20, 452, '•	CARRIER - This phone is locked to Simple Mobile from Tracfone, which means this device can only be used on the Simple Mobile wireless network.\r\n•	PLANS - Simple Mobile offers a variety of coverage plans, including 30-Day Unlimited Talk, Text & Data. No activation fees, no credit checks, and no hassles on a nationwide lightning-fast network. For more information or plan options, please visit the Simple Mobile website.\r\n•	ACTIVATION - You’ll receive a Simple Mobile SIM kit with this iPhone. Follow the instructions to get service activated with the Simple Mobile plan of your choice.\r\n•	6.5-inch Super Retina display (OLED) with HDR\r\n•	IP68 dust and water resistant (maximum depth of 2 meters up to 30 minutes)\r\n•	12MP dual cameras with dual OIS and 7MP TrueDepth front camera—Portrait mode, Portrait Lighting, Depth Control, and Smart HDR\r\n•	Face ID for secure authentication and Apple Pay\r\n•	A12 Bionic with next-generation Neural Engine\r\n•	Wireless charging—works with Qi chargers\r\n•	iOS 12 with Memoji, Screen Time, Siri Shortcuts, and Group FaceTime\r\n', 0, 1, 1),
(14, 'LG V60 ThinQ', 'LG _V60.png', 21999000, '2019-12-12 12:20:39', 0, 9, 125, 'Qualcomm Snapdragon 865 processor\r\nOcta-core 2.8GHz processor and 8GB of RAM deliver outstanding overall performance for opening and running applications, flipping through menus, running home screens and more.\r\n5G speed\r\nProvides the fastest network speeds for downloading, uploading and streaming content like HD Video and Augmented or Virtual Reality.\r\nDual rear-facing cameras and front camera\r\nLets you record high-resolution images on the rear while a front-facing camera makes it easy to Skype or take selfies.\r\n6.8\" touch screen\r\nExtra-large screen is matched with a slim body to comfortably fit in your hand.\r\n128GB internal memory plus microSD slot\r\nExtensive storage space for your contacts, music, photos, apps and more. Expand storage up to 2TB by adding a microSD card (sold separately).\r\nPersonalize photos and screenshots with handwritten notes\r\nAdd a caption to a photo with your finger, circle a location on a map or add comments and doodles to a screenshot with QuickMemo. Then share your creations with friends and family.\r\nYour fingerprint keeps your phone secure\r\nHold your finger on the fingerprint sensor to unlock your phone.\r\nAccess to Google Play\r\nBrowse and download apps, magazines, books, movies, and television programs directly to your phone.\r\n', 0, 1, 3),
(15, 'LG Velvet', 'LGVelvet.png', 17900000, '2020-02-21 00:00:39', 25, 20, 213, 'LG Velvet is an attractive flagship smartphone from the house of LG. Certified with IP-68 dust and water-resistant, this LG Velvet sports a 6.8-inch P-OLED display, a 4500mAh battery, and, the storage sits at 128GB of UFS2.1 storage. LG Velvet has a mid-range Snapdragon765G chipset, and for optics, it flaunts a 48MP sensor with pixel binning technology. With this Velvet smartphone, LG is signing off its G-series lineup. Let’s see how attractive the phone is and you decide if this LG Velvet is worth buying.\r\n\r\nDisplay and Performance\r\nLG Velvet is fitted with a P-OLED display. The phone has a long 6.8-inch display, LG calls it Cinema FullView display.This display is QHD+(1080x2460px) and amounts to 395PPI. LG Velvet has a 60Hz display which is disappointing in comparison to other mid-range phones. The aspect ratio of the phone is 20:9. LG Velvet sports an in-display fingerprint sensor and face unlock in the name of biometrics.\r\nSnapdragon765G chipset drives LG Velvet, Snapdragon 765G chipset is an optimized SoC which is especially for mid-range gaming. The phone has Android v10 and runs on 8GB of RAM. LG Velvet has an Adreno 620 GPU for graphic needs. Games like Pub-G may run stable. User-friendly sensors like Accelerometer, Gyroscope, Proximity, and, Compass are present.\r\n\r\nCamera and Storage\r\nLG Velvet has a 48MP triple rear-shooters with pixel-binning technology. The setup has a 48MP main sensor, 8MP’s ultra-wide sensor, and a 5MP depth sensor with autofocus. For selfies, it has a 16MP main sensor. LG Velvet records UHD 4K videos @30fps. Basic photography can be easily sorted on this phone.\r\nLG Velvet has 128GB of UFS2.1 storage. This 128GB storage may satisfy storage needs, also it has an extra card slot with 2TB of capacity.\r\n\r\n', 0, 1, 3),
(16, 'MacbookPro 13inch 2020', 'MacbookPro 13inch 2020.png', 33990000, '2020-01-11 12:26:47', 14, 9, 254, '•	8Th-generation quad-core Intel Core i5 Processor\r\n•	Brilliant Retina Display with True Tone technology\r\n•	Touch Bar and Touch ID\r\n•	Intel Iris Plus Graphics 655\r\n•	Ultrafast SSD\r\n•	Four Thunderbolt 3 (USB-C) ports\r\n•	Up to 10 hours of battery life\r\n•	802.11AC Wi-Fi\r\n•	Latest Apple-designed keyboard\r\n•	Force touch trackpad\r\n\r\n', 0, 4, 1),
(17, 'Galaxy Note 10+', 'Note10.png', 25900000, '2020-02-21 00:00:39', 25, 12, 452, 'Fast-charging, long-lasting intelligent power and super speed processing outlast whatever you throw at Note 10+. S pen’s newest Evolution gives you the power of air gestures, a remote shutter and playlist button and handwriting-to-text, all in One Magic wand.\r\n\r\n6.8” Nearly Bezel-less Infinity Display* Ultrasonic In-Display Fingerprint ID\r\nBluetooth, Air Action Wireless Gestures, Handwriting-to-Text\r\n\r\nWith a full set of Pro lenses, super-stabilization, live video bokeh and precision audio recording, Note 10+ is a studio in your pocket | 10MP Selfie Camera with Dual Pixel 12MP Wide, 12MP 2x Zoom, 16MP Ultra Wide\r\n\r\n256GB Storage / 12GB RAM 4,300mAh Superfast Charging, All-Day Battery, Wireless PowerShare\r\n', 0, 1, 2),
(18, ' Galaxy S20 Ultra', 'S20Ultra.png', 38999000, '2020-05-05 12:32:45', 23, 15, 321, 'Power of 5G: Get next-level power for everything you love to do with Samsung Galaxy 5G; Share more, game harder, experience more and never miss a beat\r\n\r\nSingle Take AI: Capture video and multiple types of images with one tap of the shutter button; Lenses, effects and filters capture the best of every moment, every time\r\n\r\nHi-Res Camera Zoom: Capture hi-res images from 300 feet away that look like they were taken from 3 feet away; The game-changing new 100x Space Zoom delivers unprecedented power and clarity\r\n\r\nUltra Bright Night Mode: Capture pro-quality content in Ultra Bright Night mode to capture dazzling, blur-free photos and vivid HRD video without flash, even in low light\r\n\r\nSuper Fast Charging: Charge up quicker with Super Fast Charge so you can keep moving, with more juice; Give your buds – or Galaxy Buds – a boost of power with Wireless PowerShare right from Galaxy S20 Ultra 5G\r\n\r\nAll-Day Battery: S20 Ultra 5G’s intelligent battery uses an algorithm to learn from how you live to optimize power and take you through a day or more of work and life without ever giving out on you\r\n\r\nMassive Storage: Generous storage out of the box and expandable memory means you never have to delete what’s important to you; Memory card sold separately\r\nIncluded Components: Screen Protector Leaflet, Smart Switch Insert, Quick Reference Manual, Terms & Conditions/ Health & Safety Guide\r\n', 0, 1, 2),
(19, 'Samsung Earbud', 'Samsung Earbud.png', 2690000, '2019-12-13 12:32:45', 30, 17, 254, 'Power up to power on Get up to six hours of battery life with an additional seven hours from the case that doubles as a wireless charger\r\n\r\nPremium sound Tuned by AKG, an optimized driver offers substantial bass, while a volume driver gives you a wider range of sound\r\n\r\nJust what you want to hear Control how much surrounding noise you want with Ambient Aware. Quick Ambient Mode lets you hear traffic, flight announcements and coworkers calling out to you\r\n\r\nSounds good. Feels good. Galaxy Buds come in three adjustable ear tip and wingtip sizes right from the box\r\n\r\nResists water With splash resistant technology, your Galaxy Buds handle splashes, sweat and spills\r\n\r\nThe Galaxy Buds pairs with both Android and iOS compatible devices via Bluetooth connection. Use with a smartphone and tablet running Android 5. 0 or higher & RAM 1. 5GB above. Automatic sync and Ambient Aware Mode only available for Android; iOS users can use Voice Command/Siri\r\n\r\n', 0, 3, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `fk_account_accounttype` (`account_type_id`) USING BTREE;

--
-- Indexes for table `acounttype`
--
ALTER TABLE `acounttype`
  ADD PRIMARY KEY (`account_type_id`);

--
-- Indexes for table `banking`
--
ALTER TABLE `banking`
  ADD PRIMARY KEY (`banking_id`),
  ADD KEY `fk_banking_account` (`account_id`) USING BTREE;

--
-- Indexes for table `billcod`
--
ALTER TABLE `billcod`
  ADD PRIMARY KEY (`bill_COD_id`),
  ADD KEY `fk_billcod_account` (`account_id`),
  ADD KEY `fk_billcod_process` (`process_id`);

--
-- Indexes for table `billdetail`
--
ALTER TABLE `billdetail`
  ADD PRIMARY KEY (`bill_detail_id`),
  ADD KEY `fk_billdetail_billcod` (`bill_COD_id`),
  ADD KEY `fk_billdetail_product` (`pid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `process`
--
ALTER TABLE `process`
  ADD PRIMARY KEY (`process_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `fk_product_category` (`cid`),
  ADD KEY `fk_product_manufacturer` (`mid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `acounttype`
--
ALTER TABLE `acounttype`
  MODIFY `account_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `banking`
--
ALTER TABLE `banking`
  MODIFY `banking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `manufacturer`
--
ALTER TABLE `manufacturer`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `process`
--
ALTER TABLE `process`
  MODIFY `process_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `fk_account_accounttype` FOREIGN KEY (`account_type_id`) REFERENCES `acounttype` (`account_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `billcod`
--
ALTER TABLE `billcod`
  ADD CONSTRAINT `fk_billcod_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_billcod_process` FOREIGN KEY (`process_id`) REFERENCES `process` (`process_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `billdetail`
--
ALTER TABLE `billdetail`
  ADD CONSTRAINT `fk_billdetail_billcod` FOREIGN KEY (`bill_COD_id`) REFERENCES `billcod` (`bill_COD_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_billdetail_product` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_category` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_product_manufacturer` FOREIGN KEY (`mid`) REFERENCES `manufacturer` (`mid`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
