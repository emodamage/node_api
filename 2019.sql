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

 Date: 19/03/2023 21:29:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for buyer_goods
-- ----------------------------
DROP TABLE IF EXISTS `buyer_goods`;
CREATE TABLE `buyer_goods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物资名',
  `price` double(10, 2) NOT NULL COMMENT '物资价格',
  `number` int NOT NULL COMMENT '物资数量',
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物资生产地',
  `manufacturers` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物资生产商',
  `descs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物资描述',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '入库时间',
  `isDisinfect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否消毒',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of buyer_goods
-- ----------------------------
INSERT INTO `buyer_goods` VALUES (1, '3普通口罩', 1.50, 1, '江苏无锡3', '江苏无锡制造商3', '354', '2023-03-01', '未消毒');
INSERT INTO `buyer_goods` VALUES (2, 'n95口罩', 5.50, 2, '江苏无锡3', '江苏无锡制造商3', '7435', '2023-03-05', '已消毒');
INSERT INTO `buyer_goods` VALUES (3, '3防护服', 100.50, 10, '江苏无锡3', '江苏无锡制造商3', '74354', '2023-03-04', '已消毒');
INSERT INTO `buyer_goods` VALUES (4, '洗手液', 10.50, 10, '江苏无锡3', '江苏无锡制造商3', '453', '2023-03-02', '未消毒');
INSERT INTO `buyer_goods` VALUES (5, '3防护镜', 20.50, 4, '江苏无锡3', '江苏无锡制造商3', '12.', '2023-03-04', '未消毒');
INSERT INTO `buyer_goods` VALUES (6, '棉签', 2.50, 10, '江苏无锡3', '江苏无锡制造商3', '453', '2023-03-03', '未消毒');
INSERT INTO `buyer_goods` VALUES (7, '采样管', 10.50, 7, '江苏无锡3', '江苏无锡制造商3', '412.745', '2023-03-04', '未消毒');
INSERT INTO `buyer_goods` VALUES (8, '测温枪', 50.50, 10, '江苏无锡3', '江苏无锡制造商3', '423', '2023-03-09', '已消毒');
INSERT INTO `buyer_goods` VALUES (9, '3隔离服', 100.50, 2, '江苏无锡3', '江苏无锡制造商3', '783', '2023-03-04', '未消毒');
INSERT INTO `buyer_goods` VALUES (10, '医用手套', 40.50, 10, '江苏无锡3', '江苏无锡制造商3', '7453', '2023-03-05', '未消毒');
INSERT INTO `buyer_goods` VALUES (11, '酒精', 10.50, 10, '江苏无锡3', '江苏无锡制造商3', '123', '2023-03-04', '未消毒');
INSERT INTO `buyer_goods` VALUES (19, '3消毒水', 15.50, 60, '江苏无锡3', '江苏无锡制造商3', '7452', '2023-03-10', '未消毒');
INSERT INTO `buyer_goods` VALUES (20, '消毒水', 15.50, 50, '江苏无锡3', '江苏无锡制造商3', '73', '2023-03-04', '未消毒');
INSERT INTO `buyer_goods` VALUES (23, '3ib', 1.00, 20, 'ibk', 'bho', 'asfd1', '2023-03-16', '未消毒');
INSERT INTO `buyer_goods` VALUES (24, '3boul', 1.00, 12, 'hfg', 'fdg', 'hdf', '2023-03-14', '已消毒');

-- ----------------------------
-- Table structure for goods_in
-- ----------------------------
DROP TABLE IF EXISTS `goods_in`;
CREATE TABLE `goods_in`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物资名',
  `price` double(10, 2) NOT NULL COMMENT '物资价格',
  `number` int NOT NULL COMMENT '物资数量',
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物资生产地',
  `manufacturers` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物资生产商',
  `descs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物资描述',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '审批时间',
  `isDisinfect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否消毒',
  `approval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '审批 1是审批中 2是驳回 3是通过',
  `power` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户权限 1是管理员 2是供应商 3是需求方',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_in
