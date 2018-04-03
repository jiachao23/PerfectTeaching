package com.jcohy.perfectteaching.controller;

import com.jcohy.perfectteaching.common.JsonResult;
import com.jcohy.perfectteaching.model.Lab;
import com.jcohy.perfectteaching.model.Student;
import com.jcohy.perfectteaching.model.Stulab;
import com.jcohy.perfectteaching.model.Teacher;
import com.jcohy.perfectteaching.repository.StuLabRepository;
import com.jcohy.perfectteaching.service.LabService;
import com.jcohy.perfectteaching.service.StudentService;
import com.jcohy.perfectteaching.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

/**
 * Created by jiac on 2018/4/3.
 * ClassName  : com.jcohy.perfectteaching.controller
 * Description  :
 */
@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private LabService labService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private StuLabRepository stuLabRepository;

    @GetMapping
    public void index(){

    }

    @GetMapping("/login")
    public JsonResult login(Integer num,String password){
        Student login = null;
        try {
            login = studentService.login(num, password);
            if(login == null){
                return JsonResult.fail("登录失败,用户名或密码不正确");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return JsonResult.ok("登录成功").set("data",login);
    }

    @GetMapping("/register")
    public JsonResult register(Integer num,Integer phone,String password,String email){
        boolean exist = studentService.checkUser(num);
        if(exist){
            return JsonResult.fail("用户已存在");
        }
        Student student = new Student();
        student.setNum(num);
        student.setPassword(password);
        student.setEmail(email);
        student.setPhone(phone);
        studentService.saveOrUpdate(student);
        return JsonResult.ok("注册成功").set("data",student);
    }

    @GetMapping("/update")
    public JsonResult update(Student student){
        try {
            studentService.saveOrUpdate(student);
            Student stu = studentService.findById(student.getId());
            return JsonResult.ok().set("data",stu);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.fail(e.getMessage());
        }
    }


    @GetMapping("/labs")
    public JsonResult findAll(){
        List<Lab> all = labService.findAll();
        return JsonResult.ok().set("data",all);
    }

    @GetMapping("/lab/{id}")
    public JsonResult getLab(@PathVariable("id") Integer id){
        Lab lab = labService.findById(id);
        return JsonResult.ok().set("data",lab);
    }

    @GetMapping("/teacher")
    public JsonResult getteachers(){
        List<Teacher> teachers = teacherService.findAll();
        return JsonResult.ok().set("data",teachers);
    }

    @GetMapping("/{studentId}/{labId}")
    public JsonResult chooseLab(@PathVariable("studentId") Integer studentId,@PathVariable("labId") Integer labId){
        Student student = studentService.findById(studentId);
        Lab lab = labService.findById(labId);
        Stulab stulab = new Stulab(student,lab);
        stulab = stuLabRepository.save(stulab);
        return JsonResult.ok().set("data",stulab);
    }

    @GetMapping("/labs/{studentId}")
    public JsonResult chooseByStudent(@PathVariable("studentId") Integer studentId){
        List<Stulab> all = stuLabRepository.findAll();
        List<Stulab> list = all.stream().filter(labs -> labs.getStudent().getId() == studentId).collect(Collectors.toList());
        return JsonResult.ok().set("data",list);
    }

    

}
