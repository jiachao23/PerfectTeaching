package com.jcohy.perfectteaching.service.impl;

import com.jcohy.perfectteaching.model.Lab;
import com.jcohy.perfectteaching.model.Test;
import com.jcohy.perfectteaching.repository.TestRepository;
import com.jcohy.perfectteaching.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 14:40 2018/4/22
 * Email: jia_chao23@126.com
 * ClassName: TestServiceImpl
 * Description:
 **/
@Service
public class TestServiceImpl implements TestService {

    @Autowired
    private TestRepository testRepository;
    @Override
    public List<Test> findByLab(Lab lab) {
        return testRepository.findByLab(lab);
    }
}