-- ----------------------------
INSERT INTO `goods_in` VALUES (25, '2采样管', 10.50, 1, '浙江嘉兴2', '浙江嘉兴制造商2', '描述753', '2023-03-19', '未消毒', '2', '1');
INSERT INTO `goods_in` VALUES (26, '2普通口罩', 1.50, 1, '浙江嘉兴2', '浙江嘉兴制造商2', '描述546', '2023-03-19', '已消毒', '2', '1');
INSERT INTO `goods_in` VALUES (27, '2防护服', 100.50, 1, '浙江嘉兴2', '浙江嘉兴制造商2', '描述453', '2023-03-19', '已消毒', '2', '1');
INSERT INTO `goods_in` VALUES (28, '2消毒水', 15.50, 1, '浙江嘉兴2', '浙江嘉兴制造商2', '描述', '2023-03-19', '未消毒', '3', '1');
INSERT INTO `goods_in` VALUES (29, '2普通口罩', 1.50, 1, '浙江嘉兴2', '浙江嘉兴制造商2', '描述546', '2023-03-19', '已消毒', '2', '1');
INSERT INTO `goods_in` VALUES (30, '消毒水', 15.50, 1, '浙江嘉兴2', '浙江嘉兴制造商2', '描述7853', '2023-03-19', '未消毒', '3', '1');
INSERT INTO `goods_in` VALUES (31, '布莱克', 1.00, 1, '不能离开', 'vhbjknl;m111', '看不见你了', '2023-03-19', '已消毒', '2', '3');
INSERT INTO `goods_in` VALUES (32, '1测温枪', 50.50, 1, '湖南长沙1', '湖南长沙制造商156411651513', '321', '2023-03-19', '未消毒', '3', '3');
INSERT INTO `goods_in` VALUES (33, '你离开', 100.00, 1, '吧那就快来', '哦伯爵考虑', '弄i离开', '2023-03-19', '未消毒', '2', '3');
INSERT INTO `goods_in` VALUES (34, '哦那哦', 1.00, 1, '湖南长沙1', '湖南长沙制造商1', '科技博客就', '2023-03-19', '未消毒', '3', '3');

