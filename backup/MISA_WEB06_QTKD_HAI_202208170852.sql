﻿--
-- Script was generated by Devart dbForge Studio 2020 for MySQL, Version 9.0.338.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 8/17/2022 8:52:32 AM
-- Server version: 10.3.34
-- Client version: 4.1
--

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

--
-- Set default database
--
USE `MISA.WEB06.QTKD.HAI`;

--
-- Drop table `AnnualRevenue`
--
DROP TABLE IF EXISTS AnnualRevenue;

--
-- Drop table `BusinessType`
--
DROP TABLE IF EXISTS BusinessType;

--
-- Drop table `Country`
--
DROP TABLE IF EXISTS Country;

--
-- Drop table `Department`
--
DROP TABLE IF EXISTS Department;

--
-- Drop table `District`
--
DROP TABLE IF EXISTS District;

--
-- Drop table `Industry`
--
DROP TABLE IF EXISTS Industry;

--
-- Drop table `LeadSource`
--
DROP TABLE IF EXISTS LeadSource;

--
-- Drop table `LeadType`
--
DROP TABLE IF EXISTS LeadType;

--
-- Drop table `Province`
--
DROP TABLE IF EXISTS Province;

--
-- Drop table `Salutation`
--
DROP TABLE IF EXISTS Salutation;

--
-- Drop table `Sector`
--
DROP TABLE IF EXISTS Sector;

--
-- Drop table `Title`
--
DROP TABLE IF EXISTS Title;

--
-- Drop table `Ward`
--
DROP TABLE IF EXISTS Ward;

--
-- Drop procedure `Proc_InsertLead`
--
DROP PROCEDURE IF EXISTS Proc_InsertLead;

--
-- Drop table `Leads`
--
DROP TABLE IF EXISTS Leads;

--
-- Set default database
--
USE `MISA.WEB06.QTKD.HAI`;

