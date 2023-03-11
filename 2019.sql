/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : 2019

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 11/03/2023 22:41:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for buyer_goods
-- ----------------------------
DROP TABLE IF EXISTS `buyer_goods`;
CREATE TABLE `buyer_goods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` double(10, 2) NOT NULL,
  `number` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of buyer_goods
-- ----------------------------
INSERT INTO `buyer_goods` VALUES (1, '3普通口罩', 1.50, 1);
INSERT INTO `buyer_goods` VALUES (2, 'n95口罩', 5.50, 2);
INSERT INTO `buyer_goods` VALUES (3, '3防护服', 100.50, 10);
INSERT INTO `buyer_goods` VALUES (4, '洗手液', 10.50, 10);
INSERT INTO `buyer_goods` VALUES (5, '3防护镜', 20.50, 4);
INSERT INTO `buyer_goods` VALUES (6, '棉签', 2.50, 10);
INSERT INTO `buyer_goods` VALUES (7, '采样管', 10.50, 7);
INSERT INTO `buyer_goods` VALUES (8, '测温枪', 50.50, 10);
INSERT INTO `buyer_goods` VALUES (9, '3隔离服', 100.50, 2);
INSERT INTO `buyer_goods` VALUES (10, '医用手套', 40.50, 10);
INSERT INTO `buyer_goods` VALUES (11, '酒精', 10.50, 10);
INSERT INTO `buyer_goods` VALUES (19, '3消毒水', 15.50, 6);
INSERT INTO `buyer_goods` VALUES (20, '消毒水', 15.50, 50);
INSERT INTO `buyer_goods` VALUES (21, '3消毒水', 15.50, 5);
INSERT INTO `buyer_goods` VALUES (22, '消毒水', 15.50, 52);

-- ----------------------------
-- Table structure for manage_goods
-- ----------------------------
DROP TABLE IF EXISTS `manage_goods`;
CREATE TABLE `manage_goods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` double(10, 2) NOT NULL,
  `number` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of manage_goods
-- ----------------------------
INSERT INTO `manage_goods` VALUES (1, '1普通口罩', 1.50, 10);
INSERT INTO `manage_goods` VALUES (2, '1n95口罩', 5.50, 4);
INSERT INTO `manage_goods` VALUES (3, '1防护服', 100.50, 10);
INSERT INTO `manage_goods` VALUES (4, '1洗手液', 10.50, 3);
INSERT INTO `manage_goods` VALUES (5, '1防护镜', 20.50, 10);
INSERT INTO `manage_goods` VALUES (6, '1棉签', 2.50, 6);
INSERT INTO `manage_goods` VALUES (7, '1采样管', 10.50, 10);
INSERT INTO `manage_goods` VALUES (8, '1测温枪', 50.50, 10);
INSERT INTO `manage_goods` VALUES (9, '1隔离服', 100.50, 6);
INSERT INTO `manage_goods` VALUES (10, '1医用手套', 40.50, 10);
INSERT INTO `manage_goods` VALUES (11, '酒精', 10.50, 10);
INSERT INTO `manage_goods` VALUES (19, '消毒水', 15.50, 50);
INSERT INTO `manage_goods` VALUES (20, '1消毒水', 15.50, 8);
INSERT INTO `manage_goods` VALUES (21, '消毒水', 15.50, 10);
INSERT INTO `manage_goods` VALUES (22, '消毒水', 15.50, 50);

-- ----------------------------
-- Table structure for provide_goods
-- ----------------------------
DROP TABLE IF EXISTS `provide_goods`;
CREATE TABLE `provide_goods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` double(10, 2) NOT NULL,
  `number` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of provide_goods
-- ----------------------------
INSERT INTO `provide_goods` VALUES (1, '2普通口罩', 1.50, 5);
INSERT INTO `provide_goods` VALUES (2, '2n95口罩', 5.50, 4);
INSERT INTO `provide_goods` VALUES (3, '2防护服', 100.50, 10);
INSERT INTO `provide_goods` VALUES (4, '洗手液', 10.50, 7);
INSERT INTO `provide_goods` VALUES (5, '2防护镜', 20.50, 6);
INSERT INTO `provide_goods` VALUES (6, '棉签', 2.50, 10);
INSERT INTO `provide_goods` VALUES (7, '2采样管', 10.50, 10);
INSERT INTO `provide_goods` VALUES (8, '测温枪', 50.50, 1);
INSERT INTO `provide_goods` VALUES (9, '隔离服', 100.50, 10);
INSERT INTO `provide_goods` VALUES (10, '2医用手套', 40.50, 2);
INSERT INTO `provide_goods` VALUES (11, '酒精', 10.50, 10);
INSERT INTO `provide_goods` VALUES (19, '消毒水', 15.50, 50);
INSERT INTO `provide_goods` VALUES (20, '2消毒水', 15.50, 50);
INSERT INTO `provide_goods` VALUES (21, '消毒水', 15.50, 10);
INSERT INTO `provide_goods` VALUES (22, '消毒水', 15.50, 50);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `power` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (60, '1234', '24214', '1');
INSERT INTO `users` VALUES (62, '466456', '649684', '1');
INSERT INTO `users` VALUES (64, '46645674', '649684', '1');
INSERT INTO `users` VALUES (65, 'adsas', 'asda', '1');
INSERT INTO `users` VALUES (66, 'asda', 'dasd', '1');

SET FOREIGN_KEY_CHECKS = 1;
