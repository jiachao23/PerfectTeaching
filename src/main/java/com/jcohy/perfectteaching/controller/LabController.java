package com.jcohy.perfectteaching.controller;

import com.jcohy.perfectteaching.common.JsonResult;
import com.jcohy.perfectteaching.common.PageJson;
import com.jcohy.perfectteaching.model.Lab;
import com.jcohy.perfectteaching.model.Teacher;
import com.jcohy.perfectteaching.service.LabService;
import com.jcohy.perfectteaching.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by jiac on 2018/4/3.
 * ClassName  : com.jcohy.perfectteaching.controller
 * Description  :
 */
@Controller
@RequestMapping("/teacher/lab")
public class LabController extends BaseController{


    @Autowired
    private TeacherService teacherService;

    @Autowired
    private LabService labService;

    @GetMapping("/list")
    @ResponseBody
    public PageJson<Lab> all(ModelMap map){
        PageRequest pageRequest = getPageRequest();
        Page<Lab> labs = labService.findAll(pageRequest);
        PageJson<Lab> page = new PageJson<>();
        page.setCode(0);
        page.setMsg("成功");
        page.setCount(labs.getContent().size());
        page.setData(labs.getContent());
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
        return "teacher/lab/form";
    }

    @PostMapping("/save")
    @ResponseBody
    public JsonResult save(Lab lab){
        try {
            labService.saveOrUpdate(lab);
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
}
