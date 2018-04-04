package com.jcohy.perfectteaching.service;

import com.jcohy.perfectteaching.model.Report;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * ClassName  : com.jcohy.perfectteaching.service
 * Description  :
 */
public interface ReportService {

    /**
     * 查询所有报告
     * @return
     */
    List<Report> findAll();

    /**
     * 分页查询
     * @param Pageable
     * @return
     */
    Page<Report> findAll(Pageable Pageable);

    /**
     * 通过Id查找
     * @param id
     * @return
     */
    Report findById(Integer id);


    /**
     * 增加，修改
     * @param report
     */
    Report saveOrUpdate(Report report);

    /**
     *
     * 根据id删除
     * @param id
     */
    void delete(Integer id);

    /**
     * 提交，并保存答案
     * @param studentId
     * @param labsId
     * @param result
     * @return
     */
    Report commit(Integer studentId, Integer labsId, String result);
}
