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

 Date: 16/03/2023 10:40:41
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
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `manufacturers` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `descs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `isDisinfect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of buyer_goods
-- ----------------------------
INSERT INTO `buyer_goods` VALUES (1, '3普通口罩', 1.50, 1, '江苏无锡3', '江苏无锡制造商3', '354', '2023-03-01', '未消毒');
INSERT INTO `buyer_goods` VALUES (2, 'n95口罩', 5.50, 2, '江苏无锡3', '江苏无锡制造商3', '7435', '2023-03-05', '未消毒');
INSERT INTO `buyer_goods` VALUES (3, '3防护服', 100.50, 10, '江苏无锡3', '江苏无锡制造商3', '74354', '2023-03-04', '未消毒');
INSERT INTO `buyer_goods` VALUES (4, '洗手液', 10.50, 10, '江苏无锡3', '江苏无锡制造商3', '453', '2023-03-02', '未消毒');
INSERT INTO `buyer_goods` VALUES (5, '3防护镜', 20.50, 4, '江苏无锡3', '江苏无锡制造商3', '12.', '2023-03-04', '未消毒');
INSERT INTO `buyer_goods` VALUES (6, '棉签', 2.50, 10, '江苏无锡3', '江苏无锡制造商3', '453', '2023-03-03', '未消毒');
INSERT INTO `buyer_goods` VALUES (7, '采样管', 10.50, 7, '江苏无锡3', '江苏无锡制造商3', '412.745', '2023-03-04', '未消毒');
INSERT INTO `buyer_goods` VALUES (8, '测温枪', 50.50, 10, '江苏无锡3', '江苏无锡制造商3', '423', '2023-03-09', '未消毒');
INSERT INTO `buyer_goods` VALUES (9, '3隔离服', 100.50, 2, '江苏无锡3', '江苏无锡制造商3', '783', '2023-03-04', '未消毒');
INSERT INTO `buyer_goods` VALUES (10, '医用手套', 40.50, 10, '江苏无锡3', '江苏无锡制造商3', '7453', '2023-03-05', '未消毒');
INSERT INTO `buyer_goods` VALUES (11, '酒精', 10.50, 10, '江苏无锡3', '江苏无锡制造商3', '123', '2023-03-04', '未消毒');
INSERT INTO `buyer_goods` VALUES (19, '3消毒水', 15.50, 6, '江苏无锡3', '江苏无锡制造商3', '7452', '2023-03-10', '未消毒');
INSERT INTO `buyer_goods` VALUES (20, '消毒水', 15.50, 50, '江苏无锡3', '江苏无锡制造商3', '73', '2023-03-04', '未消毒');

-- ----------------------------
-- Table structure for manage_goods
-- ----------------------------
DROP TABLE IF EXISTS `manage_goods`;
CREATE TABLE `manage_goods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` double(10, 2) NOT NULL,
  `number` int NOT NULL,
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `manufacturers` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `descs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `isDisinfect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1335 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of manage_goods
-- ----------------------------
INSERT INTO `manage_goods` VALUES (8, '1测温枪', 50.50, 10, '湖南长沙1', '湖南长沙制造商156411651513', '321', '2023-03-06', '未消毒');
INSERT INTO `manage_goods` VALUES (9, '1隔离服', 100.50, 6, '湖南长沙1', '湖南长沙制造商1', '651', '2023-03-05', '未消毒');
INSERT INTO `manage_goods` VALUES (10, '1医用手套', 40.50, 10, '湖南长沙1', '湖南长沙制造商1', '9', '2023-03-02', '未消毒');
INSERT INTO `manage_goods` VALUES (11, '酒精', 10.50, 10, '湖南长沙1', '湖南长沙制造商1', '1651', '2023-03-042023-03-02', '未消毒');
INSERT INTO `manage_goods` VALUES (19, '消毒水', 15.50, 50, '湖南长沙1', '湖南长沙制造商1', '615651', '2023-03-02', '未消毒');
INSERT INTO `manage_goods` VALUES (20, '1消毒水', 15.50, 8, '湖南长沙1', '湖南长沙制造商1', '651', '2023-03-03', '未消毒');
INSERT INTO `manage_goods` VALUES (1322, '132', 123.00, 1321, '湖南长沙1465134161', '湖南长沙制造商1', '132', '2023-03-06', '未消毒');
INSERT INTO `manage_goods` VALUES (1323, '阿松大', 10.00, 8, '湖南长沙1', '湖南长沙制造商149684165161', '阿松大', '2023-03-01', '未消毒');
INSERT INTO `manage_goods` VALUES (1328, '能尽快', 1.00, 1, '湖南长沙1', '湖南长沙制造商1', '哦vu吧', '2023-03-02', '未消毒');
INSERT INTO `manage_goods` VALUES (1329, '哦那哦', 1.00, 1, '湖南长沙1', '湖南长沙制造商1', '科技博客就', '2023-03-06', '未消毒');
INSERT INTO `manage_goods` VALUES (1330, '哦i糊弄', 1.00, 1, '湖南长沙11111', '湖南长沙制造商1', '里看见艰苦', '2023-03-02', '已消毒');
INSERT INTO `manage_goods` VALUES (1331, '16', 1.00, 1, '1651', '6165', '科技博客就', '2023-03-07', '已消毒');
INSERT INTO `manage_goods` VALUES (1332, '941156', 1.00, 1, '616', '8561', '科技博客就', '2023-03-12', '已消毒');
INSERT INTO `manage_goods` VALUES (1333, '174196', 1.00, 1, '9641984196', '4186', '科技博客就', '2023-03-01', '未消毒');
INSERT INTO `manage_goods` VALUES (1334, '41784', 1.00, 1, '894186416', '419641', '498416', '2023-02-28', '已消毒');
INSERT INTO `manage_goods` VALUES (1335, '41961', 1.00, 1, '61615', '616', '4165', '2023-03-01', '未消毒');
INSERT INTO `manage_goods` VALUES (1336, '手', 2.00, 45, '5132', '561', '615', '2023-03-01', '未消毒');
INSERT INTO `manage_goods` VALUES (1337, '手机', 45.10, 20, '1621', '6546', '654', '2023-01-01', '已消毒');
INSERT INTO `manage_goods` VALUES (1338, '你离开', 100.00, 16, '吧那就快来', '哦伯爵考虑', '弄i离开', '2023-03-06', '未消毒');
INSERT INTO `manage_goods` VALUES (1339, 'iuv不看好零', 1.00, 55, '便看见了', '不能', '偶伯爵考虑', '2023-03-08', '已消毒');
INSERT INTO `manage_goods` VALUES (1340, '4165', -111.00, 1, '65165', '615', '78615', '2023-03-09', '已消毒');

