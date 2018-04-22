package com.jcohy.perfectteaching.service;

import com.jcohy.perfectteaching.model.Lab;
import com.jcohy.perfectteaching.model.Test;

import java.util.List;

/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 14:39 2018/4/22
 * Email: jia_chao23@126.com
 * ClassName: TestService
 * Description:
 **/
public interface TestService {

    List<Test> findByLab(Lab lab);
}
