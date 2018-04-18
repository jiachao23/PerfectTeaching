package com.jcohy.perfectteaching.service.impl;

import com.jcohy.perfectteaching.model.Lab;
import com.jcohy.perfectteaching.repository.LabRepository;
import com.jcohy.perfectteaching.repository.ReportRepository;
import com.jcohy.perfectteaching.service.LabService;
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
public class LabServiceImpl implements LabService{

    @Autowired
    private LabRepository labRepository;

    @Autowired
    private ReportRepository reportRepository;

    @Override
    public List<Lab> findAll() {
        return labRepository.findAll();
    }

    @Override
    public Page<Lab> findAll(Pageable Pageable) {
        return labRepository.findAll(Pageable);
    }

    @Override
    public Lab findById(Integer id) {
        return labRepository.findById(id).get();
    }

    @Override
    public Lab saveOrUpdate(Lab num) {
        return labRepository.save(num);
    }

    @Override
    public Lab findByNum(Integer num) {
        return labRepository.findLabByNum(num);
    }

    @Override
    public void delete(Integer id) {
        labRepository.deleteById(id);
    }

    @Override
    public Lab change(Integer id, String type) {
        Lab lab =findById(id);
        switch (type){
            case "status":
                lab.setStatus(lab.getStatus() == 0 ? 1:0);
                break;
            default:
                break;
        }
        return labRepository.save(lab);
    }

    @Override
    public List<Lab> findByType(String Type) {
        return labRepository.findByType(Type);
    }
}
