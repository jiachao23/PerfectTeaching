package com.jcohy.perfectteaching.controller;

import com.jcohy.perfectteaching.common.JsonResult;
import com.jcohy.perfectteaching.service.AdminService;
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
import java.util.ArrayList;

/**
 * ClassName  : LoginController
 * Description  :登录模块处理
 */
@Controller
public class LoginController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
    @Autowired
    private AdminService adminService;

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
     * @param role
     * @return
     */
    @PostMapping("/login")
    @ResponseBody
    public JsonResult login(HttpServletRequest request, HttpServletResponse response,
                            String name, String password,
                            @RequestParam(required = false) String role){
        try {
            logger.error("name:{}  password:{}  type:{}",name,password,role);
            request.getSession().setAttribute("role",role);
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
