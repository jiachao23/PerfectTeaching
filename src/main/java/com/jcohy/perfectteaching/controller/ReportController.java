package com.jcohy.perfectteaching.controller;

import com.jcohy.perfectteaching.common.JsonResult;
import com.jcohy.perfectteaching.common.PageJson;
import com.jcohy.perfectteaching.model.Lab;
import com.jcohy.perfectteaching.model.Report;
import com.jcohy.perfectteaching.model.Student;
import com.jcohy.perfectteaching.model.Teacher;
import com.jcohy.perfectteaching.service.LabService;
import com.jcohy.perfectteaching.service.ReportService;
import com.jcohy.perfectteaching.service.TeacherService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * Created by jiac on 2018/4/20.
 * ClassName  : com.jcohy.perfectteaching.controller
 * Description  :
 */
@Controller
@RequestMapping("/report")
public class ReportController extends BaseController{

    private static final Logger logger = LoggerFactory.getLogger(ReportController.class);

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private ReportService reportService;

    @Autowired
    private LabService labService;

    @GetMapping("/list")
    @ResponseBody
    public PageJson<Report> all(@SessionAttribute("user") Teacher teacher, ModelMap map){
        PageRequest pageRequest = getPageRequest();
        List<Lab> labs = labService.findByTeacher(teacher);
        List<Report> reports = new ArrayList<>();
        if(labs !=null){
            for(int i=0;i<labs.size();i++){
                Lab lab = labs.get(i);
                List<Student> students = lab.getStudent();
                if(students != null){
                    for(int j =0;j<students.size();j++){
                        Student student = students.get(j);
                        Report report = reportService.findByLabAndTeacher(lab, student);
                        if(report != null){
                            reports.add(report);
                        }
                    }
                }
            }
        }
//        Page<Lab> labs =
        PageJson<Report> page = new PageJson<>();
        page.setCode(0);
        page.setMsg("成功");
        page.setCount(reports.size());
        page.setData(reports);
        return page;
    }

    @GetMapping("/change/{id}")
    @ResponseBody
    public JsonResult change(@PathVariable("id") Integer id,@PathParam("advise") String advise){
        logger.error("id: {} advice: {}",id,advise);
        try {
            reportService.addAdvise(id,advise);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.fail("修改失败");
        }
        return JsonResult.ok();
    }
    @PostMapping("/autoCheck/{id}")
    @ResponseBody
    public JsonResult autoCheck(@PathVariable("id") Integer id){
        try {
            Report report = reportService.findById(id);
            if(report != null){
                reportService.autoCheck(report);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.fail(e.getMessage());
        }
        return JsonResult.ok();
    }

    @DeleteMapping("/{id}/del")
    @ResponseBody
    public JsonResult del(@PathVariable("id") Integer id){
        try {
            reportService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.fail("删除失败");
        }
        return JsonResult.ok();
    }
}
