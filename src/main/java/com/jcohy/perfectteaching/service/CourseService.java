package com.jcohy.perfectteaching.service;

import com.jcohy.perfectteaching.model.Course;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/12/18 09:22.
 * ClassName  : UserService
 * Description  :
 */

public interface CourseService {
    /**
     * 查询所有实验
     * @return
     */
    List<Course> findAll();

    /**
     * 分页查询
     * @param Pageable
     * @return
     */
    Page<Course> findAll(Pageable Pageable);

    /**
     * 通过Id查找
     * @param id
     * @return
     */
    Course findById(Integer id);


    /**
     * 增加，修改
     * @param course
     */
    Course saveOrUpdate(Course course);

    /**
     * 通过编号查找
     * @param num
     * @return
     */
    Course findByNum(Integer num);

    /**
     *
     * 根据id删除
     * @param id
     */
    void delete(Integer id);

    /**
     *
     * 修改状态
     * @param id
     */
    Course change(Integer id, String type);

}
