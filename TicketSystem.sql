/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : TicketSystem

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 08/06/2019 16:42:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Airport
-- ----------------------------
DROP TABLE IF EXISTS `Airport`;
CREATE TABLE `Airport` (
  `AirportNo` varchar(10) NOT NULL,
  `AirportName` varchar(32) DEFAULT NULL,
  `CityNo` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`AirportNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Airport
-- ----------------------------
BEGIN;
INSERT INTO `Airport` VALUES ('1001', '北京首都国际机场', '1001');
INSERT INTO `Airport` VALUES ('1002', '北京东方机场', '1005');
INSERT INTO `Airport` VALUES ('2001', '上海虹桥国际机场', '1002');
INSERT INTO `Airport` VALUES ('2002', '上海浦东国际机场', '1002');
INSERT INTO `Airport` VALUES ('3001', '南京禄口国际机场', '1003');
COMMIT;

-- ----------------------------
-- Table structure for City
-- ----------------------------
DROP TABLE IF EXISTS `City`;
CREATE TABLE `City` (
  `CityNo` varchar(8) NOT NULL,
  `CityName` varchar(16) DEFAULT NULL,
  `AirportNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`CityNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of City
-- ----------------------------
BEGIN;
INSERT INTO `City` VALUES ('1001', '北京', 3);
INSERT INTO `City` VALUES ('1002', '上海', 3);
INSERT INTO `City` VALUES ('1003', '南京', 4);
INSERT INTO `City` VALUES ('1004', '广州', 2);
COMMIT;

-- ----------------------------
-- Table structure for Flight
-- ----------------------------
DROP TABLE IF EXISTS `Flight`;
CREATE TABLE `Flight` (
  `FlightNo` varchar(10) NOT NULL,
  `FlightCom` varchar(32) DEFAULT NULL,
  `PlaneType` varchar(16) DEFAULT NULL,
  `TotalSeat` int(11) DEFAULT NULL,
  `Route` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`FlightNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Flight
-- ----------------------------
BEGIN;
INSERT INTO `Flight` VALUES ('CZ3163', '南方航空公司', '空客321', 160, '长沙-北京');
INSERT INTO `Flight` VALUES ('CZ6599', '南方航空公司', '空客321', 190, '海口-温州-沈阳');
INSERT INTO `Flight` VALUES ('HU7487', '海南航空公司', '波音737', 217, '长沙-上海');
INSERT INTO `Flight` VALUES ('MU2756', '东方航空公司', '波音747', 367, '长沙-南京-青岛');
INSERT INTO `Flight` VALUES ('MU9396', '东方航空公司', '波音737', 218, '长沙-上海-北京-哈尔滨');
COMMIT;

-- ----------------------------
-- Table structure for FlightPlan
-- ----------------------------
DROP TABLE IF EXISTS `FlightPlan`;
CREATE TABLE `FlightPlan` (
  `PlanNo` varchar(20) NOT NULL,
  `SegementNo` varchar(32) DEFAULT NULL,
  `FlyDate` date DEFAULT NULL,
  `FirstClass` int(11) DEFAULT NULL,
  `FirstPrice` float(10,5) DEFAULT NULL,
  `SecondClass` int(11) DEFAULT NULL,
  `SecondPrice` float(10,5) DEFAULT NULL,
  `WeekNo` int(11) DEFAULT NULL,
  `WeekDay` varchar(12) DEFAULT NULL,
  `Port` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`PlanNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of FlightPlan
-- ----------------------------
BEGIN;
INSERT INTO `FlightPlan` VALUES ('1001', '1001', '2019-05-11', 12, 2000.00000, 185, 500.00000, 2, '星期三', 'T1-128');
INSERT INTO `FlightPlan` VALUES ('1002', '1001', '2019-05-16', 10, 8000.00000, 300, 2000.00000, 3, '星期五', 'T2-001');
COMMIT;

-- ----------------------------
-- Table structure for FlightSegement
-- ----------------------------
DROP TABLE IF EXISTS `FlightSegement`;
CREATE TABLE `FlightSegement` (
  `SegementNo` bigint(32) NOT NULL AUTO_INCREMENT,
  `FlightNo` varchar(10) DEFAULT NULL,
  `AirportNo` varchar(10) DEFAULT NULL,
  `Origin` varchar(16) DEFAULT NULL,
  `Terminal` varchar(16) DEFAULT NULL,
  `DepartTime` time(6) DEFAULT NULL,
  `ArrivalTime` time(6) DEFAULT NULL,
  `FlightTime` float(10,5) DEFAULT NULL,
  `FirstClass` int(11) DEFAULT NULL,
  `SecondClass` int(11) DEFAULT NULL,
  `Nonstop` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`SegementNo`)
) ENGINE=InnoDB AUTO_INCREMENT=1113 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of FlightSegement
-- ----------------------------
BEGIN;
INSERT INTO `FlightSegement` VALUES (1001, 'CZ3163', '1001', '长沙', '北京', '10:45:16.000000', '13:45:23.000000', 3.15000, 12, 155, 1);
INSERT INTO `FlightSegement` VALUES (1002, 'CZ3163', '1001', '长沙', '郑州', '13:48:01.000000', '15:48:11.000000', 2.50000, 11, 132, 0);
INSERT INTO `FlightSegement` VALUES (1003, 'HU7487', '1002', '长沙', '上海', '09:10:52.000000', '11:11:06.000000', 1.20000, 18, 190, 0);
INSERT INTO `FlightSegement` VALUES (1004, 'MU2756', '1004', '长沙', '青岛', '17:29:11.000000', '19:29:19.000000', 2.00000, 5, 98, 1);
INSERT INTO `FlightSegement` VALUES (1005, 'CZ3163', '1003', '长沙', '郑州', '10:30:53.000000', '12:31:01.000000', 1.65000, 15, 87, 0);
INSERT INTO `FlightSegement` VALUES (1008, 'CZ3163', '1001', '长沙', '郑州', '15:01:02.000000', '17:01:07.000000', 2.10000, 6, 99, 0);
INSERT INTO `FlightSegement` VALUES (1111, 'MU2756', '1001', 'changsha', 'shanghai', '12:30:00.000000', '13:45:00.000000', 1.50000, 15, 123, 1);
INSERT INTO `FlightSegement` VALUES (1112, 'MU2756', '1001', 'changsha', 'shanghai', '12:30:00.000000', '13:45:00.000000', 1.50000, 15, 123, 1);
COMMIT;

-- ----------------------------
-- Table structure for Passenger
-- ----------------------------
DROP TABLE IF EXISTS `Passenger`;
CREATE TABLE `Passenger` (
  `Identity` varchar(20) NOT NULL,
  `IdentityType` varchar(16) DEFAULT NULL,
  `Name` varchar(64) DEFAULT NULL,
  `Gender` char(2) DEFAULT NULL,
  `Tel` char(11) DEFAULT NULL,
  `Email` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`Identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Passenger
-- ----------------------------
BEGIN;
INSERT INTO `Passenger` VALUES ('1001', '身份证', '宋彪', '男', '22222222222', '1001@hnu.edu.cn');
INSERT INTO `Passenger` VALUES ('1002', '护照', '孙寅涵', '男', '12345123451', '1002@hnu.edu.cn');
INSERT INTO `Passenger` VALUES ('1003', '驾驶证', '别家骏', '男', '22345678911', '1003@sina.com.cn');
INSERT INTO `Passenger` VALUES ('1004', '身份证', '田心源', '女', '32345678911', '1004@qq.com');
COMMIT;

-- ----------------------------
-- Table structure for Sale
-- ----------------------------
DROP TABLE IF EXISTS `Sale`;
CREATE TABLE `Sale` (
  `SellNo` varchar(20) NOT NULL,
  `PlanNo` varchar(20) DEFAULT NULL,
  `Identity` varchar(20) DEFAULT NULL,
  `SegementNo` varchar(32) DEFAULT NULL,
  `WeekDay` varchar(12) DEFAULT NULL,
  `SellDate` datetime(6) DEFAULT NULL,
  `Discount` float(10,5) DEFAULT NULL,
  PRIMARY KEY (`SellNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