--
-- Create table `Leads`
--
CREATE TABLE Leads (
  LeadID char(36) NOT NULL DEFAULT '' COMMENT 'ID của tiềm năng',
  LeadCode varchar(20) DEFAULT '' COMMENT 'Mã tiềm năng',
  LastName varchar(100) DEFAULT '' COMMENT 'Tên đầy đủ của khách hàng tiềm năng',
  FirstName varchar(100) DEFAULT NULL COMMENT 'Tên khách hàng tiềm năng',
  Email varchar(100) DEFAULT NULL COMMENT 'Email',
  Address varchar(255) DEFAULT NULL COMMENT 'Địa chỉ',
  TitleID int(11) DEFAULT NULL COMMENT 'ID của chức danh',
  TitleName varchar(255) DEFAULT NULL COMMENT 'Chức vụ',
  AnnualRevenueID int(11) DEFAULT NULL COMMENT 'Doanh thu hằng năm ID',
  AnnualRevenueName varchar(255) DEFAULT NULL COMMENT 'Doanh thu hàng năm đạt',
  SalutationID int(11) DEFAULT NULL COMMENT 'Mã xưng hô',
  SalutationName varchar(30) DEFAULT NULL COMMENT 'Xưng hô là',
  DepartmentID int(11) DEFAULT NULL COMMENT 'ID phòng ban',
  DepartmentName varchar(255) DEFAULT NULL COMMENT 'Tên phòng ban',
  Mobile varchar(50) DEFAULT NULL COMMENT 'Điện thoại di động',
  OfficeMobile varchar(50) DEFAULT NULL COMMENT 'Điện thoại cơ quan',
  LeadSourceID int(11) DEFAULT NULL COMMENT 'Mã tiềm năng',
  LeadSourceName varchar(100) DEFAULT NULL COMMENT 'Tên mã tiềm năng',
  LeadTypeID int(11) DEFAULT NULL COMMENT 'ID loại khách hàng tiềm năng',
  LeadTypeName varchar(255) DEFAULT NULL COMMENT 'Tên loại khách hàng tiềm năng',
  Zalo varchar(50) DEFAULT NULL COMMENT 'Tài khoản Zalo',
  OfficeEmail varchar(100) DEFAULT NULL COMMENT 'Email cơ quan',
  CompanyName varchar(255) DEFAULT NULL COMMENT 'Tên công ty',
  TaxCode varchar(50) DEFAULT NULL COMMENT 'Mã số thuế',
  BankAccount varchar(50) DEFAULT NULL COMMENT 'Tài khoản ngân hàng',
  EstablishDay datetime DEFAULT NULL COMMENT 'Ngày thành lập',
  SectorID int(11) DEFAULT NULL COMMENT 'ID khu vực',
  SectorName varchar(255) DEFAULT NULL COMMENT 'Khu vực',
  BankName varchar(255) DEFAULT NULL COMMENT 'Tên ngân hàng',
  BusinessTypeID int(11) DEFAULT NULL COMMENT 'ID loại khách hàng',
  BusinessTypeName varchar(255) DEFAULT NULL COMMENT 'phân loại khách hàng',
  IndustryID int(11) DEFAULT NULL COMMENT 'Mã ngành nghề',
  IndustryName varchar(255) DEFAULT NULL COMMENT 'Tên ngành nghề',
  CountryID int(11) DEFAULT NULL COMMENT 'ID quốc gia',
  CountryName varchar(255) DEFAULT NULL COMMENT 'Tên Quốc gia',
  DistrictID int(11) DEFAULT NULL COMMENT 'ID Huyện',
  DistrictName varchar(255) DEFAULT NULL COMMENT 'Tên huyện',
  Street varchar(255) DEFAULT NULL COMMENT 'Số nhà, Đường phố',
  ProvinceID int(11) DEFAULT NULL COMMENT 'ID thành phố',
  ProvinceName varchar(255) DEFAULT NULL COMMENT 'Tên thành phố',
  WardID int(11) DEFAULT NULL COMMENT 'ID xã',
  WardName varchar(255) DEFAULT NULL COMMENT 'Xã',
  ZipCode varchar(10) DEFAULT NULL COMMENT 'mã vùng',
  Description varchar(255) DEFAULT NULL COMMENT 'Mô tả',
  IsPublic bit(1) DEFAULT NULL COMMENT 'dùng chung (0 - true, 1 false)',
  CreatedDate datetime DEFAULT NULL,
  CreatedBy varchar(255) DEFAULT NULL,
  ModifiedDate datetime DEFAULT NULL,
  ModifiedBy varchar(255) DEFAULT NULL,
  PRIMARY KEY (LeadID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 1638,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci;

--
-- Create index `IDX_Leads_Address` on table `Leads`
--
ALTER TABLE Leads
ADD INDEX IDX_Leads_Address (Address);

--
-- Create index `IDX_Leads_AnnualRevenueName` on table `Leads`
--
ALTER TABLE Leads
ADD INDEX IDX_Leads_AnnualRevenueName (AnnualRevenueName);

--
-- Create index `IDX_Leads_BusinessTypeName` on table `Leads`
--
ALTER TABLE Leads
ADD INDEX IDX_Leads_BusinessTypeName (BusinessTypeName);

--
-- Create index `IDX_Leads_CountryName` on table `Leads`
--
ALTER TABLE Leads
ADD INDEX IDX_Leads_CountryName (CountryName);

--
-- Create index `IDX_Leads_DepartmentName` on table `Leads`
--
ALTER TABLE Leads
ADD INDEX IDX_Leads_DepartmentName (DepartmentName);

--
-- Create index `IDX_Leads_Description` on table `Leads`
--
ALTER TABLE Leads
ADD INDEX IDX_Leads_Description (Description);

--
-- Create index `IDX_Leads_DistrictName` on table `Leads`
--
ALTER TABLE Leads
ADD INDEX IDX_Leads_DistrictName (DistrictName);

--
-- Create index `IDX_Leads_Email` on table `Leads`
--
ALTER TABLE Leads
ADD INDEX IDX_Leads_Email (Email);

--
-- Create index `IDX_Leads_IndustryName` on table `Leads`
--
ALTER TABLE Leads
ADD INDEX IDX_Leads_IndustryName (IndustryName);

--
-- Create index `IDX_Leads_LastName` on table `Leads`
--
ALTER TABLE Leads
ADD INDEX IDX_Leads_LastName (LastName);

--
-- Create index `IDX_Leads_LeadSourceName` on table `Leads`
--
ALTER TABLE Leads
ADD INDEX IDX_Leads_LeadSourceName (LeadSourceName);

--
-- Create index `IDX_Leads_LeadTypeName` on table `Leads`
--
ALTER TABLE Leads
ADD INDEX IDX_Leads_LeadTypeName (LeadTypeName);

--
-- Create index `IDX_Leads_OfficeEmail` on table `Leads`
--
ALTER TABLE Leads
ADD INDEX IDX_Leads_OfficeEmail (OfficeEmail);

--
-- Create index `IDX_Leads_ProvinceName` on table `Leads`
--
ALTER TABLE Leads
ADD INDEX IDX_Leads_ProvinceName (ProvinceName);

--
-- Create index `IDX_Leads_SalutationName` on table `Leads`
--
ALTER TABLE Leads
ADD INDEX IDX_Leads_SalutationName (SalutationName);

--
-- Create index `IDX_Leads_SectorName` on table `Leads`
--
ALTER TABLE Leads
ADD INDEX IDX_Leads_SectorName (SectorName);

--
-- Create index `IDX_Leads_TitleName` on table `Leads`
--
ALTER TABLE Leads
ADD INDEX IDX_Leads_TitleName (TitleName);

--
-- Create index `IDX_Leads_WardName` on table `Leads`
--
ALTER TABLE Leads
ADD INDEX IDX_Leads_WardName (WardName);

--
-- Create index `IDX_Leads_ZipCode` on table `Leads`
--
ALTER TABLE Leads
ADD INDEX IDX_Leads_ZipCode (ZipCode);

--
-- Create index `UK_Leads_LeadCode` on table `Leads`
--
ALTER TABLE Leads
ADD UNIQUE INDEX UK_Leads_LeadCode (LeadCode);

DELIMITER $$

--
-- Create procedure `Proc_InsertLead`
--
CREATE DEFINER = 'dev'@'%'
PROCEDURE Proc_InsertLead (IN id char(36), IN name varchar(255), IN email varchar(50), IN phone varchar(25))
BEGIN
  INSERT Leads (LeadsID, LeadsName, Email, Phone)
    VALUES (id, name, email, phone);
END
$$

DELIMITER ;

--
-- Create table `Ward`
--
CREATE TABLE Ward (
  WardID char(36) NOT NULL DEFAULT '' COMMENT 'Mã phường xã',
  WardName varchar(255) DEFAULT NULL COMMENT 'Tên phường xã',
  PRIMARY KEY (WardID)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Phường xã';

--
-- Create index `IDX_Ward_WardName` on table `Ward`
--
ALTER TABLE Ward
ADD INDEX IDX_Ward_WardName (WardName);

--
-- Create table `Title`
--
CREATE TABLE Title (
  TitleID char(36) NOT NULL DEFAULT '' COMMENT 'ID chức danh',
  TitleName varchar(100) DEFAULT NULL COMMENT 'Chức danh',
  PRIMARY KEY (TitleID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci;

--
-- Create index `IDX_Title_TitleName` on table `Title`
--
ALTER TABLE Title
ADD INDEX IDX_Title_TitleName (TitleName);

--
-- Create table `Sector`
--
CREATE TABLE Sector (
  SectorID char(36) NOT NULL DEFAULT '' COMMENT 'Mã lĩnh vực',
  SectorName varchar(255) DEFAULT NULL COMMENT 'Tên lĩnh vực',
  PRIMARY KEY (SectorID)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Lĩnh vực';

--
-- Create index `IDX_Sector_SectorName` on table `Sector`
--
ALTER TABLE Sector
ADD INDEX IDX_Sector_SectorName (SectorName);

--
-- Create table `Salutation`
--
CREATE TABLE Salutation (
  SalutationID char(36) NOT NULL DEFAULT '' COMMENT 'Mã xưng hô',
  SalutationName varchar(255) DEFAULT NULL COMMENT 'Tên xưng hô',
  PRIMARY KEY (SalutationID)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Xưng hô';

--
-- Create index `IDX_Salutation_SalutationName` on table `Salutation`
--
ALTER TABLE Salutation
ADD INDEX IDX_Salutation_SalutationName (SalutationName);

--
-- Create table `Province`
--
CREATE TABLE Province (
  ProvinceID char(36) NOT NULL DEFAULT '' COMMENT 'Mã tỉnh',
  ProvinceName varchar(255) DEFAULT NULL COMMENT 'Tên tỉnh , thành phố',
  PRIMARY KEY (ProvinceID)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Tỉnh/Thành phố';

--
-- Create index `IDX_Province_ProvinceName` on table `Province`
--
ALTER TABLE Province
ADD INDEX IDX_Province_ProvinceName (ProvinceName);

--
-- Create table `LeadType`
--
CREATE TABLE LeadType (
  LeadTypeID char(36) NOT NULL DEFAULT '' COMMENT 'Mã loại tiềm năng',
  LeadTypeName varchar(255) DEFAULT NULL,
  PRIMARY KEY (LeadTypeID)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Loại tiềm năng';

--
-- Create index `IDX_LeadType_LeadTypeName` on table `LeadType`
--
ALTER TABLE LeadType
ADD INDEX IDX_LeadType_LeadTypeName (LeadTypeName);

--
-- Create table `LeadSource`
--
CREATE TABLE LeadSource (
  LeadSourceID char(36) NOT NULL DEFAULT '' COMMENT 'Mã nguồn gốc',
  LeadSourceName varchar(255) DEFAULT NULL COMMENT 'Tên nguồn gốc',
  PRIMARY KEY (LeadSourceID)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create index `IDX_LeadSource_LeadSourceName` on table `LeadSource`
--
ALTER TABLE LeadSource
ADD INDEX IDX_LeadSource_LeadSourceName (LeadSourceName);

--
-- Create table `Industry`
--
CREATE TABLE Industry (
  IndustryID char(36) NOT NULL DEFAULT '' COMMENT 'Mã ngành nghề',
  IndustryName varchar(255) DEFAULT NULL COMMENT 'Tên ngành nghề',
  PRIMARY KEY (IndustryID)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Ngành nghề';

--
-- Create index `IDX_Industry_IndustryName` on table `Industry`
--
ALTER TABLE Industry
ADD INDEX IDX_Industry_IndustryName (IndustryName);

--
-- Create table `District`
--
CREATE TABLE District (
  DistrictID char(36) NOT NULL DEFAULT '' COMMENT 'Mã  quận huyện',
  DistrictName varchar(255) DEFAULT NULL COMMENT 'Tên quận huyện',
  PRIMARY KEY (DistrictID)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Quận huyện';

--
-- Create index `IDX_District_DistrictName` on table `District`
--
ALTER TABLE District
ADD INDEX IDX_District_DistrictName (DistrictName);

--
-- Create table `Department`
--
CREATE TABLE Department (
  DepartmentID char(36) NOT NULL DEFAULT '' COMMENT 'Mã phòng ban',
  DepartmentName varchar(255) DEFAULT NULL COMMENT 'Tên phòng ban',
  PRIMARY KEY (DepartmentID)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Create index `IDX_Department_DepartmentName` on table `Department`
--
ALTER TABLE Department
ADD INDEX IDX_Department_DepartmentName (DepartmentName);

--
-- Create table `Country`
--
CREATE TABLE Country (
  CountryID char(36) NOT NULL DEFAULT '' COMMENT 'Mã quốc gia',
  CountryName varchar(255) DEFAULT NULL COMMENT 'Tên quốc gia',
  PRIMARY KEY (CountryID)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Quốc gia';

--
-- Create index `IDX_Country_CountryName` on table `Country`
--
ALTER TABLE Country
ADD INDEX IDX_Country_CountryName (CountryName);

--
-- Create table `BusinessType`
--
CREATE TABLE BusinessType (
  BusinessTypeID char(36) NOT NULL DEFAULT '' COMMENT 'Mã loại hình',
  BusinessTypeName varchar(255) DEFAULT NULL COMMENT 'Tên loại hình',
  PRIMARY KEY (BusinessTypeID)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Loại hình';

--
-- Create index `IDX_BusinessType_BusinessTypeName` on table `BusinessType`
--
ALTER TABLE BusinessType
ADD INDEX IDX_BusinessType_BusinessTypeName (BusinessTypeName);

--
-- Create table `AnnualRevenue`
--
CREATE TABLE AnnualRevenue (
  AnnualRevenueID char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Mã doanh thu',
  AnnualRevenueName varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Doanh thu hàng năm',
  PRIMARY KEY (AnnualRevenueID)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = 'Doanh thu';

--
-- Create index `IDX_AnnualRevenue_AnnualRevenueName` on table `AnnualRevenue`
--
ALTER TABLE AnnualRevenue
ADD INDEX IDX_AnnualRevenue_AnnualRevenueName (AnnualRevenueName);

-- 
-- Dumping data for table Ward
--
-- Table `MISA.WEB06.QTKD.HAI`.Ward does not contain any data (it is empty)

-- 
-- Dumping data for table Title
--
INSERT INTO Title VALUES
('674934cc-42cf-20cf-1d4a-aea48a10ed18', 'Chủ tịch'),
('34bd2cef-5026-567c-3b71-153b37881afe', 'Giám đốc'),
('64a59a25-2488-54b0-f6b4-c8af08a50cbf', 'Trưởng phòng');

-- 
-- Dumping data for table Sector
--
-- Table `MISA.WEB06.QTKD.HAI`.Sector does not contain any data (it is empty)

-- 
-- Dumping data for table Salutation
--
-- Table `MISA.WEB06.QTKD.HAI`.Salutation does not contain any data (it is empty)

-- 
-- Dumping data for table Province
--
-- Table `MISA.WEB06.QTKD.HAI`.Province does not contain any data (it is empty)

-- 
-- Dumping data for table LeadType
--
-- Table `MISA.WEB06.QTKD.HAI`.LeadType does not contain any data (it is empty)

-- 
-- Dumping data for table LeadSource
--
-- Table `MISA.WEB06.QTKD.HAI`.LeadSource does not contain any data (it is empty)

-- 
-- Dumping data for table Leads
--
INSERT INTO Leads VALUES
('12437806-26ac-3517-9c0b-87ae14180c33', 'TN-2392', 'Nguyễn', 'Minh Hoa', 'qtruong270900@gmail.com', 'Bắc Giang', 15, 'Quản lý', 15, '35 tỷ đồng', 15, 'Bà', 15, 'Phòng nhân sự', '0878912566', '0365605634', 15, 'Khách hàng tự tìm đến', 15, 'KH Thương Mại', 'Nguyễn Linh', 'mtudz35@gmail.com', 'FPT Soft', 'AC2HF4474359R', '5701423395', '2013-07-20 00:00:00', 15, 'Construction & Materials', 'Saccombank', 15, 'Doanh nghiệp tư nhân', 15, 'Dịch vụ hiếu hỉ', 15, 'Việt Nam', 15, 'Huyện Phúc thọ', '16 Ngõ 225', 15, 'Nam Định', 15, 'Hà son', '48708', 'Tiềm năng lớn', False, '1982-02-21 14:54:50', 'dhthinh', '1974-06-14 19:03:17', 'dhthinh'),
('148ed882-32b8-218e-9c20-39c2f00615e8', 'TN-6273', 'Nguyễn', 'Thị Ngọc', 'ngkhanh184@gmail.com', 'Yên Bái', 1, 'Thư ký', 1, '25 tỷ đồng', 1, 'Bà', 1, 'Phòng truyền thông', '0362734857', '0972517213', 1, 'Khách hàng được tặng miễn phí', 1, 'KH Thương Mại', 'Mai Thuận', 'lognhat35@gmail.com', 'FPT Soft', '34460IS0VLEKG', '8234135616', '2018-06-23 00:00:00', 1, 'Alternative Energy', 'Saccombank', 1, 'Công ty TNHH', 1, 'Dịch vụ du lịch', 1, 'Việt Nam', 1, 'Huyện Phúc thọ', '16 Ngõ 225', 1, NULL, 1, 'Quất Lâm tự', '96821', 'Tiềm năng lớn', True, '1979-12-29 14:16:07', 'dhthinh', '2010-10-26 23:55:09', 'dhthinh'),
('14ee7bc0-194c-3948-57be-406293204378', 'TN-6525', 'Nguyễn', 'Thị Ly', 'qkhai019gmail.com', 'Bắc Giang', 14, 'Quản lý', 14, '10 tỷ đồng', 14, 'Chị', 14, 'Phòng nhân sự', '0337955274', '0976880321', 14, 'Khách hàng tự tìm đến', 14, 'KH Thương Mại', 'Nguyễn Anh', 'dvhoan201@gmail.com', 'Theanh28 Express', '5SM19T737FXQW', '6449543231', '2015-09-23 00:00:00', 14, 'Forestry & Paper', 'Agribank', 14, 'Cửa hàng trung tâm', 14, 'Dịch vụ cung ứng phần mềm', 14, 'Việt Nam', 14, 'Huyện Quốc Oai', '16 Ngõ 225', 14, 'Hà Nam', 14, 'Quất Lâm tự', '48685', 'Một tiềm năng mới', True, '1992-05-02 05:35:39', 'dhthinh', '1970-01-01 00:10:13', 'dhthinh'),
('15cb3909-1246-2add-33de-23e177779933', 'TN-3423', 'Nguyễn', 'Thị Linh', 'vhvt297@gmail.com', 'Yên Bái', 27, 'Thư ký', 27, '15 tỷ đồng', 27, 'Bà', 27, 'Phòng nghiên cứu', '0979207126', '0360147344', 27, 'Khách hàng tự tìm đến', 27, 'KH Thương Mại', 'Mai Ngọc', 'ngquyet201@gmail.com', 'FPT Soft', '376ZFL6TJZD4N', '1055305680', '2014-05-19 00:00:00', 27, 'Electricity', 'Saccombank', 27, 'công ty có vốn đầu tư nước ngoài', 27, 'Dịch vụ chăm sóc sắc đẹp', 27, 'Việt Nam', 27, 'Huyện Gia Viễn', '16 Ngõ 225', 27, 'Hà Nội', 27, 'Hà son', '49252', 'Tiềm năng lớn', True, '1970-01-01 00:10:47', 'dhthinh', '2009-03-06 12:08:46', 'dhthinh'),
('15d0d796-1465-4665-fc83-196123975cb2', 'TN-6383', 'Trịnh', 'Ngọc Ly', 'vthanh0019@gmail.com', 'Vĩnh Phúc', 10, 'Nhân viên', 10, '15 tỷ đồng', 10, 'Anh', 10, 'Phòng nhân sự', '0872391095', '0972942398', 10, 'Thông qua hội thảo tập huấn', 10, 'KH Thương Mại', 'Nguyễn Loan', 'yeutien184@gmail.com', 'MISA JSC', '57JU4N65GPEQJ', '5678042388', '2021-07-31 00:00:00', 10, 'Industrial Engineering', 'VietComBank', 10, 'Tổ chức phi chính phủ', 10, 'Dịch vụ cung ứng phần mềm', 10, 'Việt Nam', 10, 'Huyện Phúc thọ', '398 ngõ ̃421', 10, 'Hà Nam', 10, 'Quất Lâm tự', '67589', 'Tiềm năng lớn', True, '2020-06-27 13:26:08', 'dhthinh', '2002-11-16 13:57:30', 'dhthinh'),
('1b691e79-236d-5b5a-9d20-39c2f00615e8', 'TN-0280', 'Nguyễn', 'Minh Hiếu', 'thinhutc191204033@gmail.com', 'Thái Bình', 5, 'Thư ký', 5, '10 tỷ đồng', 5, 'Anh', 5, 'Phòng nhân sự', '0365915651', '0367557018', 5, 'Thông qua hội thảo tập huấn', 5, 'KH Sản Xuất', 'Mai Mai', 'mtudz35@gmail.com', 'Theanh28 Express', '35H683KO09T5E', '2620801467', '2017-11-24 00:00:00', 5, 'Travel & Leisure', 'VietComBank', 5, 'Cửa hàng trung tâm', 5, 'Dịch vụ du lịch', 5, 'Việt Nam', 5, 'Huyện Ba Vì', '186 ngõ ̃830', 5, 'Nam Định', 5, 'Hà son', '27381', 'Một tiềm năng mới', False, '2000-09-23 20:21:51', 'dhthinh', '1970-01-01 00:01:08', 'dhthinh'),
('1f94a596-32c4-2a29-8ad5-ba100c6f7bce', 'TN-6865', 'Nguyễn', 'Minh Cường', 'qkhai019gmail.com', 'Hưng Yên', 26, 'Thư ký', 26, '15 tỷ đồng', 26, 'Bà', 26, 'Phòng đào tạo', '0335720181', '0976840250', 26, 'Khách hàng hoặc đối tác giới thiệu', 26, 'KH Sản Xuất', 'Nguyễn Tuấn', 'vthanh0019@gmail.com', 'MISA JSC', 'V5441JXYL4DZ5', '2335516937', '2012-01-31 00:00:00', 26, 'Industrial Transportation', 'VietComBank', 26, 'Công ty TNHH', 26, 'Dịch vụ cho thuê bảo vệ vệ sĩ', 26, 'Việt Nam', 26, 'Huyện Gia Viễn', '938 ngõ ̃458', 26, NULL, 26, 'Hà son', '11796', 'Tiềm năng lớn', True, '1975-06-06 07:53:36', 'dhthinh', '1970-01-01 00:00:09', 'dhthinh'),
('20bbbd0b-3c4a-7d94-6f09-bf1378b8dc91', 'TN-3386', 'Nguyễn', 'Minh Tuấn', 'qkhai019gmail.com', 'Thái Bình', 12, 'Nhân viên', 12, '5 tỷ đồng', 12, 'Ông', 12, 'Phòng nhân sự', '0971674421', '0334675147', 12, 'Nhân viên kinh doanh tự tìm kiếm', 12, 'KH Sản Xuất', 'Nguyễn Thành', 'dgchung2k@gmail.com', 'FPT Soft', 'K722KA0214FL9', '9379967709', '2015-09-01 00:00:00', 12, 'Real Estate Investment & Services', 'Agribank', 12, 'Công ty TNHH', 12, 'Dịch vụ hiếu hỉ', 12, 'Việt Nam', 12, 'Huyện Gia Viễn', '802 ngõ ̃820', 12, 'Nam Định', 12, 'Trực Thái', '25316', 'Tiềm năng lớn', True, '2014-10-28 10:46:17', 'dhthinh', '1982-12-30 19:07:29', 'dhthinh'),
('22f29725-54f0-11f0-9d0b-87ae14180c33', 'TN-1767', 'Nguyễn', 'Mai Loan', 'vhvt297@gmail.com', 'Vĩnh Phúc', 20, 'Nhân viên', 20, '15 tỷ đồng', 20, 'Chị', 20, 'Phòng nhân sự', '0337138572', '0337305926', 20, 'Khách hàng tự tìm đến', 20, 'KH Sản Xuất', 'Mai Hương', 'vthanh0019@gmail.com', 'Theanh28 Express', 'E9N92B9513H0Q', '8020286963', '2012-07-06 00:00:00', 20, 'Real Estate Investment Trusts', 'VietComBank', 20, 'Doanh nghiệp tư nhân', 20, 'Dịch vụ hiếu hỉ', 20, 'Việt Nam', 20, 'Huyện Ba Vì', '16 Ngõ 225', 20, 'Hà Nội', 20, 'Trực Thái', '52663', 'Một tiềm năng mới', True, '2014-08-14 06:52:48', 'dhthinh', '2002-04-15 10:39:10', 'dhthinh'),
('234d2569-6b1c-720c-9f20-39c2f00615e8', 'TN-7891', 'Nguyễn', 'Việt Thành', 'binh20061956@gmail.com', 'Vĩnh Phúc', 24, 'Nhân viên', 24, '10 tỷ đồng', 24, 'Chị', 24, 'Phòng truyền thông', '0976341708', '0876653581', 24, 'Khách hàng hoặc đối tác giới thiệu', 24, 'KH Thương Mại', 'Nguyễn Hoa', 'qtruong270900@gmail.com', 'Solution Dev', 'C0RHN81B54D2Z', '3511911015', '2021-05-07 00:00:00', 24, 'Mining', 'Agribank', 24, 'Công ty TNHH', 24, 'Dịch vụ cung ứng lao động và làm việc', 24, 'Việt Nam', 24, 'Huyện Ba Vì', '16 Ngõ 225', 24, 'Hà Nội', 24, 'Hà son', '22638', 'Một tiềm năng mới', True, '1970-01-01 02:16:16', 'dhthinh', '2003-04-26 12:02:44', 'dhthinh'),
('2520d168-1494-4217-89d5-ba100c6f7bce', 'TN-3118', 'Lê', 'Thị Hoa', 'ngthinh949@gmail.com', 'Bắc Giang', 23, 'Nhân viên', 23, '5 tỷ đồng', 23, 'Chị', 23, 'Phòng nhân sự', '0366146264', '0976029404', 23, 'Khách hàng hoặc đối tác giới thiệu', 23, 'KH Thương Mại', 'Đặng Loan', 'qkhai019gmail.com', 'Theanh28 Express', 'SD6312BLC9E9O', '5033048924', '2013-12-18 00:00:00', 23, 'Tobacco', 'Agribank', 23, 'Cửa hàng trung tâm', 23, 'Dịch vụ cho thuê bảo vệ vệ sĩ', 23, 'Việt Nam', 23, 'Huyện Gia Viễn', '16 Ngõ 225', 23, 'Nam Định', 23, 'Hà son', '49673', 'Tiềm năng lớn', True, '2002-05-10 09:21:55', 'dhthinh', '1992-03-16 11:40:31', 'dhthinh'),
('25c6c36e-1668-7d10-6e09-bf1378b8dc91', 'TN-6490', 'Hoàng', 'Ngọc Diễm', NULL, NULL, 2, NULL, 2, NULL, 2, NULL, 2, NULL, NULL, '0975579496', 2, NULL, 2, 'KH Sản Xuất', 'Đặng Hân', 'nhungkiuu01@gmail.com', NULL, '8D7W4ME0103K2', '9939982060', NULL, 2, NULL, NULL, 2, 'công ty có vốn đầu tư nước ngoài', 2, 'Dịch vụ cung ứng phần mềm', 2, NULL, 2, NULL, '213 ngõ ̃561', 2, 'Ninh Bình', 2, 'Hà son', NULL, NULL, NULL, NULL, NULL, '1974-10-23 14:01:51', 'dhthinh'),
('2ea8deee-1b95-2a51-88d5-ba100c6f7bce', 'TN-6613', 'Nông', 'Thị Lệ', 'ngthinh949@gmail.com', 'Hà Nội', 13, 'Quản lý', 13, '5 tỷ đồng', 13, 'Anh', 13, 'Phòng truyền thông', '0365638643', NULL, 13, 'Khách hàng được tặng miễn phí', 13, NULL, NULL, NULL, 'Solution Dev', '47C3QR5BVP827', '0054104826', '2022-07-21 00:00:00', 13, NULL, 'VietComBank', 13, 'Cửa hàng trung tâm', 13, NULL, 13, 'Việt Nam', 13, 'Huyện Ba Vì', NULL, 13, 'Ninh Bình', 13, 'Hà son', '75243', 'Một tiềm năng mới', True, '1970-01-01 00:00:31', 'dhthinh', NULL, NULL),
('354f1b13-17bf-1b52-87d5-ba100c6f7bce', 'TN-4637', 'Nguyễn', 'Thị Hường', 'phthan247@gmail.com', 'Bắc Giang', 4, 'Nhân viên', 4, '30 tỷ đồng', 4, 'Chị', 4, 'Phòng nghiên cứu', '0332681204', NULL, 4, 'Khách hàng tự tìm đến', 4, NULL, NULL, NULL, 'Theanh28 Express', '073M6S4N66X09', '5119796299', '2021-08-25 00:00:00', 4, 'Support Services', 'Agribank', 4, 'Cửa hàng trung tâm', 4, NULL, 4, 'Việt Nam', 4, 'Huyện Phúc thọ', NULL, 4, 'Ninh Bình', 4, 'Trực Thái', '91981', 'Tiềm năng lớn', False, '2020-12-08 20:28:27', 'dhthinh', NULL, NULL),
('357d7c4e-4b7f-11c2-84c0-08fd2f807219', 'TN-2264', 'Nông', 'Việt Anh', 'dvthanh019@gmail.com', 'Ninh Bình', 19, 'Quản lý', 19, '25 tỷ đồng', 19, 'Bà', 19, 'Phòng nhân sự', '0364742578', NULL, 19, 'Khách hàng tự tìm đến', 19, NULL, NULL, NULL, 'Solution Dev', NULL, '0303860007', '2021-01-05 00:00:00', 19, 'Oil & Gas Producers', 'Agribank', 19, NULL, 19, NULL, 19, 'Việt Nam', 19, 'Huyện Ba Vì', NULL, 19, 'Nam Định', 19, 'Non Bình', '51365', 'Tiềm năng lớn', True, '2013-09-29 12:03:01', 'dhthinh', NULL, NULL),
('36104b10-705b-57a8-83c0-08fd2f807219', 'TN-4094', 'Nguyễn', 'Ngọc Hoa', 'qtruong270900@gmail.com', 'Ninh Bình', 9, 'Quản lý', 9, '1 tỷ đồng', 9, 'Bà', 9, 'Phòng đào tạo', '0878338096', '0873219996', 9, 'Khách hàng được tặng miễn phí', 9, 'KH Sản Xuất', 'Trân Hường', 'binh20061956@gmail.com', 'Theanh28 Express', 'TED9PLO9LBEA3', '4695749100', '2021-07-02 00:00:00', 9, 'Life Insurance', 'Saccombank', 9, 'công ty có vốn đầu tư nước ngoài', 9, 'Dịch vụ chăm sóc sắc đẹp', 9, 'Việt Nam', 9, 'Huyện Gia Viễn', '16 Ngõ 225', 9, 'Hà Nam', 9, 'Quất Lâm tự', '98918', 'Tiềm năng lớn', False, '1970-01-01 00:15:15', 'dhthinh', '1983-09-06 14:12:24', 'dhthinh'),
('3700cc49-55b5-69ea-4929-a2925c0f334d', 'TN-8127', 'Trịnh', 'Tuấn Ngọc', 'dngoc27782@gmail.com', 'Lào Cai', 3, 'Nhân viên', 3, '30 tỷ đồng', 3, 'Ông', 3, 'Phòng đào tạo', '0362781584', '0367144238', 3, 'Khách hàng tự tìm đến', 3, 'KH Sản Xuất', 'Trịnh Ngọc', 'qghung19@gmail.com', 'MISA JSC', NULL, '9527075258', '2021-03-11 00:00:00', 3, 'Equity Investment Instruments', 'Saccombank', 3, NULL, 3, 'Dịch vụ cung ứng lao động và làm việc', 3, 'Việt Nam', 3, 'Huyện Ba Vì', '16 Ngõ 225', 3, 'Hà Nội', 3, 'Hà son', '12831', 'Tiềm năng lớn', False, '1973-03-07 19:23:03', 'dhthinh', '1970-01-01 01:08:43', 'dhthinh'),
('37dd9bb0-4c53-4134-31de-23e177779933', 'TN-9956', 'Nguyễn', 'Thị Linh', 'thinhutc191204033@gmail.com', 'Hà Nội', 8, 'Quản lý', 8, '5 tỷ đồng', 8, 'Anh', 8, 'Phòng đào tạo', '0364335423', '0970920805', 8, 'Khách hàng tự tìm đến', 8, 'KH Thương Mại', 'Nguyễn Hoàng', 'vhoa21785@gmail.com', 'MISA JSC', '363QQ8G1A5OSK', '8047394740', '2013-08-13 00:00:00', 8, 'Software & Computer Services', 'Agribank', 8, 'Tổ chức phi chính phủ', 8, 'Dịch vụ cho thuê kho bãi', 8, 'Việt Nam', 8, 'Huyện Gia Viễn', '16 Ngõ 225', 8, 'Ninh Bình', 8, NULL, '27438', 'Một tiềm năng mới', False, '1970-01-01 00:09:27', 'dhthinh', '2002-08-13 01:50:05', 'dhthinh'),
('38528581-656f-2902-32de-23e177779933', 'TN-8820', 'Lê', 'Tuấn Mạnh', NULL, NULL, 17, NULL, 17, NULL, 17, NULL, 17, NULL, NULL, '0873301905', 17, NULL, 17, 'KH Sản Xuất', 'Nguyễn Hoa', 'binh20061956@gmail.com', NULL, '5P11396XC9L56', '1983464092', NULL, 17, NULL, NULL, 17, 'Doanh nghiệp tư nhân', 17, 'Dịch vụ cung ứng lao động và làm việc', 17, NULL, 17, NULL, '229 ngõ ̃080', 17, 'Nam Định', 17, 'Quất Lâm tự', NULL, NULL, NULL, NULL, NULL, '1999-09-07 22:44:07', 'dhthinh'),
('3b86d2ed-446c-5fce-56be-406293204378', 'TN-5187', 'Nguyễn', 'Ngọc Ngọc', 'binh20061956@gmail.com', 'Phú Thọ', 6, 'Giám đốc', 6, '20 tỷ đồng', 6, 'Chị', 6, 'Phòng nhân sự', '0877616409', '0362323932', 6, 'Thông qua hội thảo tập huấn', 6, 'KH Sản Xuất', 'Nguyễn Giang', 'ngthinh949@gmail.com', 'MISA JSC', '42W1J985SKW93', '2684098265', '2013-02-28 00:00:00', 6, 'Household Goods & Home Construction', 'VietComBank', 6, 'công ty có vốn đầu tư nước ngoài', 6, 'Dịch vụ cung ứng phần mềm', 6, 'Việt Nam', 6, 'Huyện Phúc thọ', '518 ngõ ̃846', 6, 'Hà Nam', 6, 'Trực Thái', '15938', 'Tiềm năng lớn', True, '2016-04-17 18:02:36', 'dhthinh', '1972-09-07 06:01:32', 'dhthinh'),
('486f3705-5928-5b0d-15cf-9712082ff6cb', 'TN-3909', 'Nguyễn', 'Việt Thuận', 'qtruong270900@gmail.com', 'Hưng Yên', 28, 'Quản lý', 28, '20 tỷ đồng', 28, 'Chị', 28, 'Phòng kinh doanh', '0973135912', '0875233645', 28, 'Thông qua hội thảo tập huấn', 28, 'KH Sản Xuất', 'Bùi Lệ', 'ngthinh949@gmail.com', 'MISA JSC', 'V3M5L471Z07P8', '2035069115', '2013-11-09 00:00:00', 28, 'Financial Services', 'Agribank', 28, 'công ty có vốn đầu tư nước ngoài', 28, 'Dịch vụ cung ứng lao động và làm việc', 28, 'Việt Nam', 28, 'Huyện Phúc thọ', '771 ngõ ̃026', 28, 'Hà Nội', 28, 'Trực Thái', '74078', 'Một tiềm năng mới', False, '2012-11-20 21:03:11', 'dhthinh', '1980-01-30 22:58:40', 'dhthinh'),
('4a4a8c90-2e57-215e-58be-406293204378', 'TN-3696', 'Trân', 'Tuấn Trường', NULL, NULL, 21, NULL, 21, NULL, 21, NULL, 21, NULL, NULL, '0366571478', 21, NULL, 21, 'KH Sản Xuất', 'Nguyễn Linh', 'dngoc27782@gmail.com', NULL, 'N90IF5L5MOLI1', '1689778934', NULL, 21, NULL, NULL, 21, 'công ty có vốn đầu tư nước ngoài', 21, 'Dịch vụ chăm sóc sắc đẹp', 21, NULL, 21, NULL, '16 Ngõ 225', 21, 'Hà Nam', 21, 'Trực Thái', NULL, NULL, NULL, NULL, NULL, '1980-04-04 07:28:50', 'dhthinh'),
('4fbf7ac2-4f95-259e-fd83-196123975cb2', 'TN-2949', 'Nguyễn', 'Việt Thành', 'binh20061956@gmail.com', 'Yên Bái', 29, 'Nhân viên', 29, '5 tỷ đồng', 29, 'Bà', 29, 'Phòng nghiên cứu', '0362605419', '0971245420', 29, 'Khách hàng tự tìm đến', 29, 'KH Sản Xuất', 'Trân Hiếu', 'duyendang01011960@gmail.com', 'MISA JSC', '868PZ711XBAJZ', '6208329994', '2012-01-14 00:00:00', 29, 'Banks', 'Saccombank', 29, 'Cửa hàng trung tâm', 29, 'Dịch vụ cho thuê bảo vệ vệ sĩ', 29, 'Việt Nam', 29, 'Huyện Gia Viễn', '162 ngõ ̃628', 29, 'Hà Nam', 29, NULL, '91853', 'Tiềm năng lớn', True, '2011-06-02 16:52:45', 'dhthinh', '2014-12-28 22:40:14', 'dhthinh'),
('53baae5e-52f2-2642-4a29-a2925c0f334d', 'TN-6752', 'Nguyễn', 'Tuấn Trường', 'ngthinh949@gmail.com', 'Thái Bình', 11, 'Thư ký', 11, '30 tỷ đồng', 11, 'Chị', 11, 'Phòng nghiên cứu', '0978869654', '0978331303', 11, 'Khách hàng được tặng miễn phí', 11, 'KH Sản Xuất', 'Trân Lệ', 'kakhanh111@gmail.com', 'MISA JSC', '32M6AUG6JEB27', '3280278560', '2022-06-16 00:00:00', 11, 'Nonlife Insurance', 'Agribank', 11, 'Doanh nghiệp tư nhân', 11, 'Dịch vụ cung ứng phần mềm', 11, 'Việt Nam', 11, 'Huyện Gia Viễn', '16 Ngõ 225', 11, 'Hà Nam', 11, 'Trực Thái', '60676', 'Một tiềm năng mới', True, '2016-03-04 07:00:48', 'dhthinh', '2011-06-07 18:15:44', 'dhthinh'),
('57a3f48f-1c1d-1f04-9e20-39c2f00615e8', 'TN-3938', 'Hoàng', 'Minh Mạnh', 'ngthinh949@gmail.com', 'Hà Nội', 16, 'Thư ký', 16, '15 tỷ đồng', 16, 'Chị', 16, 'Phòng nhân sự', '0979985934', '0972102276', 16, 'Thông qua hội thảo tập huấn', 16, 'KH Thương Mại', 'Bùi Trường', 'dvhoan201@gmail.com', 'Theanh28 Express', 'HCW5CAW016J40', '6782491575', '2021-06-16 00:00:00', 16, 'Media', 'Saccombank', 16, 'Công ty cổ phần', 16, 'Dịch vụ cho thuê bảo vệ vệ sĩ', 16, 'Việt Nam', 16, 'Huyện Phúc thọ', '16 Ngõ 225', 16, 'Ninh Bình', 16, 'Quất Lâm tự', '78096', 'Tiềm năng lớn', True, '1970-01-01 00:00:14', 'dhthinh', '2018-02-10 00:58:31', 'dhthinh'),
('5c9f5f1a-6f5c-49cc-59be-406293204378', 'TN-6962', 'Nguyễn', 'Thị Mai', 'nhungkiuu01@gmail.com', 'Hòa Bình', 30, 'Nhân viên', 30, '20 tỷ đồng', 30, 'Bà', 30, 'Phòng truyền thông', '0872149339', '0973934745', 30, 'Nhân viên kinh doanh tự tìm kiếm', 30, 'KH Sản Xuất', 'Nguyễn Anh', 'ngthinh949@gmail.com', 'MISA JSC', '40BQ5BQ1DSITL', '9555908004', '2022-07-20 00:00:00', 30, 'Gas, Water & Multiutilities', 'VietComBank', 30, 'Cửa hàng trung tâm', 30, 'Dịch vụ hiếu hỉ', 30, 'Việt Nam', 30, 'Huyện Gia Viễn', '817 ngõ ̃007', 30, NULL, 30, NULL, '92568', 'Một tiềm năng mới', True, '1980-01-20 08:00:25', 'dhthinh', '1970-01-01 00:01:05', 'dhthinh'),
('62a849b4-1145-4227-7009-bf1378b8dc91', 'TN-5979', 'Lê', 'Diễm Hường', 'qghung19@gmail.com', 'Phú Thọ', 18, 'Giám đốc', 18, '20 tỷ đồng', 18, 'Chị', 18, 'Phòng kinh doanh', '0875393776', '0331970679', 18, 'Nhân viên kinh doanh tự tìm kiếm', 18, 'KH Thương Mại', 'Nguyễn Lệ', 'qghung19@gmail.com', 'Theanh28 Express', NULL, '8379423155', '2014-07-03 00:00:00', 18, 'Industrial Metals & Mining', 'VietComBank', 18, NULL, 18, 'Dịch vụ chăm sóc sắc đẹp', 18, 'Việt Nam', 18, 'Huyện Quốc Oai', '16 Ngõ 225', 18, 'Ninh Bình', 18, 'Quất Lâm tự', '95191', 'Tiềm năng lớn', False, '2007-06-23 10:17:00', 'dhthinh', '1970-01-01 00:00:01', 'dhthinh'),
('6b47b37f-3123-3ce7-14cf-9712082ff6cb', 'TN-5038', 'Nguyễn', 'Mai Lệ', 'nhungkiuu01@gmail.com', 'Vĩnh Phúc', 7, 'Giám đốc', 7, '15 tỷ đồng', 7, 'Chị', 7, 'Phòng đào tạo', '0876380167', '0368871934', 7, 'Khách hàng được tặng miễn phí', 7, 'KH Sản Xuất', 'Nguyễn Cường', 'thinhutc191204033@gmail.com', 'MISA JSC', 'KC66W5UYB0BY1', '7738158730', '2021-12-25 00:00:00', 7, 'Technology Hardware & Equipment', 'Agribank', 7, 'Công ty TNHH', 7, 'Dịch vụ du lịch', 7, 'Việt Nam', 7, 'Huyện Quốc Oai', '909 ngõ ̃507', 7, 'Ninh Bình', 7, 'Non Bình', '11427', 'Tiềm năng lớn', True, '1990-03-05 20:54:13', 'dhthinh', '1975-05-01 03:00:24', 'dhthinh'),
('749af78e-699e-5d1e-7109-bf1378b8dc91', 'TN-8392', 'Nguyễn', 'Thị Hương', 'mtudz35@gmail.com', 'Ninh Bình', 25, 'Thư ký', 25, '20 tỷ đồng', 25, 'Anh', 25, 'Phòng nhân sự', '0334730228', '0362600789', 25, 'Khách hàng được tặng miễn phí', 25, 'KH Sản Xuất', 'Nguyễn Hường', 'lognhat35@gmail.com', 'FPT Soft', '70Y19Q5NZ059X', '0329656518', '2020-09-08 00:00:00', 25, 'Oil Equipment, Services & Distribution', 'Saccombank', 25, 'Doanh nghiệp tư nhân', 25, 'Dịch vụ cho thuê bảo vệ vệ sĩ', 25, 'Việt Nam', 25, 'Huyện Phúc thọ', '835 ngõ ̃226', 25, 'Hà Nội', 25, 'Non Bình', '91427', 'Một tiềm năng mới', True, '1970-01-01 00:57:14', 'dhthinh', '1988-03-20 06:40:20', 'dhthinh'),
('7dbd90f6-6015-12c6-4b29-a2925c0f334d', 'TN-8126', 'Võ', 'Việt Cường', 'phthan247@gmail.com', 'Hà Nam', 22, 'Quản lý', 22, '30 tỷ đồng', 22, 'Ông', 22, 'Phòng nghiên cứu', '0879409683', '0973077664', 22, 'Nhân viên kinh doanh tự tìm kiếm', 22, 'KH Thương Mại', 'Nguyễn Anh', 'vhoa21785@gmail.com', 'FPT Soft', 'P3KW0LHPW5T15', '1030337905', '2021-01-03 00:00:00', 22, 'Automobiles & Parts', 'Saccombank', 22, 'công ty có vốn đầu tư nước ngoài', 22, 'Dịch vụ cho thuê kho bãi', 22, 'Việt Nam', 22, 'Huyện Ba Vì', '684 ngõ ̃799', 22, 'Nam Định', 22, 'Quất Lâm tự', '73979', 'Tiềm năng lớn', False, '1970-01-01 00:00:06', 'dhthinh', '1973-01-10 23:12:15', 'dhthinh');

-- 
-- Dumping data for table Industry
--
-- Table `MISA.WEB06.QTKD.HAI`.Industry does not contain any data (it is empty)

-- 
-- Dumping data for table District
--
-- Table `MISA.WEB06.QTKD.HAI`.District does not contain any data (it is empty)

-- 
-- Dumping data for table Department
--
-- Table `MISA.WEB06.QTKD.HAI`.Department does not contain any data (it is empty)

-- 
-- Dumping data for table Country
--
-- Table `MISA.WEB06.QTKD.HAI`.Country does not contain any data (it is empty)

-- 
-- Dumping data for table BusinessType
--
-- Table `MISA.WEB06.QTKD.HAI`.BusinessType does not contain any data (it is empty)

-- 
-- Dumping data for table AnnualRevenue
--
INSERT INTO AnnualRevenue VALUES
('142cb08f-7c31-21fa-8e90-67245e8b283e', '10 đến 20 tỷ đồng\r\n'),
('469b3ece-744a-45d5-957d-e8c757976496', '10 đến 20 tỷ đồng\r\n'),
('4e272fc4-7875-78d6-7d32-6a1673ffca7c', '2 tỷ đồng đến 5 tỷ đồng\r\n'),
('17120d02-6ab5-3e43-18cb-66948daf6128', '5 đến 10 tỷ đồng');

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;