

ALTER TABLE `course` ADD `teacher_id` INT (11) DEFAULT NULL ;
ALTER TABLE `course` ADD CONSTRAINT `teacher_course_id` FOREIGN KEY (`teacher_id`) REFERENCES `course` (`id`);

ALTER TABLE `lab` ADD `teacher_id` INT (11) DEFAULT NULL ;
ALTER TABLE `lab` ADD CONSTRAINT `teacher_lab_id` FOREIGN KEY (`teacher_id`) REFERENCES `lab` (`id`)