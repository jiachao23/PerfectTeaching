package com.jcohy.perfectteaching.model;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;

/**
 * ClassName  : com.jcohy.perfectteaching.repository
 * Description  :课程表
 */
@Entity
@Table(name = "course")
public class Course implements Serializable{

    private static final long serialVersionUID = 4L;
    //Id
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    //实验编号
    @Column(name = "course_num")
    private Integer num;
    //实验名称
    @Column(name = "course_name")
    private String name;
    //实验内容
    @Column(name = "course_content")
    private String content;
    //状态
    @Column(name = "status")
    private Integer status;
    //开始日期
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "start")
    private Date satrt;
    //结束日期
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "end")
    private Date end;

    @ManyToMany(fetch = FetchType.EAGER, mappedBy = "courses")
    //NotFound : 意思是找不到引用的外键数据时忽略，NotFound默认是exception
    @NotFound(action = NotFoundAction.IGNORE)
    private Set<Student> Student;

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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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

    public Set<Student> getStudent() {
        return Student;
    }

    public void setStudent(Set<Student> student) {
        Student = student;
    }
}
