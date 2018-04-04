package com.jcohy.perfectteaching.model;

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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    //编号
    @Column(name = "t_num")
    private Integer num;
    //密码
    @Column(name = "password")
    private String password;
    //电话
    @Column(name = "phone")
    private Integer phone;
    //名字
    @Column(name = "t_name")
    private String name;
    //性别
    @Column(name = "t_sex")
    private String sex;
    //生日
    @Column(name = "t_birth")
    private String birth;
    //职称
    @Column(name = "t_title")
    private String title;
    //电子邮箱
    @Column(name = "email")
    private String email;
    //状态
    @ManyToOne
    @JoinColumn(name = "dept_id")
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

    public Integer getPhone() {
        return phone;
    }

    public void setPhone(Integer phone) {
        this.phone = phone;
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
