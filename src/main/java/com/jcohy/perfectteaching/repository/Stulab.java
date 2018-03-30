package com.jcohy.perfectteaching.repository;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by jiac on 2018/3/30.
 * ClassName  : com.jcohy.perfectteaching.repository
 * Description  :学生实验表
 */
@Entity
@Table(name = "stulab")
public class Stulab implements Serializable{

    private static final long serialVersionUID = 8L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    private Student student;

    private Lab lab;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Lab getLab() {
        return lab;
    }

    public void setLab(Lab lab) {
        this.lab = lab;
    }
}
