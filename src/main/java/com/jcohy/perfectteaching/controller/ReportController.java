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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.List;
import java.util.Set;

/**
 * Created by jiac on 2018/4/20.
 * ClassName  : com.jcohy.perfectteaching.controller
 * Description  :
 */
@Controller("/report")
public class ReportController extends BaseController{

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
        List<Report> reports = null;
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

//    @GetMapping("/form")
//    public String form(@RequestParam(required = false) Integer id, ModelMap map){
//        List<Book> books = bookService.findAll();
//        map.put("books",books);
//        if(id != null){
//            Book book = bookService.findById(id);
//            map.put("book",book);
//        }
//        return "teacher/resource/form";
//    }
//
//    @PostMapping("/save")
//    @ResponseBody
//    public JsonResult save(Book book,Integer num){
//        try {
//            Book dbbook = null;
//            Lab lab = labService.findByNum(num);
//            if(lab == null){
//                return JsonResult.fail("此课程/实验不存在");
//            }
//            if(book.getId() != null){
//                dbbook = bookService.findById(book.getId());
//                if(book.getDownloadUrl() != null ) dbbook.setDownloadUrl(book.getDownloadUrl());
//                if(book.getStatus() != null ) dbbook.setStatus(book.getStatus() );
//                if(book.getName()  != null ) dbbook.setName(book.getName() );
//                dbbook.setLab(lab);
//            }else{
//                dbbook = book;
//                dbbook.setLab(lab);
//            }
//            bookService.saveOrUpdate(dbbook);
//        } catch (Exception e) {
//            e.printStackTrace();
//            return JsonResult.fail(e.getMessage());
//        }
//        return JsonResult.ok();
//    }
//
//    @DeleteMapping("/{id}/del")
//    @ResponseBody
//    public JsonResult del(@PathVariable("id") Integer id){
//        try {
//            bookService.delete(id);
//        } catch (Exception e) {
//            e.printStackTrace();
//            return JsonResult.fail("删除失败");
//        }
//        return JsonResult.ok();
//    }
}
