package com.jcohy.perfectteaching.controller;

import com.jcohy.perfectteaching.common.JsonResult;
import com.jcohy.perfectteaching.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Copyright  : 2015-2033 Beijing Startimes Communication & Network Technology Co.Ltd
 * Created by jiac on 2017/12/18 09:22.
 * ClassName  : LoginController
 * Description  :
 */
@Controller
public class LoginController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String login(){
        return "admin/index";
    }

    /**
     * 登录处理
     * @param request
     * @param response
     * @param name
     * @param password
     * @param type
     * @return
     */
    @PostMapping("/login")
    @ResponseBody
    public JsonResult login(HttpServletRequest request, HttpServletResponse response,
                            String name, String password,
                            @RequestParam(required = false) String type){
        try {
            logger.error("name:{}  password:{}  type:{}",name,password,type);

            return JsonResult.ok().set("returnUrl", "/admin/index");
        } catch (Exception e) {
            return JsonResult.fail(e.getMessage());
        }
    }


    /**
     * 注销用户
     * @param request
     * @param response
     * @return
     */
    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response){

        return "redirect:/admin";
    }
}
