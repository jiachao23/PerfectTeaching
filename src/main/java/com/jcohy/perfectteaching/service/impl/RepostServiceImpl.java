package com.jcohy.perfectteaching.service.impl;

import com.jcohy.perfectteaching.model.Lab;
import com.jcohy.perfectteaching.model.Report;
import com.jcohy.perfectteaching.model.Student;
import com.jcohy.perfectteaching.repository.LabRepository;
import com.jcohy.perfectteaching.repository.ReportRepository;
import com.jcohy.perfectteaching.repository.StudentRepository;
import com.jcohy.perfectteaching.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

/**
 * ClassName  : com.jcohy.perfectteaching.service.impl
 * Description  :
 */
@Service
public class RepostServiceImpl implements ReportService{

    @Autowired
    private ReportRepository reportRepository;

    @Autowired
    private LabRepository labRepository;

    @Autowired
    private StudentRepository studentRepository;

    @Override
    public List<Report> findAll() {
        return reportRepository.findAll();
    }

    @Override
    public Page<Report> findAll(Pageable Pageable) {
        return reportRepository.findAll(Pageable);
    }

    @Override
    public Report findById(Integer id) {
        return reportRepository.findById(id).get();
    }

    @Override
    public Report saveOrUpdate(Report report) {
        Report dbReport = null;
        if(report.getId() != null){
            dbReport = findById(report.getId());
            if(report.getGrade() != null) dbReport.setGrade(report.getGrade());
            if(report.getOption() != null) dbReport.setOption(report.getOption());
            if(report.getRemark() != null) dbReport.setRemark(report.getRemark());
        }else{
            dbReport = report;
        }
        return reportRepository.save(dbReport);
    }


    @Override
    public void delete(Integer id) {
        reportRepository.deleteById(id);
    }


    @Transactional
    @Override
    public Report commit(Integer studentId, Integer labsId, String result) {
        Lab lab = labRepository.findById(labsId).get();
        Student student = studentRepository.findById(studentId).get();
        Report report = new Report();
        report.setStudent(student);
        report.setLab(lab);
        report.setOption(result);
        return reportRepository.saveAndFlush(report);
    }

    @Override
    public Report findByLabAndTeacher(Lab lab, Student student) {
        return reportRepository.findReportByLabAndAndStudent(lab,student);
    }

}
