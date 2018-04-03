package com.jcohy.perfectteaching.repository;

import com.jcohy.perfectteaching.model.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by jiac on 2018/4/2.
 * ClassName  : com.jcohy.perfectteaching.repository
 * Description  :
 */
public interface TeacherRepository  extends JpaRepository<Teacher,Integer> {

    Teacher findAdminByNum(Integer num);

    Teacher findAdminByName(String name);
}
