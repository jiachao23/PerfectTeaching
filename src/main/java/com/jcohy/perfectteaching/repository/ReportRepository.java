package com.jcohy.perfectteaching.repository;

import com.jcohy.perfectteaching.model.Lab;
import com.jcohy.perfectteaching.model.Report;
import com.jcohy.perfectteaching.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by jiac on 2018/4/2.
 * ClassName  : com.jcohy.perfectteaching.repository
 * Description  :
 */
public interface ReportRepository  extends JpaRepository<Report,Integer> {
    Report findReportByLabAndAndStudent(Lab lab, Student student);
}
