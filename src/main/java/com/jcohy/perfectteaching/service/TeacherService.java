package com.jcohy.perfectteaching.service;

import com.jcohy.perfectteaching.exception.ServiceException;
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

public interface TeacherService {
    /**
     * 用户登录
     * @param num  管理员编号
     * @param password
     * @return
     * @throws Exception
     */
    Teacher login(Integer num, String password) throws Exception;


    /**
     * 分页查询
     * @param Pageable
     * @return
     */
    Page<Teacher> findAll(Pageable Pageable);


    /**
     *  查询
     * @return
     */
    List<Teacher> findAll();

    /**
     *  查询
     * @return
     */
    Teacher findByNum(Integer num);

    /**
     * 根据ID查询
     * @param id
     * @return
     */
    Teacher findById(Integer id);

    /**
     * 根据name查询
     * @param name
     * @return
     */
    Teacher findByName(String name);

    /**
     * 新增或者更新用户
     * @param user
     */
    void saveOrUpdate(Teacher user) throws ServiceException;

    /**
     * 检查用户是否存在
     * @param num
     * @return
     */
    boolean checkUser(Integer num);

    /**
     * 删除用户
     * @param id
     */
    void delete(Integer id);

    /**
     * 修改用户密码
     * @param user
     */
    void updatePassword(Teacher user);
}
