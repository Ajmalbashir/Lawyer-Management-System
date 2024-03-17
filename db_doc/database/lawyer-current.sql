-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2024 at 05:18 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lawyer`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_appointment`
--

CREATE TABLE `tbl_appointment` (
  `id` int(11) NOT NULL,
  `name` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `phone` int(225) NOT NULL,
  `appointment_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_appointment`
--

INSERT INTO `tbl_appointment` (`id`, `name`, `email`, `phone`, `appointment_date`, `start_time`, `end_time`) VALUES
(11, 'ffasf', 'ajmal1@gmail.com', 423242323, '2024-12-31', '12:59:00', '16:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_attorney`
--

CREATE TABLE `tbl_attorney` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `designation_id` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `banner` varchar(255) NOT NULL,
  `degree` varchar(255) NOT NULL,
  `detail` mediumtext NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `linkedin` varchar(255) NOT NULL,
  `youtube` varchar(255) NOT NULL,
  `google_plus` varchar(255) NOT NULL,
  `instagram` varchar(255) NOT NULL,
  `flickr` varchar(255) NOT NULL,
  `address` mediumtext NOT NULL,
  `practice_location` mediumtext NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  `status` varchar(30) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keyword` mediumtext NOT NULL,
  `meta_description` mediumtext NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_attorney`
--

INSERT INTO `tbl_attorney` (`id`, `name`, `slug`, `designation_id`, `photo`, `banner`, `degree`, `detail`, `facebook`, `twitter`, `linkedin`, `youtube`, `google_plus`, `instagram`, `flickr`, `address`, `practice_location`, `phone`, `email`, `website`, `status`, `meta_title`, `meta_keyword`, `meta_description`, `password`) VALUES
(9, 'ajmal', 'ajmal', 5, 'attorney-9.png', 'attorney-banner-9.png', '', '', '', '', '', '', '', '', '', '', '', '', 'ajmal@test.com', '', 'Active', '', '', '', '$2y$10$C6nHd.P4RBuKtbyNfSZMyOaiNdb6YvZGn/4OaBHYRQ0QW7hgRTlxu'),
(10, 'ajmal', 'ajmal-1', 5, 'attorney-10.png', 'attorney-banner-10.png', '', '', '', '', '', '', '', '', '', '', '', '', 'ajmal@gmail.com', '', 'Active', '', '', '', '$2y$10$MDo.vfcrZGrsgCFfoR8gDOuYXboBIjqpC98BRY65gey6HqCGnHp0e'),
(11, 'john', 'john', 5, 'attorney-11.jpg', 'attorney-banner-11.jpg', 'Master of Laws (LL.M.)', '<p style=\"padding: 0px; border: 0px; color: rgb(101, 100, 100); font-family: \"Open Sans\", sans-serif; font-size: 13px; outline: none !important;\">Lorem ipsum dolor sit amet, habeo albucius cum ei, sit ex sint viderer conceptam. Qui an error animal qualisque, id ius choro nusquam consectetuer, mel hinc nonumes inciderint in. Eam an dolorem partiendo, no his maiestatis expetendis. Ex nominavi eloquentiam cum, at vix tota dicam, has eu dicunt molestie interpretaris. Per choro clita possit ei, sed an posse ridens, duo mazim admodum eu. In nam explicari iracundia.</p><p style=\"padding: 0px; border: 0px; outline: none; color: rgb(101, 100, 100); font-family: \"Open Sans\", sans-serif; font-size: 13px;\">Has te consul ignota vocent. Quod brute disputationi ei vim, his invidunt omittantur te. Mucius aperiri concludaturque sed ut. Ius te quot latine vulputate. Ne his malis nonumy utroque.</p><p style=\"padding: 0px; border: 0px; outline: none; color: rgb(101, 100, 100); font-family: \"Open Sans\", sans-serif; font-size: 13px;\">Sonet malorum invidunt nec cu, nibh possim ad duo. Eros populo euripidis ne pro, his eu probatus splendide scriptorem. Idque mazim ad vix, novum antiopam sea ut, et vim dicam urbanitas adversarium. Civibus temporibus disputationi id mei.</p>', '', '', '', '', '', '', '', '', '', '', 'john@gmail.com', '', 'Active', '', '', '', '$2y$10$oSU30x61WmJVFx1CAE.Kau8Aw.z9svBg3iknezO//Nm2Ezld8dlMW'),
(12, 'Robert', 'robert', 2, 'attorney-12.jpg', 'attorney-banner-12.jpg', 'Master of Laws (LL.M.)', '<p style=\"padding: 0px; border: 0px; outline: none; color: rgb(101, 100, 100); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\">Lorem ipsum dolor sit amet, habeo albucius cum ei, sit ex sint viderer conceptam. Qui an error animal qualisque, id ius choro nusquam consectetuer, mel hinc nonumes inciderint in. Eam an dolorem partiendo, no his maiestatis expetendis. Ex nominavi eloquentiam cum, at vix tota dicam, has eu dicunt molestie interpretaris. Per choro clita possit ei, sed an posse ridens, duo mazim admodum eu. In nam explicari iracundia.</p><p style=\"padding: 0px; border: 0px; outline: none; color: rgb(101, 100, 100); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\">Has te consul ignota vocent. Quod brute disputationi ei vim, his invidunt omittantur te. Mucius aperiri concludaturque sed ut. Ius te quot latine vulputate. Ne his malis nonumy utroque.</p><p style=\"padding: 0px; border: 0px; outline: none; color: rgb(101, 100, 100); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\">Sonet malorum invidunt nec cu, nibh possim ad duo. Eros populo euripidis ne pro, his eu probatus splendide scriptorem. Idque mazim ad vix, novum antiopam sea ut, et vim dicam urbanitas adversarium. Civibus temporibus disputationi id mei.</p>', '', '', '', '', '', '', '', '', '', '', 'robert@gmail.com', '', 'Active', '', '', '', '$2y$10$aZ15oBMe.N2GkmXayohLl.HHxYoQTpj93yBDjtmHw3ZmDdFds4SFm');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_slug` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keyword` mediumtext NOT NULL,
  `meta_description` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category_name`, `category_slug`, `meta_title`, `meta_keyword`, `meta_description`) VALUES
(1, 'Litigation funding', 'litigation-funding', 'Litigation funding', '', ''),
(2, 'Personal Injury', 'personal-injury', 'Personal Injury', '', ''),
(3, 'Private Client', 'private-client', 'Private Client', '', ''),
(4, 'Property', 'property', 'Property', '', ''),
(5, 'Risk and compliance', 'risk-and-compliance', 'Risk and compliance', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category_photo`
--

CREATE TABLE `tbl_category_photo` (
  `p_category_id` int(11) NOT NULL,
  `p_category_name` varchar(255) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_category_photo`
--

INSERT INTO `tbl_category_photo` (`p_category_id`, `p_category_name`, `status`) VALUES
(1, 'Lawyers At Work', 'Active'),
(2, 'Court Room', 'Active'),
(3, 'Miami Conference', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category_video`
--

CREATE TABLE `tbl_category_video` (
  `v_category_id` int(11) NOT NULL,
  `v_category_name` varchar(255) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_category_video`
--

INSERT INTO `tbl_category_video` (`v_category_id`, `v_category_name`, `status`) VALUES
(1, 'Press Conference', 'Active'),
(2, 'Court Room', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_client`
--

CREATE TABLE `tbl_client` (
  `id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `lawyer_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_client`
--

INSERT INTO `tbl_client` (`id`, `client_id`, `lawyer_id`, `status`) VALUES
(1, 18, 9, 1),
(2, 19, 9, 1),
(11, 16, 1, 0),
(12, 16, 2, 0),
(13, 16, 3, 0),
(14, 16, 4, 0),
(15, 16, 5, 0),
(16, 16, 6, 0),
(17, 16, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment`
--

CREATE TABLE `tbl_comment` (
  `id` int(11) NOT NULL,
  `code_body` mediumtext NOT NULL,
  `code_main` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_comment`
--

INSERT INTO `tbl_comment` (`id`, `code_body`, `code_main`) VALUES
(1, '<div id=\"fb-root\"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = \"//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.10&appId=323620764400430\";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, \'script\', \'facebook-jssdk\'));</script>', '<div class=\"fb-comments\" data-href=\"https://developers.facebook.com/docs/plugins/comments#configurator\" data-numposts=\"5\"></div>');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_designation`
--

CREATE TABLE `tbl_designation` (
  `designation_id` int(11) NOT NULL,
  `designation_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_designation`
--

INSERT INTO `tbl_designation` (`designation_id`, `designation_name`) VALUES
(2, 'Medical Lawyer'),
(5, 'Criminal Lawyer'),
(6, 'Tax Lawyer');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_faq`
--

CREATE TABLE `tbl_faq` (
  `faq_id` int(11) NOT NULL,
  `faq_title` varchar(255) NOT NULL,
  `faq_content` mediumtext NOT NULL,
  `faq_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_faq`
--

INSERT INTO `tbl_faq` (`faq_id`, `faq_title`, `faq_content`, `faq_category_id`) VALUES
(1, 'Question Title 1', '<p>Mei ut errem legimus periculis, eos liber epicurei necessitatibus eu, facilisi postulant vel no. Ad mea commune disputando, cu vel choro exerci. Pri et oratio iisque atomorum, enim detracto mei ne, id eos soleat iudicabit. Ne reque reformidans mei, rebum delicata consequuntur an sit. Sea ad audire utamur. Ut mei ridens minimum intellegat, perpetua euripidis te qui, ad consul intellegebat comprehensam eum.</p>\r\n', 1),
(2, 'Question Title 2', '<p>Mei ut errem legimus periculis, eos liber epicurei necessitatibus eu, facilisi postulant vel no. Ad mea commune disputando, cu vel choro exerci. Pri et oratio iisque atomorum, enim detracto mei ne, id eos soleat iudicabit. Ne reque reformidans mei, rebum delicata consequuntur an sit. Sea ad audire utamur. Ut mei ridens minimum intellegat, perpetua euripidis te qui, ad consul intellegebat comprehensam eum.</p>\r\n', 1),
(3, 'Question Title 3', '<p>Mei ut errem legimus periculis, eos liber epicurei necessitatibus eu, facilisi postulant vel no. Ad mea commune disputando, cu vel choro exerci. Pri et oratio iisque atomorum, enim detracto mei ne, id eos soleat iudicabit. Ne reque reformidans mei, rebum delicata consequuntur an sit. Sea ad audire utamur. Ut mei ridens minimum intellegat, perpetua euripidis te qui, ad consul intellegebat comprehensam eum.</p>\r\n', 2),
(4, 'Question Title 4', '<p>Mei ut errem legimus periculis, eos liber epicurei necessitatibus eu, facilisi postulant vel no. Ad mea commune disputando, cu vel choro exerci. Pri et oratio iisque atomorum, enim detracto mei ne, id eos soleat iudicabit. Ne reque reformidans mei, rebum delicata consequuntur an sit. Sea ad audire utamur. Ut mei ridens minimum intellegat, perpetua euripidis te qui, ad consul intellegebat comprehensam eum.</p>\r\n', 2),
(5, 'Question Title 5', '<p>Mei ut errem legimus periculis, eos liber epicurei necessitatibus eu, facilisi postulant vel no. Ad mea commune disputando, cu vel choro exerci. Pri et oratio iisque atomorum, enim detracto mei ne, id eos soleat iudicabit. Ne reque reformidans mei, rebum delicata consequuntur an sit. Sea ad audire utamur. Ut mei ridens minimum intellegat, perpetua euripidis te qui, ad consul intellegebat comprehensam eum.</p>\r\n', 2),
(6, 'Question Title 6', '<p>Mei ut errem legimus periculis, eos liber epicurei necessitatibus eu, facilisi postulant vel no. Ad mea commune disputando, cu vel choro exerci. Pri et oratio iisque atomorum, enim detracto mei ne, id eos soleat iudicabit. Ne reque reformidans mei, rebum delicata consequuntur an sit. Sea ad audire utamur. Ut mei ridens minimum intellegat, perpetua euripidis te qui, ad consul intellegebat comprehensam eum.</p>\r\n', 3),
(7, 'Question Title 7', '<p>Mei ut errem legimus periculis, eos liber epicurei necessitatibus eu, facilisi postulant vel no. Ad mea commune disputando, cu vel choro exerci. Pri et oratio iisque atomorum, enim detracto mei ne, id eos soleat iudicabit. Ne reque reformidans mei, rebum delicata consequuntur an sit. Sea ad audire utamur. Ut mei ridens minimum intellegat, perpetua euripidis te qui, ad consul intellegebat comprehensam eum.</p>\r\n', 3),
(8, 'Question Title 8', '<p>Mei ut errem legimus periculis, eos liber epicurei necessitatibus eu, facilisi postulant vel no. Ad mea commune disputando, cu vel choro exerci. Pri et oratio iisque atomorum, enim detracto mei ne, id eos soleat iudicabit. Ne reque reformidans mei, rebum delicata consequuntur an sit. Sea ad audire utamur. Ut mei ridens minimum intellegat, perpetua euripidis te qui, ad consul intellegebat comprehensam eum.</p>\r\n', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_faq_category`
--

CREATE TABLE `tbl_faq_category` (
  `faq_category_id` int(11) NOT NULL,
  `faq_category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_faq_category`
--

INSERT INTO `tbl_faq_category` (`faq_category_id`, `faq_category_name`) VALUES
(1, 'General Questions'),
(2, 'Client Query'),
(3, 'Technical Questions');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_file`
--

CREATE TABLE `tbl_file` (
  `file_id` int(11) NOT NULL,
  `file_title` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_home_category`
--

CREATE TABLE `tbl_home_category` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `category_order` varchar(10) NOT NULL,
  `category_layout` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_home_category`
--

INSERT INTO `tbl_home_category` (`id`, `category_id`, `category_order`, `category_layout`) VALUES
(14, 16, '2', '2 Columns (6 posts)'),
(15, 17, '', ''),
(16, 18, '', ''),
(17, 19, '1', '2 Columns (6 posts)'),
(18, 20, '4', '2 Columns (6 posts)'),
(19, 21, '3', '2 Columns (6 posts)'),
(20, 22, '', ''),
(21, 23, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `menu_id` int(11) NOT NULL,
  `menu_type` varchar(255) NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `category_or_page_slug` varchar(255) NOT NULL,
  `menu_order` int(11) NOT NULL,
  `menu_parent` int(11) NOT NULL,
  `menu_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`menu_id`, `menu_type`, `menu_name`, `category_or_page_slug`, `menu_order`, `menu_parent`, `menu_url`) VALUES
(17, 'Other', 'Home', '', 1, 0, 'https://envato.phpscriptpoint.com/lawyer/'),
(18, 'Other', 'Pages', '', 2, 0, '#'),
(19, 'Page', 'About Us', 'about-us', 3, 18, ''),
(20, 'Page', 'Contact Us', 'contact-us', 9, 0, ''),
(21, 'Page', 'FAQ', 'faq', 4, 18, ''),
(23, 'Page', 'Photo Gallery', 'photo-gallery', 80, 22, ''),
(24, 'Page', 'Video Gallery', 'video-gallery', 81, 22, ''),
(25, 'Page', 'Blog', 'blog', 8, 0, ''),
(27, 'Page', 'Attorney', 'attorney', 6, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news`
--

CREATE TABLE `tbl_news` (
  `news_id` int(11) NOT NULL,
  `news_title` varchar(255) NOT NULL,
  `news_slug` varchar(255) NOT NULL,
  `news_content` mediumtext NOT NULL,
  `news_date` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `total_view` int(11) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keyword` mediumtext NOT NULL,
  `meta_description` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_news`
--

INSERT INTO `tbl_news` (`news_id`, `news_title`, `news_slug`, `news_content`, `news_date`, `photo`, `category_id`, `publisher`, `total_view`, `meta_title`, `meta_keyword`, `meta_description`) VALUES
(12, 'Insurers toast new discount rate plans', 'insurers-toast-new-discount-rate-plans', '<p>Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.</p><p>Solum atqui intellegebat mea an. Ne ius alterum aliquam. Ea nec populo aliquid mentitum, vis in meliore atomorum, sanctus consequat vituperatoribus duo ea. Ad doctus pertinacia ius, virtute fuisset id has, eum ut modo principes. Qui eu labore adversarium, oporteat delicata qui ut, an qui meliore principes. Id aliquid dolorum nam.</p><p>Reque pericula philosophia ut mei, volumus eligendi mandamus has an. In nobis consulatu pri, has at timeam scaevola, has simul quaeque et. Te nec sale accumsan. Dolorem prodesset efficiendi sea ea.</p><p>Et habeo modus debitis pri, vel quis fierent albucius ne. Ea animal meliore usu, nec etiam dolorum atomorum at, nam in audire mandamus omittantur. Cu ius dicam officiis molestiae, mea volumus officiis cotidieque no. Ut vel possim interpretaris, idque probatus antiopam has ad. Facilisi qualisque te sea, no dolorum mnesarchum usu.</p><p>Eum tota graeci impetus an, eirmod invenire rationibus ne mel. Ignota habemus eum ex, vis omnesque delicata perpetua an. Sit id modo invidunt sapientem, ne eum vocibus dolores phaedrum. Case praesent appellantur eu per.</p>', '26-02-2024', 'news-12.jpg', 1, 'John Doe', 0, '', '', ''),
(13, 'Disgraceful solicitor overcharged estate by 574%', 'disgraceful-solicitor-overcharged-estate-by-574-', '<p>Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.</p><p>Solum atqui intellegebat mea an. Ne ius alterum aliquam. Ea nec populo aliquid mentitum, vis in meliore atomorum, sanctus consequat vituperatoribus duo ea. Ad doctus pertinacia ius, virtute fuisset id has, eum ut modo principes. Qui eu labore adversarium, oporteat delicata qui ut, an qui meliore principes. Id aliquid dolorum nam.</p><p>Reque pericula philosophia ut mei, volumus eligendi mandamus has an. In nobis consulatu pri, has at timeam scaevola, has simul quaeque et. Te nec sale accumsan. Dolorem prodesset efficiendi sea ea.</p><p>Et habeo modus debitis pri, vel quis fierent albucius ne. Ea animal meliore usu, nec etiam dolorum atomorum at, nam in audire mandamus omittantur. Cu ius dicam officiis molestiae, mea volumus officiis cotidieque no. Ut vel possim interpretaris, idque probatus antiopam has ad. Facilisi qualisque te sea, no dolorum mnesarchum usu.</p><p>Eum tota graeci impetus an, eirmod invenire rationibus ne mel. Ignota habemus eum ex, vis omnesque delicata perpetua an. Sit id modo invidunt sapientem, ne eum vocibus dolores phaedrum. Case praesent appellantur eu per.</p>', '26-02-2024', 'news-13.jpg', 3, 'robert', 0, '', '', ''),
(14, ' Holiday sickness claims farmer stripped of licence', '-holiday-sickness-claims-farmer-stripped-of-licence', '<p>Lorem ipsum dolor sit amet, qui case probo velit no, an postea scaevola partiendo mei. Id mea fuisset perpetua referrentur. Ut everti ceteros mei, alii discere eum no, duo id malis iuvaret. Ad sint everti accusam vel, ea viderer suscipiantur pri. Brute option minimum in cum, ignota iuvaret an pro.</p><p>Solum atqui intellegebat mea an. Ne ius alterum aliquam. Ea nec populo aliquid mentitum, vis in meliore atomorum, sanctus consequat vituperatoribus duo ea. Ad doctus pertinacia ius, virtute fuisset id has, eum ut modo principes. Qui eu labore adversarium, oporteat delicata qui ut, an qui meliore principes. Id aliquid dolorum nam.</p><p>Reque pericula philosophia ut mei, volumus eligendi mandamus has an. In nobis consulatu pri, has at timeam scaevola, has simul quaeque et. Te nec sale accumsan. Dolorem prodesset efficiendi sea ea.</p><p>Et habeo modus debitis pri, vel quis fierent albucius ne. Ea animal meliore usu, nec etiam dolorum atomorum at, nam in audire mandamus omittantur. Cu ius dicam officiis molestiae, mea volumus officiis cotidieque no. Ut vel possim interpretaris, idque probatus antiopam has ad. Facilisi qualisque te sea, no dolorum mnesarchum usu.</p><p>Eum tota graeci impetus an, eirmod invenire rationibus ne mel. Ignota habemus eum ex, vis omnesque delicata perpetua an. Sit id modo invidunt sapientem, ne eum vocibus dolores phaedrum. Case praesent appellantur eu per.</p>', '26-02-2024', 'news-14.jpg', 4, 'alien', 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_page`
--

CREATE TABLE `tbl_page` (
  `page_id` int(11) NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `page_slug` varchar(255) NOT NULL,
  `page_content` mediumtext NOT NULL,
  `page_layout` varchar(255) NOT NULL,
  `banner` varchar(255) NOT NULL,
  `status` varchar(30) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keyword` mediumtext NOT NULL,
  `meta_description` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_page`
--

INSERT INTO `tbl_page` (`page_id`, `page_name`, `page_slug`, `page_content`, `page_layout`, `banner`, `status`, `meta_title`, `meta_keyword`, `meta_description`) VALUES
(5, 'Photo Gallery', 'photo-gallery', '', 'Photo Gallery Page Layout', 'page-banner-5.jpg', 'Active', 'Photo Gallery Page', '', ''),
(6, 'Video Gallery', 'video-gallery', '', 'Video Gallery Page Layout', 'page-banner-6.jpg', 'Active', 'Video Gallery Page', '', ''),
(11, 'About Us', 'about-us', '<p>Lorem ipsum dolor sit amet, at pro eleifend vulputate, vim movet regione ad. Has veritus adipisci aliquando eu, fugit eripuit dignissim per ea, sanctus omittam assueverit his ex. Nulla affert vix in, ei sea dolore dolores vivendum. Vix eros postea an, ius suas ubique habemus an, wisi nulla ex mel. Saepe postulant concludaturque at has. Exerci tincidunt interesset ne per, pro bonorum utroque appetere ad.</p><p>Est ea corpora deserunt cotidieque, quo te vero melius assentior, pri ex velit altera iuvaret. Tibique hendrerit voluptaria ad quo. Ut appetere reprimique qui, aliquip suscipiantur ex eos. Nibh vero nusquam his eu, agam summo democritum mea ne. Ius in novum scripta, atqui appetere efficiantur an vel, ex probo modus temporibus nam.</p><p>Ea feugiat nominavi quo, debet gubergren elaboraret at cum, mel timeam vivendo mentitum cu. Aeque civibus luptatum cu eos. Novum facilisi insolens his et, ex aliquip tibique laboramus vim. Vix brute appellantur ei.</p><p>Nec eros viderer ne, mel ad suas offendit suavitate, te pri laoreet legendos hendrerit. Per ut paulo urbanitas mediocritatem, in sea facilisis imperdiet torquatos, ea vis soleat fierent pertinacia. Maiestatis reprimique no est, ut ius esse tation. Nam animal discere omnesque at. Evertitur adipiscing vis ei, his ut luptatum recteque, et idque mundi vim.</p><p>Adhuc vocibus at mei, nulla altera eu vim. At sit quot ferri everti. Mea ea doming dictas possim. Te mea facete nominati constituam, no discere democritum has, ei nam eirmod vocent deserunt. Eu wisi voluptatibus mea, elit errem ad pro, vim quando denique id. Labitur accommodare eam at.</p>', 'Full Width Page Layout', 'page-banner-11.jpg', 'Active', '', '', ''),
(12, 'FAQ', 'faq', '', 'FAQ Page Layout', 'page-banner-12.jpg', 'Active', '', '', ''),
(13, 'Attorney', 'attorney', '', 'Attorney Page Layout', 'page-banner-13.jpg', 'Active', '', '', ''),
(14, 'Blog', 'blog', '', 'Blog Page Layout', 'page-banner-14.jpg', 'Active', '', '', ''),
(15, 'Contact Us', 'contact-us', '', 'Contact Us Page Layout', 'page-banner-15.jpg', 'Active', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_partner`
--

CREATE TABLE `tbl_partner` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_photo`
--

CREATE TABLE `tbl_photo` (
  `photo_id` int(11) NOT NULL,
  `photo_caption` varchar(255) NOT NULL,
  `photo_name` varchar(255) NOT NULL,
  `p_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_photo`
--

INSERT INTO `tbl_photo` (`photo_id`, `photo_caption`, `photo_name`, `p_category_id`) VALUES
(8, 'Photo 1', 'photo-8.jpg', 1),
(9, 'Photo 2', 'photo-9.jpg', 1),
(10, 'Photo 3', 'photo-10.jpg', 1),
(11, 'Photo 4', 'photo-11.jpg', 1),
(12, 'Photo 5', 'photo-12.jpg', 2),
(13, 'Photo 6', 'photo-13.png', 2),
(14, 'Photo 7', 'photo-14.jpg', 2),
(15, 'Photo 8', 'photo-15.jpg', 2),
(16, 'Photo 9', 'photo-16.jpg', 3),
(17, 'Photo 10', 'photo-17.jpg', 3),
(18, 'Photo 11', 'photo-18.jpg', 3),
(19, 'Photo 12', 'photo-19.jpg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pricing_item`
--

CREATE TABLE `tbl_pricing_item` (
  `pricing_item_id` int(11) NOT NULL,
  `pricing_item_name` mediumtext NOT NULL,
  `pricing_plan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_pricing_item`
--

INSERT INTO `tbl_pricing_item` (`pricing_item_id`, `pricing_item_name`, `pricing_plan_id`) VALUES
(1, '6 Specialties', 1),
(2, '30 Tests and Treatments', 1),
(3, '1 Medical Consultation', 1),
(4, '1 Home Visit', 1),
(5, 'No Pregnancy Care', 1),
(6, 'No Assistance', 1),
(7, '12 Specialties', 2),
(8, '24 Specialties', 3),
(9, '90 Tests and Treatments', 2),
(10, '160 Tests and Treatments', 3),
(11, '2 Medical Consultation', 2),
(12, '4 Medical Consultation', 3),
(13, '2 Home Visit', 2),
(14, '4 Home Visit', 3),
(15, 'Available Pregnancy Care', 2),
(16, 'Available Pregnancy Care', 3),
(17, '24 Hours Assistance', 2),
(18, '24 Hours Assistance', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pricing_plan`
--

CREATE TABLE `tbl_pricing_plan` (
  `pricing_plan_id` int(11) NOT NULL,
  `pricing_plan_name` varchar(255) NOT NULL,
  `pricing_plan_price` varchar(100) NOT NULL,
  `pricing_plan_button_text` varchar(255) NOT NULL,
  `pricing_plan_button_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_pricing_plan`
--

INSERT INTO `tbl_pricing_plan` (`pricing_plan_id`, `pricing_plan_name`, `pricing_plan_price`, `pricing_plan_button_text`, `pricing_plan_button_url`) VALUES
(1, 'Basic', '199', 'Select', '#'),
(2, 'Platinum', '299', 'Select', '#'),
(3, 'Gold', '399', 'Select', '#');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_service`
--

CREATE TABLE `tbl_service` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `short_description` mediumtext NOT NULL,
  `photo` varchar(255) NOT NULL,
  `banner` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_service`
--

INSERT INTO `tbl_service` (`id`, `name`, `slug`, `description`, `short_description`, `photo`, `banner`) VALUES
(12, 'Family Law', 'family-law-1', '<p>Ad his <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549776502059277528\">diam</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549776504207005394\">eirmod</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549776511368374209\">persecuti</gwmw>. <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796248253932642\">Eum</gwmw> health cube <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796245226057529\">scriptorem</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796246772081832\">eu</gwmw>, <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796246079383730\">eu</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796248678069006\">aperiri</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796242415282094\">definiebas</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796244864493159\">concludaturque</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796243739547873\">eam</gwmw>. Ad his <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549802549895823410\">diam</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549802546574220158\">eirmod</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549802540321802334\">persecuti</gwmw>. <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796292155375720\">Eum</gwmw> health cube <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796292071777331\">scriptorem</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796291890756125\">eu</gwmw>, <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796291103979466\">eu</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796291642168789\">aperiri</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796297733819427\">definiebas</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796292159255559\">concludaturque</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796293065696641\">eam</gwmw>. Ad his <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549802629323640394\">diam</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549802621813916006\">eirmod</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549802620810627732\">persecuti</gwmw>. <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796347531684881\">Eum</gwmw> health cube <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796340547709706\">scriptorem</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796343867373083\">eu</gwmw>, <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796340493162132\">eu</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796347418764617\">aperiri</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796345624972873\">definiebas</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796343407799476\">concludaturque</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796346891990195\">eam</gwmw>. Ad his <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549802709053564894\">diam</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549802705895276603\">eirmod</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549802705144027408\">persecuti</gwmw>. <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796387189228837\">Eum</gwmw> health cube <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796380637946988\">scriptorem</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796384674300998\">eu</gwmw>, <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796386594731580\">eu</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796380221429890\">aperiri</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796389525704824\">definiebas</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796388836079930\">concludaturque</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796382886412553\">eam</gwmw>. Ad his <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549802768817900962\">diam</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549802760852302792\">eirmod</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549802766740878042\">persecuti</gwmw>. <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796438772131190\">Eum</gwmw> health cube <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796434464872051\">scriptorem</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796430274061662\">eu</gwmw>, <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796431705103362\">eu</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796431943146125\">aperiri</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796438023872186\">definiebas</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796435116117588\">concludaturque</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796430607153475\">eam</gwmw>. Ad his <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549802837653821461\">diam</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549802835414650002\">eirmod</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549802837619326759\">persecuti</gwmw>. <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796486534000846\">Eum</gwmw> health cube <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796486404865520\">scriptorem</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796480843644222\">eu</gwmw>, <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796496396652561\">eu</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796496821203347\">aperiri</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796490936541681\">definiebas</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796498988420215\">concludaturque</gwmw> <gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539549796498516502584\">eam</gwmw>.<br></p>', 'Ad his diam eirmod persecuti. Eum health cube scriptorem eu, eu aperiri definiebas concludaturque eam. eu aperiri definiebas concludaturque eam. ', 'service-12.jpg', 'service-banner-12.jpg'),
(13, 'Medical Law', 'medical-law', '<p>Ad his&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550070961077360993\">diam</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550070964585090175\">eirmod</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550070964614340182\">persecuti</gwmw>.&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083501998491381\">Eum</gwmw>&nbsp;health cube&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083501738520226\">scriptorem</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083503099997420\">eu</gwmw>,&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083507160199678\">eu</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083503222102720\">aperiri</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083501493290378\">definiebas</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083501232564951\">concludaturque</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083504321017671\">eam</gwmw>.&nbsp;Ad his&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089654839473190\">diam</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089659953561636\">eirmod</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089655489881083\">persecuti</gwmw>.&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083604765497642\">Eum</gwmw>&nbsp;health cube&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083606990872995\">scriptorem</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083607599982067\">eu</gwmw>,&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083604839161688\">eu</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083603008615916\">aperiri</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083604312322551\">definiebas</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083604191618301\">concludaturque</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083607369532256\">eam</gwmw>.&nbsp;Ad his&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089773213058755\">diam</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089773367774359\">eirmod</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089778740454743\">persecuti</gwmw>.&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083674180432370\">Eum</gwmw>&nbsp;health cube&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083677301815620\">scriptorem</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083676536568956\">eu</gwmw>,&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083674057551000\">eu</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083677538992168\">aperiri</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083676043494034\">definiebas</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083671602945864\">concludaturque</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083672608625821\">eam</gwmw>.&nbsp;Ad his&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089878287074202\">diam</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089873965828538\">eirmod</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089874647434686\">persecuti</gwmw>.&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083840894489545\">Eum</gwmw>&nbsp;health cube&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083845807794595\">scriptorem</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083840532493069\">eu</gwmw>,&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083843166519143\">eu</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083849535379003\">aperiri</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083846291294116\">definiebas</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083841345985491\">concludaturque</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083841330445564\">eam</gwmw>.&nbsp;Ad his&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089947603978193\">diam</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089947399185189\">eirmod</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089944510880767\">persecuti</gwmw>.&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083892909856434\">Eum</gwmw>&nbsp;health cube&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083892864792345\">scriptorem</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083893025831349\">eu</gwmw>,&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083898553922022\">eu</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083891073225200\">aperiri</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083897709592603\">definiebas</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083891180964410\">concludaturque</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083895860358836\">eam</gwmw>.&nbsp;Ad his&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550090040944482438\">diam</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550090045625321163\">eirmod</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550090048656028908\">persecuti</gwmw>.&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083949803347131\">Eum</gwmw>&nbsp;health cube&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083946989323688\">scriptorem</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083945747676916\">eu</gwmw>,&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083947787704349\">eu</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083941351911383\">aperiri</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083949381448132\">definiebas</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083947607275322\">concludaturque</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083941289559693\">eam</gwmw>.<br></p>', 'Ad his diam eirmod persecuti. Eum health cube scriptorem eu, eu aperiri definiebas concludaturque eam.Â eu aperiri definiebas concludaturque eam. ', 'service-13.jpg', 'service-banner-13.jpg'),
(14, 'Property Law', 'property-law', '<p>Ad his&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550070961077360993\">diam</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550070964585090175\">eirmod</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550070964614340182\">persecuti</gwmw>.&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083501998491381\">Eum</gwmw>&nbsp;health cube&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083501738520226\">scriptorem</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083503099997420\">eu</gwmw>,&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083507160199678\">eu</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083503222102720\">aperiri</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083501493290378\">definiebas</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083501232564951\">concludaturque</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083504321017671\">eam</gwmw>.&nbsp;Ad his&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089654839473190\">diam</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089659953561636\">eirmod</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089655489881083\">persecuti</gwmw>.&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083604765497642\">Eum</gwmw>&nbsp;health cube&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083606990872995\">scriptorem</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083607599982067\">eu</gwmw>,&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083604839161688\">eu</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083603008615916\">aperiri</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083604312322551\">definiebas</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083604191618301\">concludaturque</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083607369532256\">eam</gwmw>.&nbsp;Ad his&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089773213058755\">diam</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089773367774359\">eirmod</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089778740454743\">persecuti</gwmw>.&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083674180432370\">Eum</gwmw>&nbsp;health cube&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083677301815620\">scriptorem</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083676536568956\">eu</gwmw>,&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083674057551000\">eu</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083677538992168\">aperiri</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083676043494034\">definiebas</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083671602945864\">concludaturque</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083672608625821\">eam</gwmw>.&nbsp;Ad his&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089878287074202\">diam</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089873965828538\">eirmod</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089874647434686\">persecuti</gwmw>.&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083840894489545\">Eum</gwmw>&nbsp;health cube&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083845807794595\">scriptorem</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083840532493069\">eu</gwmw>,&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083843166519143\">eu</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083849535379003\">aperiri</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083846291294116\">definiebas</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083841345985491\">concludaturque</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083841330445564\">eam</gwmw>.&nbsp;Ad his&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089947603978193\">diam</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089947399185189\">eirmod</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089944510880767\">persecuti</gwmw>.&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083892909856434\">Eum</gwmw>&nbsp;health cube&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083892864792345\">scriptorem</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083893025831349\">eu</gwmw>,&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083898553922022\">eu</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083891073225200\">aperiri</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083897709592603\">definiebas</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083891180964410\">concludaturque</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083895860358836\">eam</gwmw>.&nbsp;Ad his&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550090040944482438\">diam</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550090045625321163\">eirmod</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550090048656028908\">persecuti</gwmw>.&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083949803347131\">Eum</gwmw>&nbsp;health cube&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083946989323688\">scriptorem</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083945747676916\">eu</gwmw>,&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083947787704349\">eu</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083941351911383\">aperiri</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083949381448132\">definiebas</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083947607275322\">concludaturque</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083941289559693\">eam</gwmw>.<br></p>', 'Ad his diam eirmod persecuti. Eum health cube scriptorem eu, eu aperiri definiebas concludaturque eam.Â eu aperiri definiebas concludaturque eam. ', 'service-14.jpg', 'service-banner-14.jpg'),
(15, 'Insurance Law', 'insurance-law', '<p>Ad his&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550070961077360993\">diam</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550070964585090175\">eirmod</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550070964614340182\">persecuti</gwmw>.&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083501998491381\">Eum</gwmw>&nbsp;health cube&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083501738520226\">scriptorem</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083503099997420\">eu</gwmw>,&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083507160199678\">eu</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083503222102720\">aperiri</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083501493290378\">definiebas</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083501232564951\">concludaturque</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083504321017671\">eam</gwmw>.&nbsp;Ad his&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089654839473190\">diam</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089659953561636\">eirmod</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089655489881083\">persecuti</gwmw>.&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083604765497642\">Eum</gwmw>&nbsp;health cube&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083606990872995\">scriptorem</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083607599982067\">eu</gwmw>,&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083604839161688\">eu</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083603008615916\">aperiri</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083604312322551\">definiebas</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083604191618301\">concludaturque</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083607369532256\">eam</gwmw>.&nbsp;Ad his&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089773213058755\">diam</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089773367774359\">eirmod</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089778740454743\">persecuti</gwmw>.&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083674180432370\">Eum</gwmw>&nbsp;health cube&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083677301815620\">scriptorem</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083676536568956\">eu</gwmw>,&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083674057551000\">eu</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083677538992168\">aperiri</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083676043494034\">definiebas</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083671602945864\">concludaturque</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083672608625821\">eam</gwmw>.&nbsp;Ad his&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089878287074202\">diam</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089873965828538\">eirmod</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089874647434686\">persecuti</gwmw>.&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083840894489545\">Eum</gwmw>&nbsp;health cube&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083845807794595\">scriptorem</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083840532493069\">eu</gwmw>,&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083843166519143\">eu</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083849535379003\">aperiri</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083846291294116\">definiebas</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083841345985491\">concludaturque</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083841330445564\">eam</gwmw>.&nbsp;Ad his&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089947603978193\">diam</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089947399185189\">eirmod</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550089944510880767\">persecuti</gwmw>.&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083892909856434\">Eum</gwmw>&nbsp;health cube&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083892864792345\">scriptorem</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083893025831349\">eu</gwmw>,&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083898553922022\">eu</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083891073225200\">aperiri</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083897709592603\">definiebas</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083891180964410\">concludaturque</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083895860358836\">eam</gwmw>.&nbsp;Ad his&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550090040944482438\">diam</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550090045625321163\">eirmod</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550090048656028908\">persecuti</gwmw>.&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083949803347131\">Eum</gwmw>&nbsp;health cube&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083946989323688\">scriptorem</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083945747676916\">eu</gwmw>,&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083947787704349\">eu</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083941351911383\">aperiri</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083949381448132\">definiebas</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083947607275322\">concludaturque</gwmw>&nbsp;<gwmw class=\"ginger-module-highlighter-mistake-type-1\" id=\"gwmw-15539550083941289559693\">eam</gwmw>.<br></p>', 'Ad his diam eirmod persecuti. Eum health cube scriptorem eu, eu aperiri definiebas concludaturque eam.Â eu aperiri definiebas concludaturque eam. ', 'service-15.jpg', 'service-banner-15.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `id` int(11) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `footer_about` mediumtext NOT NULL,
  `footer_copyright` mediumtext NOT NULL,
  `contact_address` mediumtext NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `contact_phone` varchar(255) NOT NULL,
  `contact_fax` varchar(255) NOT NULL,
  `contact_map_iframe` mediumtext NOT NULL,
  `recaptcha_status` text NOT NULL,
  `recaptcha_site_key` mediumtext NOT NULL,
  `send_email_from` text NOT NULL,
  `receive_email_to` text NOT NULL,
  `smtp_active` text NOT NULL,
  `smtp_ssl` text NOT NULL,
  `smtp_host` text NOT NULL,
  `smtp_port` text NOT NULL,
  `smtp_username` text NOT NULL,
  `smtp_password` text NOT NULL,
  `total_recent_news_footer` int(10) NOT NULL,
  `total_popular_news_footer` int(10) NOT NULL,
  `total_recent_news_sidebar` int(11) NOT NULL,
  `total_popular_news_sidebar` int(11) NOT NULL,
  `total_recent_news_home_page` int(11) NOT NULL,
  `meta_title_home` mediumtext NOT NULL,
  `meta_keyword_home` mediumtext NOT NULL,
  `meta_description_home` mediumtext NOT NULL,
  `home_title_service` varchar(255) NOT NULL,
  `home_subtitle_service` varchar(255) NOT NULL,
  `home_status_service` int(11) NOT NULL,
  `home_title_attorney` varchar(255) NOT NULL,
  `home_subtitle_attorney` varchar(255) NOT NULL,
  `home_status_attorney` int(11) NOT NULL,
  `home_title_testimonial` varchar(255) NOT NULL,
  `home_subtitle_testimonial` varchar(255) NOT NULL,
  `home_status_testimonial` int(11) NOT NULL,
  `home_title_news` varchar(255) NOT NULL,
  `home_subtitle_news` varchar(255) NOT NULL,
  `home_status_news` int(11) NOT NULL,
  `home_title_partner` varchar(255) NOT NULL,
  `home_subtitle_partner` varchar(255) NOT NULL,
  `home_status_partner` int(11) NOT NULL,
  `preloader_status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_settings`
--

INSERT INTO `tbl_settings` (`id`, `logo`, `favicon`, `footer_about`, `footer_copyright`, `contact_address`, `contact_email`, `contact_phone`, `contact_fax`, `contact_map_iframe`, `recaptcha_status`, `recaptcha_site_key`, `send_email_from`, `receive_email_to`, `smtp_active`, `smtp_ssl`, `smtp_host`, `smtp_port`, `smtp_username`, `smtp_password`, `total_recent_news_footer`, `total_popular_news_footer`, `total_recent_news_sidebar`, `total_popular_news_sidebar`, `total_recent_news_home_page`, `meta_title_home`, `meta_keyword_home`, `meta_description_home`, `home_title_service`, `home_subtitle_service`, `home_status_service`, `home_title_attorney`, `home_subtitle_attorney`, `home_status_attorney`, `home_title_testimonial`, `home_subtitle_testimonial`, `home_status_testimonial`, `home_title_news`, `home_subtitle_news`, `home_status_news`, `home_title_partner`, `home_subtitle_partner`, `home_status_partner`, `preloader_status`) VALUES
(1, 'logo.png', 'favicon.png', '<p>Lorem ipsum dolor sit amet, omnis signiferumque in mei, mei ex enim concludaturque. Senserit salutandi euripidis no per, modus maiestatis scribentur est an.&nbsp;Ea suas pertinax has, solet officiis pericula cu pro, possit inermis qui ad. An mea tale perfecto sententiae, eos inani epicuri concludaturque ex.</p>\r\n', 'Copyright Â© 2019. All Rights Reserved.', 'ABC Steet, NewYork.', 'info@yourwebsite.com', '123-456-7878', '123-456-7890', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d387142.84040262736!2d-74.25819605476612!3d40.70583158628177!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew+York%2C+NY%2C+USA!5e0!3m2!1sen!2sbd!4v1485712851643\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', 'On', '6LfzGuEZAAAAADZrHN3QDdPLYfS3I6BaKmjWjryh', 'contact@yourwebsite.com', 'contact@yourwebsite.com', 'Yes', 'Yes', 'smtp_host', 'smtp_port', 'smtp_username', 'smtp_password', 3, 3, 4, 4, 7, 'Lawyer - Law and Attorney Website CMS', 'law, lawyer, attorney, legal, justice, criminal law, medical law, education law, trade law, transportation law, family law, crime', 'Lawyer is a nice and clean responsive cms on online law and attorney management system.', 'Our Services', 'We Are Here to Provide You Awesome Service Always', 1, 'Our Expert Attorneys', 'Meet with All Our Qualified Attorneys', 1, 'Testimonial', 'Our Happy Clients Tell About Us', 1, 'Latest News', 'See All Our Updated and Latest News', 1, 'Our Partners', 'All Our Company Partners are Listed Below', 1, 'Off');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_slider`
--

CREATE TABLE `tbl_slider` (
  `id` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `heading` varchar(255) NOT NULL,
  `subheading` mediumtext NOT NULL,
  `content` varchar(255) NOT NULL,
  `button_text` varchar(255) NOT NULL,
  `button_url` varchar(255) NOT NULL,
  `position` varchar(20) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_slider`
--

INSERT INTO `tbl_slider` (`id`, `photo`, `heading`, `subheading`, `content`, `button_text`, `button_url`, `position`, `status`) VALUES
(3, 'slider-3.jpg', 'c o d e l i s t . c c', 'We provide the best solution to clients', 'Lorem ipsum dolor sit amet, ad vim indoctum maluisset. \r\nPosse philosophia id sed, qui ut saepe nonumes.', 'Read More', '#', 'Right', 'Active'),
(4, 'slider-4.jpg', 'C O D E L I S T . C C', 'We provide the best solution to clients', 'Lorem ipsum dolor sit amet, ad vim indoctum maluisset. \r\nPosse philosophia id sed, qui ut saepe nonumes.', 'Read More', '#', 'Left', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_social`
--

CREATE TABLE `tbl_social` (
  `social_id` int(11) NOT NULL,
  `social_name` varchar(30) NOT NULL,
  `social_url` varchar(255) NOT NULL,
  `social_icon` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_social`
--

INSERT INTO `tbl_social` (`social_id`, `social_name`, `social_url`, `social_icon`) VALUES
(1, 'Facebook', '#', 'fa fa-facebook'),
(2, 'Twitter', '#', 'fa fa-twitter'),
(3, 'LinkedIn', '#', 'fa fa-linkedin'),
(4, 'Google Plus', '#', 'fa fa-google-plus'),
(5, 'Pinterest', '#', 'fa fa-pinterest'),
(6, 'YouTube', '#', 'fa fa-youtube'),
(7, 'Instagram', '', 'fa fa-instagram'),
(8, 'Tumblr', '', 'fa fa-tumblr'),
(9, 'Flickr', '', 'fa fa-flickr'),
(10, 'Reddit', '', 'fa fa-reddit'),
(11, 'Snapchat', '', 'fa fa-snapchat'),
(12, 'WhatsApp', '', 'fa fa-whatsapp'),
(13, 'Quora', '', 'fa fa-quora'),
(14, 'StumbleUpon', '', 'fa fa-stumbleupon'),
(15, 'Delicious', '', 'fa fa-delicious'),
(16, 'Digg', '', 'fa fa-digg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_testimonial`
--

CREATE TABLE `tbl_testimonial` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_testimonial`
--

INSERT INTO `tbl_testimonial` (`id`, `name`, `designation`, `company`, `photo`, `comment`) VALUES
(1, 'John Doe', 'Managing Director', 'ABC Inc.', 'testimonial-1.jpg', 'Ancillae interpretaris ea has. Id amet impedit qui, eripuit mnesarchum percipitur in eam. Ne sit habeo inimicus, no his liber regione volutpat. Ex quot voluptaria usu, dolor vivendo docendi nec ea. Et atqui vocent integre vim, quod cibo recusabo ei usu, s'),
(2, 'Asif Ikbal', 'CEO', 'Typhon Multimedia', 'testimonial-2.jpg', 'Ancillae interpretaris ea has. Id amet impedit qui, eripuit mnesarchum percipitur in eam. Ne sit habeo inimicus, no his liber regione volutpat. Ex quot voluptaria usu, dolor vivendo docendi nec ea. Et atqui vocent integre vim, quod cibo recusabo ei usu, s');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(10) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` text NOT NULL,
  `photo` varchar(255) NOT NULL,
  `role` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `full_name`, `email`, `phone`, `password`, `token`, `photo`, `role`, `status`) VALUES
(1, 'John Doe', 'sadmin@gmail.com', '111-222-3333', '81dc9bdb52d04dc20036dbd8313ed055', '', 'user-1.jpg', 'Super Admin', 'Active'),
(13, 'David Smith', 'admin@gmail.com', '', '81dc9bdb52d04dc20036dbd8313ed055', '', 'user-2.jpg', 'Admin', 'Active'),
(14, 'Peter Kanny', 'publisher@gmail.com', '', '81dc9bdb52d04dc20036dbd8313ed055', '', 'user-3.jpg', 'Publisher', 'Active'),
(15, 'haider raza', 'muhammadajmalbashir44@gmail.com', '', '$2y$10$zy/OW2NdSjfAGEowtNxep.WDfgqs39hGX42He75uLK1zQnVqoZGta', '', '', '', 'Active'),
(16, 'ajmal', 'ajmal@test.com', '', '$2y$10$IZfJVXIHkCheoKBTbIsdg.j9IOhfQQFuTIhoacMu3OcJqLvJeIyGS', '', '', '', 'Active'),
(17, 'alli', 'alli@gmail.com', '', '$2y$10$caexSlZRZVggncE288KBsOFKv7f45escy/6J2vivrmmRfRVQz.iUu', '', '', '', 'Active'),
(18, 'Ajmal Bashir', 'ajmal1@gmail.com', '', '$2y$10$Lmqx245XTxgComat3OO6CeYnEqQe7o8Vnu.4NN68hWgDKCrkf0bcW', '', '', '', 'Active'),
(19, 'majmal', 'majmal@test.com', '', '$2y$10$zeCFBWLIrAAnOnnMGtQY7e.IFDxtwY6txvDKkeiRlVFQyG/sNzibC', '', '', '', 'Active'),
(20, 'shahbaz', 'shahbaz@test.com', '', '$2y$10$pTUwWagXHh7x7gZLXngL8OAAsSrR.hzSo7BgllzNd08Hrhp4Y9rU.', '', '', '', 'Active'),
(21, 'adnan', 'adnan@test.com', '', '$2y$10$bYrVRGgjwAXq7h./Csn.NubaJTeZSKfSwGCVEmmNmbJD.VftYcZlq', '', '', 'user', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_video`
--

CREATE TABLE `tbl_video` (
  `video_id` int(11) NOT NULL,
  `video_title` varchar(255) NOT NULL,
  `video_iframe` mediumtext NOT NULL,
  `v_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_video`
--

INSERT INTO `tbl_video` (`video_id`, `video_title`, `video_iframe`, `v_category_id`) VALUES
(3, 'Video 1', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/4dlLD5uTkFk\" frameborder=\"0\" allowfullscreen></iframe>', 1),
(4, 'Video 2', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/62uvL4ZpQS0\" frameborder=\"0\" allowfullscreen></iframe>', 2),
(5, 'Video 3', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Lbnkkxksqls\" frameborder=\"0\" allowfullscreen></iframe>', 1),
(6, 'Video 4', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Y0bbAcF49KI\" frameborder=\"0\" allowfullscreen></iframe>', 1),
(7, 'Video 5', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/kGjz4V0ZMY4\" frameborder=\"0\" allowfullscreen></iframe>', 2),
(8, 'Video 6', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/wsyadz5a5e8\" frameborder=\"0\" allowfullscreen></iframe>', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_appointment`
--
ALTER TABLE `tbl_appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_attorney`
--
ALTER TABLE `tbl_attorney`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_category_photo`
--
ALTER TABLE `tbl_category_photo`
  ADD PRIMARY KEY (`p_category_id`);

--
-- Indexes for table `tbl_category_video`
--
ALTER TABLE `tbl_category_video`
  ADD PRIMARY KEY (`v_category_id`);

--
-- Indexes for table `tbl_client`
--
ALTER TABLE `tbl_client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_designation`
--
ALTER TABLE `tbl_designation`
  ADD PRIMARY KEY (`designation_id`);

--
-- Indexes for table `tbl_faq`
--
ALTER TABLE `tbl_faq`
  ADD PRIMARY KEY (`faq_id`);

--
-- Indexes for table `tbl_faq_category`
--
ALTER TABLE `tbl_faq_category`
  ADD PRIMARY KEY (`faq_category_id`);

--
-- Indexes for table `tbl_file`
--
ALTER TABLE `tbl_file`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `tbl_home_category`
--
ALTER TABLE `tbl_home_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `tbl_news`
--
ALTER TABLE `tbl_news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `tbl_page`
--
ALTER TABLE `tbl_page`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `tbl_partner`
--
ALTER TABLE `tbl_partner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_photo`
--
ALTER TABLE `tbl_photo`
  ADD PRIMARY KEY (`photo_id`);

--
-- Indexes for table `tbl_pricing_item`
--
ALTER TABLE `tbl_pricing_item`
  ADD PRIMARY KEY (`pricing_item_id`);

--
-- Indexes for table `tbl_pricing_plan`
--
ALTER TABLE `tbl_pricing_plan`
  ADD PRIMARY KEY (`pricing_plan_id`);

--
-- Indexes for table `tbl_service`
--
ALTER TABLE `tbl_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_slider`
--
ALTER TABLE `tbl_slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_social`
--
ALTER TABLE `tbl_social`
  ADD PRIMARY KEY (`social_id`);

--
-- Indexes for table `tbl_testimonial`
--
ALTER TABLE `tbl_testimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_video`
--
ALTER TABLE `tbl_video`
  ADD PRIMARY KEY (`video_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_appointment`
--
ALTER TABLE `tbl_appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_attorney`
--
ALTER TABLE `tbl_attorney`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_category_photo`
--
ALTER TABLE `tbl_category_photo`
  MODIFY `p_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_category_video`
--
ALTER TABLE `tbl_category_video`
  MODIFY `v_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_client`
--
ALTER TABLE `tbl_client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_designation`
--
ALTER TABLE `tbl_designation`
  MODIFY `designation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_faq`
--
ALTER TABLE `tbl_faq`
  MODIFY `faq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_faq_category`
--
ALTER TABLE `tbl_faq_category`
  MODIFY `faq_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_file`
--
ALTER TABLE `tbl_file`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_home_category`
--
ALTER TABLE `tbl_home_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tbl_news`
--
ALTER TABLE `tbl_news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_page`
--
ALTER TABLE `tbl_page`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_partner`
--
ALTER TABLE `tbl_partner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_photo`
--
ALTER TABLE `tbl_photo`
  MODIFY `photo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tbl_pricing_item`
--
ALTER TABLE `tbl_pricing_item`
  MODIFY `pricing_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_pricing_plan`
--
ALTER TABLE `tbl_pricing_plan`
  MODIFY `pricing_plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_service`
--
ALTER TABLE `tbl_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_slider`
--
ALTER TABLE `tbl_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_social`
--
ALTER TABLE `tbl_social`
  MODIFY `social_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_testimonial`
--
ALTER TABLE `tbl_testimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tbl_video`
--
ALTER TABLE `tbl_video`
  MODIFY `video_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
