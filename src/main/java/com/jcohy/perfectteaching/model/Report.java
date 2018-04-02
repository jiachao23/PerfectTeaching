package com.jcohy.perfectteaching.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * ClassName  : com.jcohy.perfectteaching.repository
 * Description  :报告表
 */
@Entity
@Table(name = "report")
public class Report implements Serializable{

    private static final long serialVersionUID = 7L;
    //Id
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    //分数
    private Integer grade;
    //学生实验
    private Stulab stulab;
    //评语
    private String remark;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public Stulab getStulab() {
        return stulab;
    }

    public void setStulab(Stulab stulab) {
        this.stulab = stulab;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
