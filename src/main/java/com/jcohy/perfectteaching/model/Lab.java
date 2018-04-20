package com.jcohy.perfectteaching.model;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;

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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    //实验编号
    @Column(name = "lab_num")
    private Integer num;
    //实验名称
    @Column(name = "lab_name")
    private String name;
    //实验内容
    @Column(name = "lab_content")
    private String content;
    //状态
    @Column(name = "status")
    private Integer status;
    @Column(name = "type")
    private String type;

//    //开始日期
//    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
//    @Column(name = "start")
//    private Date start;
//    //结束日期
//    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
//    @Column(name = "end")
//    private Date end;

    @OneToOne
    @JoinColumn(name = "teacher_id")
    private Teacher teacher;

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @ManyToMany(fetch = FetchType.EAGER, mappedBy = "labs")
    //NotFound : 意思是找不到引用的外键数据时忽略，NotFound默认是exception
    @NotFound(action = NotFoundAction.IGNORE)
    private List<Student> Student;

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
//
//    public Date getStart() {
//        return start;
//    }
//
//    public void setStart(Date start) {
//        this.start = start;
//    }
//
//    public Date getEnd() {
//        return end;
//    }
//
//    public void setEnd(Date end) {
//        this.end = end;
//    }

//    public Test getTest() {
//        return test;
//    }
//
//    public void setTest(Test test) {
//        this.test = test;
//    }

    public List<Student> getStudent() {
        return Student;
    }

    public void setStudent(List<Student> student) {
        Student = student;
    }
}