-- ----------------------------
-- Table structure for goods_out
-- ----------------------------
DROP TABLE IF EXISTS `goods_out`;
CREATE TABLE `goods_out`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物资名',
  `price` double(10, 2) NOT NULL COMMENT '物资价格',
  `number` int NOT NULL COMMENT '物资数量',
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物资生产地',
  `manufacturers` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物资生产商',
  `descs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物资描述',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '审批时间',
  `isDisinfect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否消毒',
  `approval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '审批 1是审批中 2是驳回 3是通过',
  `power` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户权限 1是管理员 2是供应商 3是需求方',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of goods_out
-- ----------------------------
INSERT INTO `goods_out` VALUES (25, '隔离服', 100.50, 1, '浙江嘉兴2', '浙江嘉兴制造商2', '描述123', '2023-03-08', '未消毒', '1', '2');
INSERT INTO `goods_out` VALUES (26, '隔离服', 100.50, 1, '浙江嘉兴2', '浙江嘉兴制造商2', '描述123', '2023-03-08', '未消毒', '1', '2');
INSERT INTO `goods_out` VALUES (27, '2普通口罩', 1.50, 1, '浙江嘉兴2', '浙江嘉兴制造商2', '描述546', '2023-03-19', '已消毒', '2', '2');
INSERT INTO `goods_out` VALUES (28, '布莱克', 1.00, 1, '不能离开', 'vhbjknl;m111', '看不见你了', '2023-03-19', '已消毒', '2', '1');
INSERT INTO `goods_out` VALUES (29, 'iuv不看好零', 1.00, 1, '便看见了', '不能', '偶伯爵考虑', '2023-03-19', '已消毒', '1', '1');
INSERT INTO `goods_out` VALUES (30, '1测温枪', 50.50, 1, '湖南长沙1', '湖南长沙制造商156411651513', '321', '2023-03-19', '未消毒', '3', '1');
INSERT INTO `goods_out` VALUES (31, '132', 123.00, 1, '湖南长沙1465134161', '湖南长沙制造商1', '132', '2023-03-19', '未消毒', '1', '1');
INSERT INTO `goods_out` VALUES (32, '你离开', 100.00, 1, '吧那就快来', '哦伯爵考虑', '弄i离开', '2023-03-19', '未消毒', '2', '1');
INSERT INTO `goods_out` VALUES (33, '哦那哦', 1.00, 1, '湖南长沙1', '湖南长沙制造商1', '科技博客就', '2023-03-19', '未消毒', '3', '1');
INSERT INTO `goods_out` VALUES (34, '你离开', 100.00, 1, '吧那就快来', '哦伯爵考虑', '弄i离开', '2023-03-19', '未消毒', '1', '1');
INSERT INTO `goods_out` VALUES (35, '132', 123.00, 1, '湖南长沙1465134161', '湖南长沙制造商1', '132', '2023-03-19', '未消毒', '1', '1');
INSERT INTO `goods_out` VALUES (36, '消毒水', 15.50, 1, '湖南长沙1', '湖南长沙制造商1', '615651', '2023-03-19', '未消毒', '1', '1');
INSERT INTO `goods_out` VALUES (37, '1医用手套', 40.50, 1, '湖南长沙1', '湖南长沙制造商1', '9', '2023-03-19', '未消毒', '1', '1');
INSERT INTO `goods_out` VALUES (38, '1消毒水', 15.50, 1, '湖南长沙1', '湖南长沙制造商1', '651', '2023-03-19', '未消毒', '1', '1');
INSERT INTO `goods_out` VALUES (39, '酒精', 10.50, 1, '湖南长沙1', '湖南长沙制造商1', '1651', '2023-03-19', '未消毒', '1', '1');
INSERT INTO `goods_out` VALUES (40, '2普通口罩', 1.50, 1, '浙江嘉兴2', '浙江嘉兴制造商2', '描述546', '2023-03-19', '已消毒', '2', '2');
INSERT INTO `goods_out` VALUES (41, '酒精', 10.50, 1, '浙江嘉兴2', '浙江嘉兴制造商2', '描述423', '2023-03-19', '未消毒', '1', '2');
INSERT INTO `goods_out` VALUES (42, '2防护服', 100.50, 1, '浙江嘉兴2', '浙江嘉兴制造商2', '描述453', '2023-03-19', '已消毒', '2', '2');
INSERT INTO `goods_out` VALUES (43, '2防护镜', 20.50, 1, '浙江嘉兴2', '浙江嘉兴制造商2', '123', '2023-03-19', '已消毒', '1', '2');
INSERT INTO `goods_out` VALUES (44, '2消毒水', 15.50, 1, '浙江嘉兴2', '浙江嘉兴制造商2', '描述', '2023-03-19', '未消毒', '3', '2');
INSERT INTO `goods_out` VALUES (45, '消毒水', 15.50, 1, '浙江嘉兴2', '浙江嘉兴制造商2', '描述7853', '2023-03-19', '未消毒', '3', '2');
INSERT INTO `goods_out` VALUES (46, '2采样管', 10.50, 1, '浙江嘉兴2', '浙江嘉兴制造商2', '描述753', '2023-03-19', '未消毒', '2', '2');
INSERT INTO `goods_out` VALUES (47, '大色的屏幕', 17.00, 1, '把你家婆', '会被弄IP就', '伯尼', '2023-03-19', '未消毒', '1', '1');
INSERT INTO `goods_out` VALUES (48, '大色的屏幕', 17.00, 1, '把你家婆', '会被弄IP就', '伯尼', '2023-03-19', '未消毒', '1', '1');
INSERT INTO `goods_out` VALUES (49, '大色的屏幕', 17.00, 1, '把你家婆', '会被弄IP就', '伯尼', '2023-03-19', '未消毒', '1', '1');
INSERT INTO `goods_out` VALUES (50, '大色的屏幕', 17.00, 1, '把你家婆', '会被弄IP就', '伯尼', '2023-03-19', '未消毒', '1', '1');
INSERT INTO `goods_out` VALUES (51, '大色的屏幕', 17.00, 1, '把你家婆', '会被弄IP就', '伯尼', '2023-03-19', '未消毒', '1', '1');
INSERT INTO `goods_out` VALUES (52, 'inoi', 123.00, 1, '能量开门', '你离开', '过hi精品', '2023-03-19', '已消毒', '1', '1');
INSERT INTO `goods_out` VALUES (53, 'iuv不看好零', 1.00, 1, '便看见了', '不能', '偶伯爵考虑', '2023-03-19', '已消毒', '1', '1');
INSERT INTO `goods_out` VALUES (54, '132', 123.00, 1, '湖南长沙1465134161', '湖南长沙制造商1', '132', '2023-03-19', '未消毒', '1', '1');
INSERT INTO `goods_out` VALUES (55, '132', 123.00, 1, '湖南长沙1465134161', '湖南长沙制造商1', '132', '2023-03-19', '未消毒', '1', '1');
INSERT INTO `goods_out` VALUES (56, '132', 123.00, 1, '湖南长沙1465134161', '湖南长沙制造商1', '132', '2023-03-19', '未消毒', '1', '1');
INSERT INTO `goods_out` VALUES (57, 'bunop1', 123.00, 1, 'bjnkl;', 'hjbkn', 'ibop1', '2023-03-19', '未消毒', '1', '2');
INSERT INTO `goods_out` VALUES (58, 'bunop1', 123.00, 1, 'bjnkl;', 'hjbkn', 'ibop1', '2023-03-19', '未消毒', '1', '2');
INSERT INTO `goods_out` VALUES (59, 'cgvjhb', 566.00, 1, 'j hkbnlm;', 'vbkjnl', 'ghjk', '2023-03-19', '未消毒', '1', '2');
INSERT INTO `goods_out` VALUES (60, 'ibohjp', 143.00, 1, 'ctuyviohjp', 'cvhijo', 'hcgvjbk', '2023-03-19', '已消毒', '1', '2');
INSERT INTO `goods_out` VALUES (61, '隔离服', 100.50, 1, '浙江嘉兴2', '浙江嘉兴制造商2', '描述123', '2023-03-19', '未消毒', '1', '2');
INSERT INTO `goods_out` VALUES (62, '2普通口罩', 1.50, 1, '浙江嘉兴2', '浙江嘉兴制造商2', '描述546', '2023-03-19', '已消毒', '1', '2');
INSERT INTO `goods_out` VALUES (63, '酒精', 10.50, 1, '浙江嘉兴2', '浙江嘉兴制造商2', '描述423', '2023-03-19', '未消毒', '1', '2');
INSERT INTO `goods_out` VALUES (64, '2n95口罩', 5.50, 1, '浙江嘉兴2', '浙江嘉兴制造商2', '描述213', '2023-03-19', '已消毒', '1', '2');
INSERT INTO `goods_out` VALUES (65, '2普通口罩', 1.50, 1, '浙江嘉兴2', '浙江嘉兴制造商2', '描述546', '2023-03-19', '已消毒', '1', '2');

-- ----------------------------
-- Table structure for manage_goods
-- ----------------------------
DROP TABLE IF EXISTS `manage_goods`;
CREATE TABLE `manage_goods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物资名\r\n',
  `price` double(10, 2) NOT NULL COMMENT '物资价格',
  `number` int NOT NULL COMMENT '物资数量',
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物资生产地',
  `manufacturers` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物资生产商',
  `descs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物资描述',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '入库时间',
  `isDisinfect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否消毒',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1342 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of manage_goods
