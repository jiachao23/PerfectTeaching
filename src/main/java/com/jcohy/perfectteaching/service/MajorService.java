package com.jcohy.perfectteaching.service;

import com.jcohy.perfectteaching.model.Dept;
import com.jcohy.perfectteaching.model.Major;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Copyright  : 2017- www.jcohy.com
 * Created by jiac on 22:10 2018/4/6
 * Email: jia_chao23@126.com
 * ClassName: MajorService
 * Description:
 **/
public interface MajorService {

    /**
     * 分页查询
     * @param pageable
     * @return
     */
    Page<Major> findAll(Pageable pageable);

    List<Major> findAll();

    Major findById(Integer id);

    List<Major> findByDept(Dept dept);
}
