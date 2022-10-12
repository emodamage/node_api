/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80029
Source Host           : localhost:3306
Source Database       : 2019

Target Server Type    : MYSQL
Target Server Version : 80029
File Encoding         : 65001

Date: 2022-10-12 23:02:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` double(10,2) NOT NULL,
  `number` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '普通口罩', '1.50', '10');
INSERT INTO `goods` VALUES ('2', 'n95口罩', '5.50', '10');
INSERT INTO `goods` VALUES ('3', '防护服', '100.50', '10');
INSERT INTO `goods` VALUES ('4', '洗手液', '10.50', '10');
INSERT INTO `goods` VALUES ('5', '防护镜', '20.50', '10');
INSERT INTO `goods` VALUES ('6', '棉签', '2.50', '10');
INSERT INTO `goods` VALUES ('7', '采样管', '10.50', '10');
INSERT INTO `goods` VALUES ('8', '测温枪', '50.50', '10');
INSERT INTO `goods` VALUES ('9', '隔离服', '100.50', '10');
INSERT INTO `goods` VALUES ('10', '医用手套', '40.50', '10');
INSERT INTO `goods` VALUES ('11', '酒精', '10.50', '10');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `power` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('60', '1234', '24214', '1');
