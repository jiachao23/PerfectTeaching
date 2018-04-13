DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
   `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_num` int(11) DEFAULT NULL,
  `course_name` varchar(50) DEFAULT NULL,
  `course_content` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `stucourse`;
CREATE TABLE `stucourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stucourse_student_id` (`s_id`),
  KEY `stucourse_course_id` (`course_id`),
  CONSTRAINT `stucourse_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `stucourse_student_id` FOREIGN KEY (`s_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;