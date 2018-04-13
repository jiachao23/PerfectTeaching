package com.jcohy.perfectteaching.repository;

import com.jcohy.perfectteaching.model.Course;
import com.jcohy.perfectteaching.model.Lab;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by jiac on 2018/4/2.
 * ClassName  : com.jcohy.perfectteaching.repository
 * Description  :
 */
public interface CourseRepository extends JpaRepository<Course,Integer> {

    Course findLabByNum(Integer num);

}
