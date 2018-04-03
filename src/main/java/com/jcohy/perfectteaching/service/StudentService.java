package com.jcohy.perfectteaching.service;

import com.jcohy.perfectteaching.exception.ServiceException;
import com.jcohy.perfectteaching.model.Student;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/12/18 09:22.
 * ClassName  : UserService
 * Description  :
 */

public interface StudentService {
    /**
     * 用户登录
     * @param num  管理员编号
     * @param password
     * @return
     * @throws Exception
     */
    Student login(Integer num, String password) throws Exception;


    /**
     * 分页查询
     * @param Pageable
     * @return
     */
    Page<Student> findAll(Pageable Pageable);


    /**
     *  查询
     * @return
     */
    List<Student> findAll();


    /**
     * 根据ID查询
     * @param id
     * @return
     */
    Student findById(Integer id);

    /**
     * 根据name查询
     * @param name
     * @return
     */
    Student findByName(String name);

    /**
     * 新增或者更新用户
     * @param user
     */
    Student saveOrUpdate(Student user) throws ServiceException;

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
     * @param oldpassword
     * @param password1
     * @param password2
     */
    void updatePassword(Student user, String oldpassword, String password1, String password2);
}
