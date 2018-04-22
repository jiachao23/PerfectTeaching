package com.jcohy.perfectteaching.service.impl;

import com.jcohy.perfectteaching.model.Lab;
import com.jcohy.perfectteaching.model.Report;
import com.jcohy.perfectteaching.model.Student;
import com.jcohy.perfectteaching.model.Test;
import com.jcohy.perfectteaching.repository.LabRepository;
import com.jcohy.perfectteaching.repository.ReportRepository;
import com.jcohy.perfectteaching.repository.StudentRepository;
import com.jcohy.perfectteaching.service.ReportService;
import com.jcohy.perfectteaching.service.TestService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Arrays;
import java.util.List;

/**
 * ClassName  : com.jcohy.perfectteaching.service.impl
 * Description  :
 */
@Service
public class RepostServiceImpl implements ReportService{

    private static final Logger logger = LoggerFactory.getLogger(RepostServiceImpl.class);

    @Autowired
    private ReportRepository reportRepository;

    @Autowired
    private LabRepository labRepository;

    @Autowired
    private StudentRepository studentRepository;

    @Autowired
    private TestService testService;
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

    @Override
    public  Report autoCheck(Report report) {
        String option = report.getOption();
        String[] split = option.split(",");
        logger.warn("split :{}",split);
        List<Test> tests = testService.findByLab(report.getLab());
        int right = 0;
        String[] studentResult = null;
        if(split.length>tests.size()){
            studentResult = Arrays.copyOf(split, tests.size());
            logger.warn("studentResult :{}",studentResult);
        }else{
            studentResult = split;
        }
        for(int i=0;i<studentResult.length;i++){
            Integer index = tests.get(i).getIndex();

            String answer = tests.get(i).getAnswer();
            logger.warn("index :option :{}  answer :{}",studentResult[i],answer);
            if(studentResult[i].equals(answer)){
                right+=1;
            }
        }
        logger.warn("right:"+right);
        report.setGrade(right*10);
        return reportRepository.save(report);
    }

    @Override
    public Report addAdvise(Integer id, String advise) {
        Report report = reportRepository.findById(id).get();
        report.setRemark(advise);
        return reportRepository.save(report);
    }

}
