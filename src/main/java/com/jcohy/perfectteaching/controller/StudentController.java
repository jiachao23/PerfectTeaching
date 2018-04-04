package com.jcohy.perfectteaching.controller;

import com.jcohy.lang.StringUtils;
import com.jcohy.perfectteaching.common.JsonResult;
import com.jcohy.perfectteaching.exception.ServiceException;
import com.jcohy.perfectteaching.model.Lab;
import com.jcohy.perfectteaching.model.Report;
import com.jcohy.perfectteaching.model.Student;
import com.jcohy.perfectteaching.model.Teacher;
import com.jcohy.perfectteaching.service.LabService;
import com.jcohy.perfectteaching.service.ReportService;
import com.jcohy.perfectteaching.service.StudentService;
import com.jcohy.perfectteaching.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * Created by jiac on 2018/4/3.
 * ClassName  : com.jcohy.perfectteaching.controller
 * Description  :
 */
@RestController
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private LabService labService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private ReportService reportService;


    @GetMapping
    public void index(){

    }

    /**
     * 用户登陆接口
     * @param num 学号
     * @param password 密码
     * @return
     */
    @GetMapping("/login")
    public JsonResult login(Integer num,String password){
        Student login = null;

        try {
            if(num == null || StringUtils.isEmpty(password)){
                return JsonResult.fail("用户名或者密码不能为空");
            }

            login = studentService.login(num, password);

            if(login == null){
                return JsonResult.fail("登录失败,用户名不存在");
            }
            if(!login.getPassword().equals(password)){
                return JsonResult.fail("登录失败,用户名账号密码不匹配");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return JsonResult.ok("登录成功").set("data",login);
    }

    /**
     * 注册接口
     * @param num 学号 必填
     * @param phone 电话 必填
     * @param password 密码 必填
     * @param name 姓名 必填
     * @return
     */
    @GetMapping("/register")
    public JsonResult register(Integer num, Integer phone, String password, String name){
        if(num == null||phone == null || StringUtils.hashEmpty(name,password)){
            return JsonResult.fail("参数不能为空");
        }
        boolean exist = studentService.checkUser(num);
        if(exist){
            return JsonResult.fail("用户已存在");
        }
        Student student = new Student();
        student.setNum(num);
        student.setPassword(password);
        student.setName(name);
        student.setPhone(phone);
        studentService.saveOrUpdate(student);
        return JsonResult.ok("注册成功").set("data",student);
    }

    /**
     * 更新学生信息
     * @param student
     * @return
     */
    @GetMapping("/update")
    public JsonResult update(Student student){
        try {
            Student stu = studentService.saveOrUpdate(student);
            return JsonResult.ok().set("data",stu);
        } catch (Exception e) {
            e.printStackTrace();
            return JsonResult.fail(e.getMessage());
        }
    }


    /**
     * 获取全部实验
     * @return
     */
    @GetMapping("/labs")
    public JsonResult findAll(){
        List<Lab> all = labService.findAll();
        return JsonResult.ok("获取成功").set("data",all);
    }

    /**
     * 实验详情接口
     * @param id
     * @return
     */
    @GetMapping("/lab/{id}")
    public JsonResult getLab(@PathVariable("id") Integer id){
        Lab lab = null;
        try {
             lab = labService.findById(id);
        }catch (Exception e){
            return JsonResult.fail("此课程不存在");
        }
        return JsonResult.ok("获取成功").set("data",lab);
    }

    /**
     * 获取教师信息
     * @return
     */
    @GetMapping("/teacher/{teacherId}")
    public JsonResult getteachers(@PathVariable("teacherId") Integer teacherId){
        Teacher teacher = null;
        try {
            teacher = teacherService.findById(teacherId);
        }catch (Exception e){
            return JsonResult.fail("此教师不存在");
        }
        return JsonResult.ok("获取成功").set("data",teacher);
    }

    /**
     * 选择课程接口
     * @param studentId
     * @param labId
     * @return
     */
    @GetMapping("/{studentId}/{labId}")
    public JsonResult chooseLab(@PathVariable("studentId") Integer studentId,@PathVariable("labId") Integer labId){
        Student student = studentService.findById(studentId);
        Lab lab = labService.findById(labId);
        if(lab == null){
            return JsonResult.fail("所选实验不存在");
        }
        Set<Lab> labs = student.getLabs();
        labs.add(lab);
        studentService.saveOrUpdate(student);
        return JsonResult.ok().set("data", student);
    }

    /**
     * 获取当前学生选择的实验
     * @param studentId
     * @return
     */
    @GetMapping("/labs/{studentId}")
    public JsonResult chooseByStudent(@PathVariable("studentId") Integer studentId){
        Student student = studentService.findById(studentId);
        return JsonResult.ok().set("data",student.getLabs());
    }

    @PostMapping("/labs/commit")
    public JsonResult commit(Integer studentId,Integer labsId,String result){

        Report report = null;
        try{
            report = reportService.commit(studentId,labsId,result);

        }catch (Exception e){
            return JsonResult.fail("保存失败");
        }
        return JsonResult.ok().set("data",report);
    }
}
