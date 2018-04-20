/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50637
Source Host           : localhost:3306
Source Database       : perfectteaching

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2018-03-29 17:23:57
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '1001', '计算机科学与工程', '小高', '123456789', '计算机');

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
  PRIMARY KEY (`id`),
  KEY `major_dept_id` (`dept_id`),
  CONSTRAINT `major_dept_id` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES ('1', '100106', '软件工程', '123456789', '小高', '1');
INSERT INTO `major` VALUES ('2', '100107', '信息工程', '123456789', '小倩', '1');

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
  KEY `teacher_dept_id` (`dept_id`),
  CONSTRAINT `teacher_dept_id` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '1002', '小倩', '女', '教授', '2018-04-04 10:28:51', '123456', '123456', '1', 'xiaoqian@qq.com');

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
  KEY `student_major_id` (`major_id`),
  CONSTRAINT `student_major_id` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '1306', '小美', '女', '2018-04-04 10:54:55', '1', 'stu@qq.com', '123456', '123456', '1', '1');

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
  `type` VARCHAR (11) DEFAULT NULL ,
  `teacher_id` INT (11) DEFAULT NULL ,
  PRIMARY KEY (`id`),
  KEY `lab_teacher_id` (`teacher_id`),
  CONSTRAINT `lab_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Records of lab
-- ----------------------------
INSERT INTO `lab` VALUES ('1', '1', '1', '1', '0','lab','1');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `index` int(11) NOT NULL ,
  `content` varchar(255) DEFAULT NULL,
  `option` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `lab_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lab_test_id` (`lab_id`),
  CONSTRAINT `lab_test_id` FOREIGN KEY (`lab_id`) REFERENCES `lab` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1','1', 'who?', 'A,B,C,D', 'A', '1');
INSERT INTO `test` VALUES ('2','2', 'where', 'A,B,C,D', 'B', '1');
INSERT INTO `test` VALUES ('3','3', 'how?', 'A,B,C,D', 'C', '1');
INSERT INTO `test` VALUES ('4','4','why?', 'A,B,C,D', 'D', '1');




-- ----------------------------
-- Table structure for stulab
-- ----------------------------
DROP TABLE IF EXISTS `stulab`;
CREATE TABLE `stulab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) NOT NULL,
  `lab_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stulab_student_id` (`s_id`),
  KEY `stulab_lab_id` (`lab_id`),
  CONSTRAINT `stulab_lab_id` FOREIGN KEY (`lab_id`) REFERENCES `lab` (`id`),
  CONSTRAINT `stulab_student_id` FOREIGN KEY (`s_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stulab
-- ----------------------------
INSERT INTO `stulab` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for plan
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `dept_id` int(11) DEFAULT NULL,
  `major_id` int(11) DEFAULT NULL,
  `lab_id`  int(11) DEFAULT NULL,
  `start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `plan_dept_id` (`dept_id`),
  KEY `plan_major_id` (`major_id`),
  KEY `plan_lab_id` (`lab_id`),
  CONSTRAINT `plan_dept_id` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`),
  CONSTRAINT `plan_major_id` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`),
  CONSTRAINT `plan_lab_id` FOREIGN KEY (`lab_id`) REFERENCES `lab` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Records of plan
-- ----------------------------
INSERT INTO `plan` VALUES ('1', '1', '1', '2', '1','2018-04-04 10:27:13', '2018-04-04 10:27:13');

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade` int(11) DEFAULT NULL,
  `s_id` int(11) DEFAULT NULL,
  `lab_id` int(11) DEFAULT NULL,
  `usr_option` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `report_student_id` (`s_id`),
  KEY `report_lab_id` (`lab_id`),
  CONSTRAINT `report_lab_id` FOREIGN KEY (`lab_id`) REFERENCES `lab` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `report_student_id` FOREIGN KEY (`s_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES ('1', '1', '1','1', 'A,D,C,C', '1');





