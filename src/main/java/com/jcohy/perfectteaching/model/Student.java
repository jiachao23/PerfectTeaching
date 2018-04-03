package com.jcohy.perfectteaching.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * ClassName  : com.jcohy.perfectteaching.repository
 * Description  :学生表
 */
@Entity()
@Table(name = "student")
public class Student  implements Serializable {

    private static final long serialVersionUID = 1L;
    //Id
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    //学号
    private Integer num;
    //密码
    private String password;
    //电话
    private Integer phone;
    //名字
    private String name;
    //性别
    private String sex;
    //生日
    private String birth;
    //班级
    private String cclass;
    //电子邮箱
    private String email;
    //状态
    private String status;
    //专业
    private Major major;

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

    public String getCclass() {
        return cclass;
    }

    public void setCclass(String cclass) {
        this.cclass = cclass;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Major getMajor() {
        return major;
    }

    public void setMajor(Major major) {
        this.major = major;
    }
}