-- MySQL dump 10.13  Distrib 5.7.19, for Win64 (x86_64)
--
-- Host: localhost    Database: guijia
-- ------------------------------------------------------
-- Server version	5.7.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `elder_info`
--

DROP TABLE IF EXISTS `elder_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elder_info` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `age` int(3) NOT NULL COMMENT '年龄',
  `gender` int(1) NOT NULL DEFAULT '1' COMMENT '1代表男，2代表女',
  `nation` varchar(255) NOT NULL DEFAULT '汉族' COMMENT '民族',
  `native` varchar(255) NOT NULL COMMENT '籍贯',
  `birthday` date NOT NULL COMMENT '出生日期',
  `feature` varchar(255) DEFAULT NULL COMMENT '特征',
  `miss_height` double DEFAULT NULL COMMENT '老人身高',
  `miss_weight` double DEFAULT NULL COMMENT '老人体重',
  `miss_province` varchar(255) NOT NULL COMMENT '失踪省份',
  `miss_city` varchar(255) NOT NULL COMMENT '失踪市',
  `miss_county` varchar(255) NOT NULL COMMENT '失踪区/县',
  `miss_town` varchar(255) NOT NULL COMMENT '失踪街道/镇',
  `miss_desc` varchar(255) NOT NULL COMMENT '失踪地详细说明',
  `miss_time` datetime NOT NULL COMMENT '失踪时间',
  `miss_type` int(1) NOT NULL DEFAULT '3' COMMENT '1代表离家出走、2代表被拐被骗、3代表迷路走失、4代表失散亲友、5代表不明原因',
  `contactor` varchar(255) NOT NULL COMMENT '联系人',
  `contact_tel` varchar(11) NOT NULL COMMENT '联系电话',
  `physical_condition` varchar(255) DEFAULT NULL COMMENT '身体状况',
  `psyc_condition` varchar(255) DEFAULT NULL COMMENT '心理状况',
  `ID_num` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `photo` varchar(255) DEFAULT NULL COMMENT '照片地址',
  `pos_pla_province` varchar(255) DEFAULT NULL COMMENT '可能去往地省份',
  `pos_pla_city` varchar(255) DEFAULT NULL COMMENT '可能去往地市',
  `pos_pla_county` varchar(255) DEFAULT NULL COMMENT '可能去往地区/县',
  `pos_pla_town` varchar(255) DEFAULT NULL COMMENT '可能去往地街道/镇',
  `pos_pla_desc` varchar(255) DEFAULT NULL COMMENT '可能去往地详细说明',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`,`native`) USING BTREE,
  KEY `miss_type` (`miss_type`),
  CONSTRAINT `elder_info_ibfk_1` FOREIGN KEY (`miss_type`) REFERENCES `missing_type` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elder_info`
--

