/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50637
Source Host           : localhost:3306
Source Database       : perfectteaching

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2018-04-04 10:30:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_num` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `admin_sex` varchar(2) DEFAULT NULL,
  `admin_birth` datetime DEFAULT NULL,
  `phone` int(20) DEFAULT NULL COMMENT '电话',
  `password` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '1001', '管理员', '男', '2018-04-09 10:27:51', '123456', '123456', 'admin@qq.com');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_num` int(11) NOT NULL,
  `dept_name` varchar(50) NOT NULL,
  `dept_chairman` varchar(50) DEFAULT NULL,
  `dept_tel` varchar(50) DEFAULT NULL,
  `dept_desc` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '1001', '计算机科学与工程', '小高', '123456789', '计算机');

-- ----------------------------
-- Table structure for lab
-- ----------------------------
DROP TABLE IF EXISTS `lab`;
CREATE TABLE `lab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lab_num` int(11) DEFAULT NULL,
  `lab_name` varchar(50) DEFAULT NULL,
  `lab_content` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `test_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_test_id` (`test_id`),
  CONSTRAINT `fk_test_id` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lab
-- ----------------------------
INSERT INTO `lab` VALUES ('1', '1', '1', '1', '0', '1');

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `major_num` int(11) NOT NULL,
  `major_name` varchar(50) NOT NULL,
  `major_tel` varchar(50) DEFAULT NULL,
  `major_assistant` varchar(50) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_major_dept` (`dept_id`),
  CONSTRAINT `fk_major_dept` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES ('1', '100106', '软件工程', '123456789', '小高', '1', '2018-04-04 09:49:01', '2018-04-04 09:49:01');
INSERT INTO `major` VALUES ('2', '100107', '信息工程', '123456789', '小倩', '1', '2018-04-04 09:49:02', '2018-04-04 09:49:02');

-- ----------------------------
-- Table structure for plan
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `t_content` text,
  `dept_id` int(11) DEFAULT NULL,
  `major_id` int(11) DEFAULT NULL,
  `start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan
-- ----------------------------
INSERT INTO `plan` VALUES ('1', '1', '1', '2', '2018-04-04 10:27:13', '2018-04-04 10:27:13');

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade` int(11) DEFAULT NULL,
  `stulab_id` int(11) DEFAULT NULL,
  `usr_option` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_report_stulab` (`stulab_id`),
  CONSTRAINT `fk_report_stulab` FOREIGN KEY (`stulab_id`) REFERENCES `stulab` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES ('1', '1', '1', 'A,D,C,C', '1');

-- ----------------------------
-- Table structure for schema_version
-- ----------------------------
DROP TABLE IF EXISTS `schema_version`;
CREATE TABLE `schema_version` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `schema_version_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schema_version
-- ----------------------------
INSERT INTO `schema_version` VALUES ('1', '1.0.0.20171229.1', 'TEACHER DB INIT', 'SQL', 'V1.0.0_20171229_1__TEACHER_DB_INIT.sql', '-1381315426', 'root', '2018-04-03 17:40:57', '6946', '1');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_num` int(20) NOT NULL,
  `s_name` varchar(50) NOT NULL,
  `s_sex` varchar(2) DEFAULT NULL,
  `s_birth` datetime DEFAULT NULL,
  `s_class` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `phone` int(20) DEFAULT NULL COMMENT '电话',
  `status` varchar(50) DEFAULT NULL,
  `major_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stu_major` (`major_id`),
  CONSTRAINT `fk_stu_major` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '1306', '小美', '女', '0000-00-00 00:00:00', '1', 'stu@qq.com', '123456', '123456', '1', '1');

-- ----------------------------
-- Table structure for stulab
-- ----------------------------
DROP TABLE IF EXISTS `stulab`;
CREATE TABLE `stulab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) NOT NULL,
  `lab_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stu_id` (`s_id`),
  KEY `fk_lab_id` (`lab_id`),
  CONSTRAINT `fk_lab_id` FOREIGN KEY (`lab_id`) REFERENCES `lab` (`id`),
  CONSTRAINT `fk_stu_id` FOREIGN KEY (`s_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stulab
-- ----------------------------
INSERT INTO `stulab` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `t_num` int(11) NOT NULL,
  `t_name` varchar(50) NOT NULL,
  `t_sex` varchar(2) DEFAULT NULL,
  `t_title` varchar(50) DEFAULT NULL,
  `t_birth` datetime DEFAULT NULL,
  `phone` int(20) DEFAULT NULL COMMENT '电话',
  `password` varchar(255) NOT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_teacher_dept` (`dept_id`),
  CONSTRAINT `fk_teacher_dept` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '1002', '小倩', '女', '辅导员', '2018-04-04 10:28:51', '123456', '123456', '1', 'xiaoqian@qq.com');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `option` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1', 'who?', 'A,B,C,D', 'A');
INSERT INTO `test` VALUES ('2', 'where', 'A,B,C,D', 'B');
INSERT INTO `test` VALUES ('3', 'how?', 'A,B,C,D', 'C');
INSERT INTO `test` VALUES ('4', 'why?', 'A,B,C,D', 'D');
