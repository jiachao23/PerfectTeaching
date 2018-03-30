package com.jcohy.perfectteaching.repository;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * ClassName  : com.jcohy.perfectteaching.repository
 * Description  :实验表
 */
@Entity
@Table(name = "lab")
public class Lab implements Serializable{

    private static final long serialVersionUID = 4L;
    //Id
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    //实验编号
    private Integer num;
    //实验名称
    private String name;
    //实验内容
    private String content;
    //开始日期
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    private Date satrt;
    //结束日期
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    private Date end;
    //对应的测试题
    private Test test;

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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getSatrt() {
        return satrt;
    }

    public void setSatrt(Date satrt) {
        this.satrt = satrt;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }

    public Test getTest() {
        return test;
    }

    public void setTest(Test test) {
        this.test = test;
    }
}