LOCK TABLES `elder_info` WRITE;
/*!40000 ALTER TABLE `elder_info` DISABLE KEYS */;
INSERT INTO `elder_info` VALUES (1,'张三',65,1,'汉族','湖北武汉','2021-03-20','相貌特征',170,60,'湖北省','武汉市','江汉区','AAA街道','BBB社区4单元楼下','2021-03-20 20:24:10',3,'张三丰','12345678910','身体状况','心理状况','44546465616',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'李四',55,1,'汉族','湖南长沙','2021-03-20',NULL,165,50,'湖南省','长沙市','天心区','BBB街道','门牌号25','2021-03-20 20:42:05',3,'李小四','123468',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `elder_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ex_resources`
--

DROP TABLE IF EXISTS `ex_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ex_resources` (
  `id` int(11) NOT NULL,
  `place_type_id` int(11) NOT NULL COMMENT '查询的种类如：公安局、医院、收容所...与place_type相联系',
  `modify_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`,`place_type_id`) USING BTREE,
  KEY `type_id` (`place_type_id`),
  CONSTRAINT `ex_resources_ibfk_1` FOREIGN KEY (`place_type_id`) REFERENCES `place_type` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ex_resources`
--

LOCK TABLES `ex_resources` WRITE;
/*!40000 ALTER TABLE `ex_resources` DISABLE KEYS */;
INSERT INTO `ex_resources` VALUES (1,1,'2021-03-21 11:25:19'),(2,2,'2021-03-21 11:26:15');
/*!40000 ALTER TABLE `ex_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade` (
  `id` int(11) NOT NULL,
  `greade_name` varchar(255) NOT NULL COMMENT '等级名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES (1,'1级'),(2,'2级'),(3,'3级');
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hospital_name` varchar(255) NOT NULL COMMENT '医院名称',
  `hospital_province` varchar(255) NOT NULL COMMENT '省',
  `hospital_city` varchar(255) NOT NULL COMMENT '市',
  `hospital_country` varchar(255) NOT NULL COMMENT '区/县',
  `hospital_town` varchar(255) NOT NULL COMMENT '镇',
  `hosptal_desc` varchar(255) NOT NULL COMMENT '具体位置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (1,'北京协和医院','北京市','北京市','东城区','帅府园','1号'),(2,'安徽省立医院','安徽省','合肥市','庐阳区','庐江路','17号');
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `missing_type`
--

DROP TABLE IF EXISTS `missing_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `missing_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `miss_typeName` varchar(255) NOT NULL COMMENT '失踪种类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `missing_type`
--

LOCK TABLES `missing_type` WRITE;
/*!40000 ALTER TABLE `missing_type` DISABLE KEYS */;
INSERT INTO `missing_type` VALUES (1,'离家出走'),(2,'被拐骗'),(3,'迷路走失'),(4,'失散亲友'),(5,'不明原因');
/*!40000 ALTER TABLE `missing_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_type`
--

DROP TABLE IF EXISTS `place_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `place_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL COMMENT '种类的名称',
  `place_id` int(11) NOT NULL COMMENT '当前种类的部门id',
  PRIMARY KEY (`id`),
  KEY `place_id` (`place_id`),
  CONSTRAINT `place_type_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `police` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `place_type_ibfk_2` FOREIGN KEY (`place_id`) REFERENCES `hospital` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_type`
--

LOCK TABLES `place_type` WRITE;
/*!40000 ALTER TABLE `place_type` DISABLE KEYS */;
INSERT INTO `place_type` VALUES (1,'警察局',2),(2,'医院',1);
/*!40000 ALTER TABLE `place_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `police`
--

DROP TABLE IF EXISTS `police`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `police` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `police_name` varchar(255) NOT NULL COMMENT '公安局名称',
  `police_province` varchar(255) NOT NULL COMMENT '公安局所在地省份',
  `police_city` varchar(255) NOT NULL COMMENT '公安局所在地市',
  `police_country` varchar(255) NOT NULL COMMENT '公安局所在区/县',
  `police_town` varchar(255) NOT NULL COMMENT '公安局所在镇',
  `police_desc` varchar(255) DEFAULT NULL COMMENT '公安局具体地址',
  `police_tel` varchar(255) NOT NULL COMMENT '公安局服务热线',
  `police_serverTime` varchar(255) NOT NULL COMMENT '公安局服务时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `police`
--

LOCK TABLES `police` WRITE;
/*!40000 ALTER TABLE `police` DISABLE KEYS */;
INSERT INTO `police` VALUES (1,'长沙市公安局','湖南省','长沙市','芙蓉区','解放西路','140号','073182587844','周一至周五，上午9:00—12:00;下午13:00—17:00(夏季:下午13:30—17:30)'),(2,'成都市公安局','四川省','成都市','青羊区','文武路','136号','123456','9:00-17:00');
/*!40000 ALTER TABLE `police` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repo_person`
--

DROP TABLE IF EXISTS `repo_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repo_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '报备人员的id,与user表中的id相联系，根据uid可以直接查找报备人员的信息',
  `trans_type` int(1) NOT NULL COMMENT '交通方式与transport表的id相联系',
  `IsPrepare` bit(1) NOT NULL COMMENT '是否准备充分，0代表否，1代表是',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`,`uid`),
  KEY `trans_type` (`trans_type`),
  KEY `uid` (`uid`),
  CONSTRAINT `repo_person_ibfk_1` FOREIGN KEY (`trans_type`) REFERENCES `transport` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `repo_person_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repo_person`
--

LOCK TABLES `repo_person` WRITE;
/*!40000 ALTER TABLE `repo_person` DISABLE KEYS */;
INSERT INTO `repo_person` VALUES (1,2,1,'','估计五分钟到达搜索起始点'),(3,4,2,'\0','缺少装备');
/*!40000 ALTER TABLE `repo_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '角色表ID',
  `roleName` varchar(255) NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'系统管理员'),(2,'救援队员'),(3,'家属');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(255) NOT NULL COMMENT '任务状态：0未开始,1正在进行,2已找到,3已结束(尚未找到)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (0,'未开始'),(1,'正在进行'),(2,'已找到'),(3,'已结束(尚未找到)');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elder_id` int(11) NOT NULL COMMENT '寻找老人的编号',
  `start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始的时间',
  `state_id` int(1) NOT NULL COMMENT '任务状态',
  `grade_id` int(1) NOT NULL COMMENT '任务等级',
  `member1_id` int(11) NOT NULL COMMENT '成员1id,搜救人员至少一人',
  `member2_id` int(11) DEFAULT NULL COMMENT '成员2id',
  `member3_id` int(11) DEFAULT NULL COMMENT '成员3id',
  `member4_id` int(11) DEFAULT NULL COMMENT '成员4id',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `clue` text COMMENT '线索',
  PRIMARY KEY (`id`,`elder_id`) USING BTREE,
  KEY `state_id` (`state_id`),
  KEY `grade_id` (`grade_id`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,1,'2021-03-21 14:33:08',0,1,1,2,NULL,NULL,NULL,'1313131313213215615613513');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport`
--

DROP TABLE IF EXISTS `transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '交通方式名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport`
--

LOCK TABLES `transport` WRITE;
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
INSERT INTO `transport` VALUES (1,'步行'),(2,'自行车'),(3,'公交车'),(4,'摩托/电动车'),(5,'轿车'),(6,'其他');
/*!40000 ALTER TABLE `transport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL COMMENT '用户名称',
  `userPassword` varchar(255) NOT NULL COMMENT '用户密码',
  `gender` int(1) NOT NULL DEFAULT '1' COMMENT '性别，1为男，2为女,默认值为1',
  `age` int(3) NOT NULL COMMENT '年龄',
  `birthday` date NOT NULL COMMENT '出生日期',
  `phone` varchar(11) NOT NULL COMMENT '电话号码',
  `address_province` varchar(255) NOT NULL COMMENT '地址_省份',
  `address_city` varchar(255) NOT NULL COMMENT '地址_市',
  `adress_county` varchar(255) NOT NULL COMMENT '地址_县/区',
  `adress_town` varchar(255) NOT NULL COMMENT '地址_乡镇/街道',
  `adress_desc` varchar(255) DEFAULT NULL COMMENT '地址_门牌号等详细说明',
  `userRole` int(1) NOT NULL COMMENT '用户角色（1管理员，2队员/志愿者，3家属）',
  `creatDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建的时间',
  `modifyDate` datetime NOT NULL COMMENT '修改的时间',
  PRIMARY KEY (`id`),
  KEY `user_ibfk_1` (`userRole`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`userRole`) REFERENCES `role` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','123456',1,20,'2021-03-20','15080811556','湖南省','长沙市','天心区','暮云街道',NULL,1,'2021-03-20 15:33:34','2021-03-20 15:20:15'),(2,'队员1','123456',1,30,'2021-03-20','123456','湖南省','长沙市','天心区','暮云街道',NULL,2,'2021-03-20 15:33:45','2021-03-20 15:23:21'),(3,'家属1','123',1,20,'2021-03-20','13456','湖北省','武汉市','江汉区','民族街道','武胜社区',3,'2021-03-20 20:47:41','2021-03-20 15:30:38'),(4,'队员2','123',1,18,'2021-03-20','12356','安徽省','阜阳市','颍泉区','太和县',NULL,2,'2021-03-20 20:51:41','2021-03-20 20:51:35');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-21 14:45:01
