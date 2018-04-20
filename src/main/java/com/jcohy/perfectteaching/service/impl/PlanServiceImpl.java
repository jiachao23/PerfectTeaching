package com.jcohy.perfectteaching.service.impl;

import com.jcohy.perfectteaching.model.Plan;
import com.jcohy.perfectteaching.repository.PlanRepository;
import com.jcohy.perfectteaching.service.PlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jiac on 2018/4/20.
 * ClassName  : com.jcohy.perfectteaching.service.impl
 * Description  :
 */
@Service
public class PlanServiceImpl implements PlanService {

    @Autowired
    private PlanRepository planRepository;
    @Override
    public Plan saveOrUpdate(Plan plan) {
        return planRepository.save(plan);
    }

    @Override
    public void delete(Integer id) {
        planRepository.deleteById(id);
    }

    @Override
    public Plan findById(Integer id) {
        return planRepository.findById(id).get();
    }

    @Override
    public List<Plan> findAll() {
        return planRepository.findAll();
    }

    @Override
    public Page<Plan> findAll(Pageable pageable) {
        return planRepository.findAll(pageable);
    }
}