-- ----------------------------
INSERT INTO `manage_goods` VALUES (8, '1测温枪', 50.50, 9, '湖南长沙1', '湖南长沙制造商156411651513', '321', '2023-03-06', '未消毒');
INSERT INTO `manage_goods` VALUES (9, '1隔离服', 100.50, 6, '湖南长沙1', '湖南长沙制造商1', '651', '2023-03-05', '未消毒');
INSERT INTO `manage_goods` VALUES (10, '1医用手套', 40.50, 9, '湖南长沙1', '湖南长沙制造商1', '9', '2023-03-02', '未消毒');
INSERT INTO `manage_goods` VALUES (11, '酒精', 10.50, 9, '湖南长沙1', '湖南长沙制造商1', '1651', '2023-03-04', '未消毒');
INSERT INTO `manage_goods` VALUES (19, '消毒水', 15.50, 49, '湖南长沙1', '湖南长沙制造商1', '615651', '2023-03-02', '未消毒');
INSERT INTO `manage_goods` VALUES (20, '1消毒水', 15.50, 7, '湖南长沙1', '湖南长沙制造商1', '651', '2023-03-03', '未消毒');
INSERT INTO `manage_goods` VALUES (1322, '132', 123.00, 1316, '湖南长沙1465134161', '湖南长沙制造商1', '132', '2023-03-06', '未消毒');
INSERT INTO `manage_goods` VALUES (1323, '阿松大', 10.00, 8, '湖南长沙1', '湖南长沙制造商149684165161', '阿松大', '2023-03-01', '未消毒');
INSERT INTO `manage_goods` VALUES (1328, '能尽快', 1.00, 1, '湖南长沙1', '湖南长沙制造商1', '哦vu吧', '2023-03-02', '未消毒');
INSERT INTO `manage_goods` VALUES (1329, '哦那哦', 1.00, 1, '湖南长沙1', '湖南长沙制造商1', '科技博客就', '2023-03-06', '未消毒');
INSERT INTO `manage_goods` VALUES (1330, '哦i糊弄', 1.00, 1, '湖南长沙11111', '湖南长沙制造商1', '里看见艰苦', '2023-03-02', '已消毒');
INSERT INTO `manage_goods` VALUES (1331, '16', 1.00, 1, '1651', '6165', '科技博客就', '2023-03-07', '已消毒');
INSERT INTO `manage_goods` VALUES (1333, '174196', 1.00, 1, '9641984196', '4186', '科技博客就', '2023-03-01', '未消毒');
INSERT INTO `manage_goods` VALUES (1334, '41784', 1.00, 1, '894186416', '419641', '498416', '2023-02-28', '已消毒');
INSERT INTO `manage_goods` VALUES (1335, '41961', 1.00, 1, '61615', '616', '4165', '2023-03-01', '未消毒');
INSERT INTO `manage_goods` VALUES (1336, '手', 2.00, 45, '5132', '561', '615', '2023-03-01', '未消毒');
INSERT INTO `manage_goods` VALUES (1337, '手机', 45.10, 20, '1621', '6546', '654', '2023-01-01', '已消毒');
INSERT INTO `manage_goods` VALUES (1338, '你离开', 100.00, 14, '吧那就快来', '哦伯爵考虑', '弄i离开', '2023-03-06', '未消毒');
INSERT INTO `manage_goods` VALUES (1339, 'iuv不看好零', 1.00, 53, '便看见了', '不能', '偶伯爵考虑', '2023-03-08', '已消毒');
INSERT INTO `manage_goods` VALUES (1341, '布莱克', 1.00, 170, '不能离开', 'vhbjknl;m111', '看不见你了', '2023-03-18', '已消毒');
INSERT INTO `manage_goods` VALUES (1342, 'inoi', 123.00, 179, '能量开门', '你离开', '过hi精品', '2023-03-12', '已消毒');
INSERT INTO `manage_goods` VALUES (1343, '伯爵考虑你', 1.00, 1, '哦你离开', '不哦i能力', '伯努利', '2023-03-17', '未消毒');
INSERT INTO `manage_goods` VALUES (1344, 'vbionlk', 15.00, 178, '看来你们', '那么', '你看了', '2023-03-05', '已消毒');
INSERT INTO `manage_goods` VALUES (1345, '大色的屏幕', 17.00, 116, '把你家婆', '会被弄IP就', '伯尼', '2023-03-19', '未消毒');

