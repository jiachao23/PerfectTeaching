package com.jcohy.perfectteaching.service.impl;

import com.jcohy.lang.StringUtils;
import com.jcohy.perfectteaching.exception.ServiceException;
import com.jcohy.perfectteaching.model.Teacher;
import com.jcohy.perfectteaching.repository.TeacherRepository;
import com.jcohy.perfectteaching.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jiac on 2018/4/2.
 * ClassName  : com.jcohy.perfectteaching.service.impl
 * Description  :
 */
@Service
public class TeacherServiceImpl implements TeacherService{

    @Autowired
    private TeacherRepository teacherRepository;


    @Override
    public Teacher login(Integer num, String password) throws Exception {
        return teacherRepository.findAdminByNum(num);
    }

    @Override
    public Page<Teacher> findAll(Pageable pageable) {
        return teacherRepository.findAll(pageable);
    }

    @Override
    public List<Teacher> findAll() {
        return teacherRepository.findAll();
    }


    @Override
    public Teacher findById(Integer id) {
        return teacherRepository.findById(id).get();
    }

    @Override
    public Teacher findByName(String name) {
        return teacherRepository.findAdminByName(name);
    }

    @Override
    public void saveOrUpdate(Teacher user) throws ServiceException {
        teacherRepository.save(user);
    }

    @Override
    public boolean checkUser(Integer num) {
        Teacher dbUser = teacherRepository.findAdminByNum(num);
        return dbUser != null;
    }


    @Override
    public void delete(Integer id) {
        if(id == null){
            throw new ServiceException("主键不能为空");
        }
        teacherRepository.deleteById(id);
    }

    @Override
    public void updatePassword(Teacher user, String oldpassword, String password1, String password2) {
        if(StringUtils.isBlank(oldpassword) || StringUtils.isBlank(password1) || StringUtils.isBlank(password2)){
            throw new ServiceException("参数不完整");
        }

        if(!password1.equals(password2)){
            throw new ServiceException("两次输入密码不一致");
        }
        Teacher dbUser = findById(user.getId());
        if(!user.getPassword().equals(oldpassword)){
            throw new ServiceException("旧密码不正确");
        }
        dbUser.setPassword(password1);
        teacherRepository.saveAndFlush(dbUser);
    }
}
