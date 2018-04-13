package com.jcohy.perfectteaching.service.impl;

import com.jcohy.perfectteaching.model.Dept;
import com.jcohy.perfectteaching.repository.DeptRepository;
import com.jcohy.perfectteaching.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 22:08 2018/4/6
 * Email: jia_chao23@126.com
 * ClassName: DeptServiceImpl
 * Description:
 **/
@Service
public class DeptServiceImpl implements DeptService {

    @Autowired
    private DeptRepository deptRepository;


    @Override
    public Page<Dept> findAll(Pageable pageable) {
        return deptRepository.findAll(pageable);
    }

    @Override
    public List<Dept> findAll() {
        return deptRepository.findAll();
    }

    @Override
    public Dept findById(Integer id) {
        return deptRepository.findById(id).get();
    }
}
