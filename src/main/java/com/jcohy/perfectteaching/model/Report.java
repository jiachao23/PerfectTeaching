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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    //分数
    @Column(name = "grade")
    private Integer grade;
    //学生实验
    @OneToOne
    @JoinColumn(name = "s_id")
    private Student student;
    @OneToOne
    @JoinColumn(name = "lab_id")
    private Lab lab;

    //评语
    @Column(name = "remark")
    private String remark;
    //用户选项
    @Column(name = "usr_option")
    private String option;

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

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    public Lab getLab() {
        return lab;
    }

    public void setLab(Lab lab) {
        this.lab = lab;
    }
}
