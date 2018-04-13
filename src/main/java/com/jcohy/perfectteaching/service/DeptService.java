package com.jcohy.perfectteaching.service;

import com.jcohy.perfectteaching.model.Dept;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 22:08 2018/4/6
 * Email: jia_chao23@126.com
 * ClassName: DeptService
 * Description:
 **/
public interface DeptService {

    /**
     * 分页查询
     * @param pageable
     * @return
     */
    Page<Dept> findAll(Pageable pageable);

    List<Dept> findAll();

    Dept findById(Integer id);
}
