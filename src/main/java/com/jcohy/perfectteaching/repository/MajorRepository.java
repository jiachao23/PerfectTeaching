package com.jcohy.perfectteaching.repository;

import com.jcohy.perfectteaching.model.Dept;
import com.jcohy.perfectteaching.model.Major;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by jiac on 2018/4/2.
 * ClassName  : com.jcohy.perfectteaching.repository
 * Description  :
 */
public interface MajorRepository  extends JpaRepository<Major,Integer> {

    List<Major> findAllByDept(Dept dept);
}
