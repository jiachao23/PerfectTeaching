package com.jcohy.perfectteaching.repository;

import javax.persistence.*;
import java.io.Serializable;

/**
 * ClassName  : com.jcohy.perfectteaching.repository
 * Description  :教师表
 */
@Entity
@Table(name = "teacher")
public class Teacher implements Serializable{

    private static final long serialVersionUID = 2L;
    //Id
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    //编号
    private Integer num;
    //密码
    private String password;
    //名字
    private String name;
    //性别
    private String sex;
    //生日
    private String birth;
    //职称
    private String title;
    //电子邮箱
    private String email;
    //状态
    private Dept dept;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }
}
