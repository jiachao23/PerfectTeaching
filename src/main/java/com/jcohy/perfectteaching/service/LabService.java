package com.jcohy.perfectteaching.service;

import com.jcohy.perfectteaching.model.Lab;
import com.jcohy.perfectteaching.model.Teacher;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/12/18 09:22.
 * ClassName  : UserService
 * Description  :
 */

public interface LabService {
    /**
     * 查询所有实验
     * @return
     */
    List<Lab> findAll();

    /**
     * 分页查询
     * @param Pageable
     * @return
     */
    Page<Lab> findAll(Pageable Pageable);

    /**
     * 通过Id查找
     * @param id
     * @return
     */
    Lab findById(Integer id);


    /**
     * 增加，修改
     * @param link
     */
    Lab saveOrUpdate(Lab link);

    /**
     * 通过编号查找
     * @param num
     * @return
     */
    Lab findByNum(Integer num);

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
    Lab change(Integer id,String type);

    List<Lab> findByType(String Type);

    List<Lab> findByTeacher(Teacher teacher);
}
