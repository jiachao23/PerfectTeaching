package com.jcohy.perfectteaching.controller;

import com.jcohy.perfectteaching.common.JsonResult;
import com.jcohy.perfectteaching.common.PageJson;
import com.jcohy.perfectteaching.model.Lab;
import com.jcohy.perfectteaching.model.Teacher;
import com.jcohy.perfectteaching.service.LabService;
import com.jcohy.perfectteaching.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by jiac on 2018/4/20.
 * ClassName  : com.jcohy.perfectteaching.controller
 * Description  :
 */

@Controller
@RequestMapping("/admin")
public class AdminLabController extends BaseController{


    @Autowired
    private TeacherService teacherService;

    @Autowired
    private LabService labService;

    @GetMapping("/{type}/list")
    @ResponseBody
    public PageJson<Lab> all(@SessionAttribute("user")Teacher teacher, ModelMap map){
        List<Lab> labs = excute();
        PageJson<Lab> page = new PageJson<>();
        page.setCode(0);
        page.setMsg("成功");
        page.setCount(labs.size());
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
        return "admin/lab/form";
    }

    @PostMapping("/save")
    @ResponseBody
    public JsonResult save(Lab lab){
        try {
            lab.setStatus(0);
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

    @GetMapping("/change")
    public JsonResult change(@PathParam("id")Integer id, ModelMap map){
        try {
            labService.change(id,"status");
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.fail("修改失败");
        }
        return JsonResult.ok();
    }

    private List<Lab> excute(){
        PageRequest request = getPageRequest();
        int number = request.getPageNumber();
        int size = request.getPageSize();
        List<Lab> versions = filterSysVersion();
        if(versions.size() >((number+1)*size)){
            List<Lab> apps1 = versions.subList(0, size);
            versions.clear();
            versions.addAll(apps1);
        }
        return versions;
    }

    private List<Lab> filterSysVersion(){
        List<Lab> allVersions = labService.findAll();
        return allVersions;
    }
}