-- ----------------------------
-- Table structure for provide_goods
-- ----------------------------
DROP TABLE IF EXISTS `provide_goods`;
CREATE TABLE `provide_goods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物资名',
  `price` double(10, 2) NOT NULL COMMENT '物资价格',
  `number` int NOT NULL COMMENT '物资数量',
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物资生产地',
  `manufacturers` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物资生产商',
  `descs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物资描述',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '入库时间',
  `isDisinfect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否消毒',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of provide_goods
-- ----------------------------
INSERT INTO `provide_goods` VALUES (1, '2普通口罩', 1.50, 46, '浙江嘉兴2', '浙江嘉兴制造商2', '描述546', '2023-03-04', '已消毒');
INSERT INTO `provide_goods` VALUES (2, '2n95口罩', 5.50, 3, '浙江嘉兴2', '浙江嘉兴制造商2', '描述213', '2023-03-02', '已消毒');
INSERT INTO `provide_goods` VALUES (3, '2防护服', 100.50, 9, '浙江嘉兴2', '浙江嘉兴制造商2', '描述453', '2023-03-02', '已消毒');
INSERT INTO `provide_goods` VALUES (4, '洗手液', 10.50, 7, '浙江嘉兴2', '浙江嘉兴制造商2', '123', '2023-03-02', '未消毒');
INSERT INTO `provide_goods` VALUES (5, '2防护镜', 20.50, 5, '浙江嘉兴2', '浙江嘉兴制造商2', '123', '2023-03-02', '已消毒');
INSERT INTO `provide_goods` VALUES (6, '棉签', 2.50, 10, '浙江嘉兴2', '浙江嘉兴制造商2', '描述786', '2023-03-04', '已消毒');
INSERT INTO `provide_goods` VALUES (7, '2采样管', 10.50, 9, '浙江嘉兴2', '浙江嘉兴制造商2', '描述753', '2023-03-02', '未消毒');
INSERT INTO `provide_goods` VALUES (8, '测温枪', 50.50, 1, '浙江嘉兴2', '浙江嘉兴制造商2', '描述', '2023-03-01', '未消毒');
INSERT INTO `provide_goods` VALUES (9, '隔离服', 100.50, 6, '浙江嘉兴2', '浙江嘉兴制造商2', '描述123', '2023-03-08', '未消毒');
INSERT INTO `provide_goods` VALUES (10, '2医用手套', 40.50, 2, '浙江嘉兴2', '浙江嘉兴制造商2', '描述', '2023-03-02', '未消毒');
INSERT INTO `provide_goods` VALUES (11, '酒精', 10.50, 8, '浙江嘉兴2', '浙江嘉兴制造商2', '描述423', '2023-03-04', '未消毒');
INSERT INTO `provide_goods` VALUES (19, '消毒水', 15.50, 49, '浙江嘉兴2', '浙江嘉兴制造商2', '描述7853', '2023-03-02', '未消毒');
INSERT INTO `provide_goods` VALUES (20, '2消毒水', 15.50, 48, '浙江嘉兴2', '浙江嘉兴制造商2', '描述', '2023-03-01', '未消毒');
INSERT INTO `provide_goods` VALUES (23, 'bunop1', 123.00, 565, 'bjnkl;', 'hjbkn', 'ibop1', '2023-03-19', '未消毒');
INSERT INTO `provide_goods` VALUES (24, 'ibohjp', 143.00, 232, 'ctuyviohjp', 'cvhijo', 'hcgvjbk', '2023-03-12', '已消毒');
INSERT INTO `provide_goods` VALUES (25, 'cgvjhb', 566.00, 566, 'j hkbnlm;', 'vbkjnl', 'ghjk', '2023-03-19', '未消毒');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户密码',
  `power` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户权限 1是管理员 2是供应商 3是需求方',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号',
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所属部门',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '性别',
  `imgUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '头像地址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (60, '1234', '24214', '1', '13973034458', '县存储局', '男', 'http://localhost:3000/api/image/default.jpg');
