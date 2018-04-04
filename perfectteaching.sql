/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : perfectteaching

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 04/04/2018 18:45:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_num` int(11) NOT NULL,
  `admin_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `admin_birth` datetime(0) NULL DEFAULT NULL,
  `phone` int(20) NULL DEFAULT NULL COMMENT '电话',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 1001, '管理员', '男', '2018-04-09 10:27:51', 123456, '123456', 'admin@qq.com');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_num` int(11) NOT NULL,
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dept_chairman` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dept_tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dept_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (1, 1001, '计算机科学与工程', '小高', '123456789', '计算机');

-- ----------------------------
-- Table structure for lab
-- ----------------------------
DROP TABLE IF EXISTS `lab`;
CREATE TABLE `lab`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lab_num` int(11) NULL DEFAULT NULL,
  `lab_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lab_content` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态',
  `start` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `end` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `test_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `lab_test_id`(`test_id`) USING BTREE,
  CONSTRAINT `lab_test_id` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lab
-- ----------------------------
INSERT INTO `lab` VALUES (1, 1, '1', '1', 0, '2018-04-04 10:27:13', '2018-04-04 10:27:13', 1);

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `major_num` int(11) NOT NULL,
  `major_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `major_tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `major_assistant` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dept_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `major_dept_id`(`dept_id`) USING BTREE,
  CONSTRAINT `major_dept_id` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES (1, 100106, '软件工程', '123456789', '小高', 1);
INSERT INTO `major` VALUES (2, 100107, '信息工程', '123456789', '小倩', 1);

-- ----------------------------
-- Table structure for plan
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `dept_id` int(11) NULL DEFAULT NULL,
  `major_id` int(11) NULL DEFAULT NULL,
  `start` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `end` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plan
-- ----------------------------
INSERT INTO `plan` VALUES (1, '1', 1, 2, '2018-04-04 10:27:13', '2018-04-04 10:27:13');

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade` int(11) NULL DEFAULT NULL,
  `s_id` int(11) NULL DEFAULT NULL,
  `lab_id` int(11) NULL DEFAULT NULL,
  `usr_option` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `report_student_id`(`s_id`) USING BTREE,
  INDEX `report_lab_id`(`lab_id`) USING BTREE,
  CONSTRAINT `report_lab_id` FOREIGN KEY (`lab_id`) REFERENCES `lab` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `report_student_id` FOREIGN KEY (`s_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES (1, 1, 1, 1, 'A,D,C,C', '1');
INSERT INTO `report` VALUES (2, NULL, 1, 1, NULL, NULL);
INSERT INTO `report` VALUES (3, NULL, 1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for schema_version
-- ----------------------------
DROP TABLE IF EXISTS `schema_version`;
CREATE TABLE `schema_version`  (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `script` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `checksum` int(11) NULL DEFAULT NULL,
  `installed_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `installed_on` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`) USING BTREE,
  INDEX `schema_version_s_idx`(`success`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schema_version
-- ----------------------------
INSERT INTO `schema_version` VALUES (1, '1.0.0.20171229.1', 'TEACHER DB INIT', 'SQL', 'V1.0.0_20171229_1__TEACHER_DB_INIT.sql', -98046625, 'root', '2018-04-04 18:11:37', 935, 1);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_num` int(20) NOT NULL,
  `s_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `s_sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `s_birth` datetime(0) NULL DEFAULT NULL,
  `s_class` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` int(20) NULL DEFAULT NULL COMMENT '电话',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `major_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `student_major_id`(`major_id`) USING BTREE,
  CONSTRAINT `student_major_id` FOREIGN KEY (`major_id`) REFERENCES `major` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 1306, '小美', '女', '2018-04-04 10:54:55', '1', 'stu@qq.com', '123456', 123456, '1', 1);

-- ----------------------------
-- Table structure for stulab
-- ----------------------------
DROP TABLE IF EXISTS `stulab`;
CREATE TABLE `stulab`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) NOT NULL,
  `lab_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `stulab_student_id`(`s_id`) USING BTREE,
  INDEX `stulab_lab_id`(`lab_id`) USING BTREE,
  CONSTRAINT `stulab_lab_id` FOREIGN KEY (`lab_id`) REFERENCES `lab` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `stulab_student_id` FOREIGN KEY (`s_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stulab
-- ----------------------------
INSERT INTO `stulab` VALUES (1, 1, 1);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `t_num` int(11) NOT NULL,
  `t_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `t_sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `t_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `t_birth` datetime(0) NULL DEFAULT NULL,
  `phone` int(20) NULL DEFAULT NULL COMMENT '电话',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dept_id` int(11) NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `teacher_dept_id`(`dept_id`) USING BTREE,
  CONSTRAINT `teacher_dept_id` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, 1002, '小倩', '女', '教授', '2018-04-04 10:28:51', 123456, '123456', 1, 'xiaoqian@qq.com');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `option` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES (1, 'who?', 'A,B,C,D', 'A');
INSERT INTO `test` VALUES (2, 'where', 'A,B,C,D', 'B');
INSERT INTO `test` VALUES (3, 'how?', 'A,B,C,D', 'C');
INSERT INTO `test` VALUES (4, 'why?', 'A,B,C,D', 'D');

SET FOREIGN_KEY_CHECKS = 1;
