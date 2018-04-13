package com.jcohy.perfectteaching.controller;

import com.jcohy.perfectteaching.common.JsonResult;
import com.jcohy.perfectteaching.common.PageJson;
import com.jcohy.perfectteaching.model.Course;
import com.jcohy.perfectteaching.model.Teacher;
import com.jcohy.perfectteaching.service.CourseService;
import com.jcohy.perfectteaching.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by jiac on 2018/4/13.
 * ClassName  : com.jcohy.perfectteaching.controller
 * Description  :
 */
@Controller
@RequestMapping("/teacher/course")
public class CourseController extends BaseController{

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private CourseService courseService;

    @GetMapping("/list")
    @ResponseBody
    public PageJson<Course> all(ModelMap map){
        PageRequest pageRequest = getPageRequest();
        Page<Course> teachers = courseService.findAll(pageRequest);
        PageJson<Course> page = new PageJson<>();
        page.setCode(0);
        page.setMsg("成功");
        page.setCount(teachers.getContent().size());
        page.setData(teachers.getContent());
        return page;
    }

    @GetMapping("/form")
    public String form(@RequestParam(required = false) Integer id, ModelMap map){
        List<Teacher> teachers = teacherService.findAll();
        map.put("teacher",teachers);
        if(id != null){
            Course teacher = courseService.findById(id);
            map.put("teacher",teacher);
        }
        return "teacher/course/form";
    }

    @PostMapping("/save")
    @ResponseBody
    public JsonResult save(Course course){
        try {
            courseService.saveOrUpdate(course);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.fail(e.getMessage());
        }
        return JsonResult.ok();
    }

    @DeleteMapping("{id}/del")
    @ResponseBody
    public JsonResult del(@PathVariable("id") Integer id){
        try {
            courseService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.fail("删除失败");
        }
        return JsonResult.ok();
    }
}
