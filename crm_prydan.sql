-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2022 at 10:02 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crm_prydan`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_rtblentity`
--

CREATE TABLE `api_rtblentity` (
  `id` bigint(20) NOT NULL,
  `Designation` varchar(30) DEFAULT NULL,
  `AddressIDF_id` int(11) DEFAULT NULL,
  `CompanyIDF_id` int(11) DEFAULT NULL,
  `EntityTypeIDF_id` int(11) DEFAULT NULL,
  `PersonIDF_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_rtblentity`
--

INSERT INTO `api_rtblentity` (`id`, `Designation`, `AddressIDF_id`, `CompanyIDF_id`, `EntityTypeIDF_id`, `PersonIDF_id`) VALUES
(1, 'Software Developer', 35, 14, 1, 42),
(3, NULL, 37, 16, 2, NULL),
(4, NULL, 38, 17, 2, NULL),
(5, 'Software Developer', 39, NULL, 1, 44),
(7, 'Web Developer', 41, NULL, 1, 45);

-- --------------------------------------------------------

--
-- Table structure for table `api_rtblentityaddress`
--

CREATE TABLE `api_rtblentityaddress` (
  `EntityAddessID` int(11) NOT NULL,
  `AddressIDF_id` int(11) DEFAULT NULL,
  `EntityIDF_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_rtblentityaddress`
--

INSERT INTO `api_rtblentityaddress` (`EntityAddessID`, `AddressIDF_id`, `EntityIDF_id`) VALUES
(1, 35, 1),
(3, 36, 4),
(4, 32, 5),
(6, 41, 7);

-- --------------------------------------------------------

--
-- Table structure for table `api_rtblentityemail`
--

CREATE TABLE `api_rtblentityemail` (
  `EntityEmailID` int(11) NOT NULL,
  `EmailIDF_id` int(11) DEFAULT NULL,
  `EntityIDF_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_rtblentityemail`
--

INSERT INTO `api_rtblentityemail` (`EntityEmailID`, `EmailIDF_id`, `EntityIDF_id`) VALUES
(1, 46, 1),
(3, 48, 3),
(4, 49, 4),
(5, 50, 5),
(7, 52, 7),
(23, 68, 1);

-- --------------------------------------------------------

--
-- Table structure for table `api_stbladdresstype`
--

CREATE TABLE `api_stbladdresstype` (
  `AddressTypeID` int(11) NOT NULL,
  `AddressType` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_stbladdresstype`
--

INSERT INTO `api_stbladdresstype` (`AddressTypeID`, `AddressType`) VALUES
(1, 'Home'),
(2, 'Office');

-- --------------------------------------------------------

--
-- Table structure for table `api_stblcompanytype`
--

CREATE TABLE `api_stblcompanytype` (
  `CompanyTypeID` int(11) NOT NULL,
  `CompanyType` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_stblcompanytype`
--

INSERT INTO `api_stblcompanytype` (`CompanyTypeID`, `CompanyType`) VALUES
(1, 'Commercial'),
(2, 'Industrial');

-- --------------------------------------------------------

--
-- Table structure for table `api_stblcountrycodetype`
--

CREATE TABLE `api_stblcountrycodetype` (
  `CountryCodeID` int(11) NOT NULL,
  `CountryName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_stblcountrycodetype`
--

INSERT INTO `api_stblcountrycodetype` (`CountryCodeID`, `CountryName`) VALUES
(1, 'India'),
(2, 'Afghanistan'),
(3, 'Australia'),
(4, 'Brazil'),
(5, 'China'),
(6, 'Egypt'),
(7, 'Hong Kong'),
(8, 'Israel');

-- --------------------------------------------------------

--
-- Table structure for table `api_stblemailtype`
--

CREATE TABLE `api_stblemailtype` (
  `EmailTypeID` int(11) NOT NULL,
  `EmailType` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_stblemailtype`
--

INSERT INTO `api_stblemailtype` (`EmailTypeID`, `EmailType`) VALUES
(1, 'Personal'),
(2, 'Company');

-- --------------------------------------------------------

--
-- Table structure for table `api_stblentitytype`
--

CREATE TABLE `api_stblentitytype` (
  `EntityTypeID` int(11) NOT NULL,
  `EntityType` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_stblentitytype`
--

INSERT INTO `api_stblentitytype` (`EntityTypeID`, `EntityType`) VALUES
(1, 'Person'),
(2, 'Company');

-- --------------------------------------------------------

--
-- Table structure for table `api_stblheadcounttype`
--

CREATE TABLE `api_stblheadcounttype` (
  `HeadCountTypeID` int(11) NOT NULL,
  `HeadCountType` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_stblheadcounttype`
--

INSERT INTO `api_stblheadcounttype` (`HeadCountTypeID`, `HeadCountType`) VALUES
(1, 'Man'),
(2, 'Woman');

-- --------------------------------------------------------

--
-- Table structure for table `api_stblindustrytype`
--

CREATE TABLE `api_stblindustrytype` (
  `IndustryID` int(11) NOT NULL,
  `IndustryType` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_stblindustrytype`
--

INSERT INTO `api_stblindustrytype` (`IndustryID`, `IndustryType`) VALUES
(1, 'IT'),
(2, 'Health Care');

-- --------------------------------------------------------

--
-- Table structure for table `api_stblpersontype`
--

CREATE TABLE `api_stblpersontype` (
  `PersonTypeID` int(11) NOT NULL,
  `PersonType` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_stblpersontype`
--

INSERT INTO `api_stblpersontype` (`PersonTypeID`, `PersonType`) VALUES
(1, 'Employee'),
(2, 'Customer');

-- --------------------------------------------------------

--
-- Table structure for table `api_stblphonetype`
--

CREATE TABLE `api_stblphonetype` (
  `PhoneTypeID` int(11) NOT NULL,
  `PhoneType` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_stblphonetype`
--

INSERT INTO `api_stblphonetype` (`PhoneTypeID`, `PhoneType`) VALUES
(1, 'Personal'),
(2, 'Home');

-- --------------------------------------------------------

--
-- Table structure for table `api_stblphototype`
--

CREATE TABLE `api_stblphototype` (
  `PhotoTypeID` int(11) NOT NULL,
  `PhotoType` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_stblphototype`
--

INSERT INTO `api_stblphototype` (`PhotoTypeID`, `PhotoType`) VALUES
(1, 'Personal');

-- --------------------------------------------------------

--
-- Table structure for table `api_stblsocialmediatype`
--

CREATE TABLE `api_stblsocialmediatype` (
  `SocialMediaTypeID` int(11) NOT NULL,
  `SocialMediaType` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_stblsocialmediatype`
--

INSERT INTO `api_stblsocialmediatype` (`SocialMediaTypeID`, `SocialMediaType`) VALUES
(1, 'Facebook'),
(2, 'Linked In');

-- --------------------------------------------------------

--
-- Table structure for table `api_stblsuffixtype`
--

CREATE TABLE `api_stblsuffixtype` (
  `SuffixID` int(11) NOT NULL,
  `SuffixType` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_stblsuffixtype`
--

INSERT INTO `api_stblsuffixtype` (`SuffixID`, `SuffixType`) VALUES
(1, 'MBBS'),
(2, 'LLB');

-- --------------------------------------------------------

--
-- Table structure for table `api_tbladdress`
--

CREATE TABLE `api_tbladdress` (
  `AddressID` int(11) NOT NULL,
  `Address` longtext NOT NULL,
  `City` varchar(30) NOT NULL,
  `District` varchar(30) NOT NULL,
  `State` varchar(30) NOT NULL,
  `PinCode` int(11) NOT NULL,
  `Country` varchar(30) NOT NULL,
  `AddressTypeIDF_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_tbladdress`
--

INSERT INTO `api_tbladdress` (`AddressID`, `Address`, `City`, `District`, `State`, `PinCode`, `Country`, `AddressTypeIDF_id`) VALUES
(32, '0001', 'Asguard', 'Asguard', 'Asguard', 453265, 'Asguard', 1),
(33, '19 janki', 'ahmedabad', 'ahmedabad', 'Gujarat', 382350, 'India', 2),
(35, '19', 'ahmedabad', 'Ahmedabad', 'Gujarat', 382350, 'India', 1),
(36, '32 ,maninagar', 'ahmedabad', 'Ahmedabad', 'ahmedabad', 654321, 'lsdkfjsljk', 1),
(37, 'cksjdfksdjlj', 'ahmedabad', 'Ahmedabad', 'Gujarat', 654321, 'India', 1),
(38, 'cksjdfksdjlj', 'ahmedabad', 'Ahmedabad', 'Gujarat', 654321, 'India', 1),
(39, 'sldkfjslkjdlkj', 'ahmedabad', 'Ahmedabad', 'ahmedabad', 382350, 'India', 1),
(40, '119,janki', 'ahmedabad', 'Ahmedabad', 'Gujarat', 321654, 'slkdjslkj', 1),
(41, '27 ', 'ahmedabadd', 'Ahmedabadd', 'Gujaratt', 382350, 'India', 1),
(42, '654,russia', 'ahmedabad', 'lsdkjfsldjk', 'ahmedabad', 654654, 'India', 2);

-- --------------------------------------------------------

--
-- Table structure for table `api_tblcompany`
--

CREATE TABLE `api_tblcompany` (
  `CompanyID` int(11) NOT NULL,
  `GSTINNo` varchar(15) NOT NULL,
  `Headquarter` varchar(30) NOT NULL,
  `WebsiteURL` longtext NOT NULL,
  `About` longtext NOT NULL,
  `Founded` date NOT NULL,
  `Specialities` longtext NOT NULL,
  `AnnualRevenue` int(11) NOT NULL,
  `CompanyTypeIDF_id` int(11) DEFAULT NULL,
  `EntityIDF_id` int(11) DEFAULT NULL,
  `HeadcountIDF_id` int(11) DEFAULT NULL,
  `IndustryIDF_id` int(11) DEFAULT NULL,
  `CompanyName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_tblcompany`
--

INSERT INTO `api_tblcompany` (`CompanyID`, `GSTINNo`, `Headquarter`, `WebsiteURL`, `About`, `Founded`, `Specialities`, `AnnualRevenue`, `CompanyTypeIDF_id`, `EntityIDF_id`, `HeadcountIDF_id`, `IndustryIDF_id`, `CompanyName`) VALUES
(9, '321654987321640', 'Asguard', 'Avengers.us', 'Infinite saga', '2010-11-29', 'it`s nice', 654321654, 2, NULL, 31, 2, 'Avengers'),
(10, '65432198765431', 'ahmedabad', 'prydan.com', 'its nice....', '2021-12-31', 'its nice....', 2147483647, 1, NULL, 33, 1, 'Prydan'),
(11, '65432198765431', 'ahmedabad', 'prydan.com', 'its nice....', '2021-12-31', 'its nice....', 2147483647, 1, NULL, 33, 1, 'Prydan'),
(12, '65432198765431', 'ahmedabad', 'prydan.com', 'its nice....', '2021-12-31', 'its nice....', 2147483647, 1, NULL, 33, 1, 'Prydan'),
(14, '65432164321654', 'Ahmedabad', 'prydan.com', 'prydan.com', '2021-12-30', 'prydan.com', 56565655, 1, 1, 34, 1, 'Prydan'),
(16, '654321654321', 'Ahmedabad', '', 'Good', '2021-12-31', 'Good', 654312, 1, 3, 36, 1, 'Prydan'),
(17, '654321654321', 'Ahmedabad', 'prydan.com', 'Good', '2020-11-30', 'Good', 654312654, 2, 4, 37, 1, 'Prydannnn');

-- --------------------------------------------------------

--
-- Table structure for table `api_tblcountrycode`
--

CREATE TABLE `api_tblcountrycode` (
  `CodeID` int(11) NOT NULL,
  `CountryCode` varchar(5) NOT NULL,
  `CountryCodeIDF_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_tblcountrycode`
--

INSERT INTO `api_tblcountrycode` (`CodeID`, `CountryCode`, `CountryCodeIDF_id`) VALUES
(1, '+91', 1),
(2, '+93', 2),
(3, '+61', 3),
(4, '+55', 4),
(5, '+86', 5),
(6, '+20', 6),
(7, '+852', 7),
(8, '+972', 8);

-- --------------------------------------------------------

--
-- Table structure for table `api_tblemail`
--

CREATE TABLE `api_tblemail` (
  `EmailID` int(11) NOT NULL,
  `EmailAddress` varchar(50) NOT NULL,
  `EmailTypeIDF_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_tblemail`
--

INSERT INTO `api_tblemail` (`EmailID`, `EmailAddress`, `EmailTypeIDF_id`) VALUES
(42, 'Thor@gmail.com', 2),
(43, 'bhavuasodariya@gmail.com', 1),
(44, 'bhavuasodariya@gmail.com', 1),
(46, 'bhavuasodariya@gmail.com', 1),
(47, 'dhruvil11@gmail.com', 1),
(48, 'bhavuasodariya@gmail.com', 1),
(49, 'bhavuasodariya@gmail.com', 1),
(50, 'bhavuasodariyaa@gmail.com', 2),
(51, 'vikas2871997@gmail.com', 1),
(52, 'vikas2871997@gmail.com', 1),
(53, 'pythonmaster@gmail.com', 1),
(68, 'dhruvil11@gmail.com', 2);

-- --------------------------------------------------------

--
-- Table structure for table `api_tblentity`
--

CREATE TABLE `api_tblentity` (
  `EntityID` int(11) NOT NULL,
  `FullName` varchar(256) NOT NULL,
  `ShortName` varchar(16) NOT NULL,
  `EntityTypeIDF_id` int(11) DEFAULT NULL,
  `CreatedAT` date NOT NULL,
  `CreatedBY_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_tblentity`
--

INSERT INTO `api_tblentity` (`EntityID`, `FullName`, `ShortName`, `EntityTypeIDF_id`, `CreatedAT`, `CreatedBY_id`) VALUES
(1, 'Bhavin Asodariya', 'bhavin', 1, '2021-12-22', 1),
(4, 'Gondaliya Meet D', 'Meet', 2, '2021-12-23', 1),
(5, 'Goswami Dhrumit Hiteshgiri', 'Rossum', 1, '2021-12-23', 1),
(7, 'Ambaliya Dhruvil Balvantbhai', 'Dhruvil', 1, '2021-12-27', 1);

-- --------------------------------------------------------

--
-- Table structure for table `api_tblentityphone`
--

CREATE TABLE `api_tblentityphone` (
  `EntityPhoneID` int(11) NOT NULL,
  `EntityIDF_id` int(11) DEFAULT NULL,
  `PhoneIDF_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_tblentityphone`
--

INSERT INTO `api_tblentityphone` (`EntityPhoneID`, `EntityIDF_id`, `PhoneIDF_id`) VALUES
(1, 1, 40),
(3, 4, 42),
(4, 5, 43),
(6, 7, 45),
(80, 1, 123),
(81, 7, 124),
(82, 1, 125),
(83, 5, 126);

-- --------------------------------------------------------

--
-- Table structure for table `api_tblentitysocialmedia`
--

CREATE TABLE `api_tblentitysocialmedia` (
  `EntitySocialMediaID` int(11) NOT NULL,
  `EntityIDF_id` int(11) DEFAULT NULL,
  `SocialMediaIDF_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_tblentitysocialmedia`
--

INSERT INTO `api_tblentitysocialmedia` (`EntitySocialMediaID`, `EntityIDF_id`, `SocialMediaIDF_id`) VALUES
(1, 1, 1),
(4, 4, 4),
(5, 5, 5),
(7, 7, 7),
(16, 7, 16),
(17, 1, 17);

-- --------------------------------------------------------

--
-- Table structure for table `api_tblheadcount`
--

CREATE TABLE `api_tblheadcount` (
  `HeadCountID` int(11) NOT NULL,
  `HeadCountRange` bigint(20) NOT NULL,
  `HeadCountTypeIDF_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_tblheadcount`
--

INSERT INTO `api_tblheadcount` (`HeadCountID`, `HeadCountRange`, `HeadCountTypeIDF_id`) VALUES
(1, 13, 1),
(2, 13, 1),
(3, 13, 1),
(4, 13, 1),
(5, 13, 1),
(6, 13, 1),
(7, 13, 1),
(8, 13, 1),
(9, 13, 1),
(10, 13, 1),
(11, 13, 1),
(12, 13, 1),
(13, 13, 1),
(14, 13, 1),
(15, 13, 1),
(16, 13, 1),
(17, 65432, 1),
(18, 13, 1),
(19, 13, 1),
(20, 13, 1),
(21, 13, 1),
(22, 13, 1),
(23, 13, 1),
(24, 13, 1),
(25, 654, 1),
(26, 5000, 1),
(27, 200, 1),
(28, -1, 1),
(29, 3500, 1),
(30, 563, 1),
(31, 6, 1),
(32, 564321, 1),
(33, 564321, 1),
(34, 5656, 1),
(35, 645654, 2),
(36, 654, 1),
(37, 65365, 2),
(38, 65312, 1),
(39, 32123, 2),
(40, 32123, 2);

-- --------------------------------------------------------

--
-- Table structure for table `api_tblperson`
--

CREATE TABLE `api_tblperson` (
  `PersonID` int(11) NOT NULL,
  `FirstName` varchar(30) NOT NULL,
  `MiddleName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `Gender` varchar(2) NOT NULL,
  `DOB` date NOT NULL,
  `EntityIDF_id` int(11) DEFAULT NULL,
  `PersonTypeIDF_id` int(11) DEFAULT NULL,
  `SuffixIDF_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_tblperson`
--

INSERT INTO `api_tblperson` (`PersonID`, `FirstName`, `MiddleName`, `LastName`, `Gender`, `DOB`, `EntityIDF_id`, `PersonTypeIDF_id`, `SuffixIDF_id`) VALUES
(39, 'Asgardian', 'Thor', 'Odin', 'M', '2020-11-28', NULL, 1, 1),
(40, 'Asodariya', 'Bhavin', 'Sureshbhai', 'M', '2021-12-31', NULL, 1, 1),
(42, 'Bhavin', 'Bhavu', 'Asodariya', 'M', '2021-12-30', 1, 1, 1),
(44, 'Goswami', 'Dhrumit', 'Hiteshgiri', 'M', '2021-12-31', 5, 1, 1),
(45, 'Ambaliyaa', 'Dhruvill', 'Balvantbhaii', 'F', '2020-11-30', 7, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `api_tblphone`
--

CREATE TABLE `api_tblphone` (
  `PhoneID` int(11) NOT NULL,
  `PhoneNo` bigint(20) NOT NULL,
  `CodeIDF_id` int(11) DEFAULT NULL,
  `PhoneTypeIDF_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_tblphone`
--

INSERT INTO `api_tblphone` (`PhoneID`, `PhoneNo`, `CodeIDF_id`, `PhoneTypeIDF_id`) VALUES
(40, 9725116320, 1, 1),
(42, 7990187017, 5, 1),
(43, 7990187017, 2, 1),
(45, 7359921243, 1, 1),
(103, 7990187017, 4, 2),
(104, 7359921243, 4, 1),
(105, 9725116320, 2, 2),
(107, 7990187017, 5, 1),
(108, 9725116320, 1, 2),
(110, 7990187017, 5, 2),
(111, 5465465325, 8, 2),
(123, 9725116320, 6, 2),
(124, 6543216549, 6, 2),
(125, 7990187017, 3, 1),
(126, 9725116320, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `api_tblphoto`
--

CREATE TABLE `api_tblphoto` (
  `PhotoID` int(11) NOT NULL,
  `Photo` varchar(100) NOT NULL,
  `PhotoTypeIDF_id` int(11) DEFAULT NULL,
  `EntityIDF_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_tblphoto`
--

INSERT INTO `api_tblphoto` (`PhotoID`, `Photo`, `PhotoTypeIDF_id`, `EntityIDF_id`) VALUES
(3, 'images/1636282759664.jpg', 1, 5),
(5, 'images/IMG_7342_1.jpg', 1, 4),
(8, 'images/IMG_20211106_104147.jpg', 1, 1),
(10, 'images/logo.jpeg', 1, 7),
(11, 'images/1636282759664_V4fWXnS.jpg', 1, 14);

-- --------------------------------------------------------

--
-- Table structure for table `api_tblsocialmedia`
--

CREATE TABLE `api_tblsocialmedia` (
  `SocialmediaID` int(11) NOT NULL,
  `url` longtext NOT NULL,
  `SocialMediaTypeIDF_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_tblsocialmedia`
--

INSERT INTO `api_tblsocialmedia` (`SocialmediaID`, `url`, `SocialMediaTypeIDF_id`) VALUES
(1, 'https://youtu.be/koImV0dR1Fo', 1),
(2, 'https://youtube.com/playlist?list=PLsyeobzWxl7r2ukVgTqIQcl-1T0C2mzau', 1),
(3, 'https://youtu.be/koImV0dR1Fo', 1),
(4, 'https://youtu.be/koImV0dR1Fo', 2),
(5, 'https://youtu.be/koImV0dR1Fo', 1),
(6, 'https://youtube.com/playlist?list=PLZVMTpwX4K3DtQ7W3csbWjdPJvLnD7sU1', 2),
(7, 'https://youtu.be/koImV0dR1Fou', 2),
(8, 'https://youtu.be/koImV0dR1Fo', 2),
(16, 'facebook.com', 1),
(17, 'https://youtu.be/koImV0dR1Fou', 2);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add stbl country code type', 7, 'add_stblcountrycodetype'),
(26, 'Can change stbl country code type', 7, 'change_stblcountrycodetype'),
(27, 'Can delete stbl country code type', 7, 'delete_stblcountrycodetype'),
(28, 'Can view stbl country code type', 7, 'view_stblcountrycodetype'),
(29, 'Can add stbl phone type', 8, 'add_stblphonetype'),
(30, 'Can change stbl phone type', 8, 'change_stblphonetype'),
(31, 'Can delete stbl phone type', 8, 'delete_stblphonetype'),
(32, 'Can view stbl phone type', 8, 'view_stblphonetype'),
(33, 'Can add tbl country code', 9, 'add_tblcountrycode'),
(34, 'Can change tbl country code', 9, 'change_tblcountrycode'),
(35, 'Can delete tbl country code', 9, 'delete_tblcountrycode'),
(36, 'Can view tbl country code', 9, 'view_tblcountrycode'),
(37, 'Can add tbl phone', 10, 'add_tblphone'),
(38, 'Can change tbl phone', 10, 'change_tblphone'),
(39, 'Can delete tbl phone', 10, 'delete_tblphone'),
(40, 'Can view tbl phone', 10, 'view_tblphone'),
(41, 'Can add tbl entity', 11, 'add_tblentity'),
(42, 'Can change tbl entity', 11, 'change_tblentity'),
(43, 'Can delete tbl entity', 11, 'delete_tblentity'),
(44, 'Can view tbl entity', 11, 'view_tblentity'),
(45, 'Can add stbl entity type', 12, 'add_stblentitytype'),
(46, 'Can change stbl entity type', 12, 'change_stblentitytype'),
(47, 'Can delete stbl entity type', 12, 'delete_stblentitytype'),
(48, 'Can view stbl entity type', 12, 'view_stblentitytype'),
(49, 'Can add stbl address type', 13, 'add_stbladdresstype'),
(50, 'Can change stbl address type', 13, 'change_stbladdresstype'),
(51, 'Can delete stbl address type', 13, 'delete_stbladdresstype'),
(52, 'Can view stbl address type', 13, 'view_stbladdresstype'),
(53, 'Can add tbl address', 14, 'add_tbladdress'),
(54, 'Can change tbl address', 14, 'change_tbladdress'),
(55, 'Can delete tbl address', 14, 'delete_tbladdress'),
(56, 'Can view tbl address', 14, 'view_tbladdress'),
(57, 'Can add tbl head count', 15, 'add_tblheadcount'),
(58, 'Can change tbl head count', 15, 'change_tblheadcount'),
(59, 'Can delete tbl head count', 15, 'delete_tblheadcount'),
(60, 'Can view tbl head count', 15, 'view_tblheadcount'),
(61, 'Can add stbl head count type', 16, 'add_stblheadcounttype'),
(62, 'Can change stbl head count type', 16, 'change_stblheadcounttype'),
(63, 'Can delete stbl head count type', 16, 'delete_stblheadcounttype'),
(64, 'Can view stbl head count type', 16, 'view_stblheadcounttype'),
(65, 'Can add stbl email type', 17, 'add_stblemailtype'),
(66, 'Can change stbl email type', 17, 'change_stblemailtype'),
(67, 'Can delete stbl email type', 17, 'delete_stblemailtype'),
(68, 'Can view stbl email type', 17, 'view_stblemailtype'),
(69, 'Can add tbl email', 18, 'add_tblemail'),
(70, 'Can change tbl email', 18, 'change_tblemail'),
(71, 'Can delete tbl email', 18, 'delete_tblemail'),
(72, 'Can view tbl email', 18, 'view_tblemail'),
(73, 'Can add tbl photo', 19, 'add_tblphoto'),
(74, 'Can change tbl photo', 19, 'change_tblphoto'),
(75, 'Can delete tbl photo', 19, 'delete_tblphoto'),
(76, 'Can view tbl photo', 19, 'view_tblphoto'),
(77, 'Can add stbl photo type', 20, 'add_stblphototype'),
(78, 'Can change stbl photo type', 20, 'change_stblphototype'),
(79, 'Can delete stbl photo type', 20, 'delete_stblphototype'),
(80, 'Can view stbl photo type', 20, 'view_stblphototype'),
(81, 'Can add tbl social media', 21, 'add_tblsocialmedia'),
(82, 'Can change tbl social media', 21, 'change_tblsocialmedia'),
(83, 'Can delete tbl social media', 21, 'delete_tblsocialmedia'),
(84, 'Can view tbl social media', 21, 'view_tblsocialmedia'),
(85, 'Can add stbl social media type', 22, 'add_stblsocialmediatype'),
(86, 'Can change stbl social media type', 22, 'change_stblsocialmediatype'),
(87, 'Can delete stbl social media type', 22, 'delete_stblsocialmediatype'),
(88, 'Can view stbl social media type', 22, 'view_stblsocialmediatype'),
(89, 'Can add stbl company type', 23, 'add_stblcompanytype'),
(90, 'Can change stbl company type', 23, 'change_stblcompanytype'),
(91, 'Can delete stbl company type', 23, 'delete_stblcompanytype'),
(92, 'Can view stbl company type', 23, 'view_stblcompanytype'),
(93, 'Can add stbl industry type', 24, 'add_stblindustrytype'),
(94, 'Can change stbl industry type', 24, 'change_stblindustrytype'),
(95, 'Can delete stbl industry type', 24, 'delete_stblindustrytype'),
(96, 'Can view stbl industry type', 24, 'view_stblindustrytype'),
(97, 'Can add stbl suffix type', 25, 'add_stblsuffixtype'),
(98, 'Can change stbl suffix type', 25, 'change_stblsuffixtype'),
(99, 'Can delete stbl suffix type', 25, 'delete_stblsuffixtype'),
(100, 'Can view stbl suffix type', 25, 'view_stblsuffixtype'),
(101, 'Can add tbl entity social media', 26, 'add_tblentitysocialmedia'),
(102, 'Can change tbl entity social media', 26, 'change_tblentitysocialmedia'),
(103, 'Can delete tbl entity social media', 26, 'delete_tblentitysocialmedia'),
(104, 'Can view tbl entity social media', 26, 'view_tblentitysocialmedia'),
(105, 'Can add stbl person type', 27, 'add_stblpersontype'),
(106, 'Can change stbl person type', 27, 'change_stblpersontype'),
(107, 'Can delete stbl person type', 27, 'delete_stblpersontype'),
(108, 'Can view stbl person type', 27, 'view_stblpersontype'),
(109, 'Can add tbl person', 28, 'add_tblperson'),
(110, 'Can change tbl person', 28, 'change_tblperson'),
(111, 'Can delete tbl person', 28, 'delete_tblperson'),
(112, 'Can view tbl person', 28, 'view_tblperson'),
(113, 'Can add tbl company', 29, 'add_tblcompany'),
(114, 'Can change tbl company', 29, 'change_tblcompany'),
(115, 'Can delete tbl company', 29, 'delete_tblcompany'),
(116, 'Can view tbl company', 29, 'view_tblcompany'),
(117, 'Can add rtbl entity', 30, 'add_rtblentity'),
(118, 'Can change rtbl entity', 30, 'change_rtblentity'),
(119, 'Can delete rtbl entity', 30, 'delete_rtblentity'),
(120, 'Can view rtbl entity', 30, 'view_rtblentity'),
(121, 'Can add tbl entity phone', 31, 'add_tblentityphone'),
(122, 'Can change tbl entity phone', 31, 'change_tblentityphone'),
(123, 'Can delete tbl entity phone', 31, 'delete_tblentityphone'),
(124, 'Can view tbl entity phone', 31, 'view_tblentityphone'),
(125, 'Can add rtbl entity email', 32, 'add_rtblentityemail'),
(126, 'Can change rtbl entity email', 32, 'change_rtblentityemail'),
(127, 'Can delete rtbl entity email', 32, 'delete_rtblentityemail'),
(128, 'Can view rtbl entity email', 32, 'view_rtblentityemail'),
(129, 'Can add rtbl entity address', 33, 'add_rtblentityaddress'),
(130, 'Can change rtbl entity address', 33, 'change_rtblentityaddress'),
(131, 'Can delete rtbl entity address', 33, 'delete_rtblentityaddress'),
(132, 'Can view rtbl entity address', 33, 'view_rtblentityaddress');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$d4lA60hjoQP7KN2CYeDfiD$sDqSqtJAGCtji3P+IPauzbanbq1R0bKsc6eTFx9h4Oc=', '2021-12-22 06:09:09.481718', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2021-09-24 07:26:54.690351'),
(2, 'pbkdf2_sha256$260000$bRpt3McR8xPn6CnUiBDxMg$KZytbrYC8oDEIFeKoVzmFBaBCVhEqKS1e81Sxzm8ZQQ=', '2021-10-11 05:15:40.097683', 0, 'kishan', '', '', '', 1, 1, '2021-09-27 05:27:02.000000'),
(3, 'pbkdf2_sha256$260000$dyPm8sc60NPqRtPH23jbRY$QIDJqTXw/B9Q8ypMWj5TIZ+5oj1KLSinQcc7VojM4jo=', NULL, 0, 'Prydan', '', '', 'prydan123@gmail.com', 1, 1, '2021-12-01 04:56:17.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(1, 2, 5),
(2, 2, 6),
(3, 2, 7),
(4, 2, 8),
(5, 2, 9),
(6, 2, 10),
(7, 2, 11),
(8, 2, 12),
(9, 2, 13),
(10, 2, 14),
(11, 2, 15),
(12, 2, 16),
(13, 2, 17),
(14, 2, 18),
(15, 2, 19),
(16, 2, 20),
(17, 2, 21),
(18, 2, 22),
(19, 2, 23),
(20, 2, 24),
(21, 2, 25),
(22, 2, 26),
(23, 2, 27),
(24, 2, 28),
(25, 2, 29),
(26, 2, 30),
(27, 2, 31),
(28, 2, 32),
(29, 2, 33),
(30, 2, 34),
(31, 2, 35),
(32, 2, 36),
(33, 2, 37),
(34, 2, 38),
(35, 2, 39),
(36, 2, 40),
(37, 2, 41),
(38, 2, 42),
(39, 2, 43),
(40, 2, 44),
(41, 2, 45),
(42, 2, 46),
(43, 2, 47),
(44, 2, 48),
(45, 2, 49),
(46, 2, 50),
(47, 2, 51),
(48, 2, 52),
(49, 2, 53),
(50, 2, 54),
(51, 2, 55),
(52, 2, 56),
(53, 2, 57),
(54, 2, 58),
(55, 2, 59),
(56, 2, 60),
(57, 2, 61),
(58, 2, 62),
(59, 2, 63),
(60, 2, 64),
(61, 2, 65),
(62, 2, 66),
(63, 2, 67),
(64, 2, 68),
(65, 2, 69),
(66, 2, 70),
(67, 2, 71),
(68, 2, 72),
(69, 2, 73),
(70, 2, 74),
(71, 2, 75),
(72, 2, 76),
(73, 2, 77),
(74, 2, 78),
(75, 2, 79),
(76, 2, 80),
(77, 2, 81),
(78, 2, 82),
(79, 2, 83),
(80, 2, 84),
(81, 2, 85),
(82, 2, 86),
(83, 2, 87),
(84, 2, 88),
(85, 2, 89),
(86, 2, 90),
(87, 2, 91),
(88, 2, 92),
(89, 2, 93),
(90, 2, 94),
(91, 2, 95),
(92, 2, 96),
(93, 2, 97),
(94, 2, 98),
(95, 2, 99),
(96, 2, 100),
(97, 2, 101),
(98, 2, 102),
(99, 2, 103),
(100, 2, 104),
(101, 2, 105),
(102, 2, 106),
(103, 2, 107),
(104, 2, 108),
(105, 2, 109),
(106, 2, 110),
(107, 2, 111),
(108, 2, 112),
(109, 2, 113),
(110, 2, 114),
(111, 2, 115),
(112, 2, 116),
(113, 2, 117),
(114, 2, 118),
(115, 2, 119),
(116, 2, 120),
(117, 2, 121),
(118, 2, 122),
(119, 2, 123),
(120, 2, 124),
(121, 2, 125),
(122, 2, 126),
(123, 2, 127),
(124, 2, 128);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-09-27 05:27:03.177726', '2', 'kishan', 1, '[{\"added\": {}}]', 4, 1),
(2, '2021-09-27 05:27:22.645983', '2', 'kishan', 2, '[]', 4, 1),
(3, '2021-09-27 05:28:23.126231', '2', 'kishan', 2, '[{\"changed\": {\"fields\": [\"Staff status\"]}}]', 4, 1),
(4, '2021-09-27 05:30:10.347841', '2', 'kishan', 2, '[{\"changed\": {\"fields\": [\"User permissions\"]}}]', 4, 1),
(5, '2021-09-27 09:28:30.192874', '1', 'India', 1, '[{\"added\": {}}]', 7, 1),
(6, '2021-12-01 04:56:17.726392', '3', 'Prydan', 1, '[{\"added\": {}}]', 4, 1),
(7, '2021-12-01 04:57:10.984202', '3', 'Prydan', 2, '[{\"changed\": {\"fields\": [\"Email address\", \"Staff status\"]}}]', 4, 1),
(8, '2021-12-03 04:27:28.013081', '2', 'Afghanistan', 1, '[{\"added\": {}}]', 7, 1),
(9, '2021-12-03 04:28:01.306852', '3', 'Australia', 1, '[{\"added\": {}}]', 7, 1),
(10, '2021-12-03 04:28:20.317904', '4', 'Brazil', 1, '[{\"added\": {}}]', 7, 1),
(11, '2021-12-03 04:28:51.739068', '5', 'China', 1, '[{\"added\": {}}]', 7, 1),
(12, '2021-12-03 04:29:13.133801', '6', 'Egypt', 1, '[{\"added\": {}}]', 7, 1),
(13, '2021-12-03 04:29:34.930387', '7', 'Hong Kong', 1, '[{\"added\": {}}]', 7, 1),
(14, '2021-12-03 04:29:56.448884', '8', 'Israel', 1, '[{\"added\": {}}]', 7, 1),
(15, '2021-12-03 04:30:38.835487', '1', '+91', 1, '[{\"added\": {}}]', 9, 1),
(16, '2021-12-03 04:31:11.857738', '2', '+93', 1, '[{\"added\": {}}]', 9, 1),
(17, '2021-12-03 04:31:34.698660', '3', '+61', 1, '[{\"added\": {}}]', 9, 1),
(18, '2021-12-03 04:31:53.862218', '4', '+55', 1, '[{\"added\": {}}]', 9, 1),
(19, '2021-12-03 04:32:11.173053', '5', '+86', 1, '[{\"added\": {}}]', 9, 1),
(20, '2021-12-03 04:32:30.551736', '6', '+20', 1, '[{\"added\": {}}]', 9, 1),
(21, '2021-12-03 04:32:58.670070', '7', '+852', 1, '[{\"added\": {}}]', 9, 1),
(22, '2021-12-03 04:33:24.192079', '8', '+972', 1, '[{\"added\": {}}]', 9, 1),
(23, '2021-12-03 04:36:08.967315', '1', 'Personal', 1, '[{\"added\": {}}]', 8, 1),
(24, '2021-12-03 04:36:16.983298', '2', 'Home', 1, '[{\"added\": {}}]', 8, 1),
(25, '2021-12-03 04:36:59.873236', '1', 'Home', 1, '[{\"added\": {}}]', 13, 1),
(26, '2021-12-03 04:37:06.521340', '2', 'Office', 1, '[{\"added\": {}}]', 13, 1),
(27, '2021-12-03 04:37:28.025779', '1', 'Commercial', 1, '[{\"added\": {}}]', 23, 1),
(28, '2021-12-03 04:37:35.134329', '2', 'Industrial', 1, '[{\"added\": {}}]', 23, 1),
(29, '2021-12-03 04:37:57.380868', '1', 'Personal', 1, '[{\"added\": {}}]', 17, 1),
(30, '2021-12-03 04:38:04.703709', '2', 'Company', 1, '[{\"added\": {}}]', 17, 1),
(31, '2021-12-03 04:38:32.045400', '1', 'Person', 1, '[{\"added\": {}}]', 12, 1),
(32, '2021-12-03 04:38:38.407766', '2', 'Organization', 1, '[{\"added\": {}}]', 12, 1),
(33, '2021-12-03 04:38:58.913041', '1', 'Man', 1, '[{\"added\": {}}]', 16, 1),
(34, '2021-12-03 04:39:04.826539', '2', 'Woman', 1, '[{\"added\": {}}]', 16, 1),
(35, '2021-12-03 04:39:23.342902', '1', 'IT', 1, '[{\"added\": {}}]', 24, 1),
(36, '2021-12-03 04:39:31.945636', '2', 'Health Care', 1, '[{\"added\": {}}]', 24, 1),
(37, '2021-12-03 04:39:49.437043', '1', 'Employee', 1, '[{\"added\": {}}]', 27, 1),
(38, '2021-12-03 04:39:54.888040', '2', 'Customer', 1, '[{\"added\": {}}]', 27, 1),
(39, '2021-12-03 04:40:34.952163', '1', 'MBBS', 1, '[{\"added\": {}}]', 25, 1),
(40, '2021-12-03 04:40:41.970934', '2', 'LLB', 1, '[{\"added\": {}}]', 25, 1),
(41, '2021-12-22 06:09:51.336358', '2', 'Company', 2, '[{\"changed\": {\"fields\": [\"EntityType\"]}}]', 12, 1),
(42, '2021-12-22 06:10:51.095417', '1', 'Facebo', 1, '[{\"added\": {}}]', 22, 1),
(43, '2021-12-22 06:10:59.761999', '1', 'Facebook', 2, '[{\"changed\": {\"fields\": [\"SocialMediaType\"]}}]', 22, 1),
(44, '2021-12-22 06:11:09.131993', '2', 'Linked In', 1, '[{\"added\": {}}]', 22, 1),
(45, '2021-12-23 10:33:10.537903', '1', 'Personal', 1, '[{\"added\": {}}]', 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(30, 'api', 'rtblentity'),
(33, 'api', 'rtblentityaddress'),
(32, 'api', 'rtblentityemail'),
(13, 'api', 'stbladdresstype'),
(23, 'api', 'stblcompanytype'),
(7, 'api', 'stblcountrycodetype'),
(17, 'api', 'stblemailtype'),
(12, 'api', 'stblentitytype'),
(16, 'api', 'stblheadcounttype'),
(24, 'api', 'stblindustrytype'),
(27, 'api', 'stblpersontype'),
(8, 'api', 'stblphonetype'),
(20, 'api', 'stblphototype'),
(22, 'api', 'stblsocialmediatype'),
(25, 'api', 'stblsuffixtype'),
(14, 'api', 'tbladdress'),
(29, 'api', 'tblcompany'),
(9, 'api', 'tblcountrycode'),
(18, 'api', 'tblemail'),
(11, 'api', 'tblentity'),
(31, 'api', 'tblentityphone'),
(26, 'api', 'tblentitysocialmedia'),
(15, 'api', 'tblheadcount'),
(28, 'api', 'tblperson'),
(10, 'api', 'tblphone'),
(19, 'api', 'tblphoto'),
(21, 'api', 'tblsocialmedia'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-09-18 04:52:48.053572'),
(2, 'auth', '0001_initial', '2021-09-18 04:52:59.343337'),
(3, 'admin', '0001_initial', '2021-09-18 04:53:02.124725'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-09-18 04:53:02.171602'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-09-18 04:53:02.249739'),
(6, 'api', '0001_initial', '2021-09-18 04:53:05.918882'),
(7, 'contenttypes', '0002_remove_content_type_name', '2021-09-18 04:53:06.887685'),
(8, 'auth', '0002_alter_permission_name_max_length', '2021-09-18 04:53:08.340876'),
(9, 'auth', '0003_alter_user_email_max_length', '2021-09-18 04:53:10.268383'),
(10, 'auth', '0004_alter_user_username_opts', '2021-09-18 04:53:10.487146'),
(11, 'auth', '0005_alter_user_last_login_null', '2021-09-18 04:53:11.674705'),
(12, 'auth', '0006_require_contenttypes_0002', '2021-09-18 04:53:11.784089'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2021-09-18 04:53:11.893465'),
(14, 'auth', '0008_alter_user_username_max_length', '2021-09-18 04:53:12.002867'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2021-09-18 04:53:12.127852'),
(16, 'auth', '0010_alter_group_name_max_length', '2021-09-18 04:53:13.287061'),
(17, 'auth', '0011_update_proxy_permissions', '2021-09-18 04:53:13.333939'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2021-09-18 04:53:13.552706'),
(19, 'sessions', '0001_initial', '2021-09-18 04:53:14.677760'),
(20, 'api', '0002_auto_20210918_1047', '2021-09-18 05:18:03.052985'),
(21, 'api', '0003_auto_20210918_1117', '2021-09-18 05:47:49.094697'),
(22, 'api', '0004_stblheadcounttype_tblheadcount', '2021-09-18 06:21:41.796979'),
(23, 'api', '0005_auto_20210920_0951', '2021-09-20 04:21:51.432105'),
(24, 'api', '0006_stblphototype_tblphoto', '2021-09-20 05:14:01.703266'),
(25, 'api', '0007_stblsocialmediatype_tblsocialmedia', '2021-09-20 05:30:40.712202'),
(26, 'api', '0008_stblcompanytype_stblindustrytype_stblsuffixtype', '2021-09-20 06:00:59.678025'),
(27, 'api', '0009_stblpersontype_tblentitysocialmedia_tblperson', '2021-09-20 06:41:07.490396'),
(28, 'api', '0010_tblcompany', '2021-09-20 08:16:10.737663'),
(29, 'api', '0011_rtblentity_rtblentityemail_tblentityphone', '2021-09-20 08:30:50.267736'),
(30, 'api', '0012_tblcompany_companyname', '2021-09-24 06:53:03.343727'),
(31, 'api', '0013_remove_tblperson_fullname', '2021-09-24 07:01:04.727903'),
(32, 'api', '0014_auto_20210924_1532', '2021-09-24 10:02:58.121734'),
(33, 'api', '0015_auto_20211202_1107', '2021-12-02 05:37:58.254771'),
(34, 'api', '0016_auto_20211207_1605', '2021-12-07 10:36:00.916151'),
(35, 'api', '0017_auto_20211207_1656', '2021-12-07 11:36:32.840900'),
(36, 'api', '0017_auto_20211207_1803', '2021-12-07 12:35:13.413727'),
(37, 'api', '0018_tblperson_createdat', '2021-12-08 04:10:07.728906'),
(38, 'api', '0019_auto_20211221_1040', '2021-12-22 06:06:55.071084'),
(39, 'api', '0020_auto_20211221_1348', '2021-12-22 06:06:57.081068'),
(40, 'api', '0021_alter_tblentityphone_phoneidf', '2021-12-22 06:06:58.096752'),
(41, 'api', '0022_auto_20211222_0949', '2021-12-22 06:06:58.265318'),
(42, 'api', '0023_auto_20211222_1736', '2021-12-22 12:06:50.132892'),
(43, 'api', '0024_auto_20211223_1214', '2021-12-23 06:44:35.929490'),
(44, 'api', '0025_auto_20211223_1611', '2021-12-23 10:41:16.978570'),
(45, 'api', '0026_alter_tblphoto_photo', '2021-12-24 05:18:34.996996'),
(46, 'api', '0027_alter_tblphoto_photo', '2021-12-24 09:49:55.041931'),
(47, 'api', '0028_auto_20211227_0924', '2021-12-27 03:54:27.561869'),
(48, 'api', '0029_alter_tblentity_createdat', '2021-12-27 07:10:28.453911'),
(49, 'api', '0030_alter_tblentity_createdat', '2021-12-27 07:12:33.233940');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0kjpznjqbxvbj8qy201k9pau62zqqql6', '.eJxVjDsOwjAQBe_iGlkbf3ZtSnrOYPmzwQHkSHFSIe4OkVJA-2bmvUSI21rD1nkJUxFnocTpd0sxP7jtoNxju80yz21dpiR3RR60y-tc-Hk53L-DGnv91jaRUmCQnLXZOPJp8NYhAiZNhFSAkXQcQXPmoWQEzorZGA8jaovi_QGomjbK:1mZnf2:jhpjCf1JYdwJcdfi-7U5GBgQ0smT76AeGohGKxt4LEs', '2021-10-25 05:15:40.216398'),
('1wc82gvq9bd3aw6p919rc6dwg080a5sx', '.eJxVjEEOwiAQRe_C2pChtDJ16d4zkIEZpGogKe3KeHfbpAvd_vfefytP65L92mT2E6uLMur0uwWKTyk74AeVe9WxlmWegt4VfdCmb5XldT3cv4NMLW81AckoDhPwOciIhAGFDHSQRMDEBIMYYbB9H9EyuGQ3gF10MBAYUp8vC2s4rA:1mYPSn:6vosk9YlzeNrUQu2QU5kweGJ3j5f_2fZBo5Wyzj-SaI', '2021-10-21 09:13:17.557030'),
('amcjv4i43ylc04ytwn2sdsn60ve8c30z', '.eJxVizsOwjAQBe_iGkXrfLBDCRUFZ7DW9rNsgUzEJjSIu0OkFFC-NzMv5XiZs1sED1eiOiitdr-f53BFXQFPpdmWNCcWnKugSpnLE5d7xO24qX99ZslrTIwRxiaKe4_RsvUWrKmlBJAOiQZoROr6PtgukkndF9g2GBqYNKv3B9yYOIE:1muYta:pmSDppS0fthSWgtF1fq_--6KaIOFjU5jSHSSrwOcaBA', '2021-12-21 11:44:30.843584'),
('bubify2vgqntx7elcgmlnzbljdm71ihc', '.eJxVizsOwjAQBe_iGkXrfLBDCRUFZ7DW9rNsgUzEJjSIu0OkFFC-NzMv5XiZs1sED1eiOiitdr-f53BFXQFPpdmWNCcWnKugSpnLE5d7xO24qX99ZslrTIwRxiaKe4_RsvUWrKmlBJAOiQZoROr6PtgukkndF9g2GBqYNKv3B9yYOIE:1mt07y:bTtDdJkT96dMZ8GhGD5v20Qy_-fkSdMy-HQHK5C0rRo', '2021-12-17 04:24:54.375067'),
('esyc51jsww9311aiecaibqqdp0qy3z2p', '.eJxVjEEOwiAQRe_C2pChtDJ16d4zkIEZpGogKe3KeHfbpAvd_vfefytP65L92mT2E6uLMur0uwWKTyk74AeVe9WxlmWegt4VfdCmb5XldT3cv4NMLW81AckoDhPwOciIhAGFDHSQRMDEBIMYYbB9H9EyuGQ3gF10MBAYUp8vC2s4rA:1mqYvK:Uubw3GiRqnf8juUA3FlnCPT-Zurki3LmDzgkJnrtLuA', '2021-12-10 10:57:46.695353'),
('g4q0qpo84t8q3ewdl1q2n545t6ss7bli', '.eJxVjEEOwiAQRe_C2pChtDJ16d4zkIEZpGogKe3KeHfbpAvd_vfefytP65L92mT2E6uLMur0uwWKTyk74AeVe9WxlmWegt4VfdCmb5XldT3cv4NMLW81AckoDhPwOciIhAGFDHSQRMDEBIMYYbB9H9EyuGQ3gF10MBAYUp8vC2s4rA:1mrDma:cmYPHF68VPofNf1PpyVCoLoFcAJyWAyFivc7ggT5cvc', '2021-12-12 06:35:28.654988'),
('kcqhs1r5aq3sha42w2z1457mytmmvsix', '.eJxVjEEOwiAQRe_C2pChtDJ16d4zkIEZpGogKe3KeHfbpAvd_vfefytP65L92mT2E6uLMur0uwWKTyk74AeVe9WxlmWegt4VfdCmb5XldT3cv4NMLW81AckoDhPwOciIhAGFDHSQRMDEBIMYYbB9H9EyuGQ3gF10MBAYUp8vC2s4rA:1mWF8D:TkoqiUVLE9ii37HIM8TzV9eeQbEjm80wRCNs_OrJxmg', '2021-10-15 09:47:05.448982'),
('o5kpqi9g1ts14bz3g29tqe39lvyo2cn9', '.eJxVizsOwjAQBe_iGkXrfLBDCRUFZ7DW9rNsgUzEJjSIu0OkFFC-NzMv5XiZs1sED1eiOiitdr-f53BFXQFPpdmWNCcWnKugSpnLE5d7xO24qX99ZslrTIwRxiaKe4_RsvUWrKmlBJAOiQZoROr6PtgukkndF9g2GBqYNKv3B9yYOIE:1mzuoH:0sxOoS7GV2i9DLhMJANL37qOzz-WEpG4AbGLiduViHw', '2022-01-05 06:09:09.573643'),
('ygh93mhmysr4v78knvzj1dxg6gucu8dr', '.eJxVizsOwjAQBe_iGkXrfLBDCRUFZ7DW9rNsgUzEJjSIu0OkFFC-NzMv5XiZs1sED1eiOiitdr-f53BFXQFPpdmWNCcWnKugSpnLE5d7xO24qX99ZslrTIwRxiaKe4_RsvUWrKmlBJAOiQZoROr6PtgukkndF9g2GBqYNKv3B9yYOIE:1msHa5:Ug6F5tTEqtB2qkbd3ncPHvBoGcSfENkul_XsRA7KGsw', '2021-12-15 04:50:57.538450');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_rtblentity`
--
ALTER TABLE `api_rtblentity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `api_rtblentity_AddressIDF_id_1b2efba5_fk_api_tblad` (`AddressIDF_id`),
  ADD KEY `api_rtblentity_CompanyIDF_id_e3dc4d65_fk_api_tblco` (`CompanyIDF_id`),
  ADD KEY `api_rtblentity_EntityTypeIDF_id_04558e5a_fk_api_stble` (`EntityTypeIDF_id`),
  ADD KEY `api_rtblentity_PersonIDF_id_ef4cd3f2_fk_api_tblperson_PersonID` (`PersonIDF_id`);

--
-- Indexes for table `api_rtblentityaddress`
--
ALTER TABLE `api_rtblentityaddress`
  ADD PRIMARY KEY (`EntityAddessID`),
  ADD KEY `api_rtblentityaddres_AddressIDF_id_fd1c4503_fk_api_tblad` (`AddressIDF_id`),
  ADD KEY `api_rtblentityaddres_EntityIDF_id_f8687b2b_fk_api_tblen` (`EntityIDF_id`);

--
-- Indexes for table `api_rtblentityemail`
--
ALTER TABLE `api_rtblentityemail`
  ADD PRIMARY KEY (`EntityEmailID`),
  ADD KEY `api_rtblentityemail_EmailIDF_id_7a6c4a2a_fk_api_tblemail_EmailID` (`EmailIDF_id`),
  ADD KEY `api_rtblentityemail_EntityIDF_id_53c27b72_fk_api_tblen` (`EntityIDF_id`);

--
-- Indexes for table `api_stbladdresstype`
--
ALTER TABLE `api_stbladdresstype`
  ADD PRIMARY KEY (`AddressTypeID`);

--
-- Indexes for table `api_stblcompanytype`
--
ALTER TABLE `api_stblcompanytype`
  ADD PRIMARY KEY (`CompanyTypeID`);

--
-- Indexes for table `api_stblcountrycodetype`
--
ALTER TABLE `api_stblcountrycodetype`
  ADD PRIMARY KEY (`CountryCodeID`);

--
-- Indexes for table `api_stblemailtype`
--
ALTER TABLE `api_stblemailtype`
  ADD PRIMARY KEY (`EmailTypeID`);

--
-- Indexes for table `api_stblentitytype`
--
ALTER TABLE `api_stblentitytype`
  ADD PRIMARY KEY (`EntityTypeID`);

--
-- Indexes for table `api_stblheadcounttype`
--
ALTER TABLE `api_stblheadcounttype`
  ADD PRIMARY KEY (`HeadCountTypeID`);

--
-- Indexes for table `api_stblindustrytype`
--
ALTER TABLE `api_stblindustrytype`
  ADD PRIMARY KEY (`IndustryID`);

--
-- Indexes for table `api_stblpersontype`
--
ALTER TABLE `api_stblpersontype`
  ADD PRIMARY KEY (`PersonTypeID`);

--
-- Indexes for table `api_stblphonetype`
--
ALTER TABLE `api_stblphonetype`
  ADD PRIMARY KEY (`PhoneTypeID`);

--
-- Indexes for table `api_stblphototype`
--
ALTER TABLE `api_stblphototype`
  ADD PRIMARY KEY (`PhotoTypeID`);

--
-- Indexes for table `api_stblsocialmediatype`
--
ALTER TABLE `api_stblsocialmediatype`
  ADD PRIMARY KEY (`SocialMediaTypeID`);

--
-- Indexes for table `api_stblsuffixtype`
--
ALTER TABLE `api_stblsuffixtype`
  ADD PRIMARY KEY (`SuffixID`);

--
-- Indexes for table `api_tbladdress`
--
ALTER TABLE `api_tbladdress`
  ADD PRIMARY KEY (`AddressID`),
  ADD KEY `api_tbladdress_AddressTypeIDF_id_69854165_fk_api_stbla` (`AddressTypeIDF_id`);

--
-- Indexes for table `api_tblcompany`
--
ALTER TABLE `api_tblcompany`
  ADD PRIMARY KEY (`CompanyID`),
  ADD KEY `api_tblcompany_CompanyTypeIDF_id_1ab73436_fk_api_stblc` (`CompanyTypeIDF_id`),
  ADD KEY `api_tblcompany_EntityIDF_id_af369345_fk_api_tblentity_EntityID` (`EntityIDF_id`),
  ADD KEY `api_tblcompany_IndustryIDF_id_7e53d733_fk_api_stbli` (`IndustryIDF_id`),
  ADD KEY `api_tblcompany_HeadcountIDF_id_5a10dd52_fk_api_tblhe` (`HeadcountIDF_id`);

--
-- Indexes for table `api_tblcountrycode`
--
ALTER TABLE `api_tblcountrycode`
  ADD PRIMARY KEY (`CodeID`),
  ADD UNIQUE KEY `api_tblcountrycode_CountryCodeIDF_id_03f8b793_uniq` (`CountryCodeIDF_id`);

--
-- Indexes for table `api_tblemail`
--
ALTER TABLE `api_tblemail`
  ADD PRIMARY KEY (`EmailID`),
  ADD KEY `api_tblemail_EmailTypeIDF_id_b37254b3_fk_api_stble` (`EmailTypeIDF_id`);

--
-- Indexes for table `api_tblentity`
--
ALTER TABLE `api_tblentity`
  ADD PRIMARY KEY (`EntityID`),
  ADD KEY `api_tblentity_EntityTypeIDF_id_529753a7_fk_api_stble` (`EntityTypeIDF_id`),
  ADD KEY `api_tblentity_CreatedBY_id_223b6e97_fk_auth_user_id` (`CreatedBY_id`);

--
-- Indexes for table `api_tblentityphone`
--
ALTER TABLE `api_tblentityphone`
  ADD PRIMARY KEY (`EntityPhoneID`),
  ADD KEY `api_tblentityphone_EntityIDF_id_a355d4b0_fk_api_tblen` (`EntityIDF_id`),
  ADD KEY `api_tblentityphone_PhoneIDF_id_937d6a8d_fk_api_tblphoto_PhotoID` (`PhoneIDF_id`);

--
-- Indexes for table `api_tblentitysocialmedia`
--
ALTER TABLE `api_tblentitysocialmedia`
  ADD PRIMARY KEY (`EntitySocialMediaID`),
  ADD KEY `api_tblentitysocialm_EntityIDF_id_f1157f2f_fk_api_tblen` (`EntityIDF_id`),
  ADD KEY `api_tblentitysocialm_SocialMediaIDF_id_9081ff08_fk_api_tblso` (`SocialMediaIDF_id`);

--
-- Indexes for table `api_tblheadcount`
--
ALTER TABLE `api_tblheadcount`
  ADD PRIMARY KEY (`HeadCountID`),
  ADD KEY `api_tblheadcount_HeadCountTypeIDF_id_42466579_fk_api_stblh` (`HeadCountTypeIDF_id`);

--
-- Indexes for table `api_tblperson`
--
ALTER TABLE `api_tblperson`
  ADD PRIMARY KEY (`PersonID`),
  ADD KEY `api_tblperson_EntityIDF_id_9e341452_fk_api_tblentity_EntityID` (`EntityIDF_id`),
  ADD KEY `api_tblperson_PersonTypeIDF_id_667c6a6d_fk_api_stblp` (`PersonTypeIDF_id`),
  ADD KEY `api_tblperson_SuffixIDF_id_11f1dbdb_fk_api_stbls` (`SuffixIDF_id`);

--
-- Indexes for table `api_tblphone`
--
ALTER TABLE `api_tblphone`
  ADD PRIMARY KEY (`PhoneID`),
  ADD KEY `api_tblphone_CodeIDF_id_aacfff7e_fk_api_tblcountrycode_CodeID` (`CodeIDF_id`),
  ADD KEY `api_tblphone_PhoneTypeIDF_id_ef8eacf4_fk_api_stblp` (`PhoneTypeIDF_id`);

--
-- Indexes for table `api_tblphoto`
--
ALTER TABLE `api_tblphoto`
  ADD PRIMARY KEY (`PhotoID`),
  ADD KEY `api_tblphoto_PhotoTypeIDF_id_7381cd3d_fk_api_stblp` (`PhotoTypeIDF_id`),
  ADD KEY `api_tblphoto_EntityIDF_id_a5c25884_fk_api_tblentity_EntityID` (`EntityIDF_id`);

--
-- Indexes for table `api_tblsocialmedia`
--
ALTER TABLE `api_tblsocialmedia`
  ADD PRIMARY KEY (`SocialmediaID`),
  ADD KEY `api_tblsocialmedia_SocialMediaTypeIDF_i_b3923f38_fk_api_stbls` (`SocialMediaTypeIDF_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_rtblentity`
--
ALTER TABLE `api_rtblentity`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `api_rtblentityaddress`
--
ALTER TABLE `api_rtblentityaddress`
  MODIFY `EntityAddessID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `api_rtblentityemail`
--
ALTER TABLE `api_rtblentityemail`
  MODIFY `EntityEmailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `api_stbladdresstype`
--
ALTER TABLE `api_stbladdresstype`
  MODIFY `AddressTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `api_stblcompanytype`
--
ALTER TABLE `api_stblcompanytype`
  MODIFY `CompanyTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `api_stblcountrycodetype`
--
ALTER TABLE `api_stblcountrycodetype`
  MODIFY `CountryCodeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `api_stblemailtype`
--
ALTER TABLE `api_stblemailtype`
  MODIFY `EmailTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `api_stblentitytype`
--
ALTER TABLE `api_stblentitytype`
  MODIFY `EntityTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `api_stblheadcounttype`
--
ALTER TABLE `api_stblheadcounttype`
  MODIFY `HeadCountTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `api_stblindustrytype`
--
ALTER TABLE `api_stblindustrytype`
  MODIFY `IndustryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `api_stblpersontype`
--
ALTER TABLE `api_stblpersontype`
  MODIFY `PersonTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `api_stblphonetype`
--
ALTER TABLE `api_stblphonetype`
  MODIFY `PhoneTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `api_stblphototype`
--
ALTER TABLE `api_stblphototype`
  MODIFY `PhotoTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `api_stblsocialmediatype`
--
ALTER TABLE `api_stblsocialmediatype`
  MODIFY `SocialMediaTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `api_stblsuffixtype`
--
ALTER TABLE `api_stblsuffixtype`
  MODIFY `SuffixID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `api_tbladdress`
--
ALTER TABLE `api_tbladdress`
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `api_tblcompany`
--
ALTER TABLE `api_tblcompany`
  MODIFY `CompanyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `api_tblcountrycode`
--
ALTER TABLE `api_tblcountrycode`
  MODIFY `CodeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `api_tblemail`
--
ALTER TABLE `api_tblemail`
  MODIFY `EmailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `api_tblentity`
--
ALTER TABLE `api_tblentity`
  MODIFY `EntityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `api_tblentityphone`
--
ALTER TABLE `api_tblentityphone`
  MODIFY `EntityPhoneID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `api_tblentitysocialmedia`
--
ALTER TABLE `api_tblentitysocialmedia`
  MODIFY `EntitySocialMediaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `api_tblheadcount`
--
ALTER TABLE `api_tblheadcount`
  MODIFY `HeadCountID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `api_tblperson`
--
ALTER TABLE `api_tblperson`
  MODIFY `PersonID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `api_tblphone`
--
ALTER TABLE `api_tblphone`
  MODIFY `PhoneID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `api_tblphoto`
--
ALTER TABLE `api_tblphoto`
  MODIFY `PhotoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `api_tblsocialmedia`
--
ALTER TABLE `api_tblsocialmedia`
  MODIFY `SocialmediaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `api_rtblentity`
--
ALTER TABLE `api_rtblentity`
  ADD CONSTRAINT `api_rtblentity_AddressIDF_id_1b2efba5_fk_api_tblad` FOREIGN KEY (`AddressIDF_id`) REFERENCES `api_tbladdress` (`AddressID`),
  ADD CONSTRAINT `api_rtblentity_CompanyIDF_id_e3dc4d65_fk_api_tblco` FOREIGN KEY (`CompanyIDF_id`) REFERENCES `api_tblcompany` (`CompanyID`),
  ADD CONSTRAINT `api_rtblentity_EntityTypeIDF_id_04558e5a_fk_api_stble` FOREIGN KEY (`EntityTypeIDF_id`) REFERENCES `api_stblentitytype` (`EntityTypeID`),
  ADD CONSTRAINT `api_rtblentity_PersonIDF_id_ef4cd3f2_fk_api_tblperson_PersonID` FOREIGN KEY (`PersonIDF_id`) REFERENCES `api_tblperson` (`PersonID`);

--
-- Constraints for table `api_rtblentityaddress`
--
ALTER TABLE `api_rtblentityaddress`
  ADD CONSTRAINT `api_rtblentityaddres_AddressIDF_id_fd1c4503_fk_api_tblad` FOREIGN KEY (`AddressIDF_id`) REFERENCES `api_tbladdress` (`AddressID`),
  ADD CONSTRAINT `api_rtblentityaddres_EntityIDF_id_f8687b2b_fk_api_tblen` FOREIGN KEY (`EntityIDF_id`) REFERENCES `api_tblentity` (`EntityID`);

--
-- Constraints for table `api_rtblentityemail`
--
ALTER TABLE `api_rtblentityemail`
  ADD CONSTRAINT `api_rtblentityemail_EmailIDF_id_7a6c4a2a_fk_api_tblemail_EmailID` FOREIGN KEY (`EmailIDF_id`) REFERENCES `api_tblemail` (`EmailID`),
  ADD CONSTRAINT `api_rtblentityemail_EntityIDF_id_53c27b72_fk_api_tblen` FOREIGN KEY (`EntityIDF_id`) REFERENCES `api_tblentity` (`EntityID`);

--
-- Constraints for table `api_tbladdress`
--
ALTER TABLE `api_tbladdress`
  ADD CONSTRAINT `api_tbladdress_AddressTypeIDF_id_69854165_fk_api_stbla` FOREIGN KEY (`AddressTypeIDF_id`) REFERENCES `api_stbladdresstype` (`AddressTypeID`);

--
-- Constraints for table `api_tblcompany`
--
ALTER TABLE `api_tblcompany`
  ADD CONSTRAINT `api_tblcompany_CompanyTypeIDF_id_1ab73436_fk_api_stblc` FOREIGN KEY (`CompanyTypeIDF_id`) REFERENCES `api_stblcompanytype` (`CompanyTypeID`),
  ADD CONSTRAINT `api_tblcompany_EntityIDF_id_af369345_fk_api_tblentity_EntityID` FOREIGN KEY (`EntityIDF_id`) REFERENCES `api_tblentity` (`EntityID`),
  ADD CONSTRAINT `api_tblcompany_HeadcountIDF_id_5a10dd52_fk_api_tblhe` FOREIGN KEY (`HeadcountIDF_id`) REFERENCES `api_tblheadcount` (`HeadCountID`),
  ADD CONSTRAINT `api_tblcompany_IndustryIDF_id_7e53d733_fk_api_stbli` FOREIGN KEY (`IndustryIDF_id`) REFERENCES `api_stblindustrytype` (`IndustryID`);

--
-- Constraints for table `api_tblcountrycode`
--
ALTER TABLE `api_tblcountrycode`
  ADD CONSTRAINT `api_tblcountrycode_CountryCodeIDF_id_03f8b793_fk_api_stblc` FOREIGN KEY (`CountryCodeIDF_id`) REFERENCES `api_stblcountrycodetype` (`CountryCodeID`);

--
-- Constraints for table `api_tblemail`
--
ALTER TABLE `api_tblemail`
  ADD CONSTRAINT `api_tblemail_EmailTypeIDF_id_b37254b3_fk_api_stble` FOREIGN KEY (`EmailTypeIDF_id`) REFERENCES `api_stblemailtype` (`EmailTypeID`);

--
-- Constraints for table `api_tblentity`
--
ALTER TABLE `api_tblentity`
  ADD CONSTRAINT `api_tblentity_CreatedBY_id_223b6e97_fk_auth_user_id` FOREIGN KEY (`CreatedBY_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `api_tblentity_EntityTypeIDF_id_529753a7_fk_api_stble` FOREIGN KEY (`EntityTypeIDF_id`) REFERENCES `api_stblentitytype` (`EntityTypeID`);

--
-- Constraints for table `api_tblentityphone`
--
ALTER TABLE `api_tblentityphone`
  ADD CONSTRAINT `api_tblentityphone_EntityIDF_id_a355d4b0_fk_api_tblen` FOREIGN KEY (`EntityIDF_id`) REFERENCES `api_tblentity` (`EntityID`),
  ADD CONSTRAINT `api_tblentityphone_PhoneIDF_id_937d6a8d_fk_api_tblphone_PhoneID` FOREIGN KEY (`PhoneIDF_id`) REFERENCES `api_tblphone` (`PhoneID`);

--
-- Constraints for table `api_tblentitysocialmedia`
--
ALTER TABLE `api_tblentitysocialmedia`
  ADD CONSTRAINT `api_tblentitysocialm_EntityIDF_id_f1157f2f_fk_api_tblen` FOREIGN KEY (`EntityIDF_id`) REFERENCES `api_tblentity` (`EntityID`),
  ADD CONSTRAINT `api_tblentitysocialm_SocialMediaIDF_id_9081ff08_fk_api_tblso` FOREIGN KEY (`SocialMediaIDF_id`) REFERENCES `api_tblsocialmedia` (`SocialmediaID`);

--
-- Constraints for table `api_tblheadcount`
--
ALTER TABLE `api_tblheadcount`
  ADD CONSTRAINT `api_tblheadcount_HeadCountTypeIDF_id_42466579_fk_api_stblh` FOREIGN KEY (`HeadCountTypeIDF_id`) REFERENCES `api_stblheadcounttype` (`HeadCountTypeID`);

--
-- Constraints for table `api_tblperson`
--
ALTER TABLE `api_tblperson`
  ADD CONSTRAINT `api_tblperson_EntityIDF_id_9e341452_fk_api_tblentity_EntityID` FOREIGN KEY (`EntityIDF_id`) REFERENCES `api_tblentity` (`EntityID`),
  ADD CONSTRAINT `api_tblperson_PersonTypeIDF_id_667c6a6d_fk_api_stblp` FOREIGN KEY (`PersonTypeIDF_id`) REFERENCES `api_stblpersontype` (`PersonTypeID`),
  ADD CONSTRAINT `api_tblperson_SuffixIDF_id_11f1dbdb_fk_api_stbls` FOREIGN KEY (`SuffixIDF_id`) REFERENCES `api_stblsuffixtype` (`SuffixID`);

--
-- Constraints for table `api_tblphone`
--
ALTER TABLE `api_tblphone`
  ADD CONSTRAINT `api_tblphone_CodeIDF_id_aacfff7e_fk_api_tblcountrycode_CodeID` FOREIGN KEY (`CodeIDF_id`) REFERENCES `api_tblcountrycode` (`CodeID`),
  ADD CONSTRAINT `api_tblphone_PhoneTypeIDF_id_ef8eacf4_fk_api_stblp` FOREIGN KEY (`PhoneTypeIDF_id`) REFERENCES `api_stblphonetype` (`PhoneTypeID`);

--
-- Constraints for table `api_tblphoto`
--
ALTER TABLE `api_tblphoto`
  ADD CONSTRAINT `api_tblphoto_EntityIDF_id_a5c25884_fk_api_tblentity_EntityID` FOREIGN KEY (`EntityIDF_id`) REFERENCES `api_tblentity` (`EntityID`),
  ADD CONSTRAINT `api_tblphoto_PhotoTypeIDF_id_7381cd3d_fk_api_stblp` FOREIGN KEY (`PhotoTypeIDF_id`) REFERENCES `api_stblphototype` (`PhotoTypeID`);

--
-- Constraints for table `api_tblsocialmedia`
--
ALTER TABLE `api_tblsocialmedia`
  ADD CONSTRAINT `api_tblsocialmedia_SocialMediaTypeIDF_i_b3923f38_fk_api_stbls` FOREIGN KEY (`SocialMediaTypeIDF_id`) REFERENCES `api_stblsocialmediatype` (`SocialMediaTypeID`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
