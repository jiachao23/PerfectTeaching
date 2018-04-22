package com.jcohy.perfectteaching.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * ClassName  : com.jcohy.perfectteaching.repository
 * Description  :
 */
@Entity
@Table(name = "plan")
public class Plan implements Serializable{

    private static final long serialVersionUID = 6L;

    //Id
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    //计划内容
    @Column(name = "content")
    private String content;
    //院系
    @OneToOne
    @JoinColumn(name = "dept_id")
    private Dept dept;
    //专业
    @OneToOne
    @JoinColumn(name = "major_id")
    private Major major;

    @OneToOne
    @JoinColumn
    private Lab lab;

    //开始时间
    @Column(name = "start")
    private String start;
    //结束时间
    @Column(name = "end")
    private String end;

    public Lab getLab() {
        return lab;
    }

    public void setLab(Lab lab) {
        this.lab = lab;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Dept getDept() {
        return dept;
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }

    public Major getMajor() {
        return major;
    }

    public void setMajor(Major major) {
        this.major = major;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }
}
