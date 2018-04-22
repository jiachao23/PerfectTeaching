package com.jcohy.perfectteaching.controller;

import com.jcohy.perfectteaching.common.PageJson;
import com.jcohy.perfectteaching.model.Lab;
import com.jcohy.perfectteaching.service.LabService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by jiac on 2018/4/2.
 * ClassName  : com.jcohy.perfectteaching.controller
 * Description  :
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private LabService labService;

    @GetMapping("/list")
    @ResponseBody
    public PageJson<Lab> all(ModelMap map){
        List<Lab> labs = labService.findAll();
        PageJson<Lab> page = new PageJson<>();
        page.setCode(0);
        page.setMsg("成功");
        page.setCount(labs.size());
        page.setData(labs);
        return page;
    }
}
