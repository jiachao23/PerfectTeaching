package com.jcohy.perfectteaching.service;

import com.jcohy.perfectteaching.model.Plan;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * Created by jiac on 2018/4/20.
 * ClassName  : com.jcohy.perfectteaching.service
 * Description  :
 */
public interface PlanService {

    Plan saveOrUpdate(Plan plan);

    /**
     *
     * 根据id删除
     * @param id
     */
    void delete(Integer id);

    /**
     * 通过Id查找
     * @param id
     * @return
     */
    Plan findById(Integer id);

    /**
     * 查询所有实验
     * @return
     */
    List<Plan> findAll();

    /**
     * 分页查询
     * @param pageable
     * @return
     */
    Page<Plan> findAll(Pageable pageable);
}
