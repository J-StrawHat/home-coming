/*
 Navicat Premium Data Transfer

 Source Server         : MyDataBase
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : localhost:3306
 Source Schema         : guijia

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 14/04/2021 21:29:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for elder_info
-- ----------------------------
DROP TABLE IF EXISTS `elder_info`;
CREATE TABLE `elder_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `age` int(11) NOT NULL COMMENT '年龄',
  `gender` int(11) NOT NULL DEFAULT 1 COMMENT '1代表男，2代表女',
  `nation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '汉族' COMMENT '民族',
  `native` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '籍贯',
  `birthday` date NOT NULL COMMENT '出生日期',
  `feature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '特征',
  `miss_height` double NULL DEFAULT NULL COMMENT '老人身高',
  `miss_weight` double NULL DEFAULT NULL COMMENT '老人体重',
  `miss_province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '失踪省份',
  `miss_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '失踪市',
  `miss_county` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '失踪区/县',
  `miss_town` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '失踪街道/镇',
  `miss_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '失踪地详细说明',
  `miss_time` datetime(0) NOT NULL COMMENT '失踪时间',
  `miss_type` int(11) NOT NULL DEFAULT 3 COMMENT '1代表离家出走、2代表被拐被骗、3代表迷路走失、4代表失散亲友、5代表不明原因',
  `contactor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人',
  `contact_tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系电话',
  `physical_condition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身体状况',
  `psyc_condition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '心理状况',
  `ID_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '照片地址',
  `pos_pla_province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可能去往地省份',
  `pos_pla_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可能去往地市',
  `pos_pla_county` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可能去往地区/县',
  `pos_pla_town` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可能去往地街道/镇',
  `pos_pla_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可能去往地详细说明',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`, `native`) USING BTREE,
  INDEX `miss_type`(`miss_type`) USING BTREE,
  CONSTRAINT `elder_info_ibfk_1` FOREIGN KEY (`miss_type`) REFERENCES `missing_type` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of elder_info
-- ----------------------------
INSERT INTO `elder_info` VALUES (1, '张三', 65, 1, '汉族', '湖北武汉', '2021-03-20', '相貌特征', 170, 60, '湖北省', '武汉市', '江汉区', 'AAA街道', 'BBB社区4单元楼下', '2021-03-20 20:24:10', 3, '张三丰', '12345678910', '身体状况', '心理状况', '44546465616', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `elder_info` VALUES (2, '李四', 55, 1, '汉族', '湖南长沙', '2021-03-20', NULL, 165, 50, '湖南省', '长沙市', '天心区', 'BBB街道', '门牌号25', '2021-03-20 20:42:05', 3, '李小四', '123468', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for ex_resources
-- ----------------------------
DROP TABLE IF EXISTS `ex_resources`;
CREATE TABLE `ex_resources`  (
  `id` int(11) NOT NULL,
  `place_type_id` int(11) NOT NULL COMMENT '查询的种类如：公安局、医院、收容所...与place_type相联系',
  `modify_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`, `place_type_id`) USING BTREE,
  INDEX `type_id`(`place_type_id`) USING BTREE,
  CONSTRAINT `ex_resources_ibfk_1` FOREIGN KEY (`place_type_id`) REFERENCES `place_type` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ex_resources
-- ----------------------------
INSERT INTO `ex_resources` VALUES (1, 1, '2021-03-21 11:25:19');
INSERT INTO `ex_resources` VALUES (2, 2, '2021-03-21 11:26:15');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `id` int(11) NOT NULL,
  `greade_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '等级名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES (1, '1级');
INSERT INTO `grade` VALUES (2, '2级');
INSERT INTO `grade` VALUES (3, '3级');

-- ----------------------------
-- Table structure for hospital
-- ----------------------------
DROP TABLE IF EXISTS `hospital`;
CREATE TABLE `hospital`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hospital_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '医院名称',
  `hospital_province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省',
  `hospital_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '市',
  `hospital_country` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区/县',
  `hospital_town` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '镇',
  `hosptal_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '具体位置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hospital
-- ----------------------------
INSERT INTO `hospital` VALUES (1, '北京协和医院', '北京市', '北京市', '东城区', '帅府园', '1号');
INSERT INTO `hospital` VALUES (2, '安徽省立医院', '安徽省', '合肥市', '庐阳区', '庐江路', '17号');

-- ----------------------------
-- Table structure for missing_type
-- ----------------------------
DROP TABLE IF EXISTS `missing_type`;
CREATE TABLE `missing_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `miss_typeName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '失踪种类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of missing_type
-- ----------------------------
INSERT INTO `missing_type` VALUES (1, '离家出走');
INSERT INTO `missing_type` VALUES (2, '被拐骗');
INSERT INTO `missing_type` VALUES (3, '迷路走失');
INSERT INTO `missing_type` VALUES (4, '失散亲友');
INSERT INTO `missing_type` VALUES (5, '不明原因');

-- ----------------------------
-- Table structure for place_type
-- ----------------------------
DROP TABLE IF EXISTS `place_type`;
CREATE TABLE `place_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '种类的名称',
  `place_id` int(11) NOT NULL COMMENT '当前种类的部门id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `place_id`(`place_id`) USING BTREE,
  CONSTRAINT `place_type_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `police` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `place_type_ibfk_2` FOREIGN KEY (`place_id`) REFERENCES `hospital` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of place_type
-- ----------------------------
INSERT INTO `place_type` VALUES (1, '警察局', 2);
INSERT INTO `place_type` VALUES (2, '医院', 1);

-- ----------------------------
-- Table structure for police
-- ----------------------------
DROP TABLE IF EXISTS `police`;
CREATE TABLE `police`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `police_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公安局名称',
  `police_province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公安局所在地省份',
  `police_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公安局所在地市',
  `police_country` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公安局所在区/县',
  `police_town` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公安局所在镇',
  `police_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公安局具体地址',
  `police_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公安局服务热线',
  `police_serverTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公安局服务时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of police
-- ----------------------------
INSERT INTO `police` VALUES (1, '长沙市公安局', '湖南省', '长沙市', '芙蓉区', '解放西路', '140号', '073182587844', '周一至周五，上午9:00—12:00;下午13:00—17:00(夏季:下午13:30—17:30)');
INSERT INTO `police` VALUES (2, '成都市公安局', '四川省', '成都市', '青羊区', '文武路', '136号', '123456', '9:00-17:00');

-- ----------------------------
-- Table structure for repo_person
-- ----------------------------
DROP TABLE IF EXISTS `repo_person`;
CREATE TABLE `repo_person`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '报备人员的id,与user表中的id相联系，根据uid可以直接查找报备人员的信息',
  `trans_type` int(11) NOT NULL COMMENT '交通方式与transport表的id相联系',
  `IsPrepare` bit(1) NOT NULL COMMENT '是否准备充分，0代表否，1代表是',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`, `uid`) USING BTREE,
  INDEX `trans_type`(`trans_type`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `repo_person_ibfk_1` FOREIGN KEY (`trans_type`) REFERENCES `transport` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `repo_person_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of repo_person
-- ----------------------------
INSERT INTO `repo_person` VALUES (1, 2, 1, b'1', '估计五分钟到达搜索起始点');
INSERT INTO `repo_person` VALUES (3, 4, 2, b'0', '缺少装备');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色表ID',
  `roleName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '系统管理员');
INSERT INTO `role` VALUES (2, '救援队员');
INSERT INTO `role` VALUES (3, '家属');

-- ----------------------------
-- Table structure for state
-- ----------------------------
DROP TABLE IF EXISTS `state`;
CREATE TABLE `state`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务状态：0未开始,1正在进行,2已找到,3已结束(尚未找到)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of state
-- ----------------------------
INSERT INTO `state` VALUES (1, '正在进行');
INSERT INTO `state` VALUES (2, '已找到');
INSERT INTO `state` VALUES (3, '已结束(尚未找到)');
INSERT INTO `state` VALUES (4, '未开始');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elder_id` int(11) NOT NULL COMMENT '寻找老人的编号',
  `start_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '开始的时间',
  `state_id` int(11) NOT NULL COMMENT '任务状态',
  `grade_id` int(11) NOT NULL COMMENT '任务等级',
  `member1_id` int(11) NOT NULL COMMENT '成员1id,搜救人员至少一人',
  `member2_id` int(11) NULL DEFAULT NULL COMMENT '成员2id',
  `member3_id` int(11) NULL DEFAULT NULL COMMENT '成员3id',
  `member4_id` int(11) NULL DEFAULT NULL COMMENT '成员4id',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `clue` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '线索',
  PRIMARY KEY (`id`, `elder_id`) USING BTREE,
  INDEX `state_id`(`state_id`) USING BTREE,
  INDEX `grade_id`(`grade_id`) USING BTREE,
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (1, 1, '2021-03-21 14:33:08', 0, 1, 1, 2, NULL, NULL, NULL, '1313131313213215615613513');

-- ----------------------------
-- Table structure for transport
-- ----------------------------
DROP TABLE IF EXISTS `transport`;
CREATE TABLE `transport`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交通方式名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transport
-- ----------------------------
INSERT INTO `transport` VALUES (1, '步行');
INSERT INTO `transport` VALUES (2, '自行车');
INSERT INTO `transport` VALUES (3, '公交车');
INSERT INTO `transport` VALUES (4, '摩托/电动车');
INSERT INTO `transport` VALUES (5, '轿车');
INSERT INTO `transport` VALUES (6, '其他');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `gender` int(11) NOT NULL DEFAULT 1 COMMENT '性别，1为男，2为女,默认值为1',
  `age` int(11) NOT NULL COMMENT '年龄',
  `birthday` date NOT NULL COMMENT '出生日期',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话号码',
  `address_province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址_省份',
  `address_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址_市',
  `address_county` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址_县/区',
  `address_town` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址_乡镇/街道',
  `address_detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址_门牌号等详细说明',
  `userRole` int(11) NULL DEFAULT NULL COMMENT '用户角色（1管理员，2队员/志愿者，3家属）',
  `createTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建的时间',
  `updateTime` datetime(0) NULL DEFAULT NULL COMMENT '修改的时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_ibfk_1`(`userRole`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`userRole`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '$2a$10$8Wl95NJPR2TidB.RFCoGxeFHSKOhy7Y/fAx5VysjJxQgCKbapVh4K', 1, 20, '2021-03-20', '15080811556', '湖南省', '长沙市', '天心区', '暮云街道', NULL, 1, '2021-03-22 18:54:27', '2021-03-20 15:20:15');
INSERT INTO `user` VALUES (2, '队员1', '123456', 1, 30, '2021-03-20', '123456', '湖南省', '长沙市', '天心区', '暮云街道', NULL, 2, '2021-03-20 15:33:45', '2021-03-20 15:23:21');
INSERT INTO `user` VALUES (3, '家属1', '123', 1, 20, '2021-03-20', '13456', '湖北省', '武汉市', '江汉区', '民族街道', '武胜社区', 3, '2021-03-20 20:47:41', '2021-03-20 15:30:38');
INSERT INTO `user` VALUES (4, '队员2', '123', 1, 18, '2021-03-20', '12356', '安徽省', '阜阳市', '颍泉区', '太和县', NULL, 2, '2021-03-20 20:51:41', '2021-03-20 20:51:35');
INSERT INTO `user` VALUES (5, 'wwwww', '$2a$10$8Wl95NJPR2TidB.RFCoGxeFHSKOhy7Y/fAx5VysjJxQgCKbapVh4K', 1, 20, '2021-03-20', '15080811556', '湖南省', '暮云街道', '湖南省', '暮云街道', NULL, 2, '2021-04-14 21:00:53', '2021-03-20 00:00:00');
INSERT INTO `user` VALUES (6, '迪迦', '123456', 1, 23333, '2021-03-20', '13456', '湖北省', '武汉市', '江汉区', '民族街道', '武胜社区', 2, '2021-04-14 21:00:54', '2021-03-20 00:00:00');
INSERT INTO `user` VALUES (7, '盖亚', '123456', 1, 23333, '2021-03-20', '13456', '湖北省', '武汉市', '江汉区', '民族街道', '武胜社区', 2, '2021-04-14 21:01:00', '2021-03-20 00:00:00');
INSERT INTO `user` VALUES (10, 'skfhsddf', '2342', 1, 30, '2021-03-20', '123456', '湖南省', '长沙市', '天心区', '暮云街道', NULL, NULL, '2021-03-20 00:00:00', '2021-03-20 00:00:00');

SET FOREIGN_KEY_CHECKS = 1;
