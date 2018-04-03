package com.jcohy.perfectteaching.service.impl;

import com.jcohy.lang.StringUtils;
import com.jcohy.perfectteaching.exception.ServiceException;
import com.jcohy.perfectteaching.model.Admin;
import com.jcohy.perfectteaching.repository.AdminRepository;
import com.jcohy.perfectteaching.service.AdminService;
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
public class AdminServiceImpl implements AdminService{


    @Autowired
    private AdminRepository adminRepository;

    @Override
    public Admin login(Integer num, String password) throws Exception {
        return adminRepository.findAdminByNum(num);
    }

    @Override
    public Page<Admin> findAll(Pageable pageable) {
        return adminRepository.findAll(pageable);
    }

    @Override
    public List<Admin> findAll() {
        return adminRepository.findAll();
    }


    @Override
    public Admin findById(Integer id) {
        return adminRepository.findById(id).get();
    }

    @Override
    public Admin findByName(String name) {
        return adminRepository.findAdminByName(name);
    }

    @Override
    public void saveOrUpdate(Admin user) throws ServiceException {
        adminRepository.save(user);
    }

    @Override
    public boolean checkUser(Integer num) {
        Admin dbUser = adminRepository.findAdminByNum(num);
        return dbUser != null;
    }


    @Override
    public void delete(Integer id) {
        if(id == null){
            throw new ServiceException("主键不能为空");
        }
        adminRepository.deleteById(id);
    }

    @Override
    public void updatePassword(Admin user, String oldpassword, String password1, String password2) {
        if(StringUtils.isBlank(oldpassword) || StringUtils.isBlank(password1) || StringUtils.isBlank(password2)){
            throw new ServiceException("参数不完整");
        }

        if(!password1.equals(password2)){
            throw new ServiceException("两次输入密码不一致");
        }
        Admin dbUser = findById(user.getId());
        if(!user.getPassword().equals(oldpassword)){
            throw new ServiceException("旧密码不正确");
        }
        dbUser.setPassword(password1);
        adminRepository.saveAndFlush(dbUser);
    }
}
