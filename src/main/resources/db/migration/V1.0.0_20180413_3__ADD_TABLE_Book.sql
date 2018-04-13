-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upload_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `download_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '1', '上传地址', '下载地址', '1');

ALTER TABLE `course` ADD `book_id` INT (11) DEFAULT NULL ;
ALTER TABLE `course` ADD CONSTRAINT `course_book_id` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);

ALTER TABLE `lab` ADD `book_id` INT (11) DEFAULT NULL ;
ALTER TABLE `lab` ADD CONSTRAINT `lab_book_id` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`)