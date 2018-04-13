package com.jcohy.perfectteaching.service.impl;

import com.jcohy.perfectteaching.model.Dept;
import com.jcohy.perfectteaching.model.Major;
import com.jcohy.perfectteaching.repository.MajorRepository;
import com.jcohy.perfectteaching.service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 22:11 2018/4/6
 * Email: jia_chao23@126.com
 * ClassName: MajorServiceImpl
 * Description:
 **/
@Service
public class MajorServiceImpl implements MajorService {

    @Autowired
    private MajorRepository majorRepository;


    @Override
    public Page<Major> findAll(Pageable pageable) {
        return majorRepository.findAll(pageable);
    }

    @Override
    public List<Major> findAll() {
        return majorRepository.findAll();
    }

    @Override
    public Major findById(Integer id) {
        return majorRepository.findById(id).get();
    }

    @Override
    public List<Major> findByDept(Dept dept) {
        return majorRepository.findAllByDept(dept);
    }
}
