package com.jcohy.perfectteaching.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * ClassName  : com.jcohy.perfectteaching.repository
 * Description  :专业表
 */
@Entity
@Table(name = "major")
public class Major implements Serializable{
    private static final long serialVersionUID = 5L;
    //Id
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    //专业编号
    private Integer num;
    //专业名
    private String name;
    //专业办公室电话
    private String tel;
    //辅导员
    private String assistant;
    //所属院系
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getAssistant() {
        return assistant;
    }

    public void setAssistant(String assistant) {
        this.assistant = assistant;
    }

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }
}