-- ----------------------------
-- Table structure for provide_goods
-- ----------------------------
DROP TABLE IF EXISTS `provide_goods`;
CREATE TABLE `provide_goods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` double(10, 2) NOT NULL,
  `number` int NOT NULL,
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `manufacturers` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `descs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `isDisinfect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of provide_goods
-- ----------------------------
INSERT INTO `provide_goods` VALUES (1, '2普通口罩', 1.50, 5, '浙江嘉兴2', '浙江嘉兴制造商2', '描述546', '2023-03-04', '未消毒');
INSERT INTO `provide_goods` VALUES (2, '2n95口罩', 5.50, 4, '浙江嘉兴2', '浙江嘉兴制造商2', '描述213', '2023-03-02', '未消毒');
INSERT INTO `provide_goods` VALUES (3, '2防护服', 100.50, 10, '浙江嘉兴2', '浙江嘉兴制造商2', '描述453', '2023-03-02', '未消毒');
INSERT INTO `provide_goods` VALUES (4, '洗手液', 10.50, 7, '浙江嘉兴2', '浙江嘉兴制造商2', '123', '2023-03-02', '未消毒');
INSERT INTO `provide_goods` VALUES (5, '2防护镜', 20.50, 6, '浙江嘉兴2', '浙江嘉兴制造商2', '123', '2023-03-02', '未消毒');
INSERT INTO `provide_goods` VALUES (6, '棉签', 2.50, 10, '浙江嘉兴2', '浙江嘉兴制造商2', '描述786', '2023-03-04', '未消毒');
INSERT INTO `provide_goods` VALUES (7, '2采样管', 10.50, 10, '浙江嘉兴2', '浙江嘉兴制造商2', '描述753', '2023-03-02', '未消毒');
INSERT INTO `provide_goods` VALUES (8, '测温枪', 50.50, 1, '浙江嘉兴2', '浙江嘉兴制造商2', '描述', '2023-03-01', '未消毒');
INSERT INTO `provide_goods` VALUES (9, '隔离服', 100.50, 10, '浙江嘉兴2', '浙江嘉兴制造商2', '描述123', '2023-03-08', '未消毒');
INSERT INTO `provide_goods` VALUES (10, '2医用手套', 40.50, 2, '浙江嘉兴2', '浙江嘉兴制造商2', '描述', '2023-03-02', '未消毒');
INSERT INTO `provide_goods` VALUES (11, '酒精', 10.50, 10, '浙江嘉兴2', '浙江嘉兴制造商2', '描述423', '2023-03-04', '未消毒');
INSERT INTO `provide_goods` VALUES (19, '消毒水', 15.50, 50, '浙江嘉兴2', '浙江嘉兴制造商2', '描述7853', '2023-03-02', '未消毒');
INSERT INTO `provide_goods` VALUES (20, '2消毒水', 15.50, 50, '浙江嘉兴2', '浙江嘉兴制造商2', '描述', '2023-03-01', '未消毒');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `power` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `imgUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (60, '1234', '24214', '1', '13973034458', '县存储局', '男', NULL);
INSERT INTO `users` VALUES (62, '466456', '649684', '2', '13973034558', '县供应商', '男', NULL);
INSERT INTO `users` VALUES (64, '46645674', '649684', '3', '13973034558', '县志愿者', '女', NULL);
INSERT INTO `users` VALUES (65, 'adsas', 'asda', '1', '13973034558', '县存储局', '男', NULL);
INSERT INTO `users` VALUES (66, 'asda', 'dasd', '1', '13973034558', '县存储局', '女', NULL);
INSERT INTO `users` VALUES (69, 'admin1', 'admin1', '1', '13973034558', '县存储局', '男', NULL);
INSERT INTO `users` VALUES (70, 'admin2', 'admin2', '2', '13973216546', '县供应商', '女', NULL);
INSERT INTO `users` VALUES (71, 'admin3', 'admin3', '3', '13546842168', '县志愿者', '男', NULL);

SET FOREIGN_KEY_CHECKS = 1;
