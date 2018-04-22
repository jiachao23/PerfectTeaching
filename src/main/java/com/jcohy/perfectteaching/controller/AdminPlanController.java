package com.jcohy.perfectteaching.controller;

import com.jcohy.perfectteaching.common.JsonResult;
import com.jcohy.perfectteaching.common.PageJson;
import com.jcohy.perfectteaching.model.*;
import com.jcohy.perfectteaching.service.DeptService;
import com.jcohy.perfectteaching.service.LabService;
import com.jcohy.perfectteaching.service.MajorService;
import com.jcohy.perfectteaching.service.PlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by jiac on 2018/4/20.
 * ClassName  : com.jcohy.perfectteaching.controller
 * Description  :
 */
@Controller
@RequestMapping("/admin/plan")
public class AdminPlanController extends BaseController{

    @Autowired
    private PlanService planService;

    @Autowired
    private DeptService deptService;

    @Autowired
    private MajorService majorService;

    @Autowired
    private LabService labService;

    @GetMapping("/list")
    @ResponseBody
    public PageJson<Plan> all(@SessionAttribute("user")Teacher teacher, ModelMap map){
        PageRequest pageRequest = getPageRequest();
        Page<Plan> plans = planService.findAll(pageRequest);
        PageJson<Plan> page = new PageJson<>();
        page.setCode(0);
        page.setMsg("成功");
        page.setCount(plans.getSize());
        page.setData(plans.getContent());
        return page;
    }

    @GetMapping("/form")
    public String form(@RequestParam(required = false) Integer id, ModelMap map){
        List<Dept> depts = deptService.findAll();
        List<Major> majors = majorService.findAll();
        map.put("depts",depts);
        map.put("majors",majors);
        if(id != null){
            Plan plan = planService.findById(id);
            map.put("plan",plan);
        }
        return "admin/plan/form";
    }

    @PostMapping("/save")
    @ResponseBody
    public JsonResult save(Plan plan,Integer num){
        try {
            Lab lab = labService.findByNum(num);
            plan.setLab(lab);
            planService.saveOrUpdate(plan);
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
            planService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.fail("删除失败");
        }
        return JsonResult.ok();
    }

}
