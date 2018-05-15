package com.jcohy.perfectteaching.controller;

import com.jcohy.perfectteaching.common.JsonResult;
import com.jcohy.perfectteaching.common.PageJson;
import com.jcohy.perfectteaching.model.Book;
import com.jcohy.perfectteaching.model.Lab;
import com.jcohy.perfectteaching.model.Teacher;
import com.jcohy.perfectteaching.service.BookService;
import com.jcohy.perfectteaching.service.LabService;
import com.jcohy.perfectteaching.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by jiac on 2018/4/3.
 * ClassName  : com.jcohy.perfectteaching.controller
 * Description  :
 */
@Controller
@RequestMapping("/teacher/course")
public class CourseController extends BaseController{


    @Autowired
    private TeacherService teacherService;

    @Autowired
    private LabService labService;

    @Autowired
    private BookService bookService;


    @GetMapping("/list")
    @ResponseBody
    public PageJson<Lab> all(@SessionAttribute("user")Teacher teacher, ModelMap map){
        List<Lab> labs = excute(teacher,"course");
        List<Lab> count = filterSysVersion(teacher,"lab");
        PageJson<Lab> page = new PageJson<>();
        page.setCode(0);
        page.setMsg("成功");
        page.setCount(count.size());
        page.setData(labs);
        return page;
    }

    @GetMapping("/form")
    public String form(@RequestParam(required = false) Integer id, ModelMap map){
        List<Teacher> teachers = teacherService.findAll();
        map.put("teacher",teachers);
        if(id != null){
            Lab lab = labService.findById(id);
            map.put("lab",lab);
        }
        return "teacher/course/form";
    }

    @PostMapping("/save")
    @ResponseBody
    public JsonResult save(Lab lab,String book){
        try {
            Book temp = null;
            if(book != null){
                temp = bookService.findById(Integer.parseInt(book));
            }
            lab.setType("course");
            lab.setStatus(0);

            Lab lab1 = labService.saveOrUpdate(lab);
            temp.setLab(lab1);
            bookService.saveOrUpdate(temp);
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
            labService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.fail("删除失败");
        }
        return JsonResult.ok();
    }

    private List<Lab> excute(Teacher teacher,String type){
        PageRequest request = getPageRequest();
        int number = request.getPageNumber();
        int size = request.getPageSize();
        List<Lab> versions = filterSysVersion(teacher,type);
        List<Lab> apps1 = null;
        if(versions.size() >((number+1)*size)){
            apps1= versions.subList(number*size, number*size+size-1);
        }else{
            apps1= versions.subList(number*size, versions.size());
        }
        return apps1;
    }

    private List<Lab> filterSysVersion(Teacher teacher,String type){
        List<Lab> allVersions = labService.findByTeacher(teacher);
        return allVersions.stream().filter(x -> x.getType().equals(type)).collect(Collectors.toList());
    }
}