INSERT INTO `users` VALUES (62, '466456', '649684', '2', '13973034558', '县供应商', '男', 'http://localhost:3000/api/image/default.jpg');
INSERT INTO `users` VALUES (64, '46645674', '649684', '3', '13973034558', '县志愿者', '女', 'http://localhost:3000/api/image/default.jpg');
INSERT INTO `users` VALUES (65, 'adsas', 'asda', '1', '13973034558', '县存储局', '男', 'http://localhost:3000/api/image/default.jpg');
INSERT INTO `users` VALUES (66, 'asda', 'dasd', '1', '13973034558', '县存储局', '女', 'http://localhost:3000/api/image/default.jpg');
INSERT INTO `users` VALUES (69, 'admin1', 'admin1', '1', '13973034558', '县存储局', '男', 'http://localhost:3000/api/image/admin1.jpg');
INSERT INTO `users` VALUES (70, 'admin2', 'admin2', '2', '13973216546', '县供应商', '女', 'http://localhost:3000/api/image/admin2.jpg');
INSERT INTO `users` VALUES (71, 'admin3', 'admin3', '3', '13546842168', '县志愿者', '男', 'http://localhost:3000/api/image/default.jpg');
INSERT INTO `users` VALUES (72, 'asdsa', 'asda', '3', '13798780248', 'gbhkkl;', '女', 'http://localhost:3000/api/image/default.jpg');
INSERT INTO `users` VALUES (73, 'obno', 'uioi', '1', '13856783456', 'adsoihno', '男', 'http://localhost:3000/api/image/default.jpg');
INSERT INTO `users` VALUES (75, 'vhkbjl', 'kblnk', '3', '13745673456', 'vjkbl', '男', 'http://localhost:3000/api/image/default.jpg');
INSERT INTO `users` VALUES (77, 'asdd', 'bnlk', '1', '15645678907', '不肯接纳了吗', '男', 'http://localhost:3000/api/image/default.jpg');

SET FOREIGN_KEY_CHECKS = 1;
