package com.jcohy.perfectteaching.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * ClassName  : com.jcohy.perfectteaching.repository
 * Description  :管理员表
 */
@Entity
@Table(name = "admin")
public class Admin implements Serializable{

    private static final long serialVersionUID = 3L;
    //Id
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    //编号，使用此信息登录
    @Column(name = "admin_num")
    private Integer num;
    //名字
    @Column(name = "admin_name")
    private String name;
    //密码
    @Column(name = "password")
    private String password;
    //电话
    @Column(name = "phone")
    private Integer phone;
    //邮箱
    @Column(name = "email")
    private String email;
    //性别
    @Column(name = "admin_sex")
    private String sex;
    //出生日期
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @Column(name = "admin_birth")
    private Date birth;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }
}
