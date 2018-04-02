package com.jcohy.perfectteaching.repository;

import com.jcohy.perfectteaching.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by jiac on 2018/4/2.
 * ClassName  : com.jcohy.perfectteaching.repository
 * Description  :
 */
public interface StudentRepository  extends JpaRepository<Student,Long> {
}
